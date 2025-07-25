<%@ Page Title="" Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master"
    AutoEventWireup="true" CodeFile="S3GOrgCustomerMaster_Add.aspx.cs" Inherits="Origination_S3GOrgCustomerMaster_Add"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register TagPrefix="uc3" TagName="NameSetup" Src="~/UserControls/NameSetup.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
       <%-- function NameChange() {
            var txtFirstName = $get('<%= txtFirstName.ClientID %>');
            var txtSecondName = $get('<%= txtSecondName.ClientID %>');
            var txtThirdName = $get('<%= txtThirdName.ClientID %>');
            var txtFourthName = $get('<%= txtFourthName.ClientID %>');
            var txtFifthName = $get('<%= txtFifthName.ClientID %>');
            var txtSixthName = $get('<%= txtSixthName.ClientID %>');
            var txtCustomerName = $get('<%= txt_CUSTOMER_NAME.ClientID %>');
            txtCustomerName.value = txtFirstName.value + ' ' + txtSecondName.value + ' ' + txtThirdName.value + ' ' + txtFourthName.value + ' ' + txtFifthName.value + ' ' + txtSixthName.value;
        }--%>
        function TotalEmployeeAdd() {
            var txtPercentageStake = $get('<%= txtPercentageStake.ClientID %>');
            var txtJVPartnerStake = $get('<%= txtJVPartnerStake.ClientID %>');
            var txtNoOfEmployees = $get('<%= txtNoOfEmployees.ClientID %>');
            if (txtPercentageStake.value != '' || txtJVPartnerStake.value != '') {
                txtNoOfEmployees.value = Number(txtPercentageStake.value) + Number(txtJVPartnerStake.value);
            }
        }
        function PageLoadTabContSetFocus() {
            var TC = $find("<%=tcCustomerMaster.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=chkCustomer.ClientID %>").focus();
            }
        }

        function funBacktoParenWindow() {
            opener.window.document.getElementById('ctl00_ContentPlaceHolder1_txtCustomerFocus').focus();
            window.close();
        }

        function fnSaveValidation() {
            if (confirm('Do you want to save?')) {

                if (!fnCheckPageValidators("Main", false)) {
                    alert("Fill the Mandatory value in Main tab");
                    tab.set_activeTabIndex(1);
                    return false;
                }
                if (!fnCheckPageValidators("Personal Details", false)) {
                    alert("Fill the Mandatory value in Personal Details tab");
                    tab.set_activeTabIndex(2);
                    return false;
                }

                Page_BlockSubmit = false;
                var a = event.srcElement;
                if (a.type == "button") {
                    a.style.display = 'none';
                }
                return true;
            }
            else {
                return false;
            }
            return true;
        }

    </script>
    <script type="text/javascript">
        var tab;
        var btnActive_index = 0;
        var index = 0;
        function pageLoad() {
            PageLoadTabContSetFocus();
            tab = $find('ctl00_ContentPlaceHolder1_tcCustomerMaster');
            querymode = location.search.split("qsMode=");
            querymode = querymode[1];
            if (querymode != 'Q' && tab != null) {
                tab.add_activeTabChanged(on_Change);
                var newindex = tab.get_activeTabIndex(index);
                var btnSave = document.getElementById('<%=btnSave.ClientID %>')
                var btnclear = document.getElementById('<%=btnClear.ClientID %>')
                //if (newindex > 0) {
                //    btnSave.removeAttribute("disabled");
                //    btnSave.setAttribute("class", "css_btn_enabled");
                //}
                //else {
                //    btnSave.setAttribute("disabled", "disabled");
                //    btnSave.setAttribute("class", "css_btn_disabled");
                //}
            }
        }

        function fnDisableOwnMandatory(ddlOwn) {
            var own = ddlOwn.options.value;
            if (own == "1") {
                //document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_frvCurrentMarketValue').enabled = true;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_lblCurrentMarketValue').setAttribute("className", "styleReqFieldLabel");
                document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtCurrentMarketValue').disabled = false;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtRemainingLoanValue').disabled = false;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtTotNetWorth').disabled = false;



            }
            else if (own == "0") {
                //document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_frvCurrentMarketValue').enabled = false;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_lblCurrentMarketValue').setAttribute("className", "styleDisplayLabel");
                document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtCurrentMarketValue').disabled = true;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtRemainingLoanValue').disabled = true;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtTotNetWorth').disabled = true;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtCurrentMarketValue').value = "";
                document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtRemainingLoanValue').value = "";
                document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtTotNetWorth').value = "";
            }

        }
        function jsMICRvaildate(txtMICRCode) {
            if (txtMICRCode.value.length > 0) {
                if (txtMICRCode.value.length < txtMICRCode.maxLength) {
                    alert('Enter a valid MICR Code');
                    document.getElementById(txtMICRCode.id).value = "";
                    document.getElementById(txtMICRCode.id).focus();
                }
            }
        }

        function fnSetEmptyText(txtControl) {
            txtControl.setAttribute("value", "");
            txtControl.setAttribute("readonly", true);
        }
        function fnvalidcustomername(txtCustomerName) {
            if (txtCustomerName.value == "0") {
                alert('Customer Name should not be 0');
                document.getElementById(txtCustomerName.id).focus();
            }
            //Added by saranya for issue raised by vasanth on 03-Mar-2012
            //if (txtCustomerName.value.split('  ')[1] != null) {
            //    alert('Customer Name should not carry more than one space between two words');
            //    document.getElementById(txtCustomerName.id).value = "";
            //    document.getElementById(txtCustomerName.id).focus();
            //}
            //End Here
        }

        function fnMoveNextTab(Source_Invoker) {
            tab = $find('ctl00_ContentPlaceHolder1_tcCustomerMaster');
            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            btnActive_index = newindex;
            //btnSave.disabled=true;
            //strValgrp = "Basic Details";
            //Valgrp.validationGroup = strValgrp;            
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;
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
                }
                else {
                    switch (index) {
                        case 0:
                            {
                                var grid = document.getElementById('<%=grvAddressDetails.ClientID %>');
                                if (grid.rows.length - 1 == 0) {
                                    alert('Add atleast one Address details');
                                    tab.set_activeTabIndex(index);
                                    index = tab.get_activeTabIndex(index);
                                    return;
                                }
                                var txtGroupName = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_txtGroupName');
                                var chkCustomer = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_chkCustomer');
                                var chkGuarantor1 = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_chkGuarantor1');
                                var chkCoApplicant = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_chkCoApplicant');
                                //var chkGroupDet = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_chkGroupDet'); && (!chkGroupDet.checked)
                                if ((!chkCustomer.checked) && (!chkGuarantor1.checked) && (!chkCoApplicant.checked)) {
                                    alert('Select atleast one Customer Type(Customer/Guarantor/Co-Applicant)');///Customer Group
                                    tab.set_activeTabIndex(index);
                                    index = tab.get_activeTabIndex(index);
                                    $get("<%=chkCustomer.ClientID %>").focus();
                                }
                                else {
                                    tab.set_activeTabIndex(newindex);
                                    index = tab.get_activeTabIndex(index);
                                    btnActive_index = index
                                }
                            }
                            break;
                        case 1:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 2:
                            if (!fnCheckPageValidators('Main', false)) {
                                tab.set_activeTabIndex(0);
                                index = 0;
                                btnActive_index = index;
                                return;
                            }
                            if (!fnCheckPageValidators('Personal Details', false)) {
                                tab.set_activeTabIndex(1);
                                index = 1;
                                btnActive_index = index;
                                return;
                            }
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 3:
                            if (!fnCheckPageValidators('Main', false)) {
                                tab.set_activeTabIndex(0);
                                index = 0;
                                btnActive_index = index;
                                return;
                            }
                            if (!fnCheckPageValidators('Personal Details', false)) {
                                tab.set_activeTabIndex(1);
                                index = 1;
                                btnActive_index = index;
                                return;
                            }
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 4:
                            if (!fnCheckPageValidators('Main', false)) {
                                tab.set_activeTabIndex(0);
                                index = 0;
                                btnActive_index = index;
                                return;
                            }
                            if (!fnCheckPageValidators('Personal Details', false)) {
                                tab.set_activeTabIndex(1);
                                index = 1;
                                btnActive_index = index;
                                return;
                            }
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 5:
                            if (!fnCheckPageValidators('Main', false)) {
                                tab.set_activeTabIndex(0);
                                index = 0;
                                btnActive_index = index;
                                return;
                            }
                            if (!fnCheckPageValidators('Personal Details', false)) {
                                tab.set_activeTabIndex(1);
                                index = 1;
                                btnActive_index = index;
                                return;
                            }
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;

                    }
                }
            }
            else {
                tab.set_activeTabIndex(newindex);
                //Focus Start
                var TC = $find("<%=tcCustomerMaster.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=chkCustomer.ClientID %>").focus();

                }
                if (TC.get_activeTab().get_tabIndex() == 1) {
                    var parm = document.getElementById('<%=ddlCustomerType.ClientID %>');
                    if (parm.options[parm.selectedIndex].text == 'INDIVIDUAL') {
                        $get("<%=txtDOB.ClientID %>").focus();
                    }
                    else {
                        $get("<%=txtKeyDecisionMaker.ClientID %>").focus();
                    }
                }
                if (TC.get_activeTab().get_tabIndex() == 2) {
                    $get("<%=ddlAccountType.ClientID %>").focus();
                }
            }
        }

        var btnActive_index = 0;
        var index = 0;
        function on_Change(sender, e) {
            var TC = $find("<%=tcCustomerMaster.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() != 0) {
                fnMoveNextTab('Tab');
            }

            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            //var Valgrp = document.getElementById('<%=vsCustomerMaster.ClientID %>')
            //Valgrp.validationGroup = strValgrp;
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;
            fnCheckStack();
            fnCheckCEOAge();
            var btnSave = document.getElementById('<%=btnSave.ClientID %>');
            var btnclear = document.getElementById('<%=btnClear.ClientID %>');
            //if (newindex > 0) {
            //    btnSave.removeAttribute("disabled");
            //    btnSave.setAttribute("class", "css_btn_enabled");
            //}
            //else {
            //    btnSave.setAttribute("disabled", "disabled");
            //    btnSave.setAttribute("class", "css_btn_disabled");
            //}
            var ddl = document.getElementById("<%=ddlCustomerType.ClientID%>");
            var SelVal = ddl.options[ddl.selectedIndex].text;
            if (SelVal.toUpperCase() == 'INDIVIDUAL') {
                var Fourth_Names = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_ucEntityNamesSetup_txtFourth_Name');
                var FamilyNames = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtFamilyName');
                FamilyNames.value = Fourth_Names.value;
            }
            if (newindex > index) {
                if (!fnCheckPageValidators(strValgrp, false)) {
                    tab.set_activeTabIndex(index);
                    return;
                }
                else {
                    switch (index) {
                        case 0:
                            {
                                var txtGroupName = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_txtGroupName');
                                var chkCustomer = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_chkCustomer');
                                var chkGuarantor1 = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_chkGuarantor1');
                                var chkCoApplicant = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_chkCoApplicant');
                                //var chkGroupDet = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_chkGroupDet');
                                if ((!chkCustomer.checked) && (!chkGuarantor1.checked) && (!chkCoApplicant.checked)) {//&& (!chkGroupDet.checked)
                                    alert('Select atleast one Relation Type(Customer/Guarantor/Co-Applicant)');///Customer Group
                                    tab.set_activeTabIndex(index);
                                    $get("<%=chkCustomer.ClientID %>").focus();
                                }
                                else {
                                    index = tab.get_activeTabIndex(index);
                                }
                            }
                            break;
                    }
                    index = tab.get_activeTabIndex(index);
                    return;
                }
            }
            else {
                tab.set_activeTabIndex(newindex);
                index = tab.get_activeTabIndex(newindex);
            }

        }

        function funCheckFirstLetterisNumeric(textbox, msg) {

            var FieldValue = new Array();
            FieldValue = textbox.value.trim();
            if (FieldValue.length > 0 && FieldValue.value != '') {
                if (isNaN(FieldValue[0])) {
                    return true;
                }
                else {
                    alert(msg + ' name cannot begin with a number');
                    textbox.focus();
                    textbox.value = '';
                    event.returnValue = false;
                    return false;
                }
            }
        }

        function fnCheckStack() {
            //alert('got');
            //debugger;
            var txtPromotersStake = document.getElementById('<%=txtPercentageStake.ClientID %>');
            var txtJVStake = document.getElementById('<%=txtJVPartnerStake.ClientID %>');

            var rfvPercentageStake = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_rfvPercentageStake');
            if (rfvPercentageStake != null) {

                ValidatorEnable(rfvPercentageStake, false);
                rfvPercentageStake.initialvalue = '';

                if (txtPromotersStake.value != '' || txtJVStake.value != '') {
                    if (parseFloat(txtPromotersStake.value) + parseFloat(txtJVStake.value) != 100) {
                        ValidatorEnable(rfvPercentageStake, true);
                        rfvPercentageStake.initialvalue = txtPromotersStake.value;
                    }
                }
            }
        }

        function fnCheckCEOAge() {
            //alert('got');
            var txtCEOAge = document.getElementById('<%=txtCEOAge.ClientID %>');
            var txtCEOexperience = document.getElementById('<%=txtCEOexperience.ClientID %>');

            var rfvCheckAge = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_rfvCheckAge');

            if (rfvCheckAge != null) {
                ValidatorEnable(rfvCheckAge, false);
                rfvCheckAge.initialvalue = '';

                if (txtCEOAge.value != '' && txtCEOexperience.value != '') {
                    if (parseFloat(txtCEOAge.value) <= parseFloat(txtCEOexperience.value)) {
                        //alert('The Experience of CEO is not match with age of CEO.');
                        //txtBox.value = '';
                        ValidatorEnable(rfvCheckAge, true);
                        rfvCheckAge.initialvalue = txtCEOAge.value;
                    }
                }
            }
        }

        //Added by Thangam M on 12/Mar/2012 to fix bug id - 5451
        function fnClearAsyncUploader(rowCount) {
            for (var x = 0; x < rowCount; x++) {
                var ctrlName = 'ctl00_ContentPlaceHolder1_tcCustomerMaster_TabConstitution_gvConstitutionalDocuments_ctl';
                if (x.toString().length == 1)
                    ctrlName = ctrlName + '0' + (x + 2).toString();
                else
                    ctrlName = ctrlName + (x + 2).toString();

                ctrlName = ctrlName + '_asyFileUpload'

                var AsyncUploader = $get(ctrlName);
                if (AsyncUploader != null) {
                    var txts = AsyncUploader.getElementsByTagName("input");

                    for (var i = 0; i < txts.length; i++) {
                        if (txts[i].type == "text") {
                            txts[i].value = "";
                        }
                    }
                }
            }
        }

        function fnLoadPath(btnBrowse) {
            if (btnBrowse != null)
                document.getElementById(btnBrowse).click();
        }

        function fnAssignPath(flUpload, hdnPath, btnBrowse) {
            if (flUpload != null)
                document.getElementById(hdnPath).value = document.getElementById(flUpload).value;
            document.getElementById(btnBrowse).click();
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

        function fnTrashBankSuggest(e) {
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
    <asp:UpdatePanel ID="updCust" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="" ID="lblHeading"> </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <cc1:TabContainer ID="tcCustomerMaster" runat="server" CssClass="styleTabPanel"
                            TabStripPlacement="top" ActiveTabIndex="0">
                            <cc1:TabPanel runat="server" HeaderText="Customer Details" ID="tbAddress" CssClass="tabpan"
                                BackColor="Red" TabIndex="0">
                                <HeaderTemplate>
                                    Main
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="updMain" runat="server">
                                        <ContentTemplate>
                                            <asp:Panel GroupingText="Customer Informations" ID="pnlCustomerInfo" runat="server" ToolTip="Customer Informations"
                                                CssClass="stylePanel">
                                                <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <asp:CheckBox runat="server" ID="chkCustomer" Text="Customer" ToolTip="Customer" />
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <asp:CheckBox runat="server" ID="chkGuarantor1" Text="Guarantor" ToolTip="Guarantor" />
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <asp:CheckBox runat="server" ID="chkCoApplicant" Text="Co-Applicant" ToolTip="Co-Applicant" />
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <button class="css_btn_enabled" id="btnDeDup" onserverclick="btnDeDup_Click" runat="server" causesvalidation="false" title="De dupe[Alt+Shift+D]"
                                                                type="button" accesskey="D">
                                                                <i aria-hidden="true"></i>&emsp;<u>D</u>e dupe
                                                            </button>
                                                        </div>
                                                        <div id="Div1" class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                                            <asp:CheckBox runat="server" ID="chkGroupDet" Text="Customer Group" ToolTip="Customer Group" AutoPostBack="true" OnCheckedChanged="chkGroupDet_CheckedChanged" />
                                                        </div>
                                                    </div>
                                                    <div class="row" style="padding: 0px !important;">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlCustomerType" runat="server" OnSelectedIndexChanged="ddlCustomerType_OnSelectedIndexChanged"
                                                                            AutoPostBack="True" CssClass="md-form-control form-control" ToolTip="Customer Type">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvCustomerType" runat="server"
                                                                                ControlToValidate="ddlCustomerType" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                InitialValue="-1" ErrorMessage="Select Customer Type" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" ID="lblCustomerType" CssClass="styleReqFieldLabel" Text="Customer Type"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <uc2:Suggest ID="ddlNationality" runat="server" ServiceMethod="GetNationalList" ToolTip="Nationality" IsMandatory="true" AutoPostBack="true"
                                                                            ValidationGroup="Main" ErrorMessage="Select Nationality" OnItem_Selected="ddlNationality_OnSelectedIndexChanged" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblNationality" CssClass="styleReqFieldLabel"
                                                                                Text="Nationality"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlConstitutionName" runat="server" AutoPostBack="True" ToolTip="Constitution Name"
                                                                            OnSelectedIndexChanged="ddlConstitutionName_OnSelectedIndexChanged" CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvConstitutionName" runat="server"
                                                                                ControlToValidate="ddlConstitutionName" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                InitialValue="0" ErrorMessage="Selcet Constitution Name" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" ID="lblConstitutionName" CssClass="styleReqFieldLabel"
                                                                                Text="Constitution Name"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtIdentityColumn" runat="server" ToolTip="Reference Number" AutoPostBack="false" OnTextChanged="txtIdentityColumn_TextChanged" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="fteIdentityColumn" runat="server"
                                                                            FilterType="Numbers" 
                                                                            Enabled="True" TargetControlID="txtIdentityColumn">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvIdentityColumn" runat="server"
                                                                                ControlToValidate="txtIdentityColumn" ErrorMessage="Enter Reference Number" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                            <asp:RegularExpressionValidator ID="revCRNumber" runat="server" ControlToValidate="txtIdentityColumn" CssClass="validation_msg_box_sapn"
                                                                                ValidationGroup="Main" Display="Dynamic" ErrorMessage="Enter a valid CR Number" ValidationExpression="" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                                                            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtIdentityColumn" ID="RevIdentityColumn" ValidationExpression="^[\s\S]{8,12}$" runat="server"
                                                                                ErrorMessage="Minimum 8 and Maximum 12 characters required." CssClass="validation_msg_box_sapn" SetFocusOnError="true" ValidationGroup="Main" Enabled="false"></asp:RegularExpressionValidator>
                                                                            <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtIdentityColumn" ID="RevCRNUMBERVal" ValidationExpression="^[\s\S]{7,11}$" runat="server"
                                                                                ErrorMessage="Minimum 7 and Maximum 11 characters required." CssClass="validation_msg_box_sapn" SetFocusOnError="true" ValidationGroup="Main" Enabled="false"></asp:RegularExpressionValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblIdentityColumn" CssClass="styleReqFieldLabel" Text="Reference Number"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtIdentityIssueDate" runat="server" ToolTip="Identity Issue Date" AutoPostBack="true" OnTextChanged="txtIdentityIssueDate_TextChanged"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtIdentityIssueDate"
                                                                            Format="dd/MM/YYYY" ID="calIdentityIssueDate" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                        </cc1:CalendarExtender>
                                                                        <cc1:FilteredTextBoxExtender ID="ftvIdentityIssueDate" runat="server" ValidChars="/-"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                            Enabled="True" TargetControlID="txtIdentityIssueDate">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvIdentityIssueDate" runat="server"
                                                                                ControlToValidate="txtIdentityIssueDate" CssClass="validation_msg_box_sapn" ErrorMessage="Enter Issue Date" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblIdentityIssueDate" CssClass="styleReqFieldLabel" Text="Issue Date"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtIdentityExpiredate" runat="server" AutoPostBack="true" OnTextChanged="txtIdentityExpiredate_TextChanged"
                                                                            ToolTip="Identity expire date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:CalendarExtender runat="server"
                                                                            Format="dd/MM/YYYY" ID="calIdentityExpiredate" Enabled="True" TargetControlID="txtIdentityExpiredate">
                                                                        </cc1:CalendarExtender>
                                                                        <cc1:FilteredTextBoxExtender ID="fteIdentityExpiredate" runat="server" ValidChars="/-" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                            Enabled="True" TargetControlID="txtIdentityExpiredate">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvIdentityExpiredate" runat="server"
                                                                                ControlToValidate="txtIdentityExpiredate" CssClass="validation_msg_box_sapn" ErrorMessage="Enter Expiry Date" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblIdentityExpiredate" CssClass="styleReqFieldLabel" Text="Expiry Date"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlTitle" runat="server" CssClass="md-form-control form-control" ToolTip="Title">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvTitle" ValidationGroup="Main" runat="server" ControlToValidate="ddlTitle"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="-1" ErrorMessage="Selcet Title" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" ID="lblTitle" CssClass="styleReqFieldLabel" Text="Title"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txt_CUSTOMER_NAME" runat="server" MaxLength="606" onfocusOut="fnvalidcustomername(this);" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Customer Name"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtCustomerName" ValidChars=" .&" TargetControlID="txt_CUSTOMER_NAME"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                                            Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ValidationGroup="Main" ID="rvfCustomerName" runat="server"
                                                                                ControlToValidate="txt_CUSTOMER_NAME" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                ErrorMessage="Enter Customer Name" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" ID="lbl_CUSTOMER_NAME" CssClass="styleReqFieldLabel" Text="Customer Name"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" runat="server" id="dvCustdtls">
                                                                    <asp:Panel GroupingText="Customer Name Details" ID="pnlCustdtls" runat="server" CssClass="stylePanel">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="row">
                                                                                <uc3:NameSetup ID="ucEntityNamesSetup" runat="server" />
                                                                            </div>
                                                                    </asp:Panel>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvddlPostingGroup" visible="false">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlPostingGroup" runat="server" CssClass="md-form-control form-control" ToolTip="Posting Group Code">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvPostingGroup" runat="server"
                                                                                ControlToValidate="ddlPostingGroup" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                InitialValue="0" ErrorMessage="Select a Customer Posting Code" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" ID="lblCustomerPostingGroup" CssClass="styleReqFieldLabel"
                                                                                Text="Posting Group Code"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="cmbIndustryCode" AutoPostBack="True" ValidationGroup="Main" ToolTip="TCSMP"
                                                                            runat="server" CssClass="md-form-control form-control"
                                                                            OnSelectedIndexChanged="cmbIndustryCode_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvIndustryCode" runat="server" ControlToValidate="cmbIndustryCode"
                                                                                Display="Dynamic" ValidationGroup="Main" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                                                ErrorMessage="Select TCSMP" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" ID="lblIndustryCode" CssClass="styleReqFieldLabel" Text="TCSMP"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="cmbsub" ValidationGroup="Main" ToolTip="TCSMP Sub Sector"
                                                                            runat="server" InitialValue="0" CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvcmbsub" runat="server" ControlToValidate="cmbsub"
                                                                                Display="Dynamic" InitialValue="0" ValidationGroup="Main" CssClass="validation_msg_box_sapn"
                                                                                ErrorMessage="Select TCSMP Sub Sector" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" ID="lblsub" CssClass="styleReqFieldLabel" Text="TCSMP Sub Sector"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Customer Branch"></asp:DropDownList>

                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvddlBranchList" runat="server" ControlToValidate="ddlBranch"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0"
                                                                                ErrorMessage="Select a Customer Branch" ValidationGroup="Main" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" ID="lblCustomerBranch" CssClass="styleReqFieldLabel" Text="Customer Branch"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtNotes" runat="server" MaxLength="250" TextMode="MultiLine" ToolTip="Notes"
                                                                            class="md-form-control form-control login_form_content_input requires_true lowercase" onkeyup="maxlengthfortxt(250);"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblNotes" CssClass="styleDisplayLabel" Text="Notes"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server">
                                                                    <div class="md-input">
                                                                        <%--<asp:TextBox ID="txtGroupCode" runat="server" ToolTip="Group Code / Name" ReadOnly="true"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>--%>
                                                                        <uc2:Suggest ID="txtGroupCode" Width="100%" runat="server" ToolTip="Group Code / Name" ServiceMethod="GetCompletionList"
                                                                            IsMandatory="false" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblgroupcode" CssClass="styleDisplayLabel" Text="Group Code / Name"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="DivtxtCustomercode">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCustomercode" runat="server" MaxLength="12" Enabled="false" ToolTip="Customer Code" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblCustomercode" CssClass="styleReqFieldLabel" Text="Customer Code"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="DivTAXApplicability">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlTAXApplicable" runat="server" OnSelectedIndexChanged="ddlTAXApplicable_SelectedIndexChanged"
                                                                            AutoPostBack="True" CssClass="md-form-control form-control" ToolTip="TAX Applicability">
                                                                        </asp:DropDownList>
                                                                         <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvddlTAXApplicable" runat="server" ControlToValidate="ddlTAXApplicable"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0"
                                                                                ErrorMessage="Select a Tax Applicable" ValidationGroup="Main" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" ID="lblTAXApplicable" CssClass="styleReqFieldLabel" Text="TAX Applicability"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="divTIN">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtVATIN" runat="server" MaxLength="12" ToolTip="Customer VAT TIN" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblVATIN" CssClass="styleReqFieldLabel" Text="Customer VAT TIN"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                            <div>
                                                <div class="row" style="padding: 0px !important;">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="row">
                                                            <div class="col-md-4 styleFieldLabel">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlAddressType" runat="server" CssClass="md-form-control form-control" ToolTip="Address Type">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvddlAddressType" runat="server" ControlToValidate="ddlAddressType"
                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0"
                                                                            ErrorMessage="Select a Address Type" ValidationGroup="AddAdds" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label ID="lblAddressType" runat="server" CssClass="styleReqFieldLabel" Text="Address Type"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">
                                                    <asp:Panel GroupingText="Address Details" ID="pnlAddressDetails" runat="server" ToolTip="Address Details"
                                                        CssClass="stylePanel" Width="100%">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <uc1:AddSetup ID="ucBasicDetAddressSetup" runat="server" ToolTip="Address Details" />
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row" style="float: right; margin-top: 5px; margin-left: 10px;">
                                                <button class="css_btn_enabled" id="btnAddAdds" onserverclick="btnAddAdds_Click" runat="server"
                                                    type="button" accesskey="O" title="Add the Details[Alt+O]" validationgroup="AddAdds">
                                                    <i class="fa fa-plus" aria-hidden="true"></i>&emsp;Add
                                                </button>
                                                <button class="css_btn_enabled" id="btnModifyAdds" onserverclick="btnModifyAdds_Click" runat="server"
                                                    type="button" accesskey="M" title="Modify the Details[Alt+M]" validationgroup="AddAdds">
                                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>odify
                                                </button>
                                            </div>
                                            <div id="grvAddressDetail" style="margin-top: 10px;" class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <div class="gird">
                                                        <asp:GridView ID="grvAddressDetails" runat="server" AllowPaging="True" HeaderStyle-CssClass="styleGridHeader" class="gird_details" AutoGenerateColumns="False"
                                                            EmptyDataText="No Address Details Found!..." OnRowDataBound="grvAddressDetails_RowDataBound" ToolTip="Address Details"
                                                            OnRowDeleting="grvAddressDetails_RowDeleting" OnSelectedIndexChanged="grvAddressDetails_SelectedIndexChanged">
                                                            <Columns>
                                                                <asp:CommandField ShowSelectButton="True" Visible="False" />
                                                                <asp:TemplateField HeaderText="ID" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCust_Add_Mapping_ID" runat="server" Text='<%#Bind("Cust_Add_Mapping_ID") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Address ID" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCust_Address_ID" runat="server" Text='<%#Bind("Cust_Address_ID") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Address Type ID" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCust_Address_Type_ID" runat="server" Text='<%#Bind("Cust_Address_Type_ID") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Address Type">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCust_Address_Type" runat="server" Text='<%#Bind("Cust_Address_Type") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Postal Code">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblPostalCode_Text" runat="server" Text='<%#Bind("Postal_Code_Text") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="PostalCode_Value" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblPostalCode_Value" runat="server" Text='<%#Bind("Postal_Code_Value") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="Post_Box_No" HeaderText="Post Box No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Way_No" HeaderText="Way No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="House_No" HeaderText="House No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Block_No" HeaderText="Block No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Flat_No" HeaderText="Flat No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="LandMark" HeaderText="Land Mark" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="Area Sheik">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblArea_Sheik_Text" runat="server" Text='<%#Bind("Area_Sheik") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="Residence_Phone_No" HeaderText="Residence Phone No" NullDisplayText="">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Residence_Fax_No" HeaderText="Residence Fax No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Mobile_Phone_No" HeaderText="Mobile Phone No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Contact_Name" HeaderText="Contact Name" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Contact_No" HeaderText="Contact No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Office_Phone_No" HeaderText="Office Phone No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Office_Fax_No" HeaderText="Office Fax No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Cust_Email" HeaderText="Email" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="lnkbtnDelete" runat="server" CommandName="Delete" CssClass="grid_btn_delete" CausesValidation="false"
                                                                            Text="Remove" AccessKey="R" OnClientClick="return confirm('Are you sure you want to Remove this record?');" ToolTip="Remove,Alt+R" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <input id="hdnAddsID" runat="server" type="hidden" />
                                                        </input>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <div class="row">
                                <div class="col">
                                    <cc1:TabPanel runat="server" HeaderText="Personal Details" ID="tpPersonal" ToolTip="Personal Details" CssClass="tabpan"
                                        BackColor="Red">
                                        <HeaderTemplate>
                                            Personal Details
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <asp:UpdatePanel ID="updPersonal" runat="server">
                                                <ContentTemplate>
                                                    <div class="row">
                                                        <asp:Panel GroupingText="Individual Customer" ID="pnlIndividual" Enabled="false" ToolTip="Individual Customer" runat="server" CssClass="stylePanel">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <div class="row">
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtDOB" runat="server" OnTextChanged="txtDOB_OnTextChanged" ToolTip="Date of Birth"
                                                                                        AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftxtDOB" runat="server" ValidChars="/-" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                                        Enabled="true" TargetControlID="txtDOB">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtDOB" PopupButtonID="imgDOB"
                                                                                        Format="dd/MM/YYYY" ID="CalendarExtenderSD" Enabled="False" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                                    </cc1:CalendarExtender>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblDOB" CssClass="styleReqFieldLabel" Text="Date of Birth"></asp:Label>
                                                                                    </label>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvDOB" runat="server"
                                                                                            ControlToValidate="txtDOB" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Select Date Of Birth" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtAge" runat="server" ReadOnly="True" Style="text-align: right;" ToolTip="Age" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblAge" CssClass="styleReqFieldLabel" Text="Age"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="md-form-control form-control" ToolTip="Gender">
                                                                                        <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                                                                        <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                                                                                        <asp:ListItem Text="Female" Value="0"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvGender" runat="server"
                                                                                            ControlToValidate="ddlGender" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="-1" ErrorMessage="Select Gender" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label class="tess">
                                                                                        <asp:Label runat="server" ID="lblGender" CssClass="styleReqFieldLabel" Text="Gender"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:DropDownList ID="ddlMaritalStatus" runat="server" CssClass="md-form-control form-control" ToolTip="Marital Status"
                                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlMaritalStatus_OnSelectedIndexChanged">
                                                                                    </asp:DropDownList>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvMaritalStatus" runat="server"
                                                                                            ControlToValidate="ddlMaritalStatus" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="0" ErrorMessage="Select Marital Status" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label class="tess">
                                                                                        <asp:Label runat="server" ID="lblMaritalStatus" CssClass="styleDisplayLabel" Text="Marital Status"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtTotalDependents" runat="server" MaxLength="2" Enabled="false" ToolTip="Total Dependents"
                                                                                        Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftxtTotalDependents" runat="server" ValidChars=""
                                                                                        FilterType="Numbers" Enabled="true" TargetControlID="txtTotalDependents">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblTotalDependents" CssClass="styleDisplayLabel" Text="Total Dependents"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtChildren" runat="server" MaxLength="2" Enabled="false" ToolTip="Children"
                                                                                        Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftxtChildren" runat="server" ValidChars="" FilterType="Numbers"
                                                                                        Enabled="true" TargetControlID="txtChildren">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblChildren" CssClass="styleDisplayLabel" Text="Children"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtSpouseName" runat="server" MaxLength="40" ToolTip="Spouse Name" Enabled="false" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="fteSpouseName" ValidChars=" " TargetControlID="txtSpouseName"
                                                                                        FilterType="Custom, UppercaseLetters, LowercaseLetters" runat="server"
                                                                                        Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblSpouseName" CssClass="styleDisplayLabel" Text="Spouse Name"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtWeddingdate" runat="server" Enabled="false" AutoPostBack="true" OnTextChanged="txtWeddingdate_TextChanged" ToolTip="Wedding Date" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtWeddingdate" PopupButtonID="ImgWeddingdate"
                                                                                        Format="DD/MM/YYYY" ID="CalendarWeddingdate" Enabled="False" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                                    </cc1:CalendarExtender>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblWeddingdate" CssClass="styleDisplayLabel" Text="Wedding Date"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtResidenceOmanSince" AutoPostBack="true" OnTextChanged="txtResidenceOmanSince_TextChanged" runat="server" ToolTip="Resident In Oman Since" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtResidenceOmanSince"
                                                                                        Format="dd/MM/YYYY" ID="calResidenceOmanSince" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                                    </cc1:CalendarExtender>
                                                                                    <cc1:FilteredTextBoxExtender ID="fteResidenceOmanSince" runat="server" ValidChars="/-"
                                                                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                                        Enabled="True" TargetControlID="txtResidenceOmanSince">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvResidenceOmanSince" runat="server"
                                                                                            ControlToValidate="txtResidenceOmanSince" CssClass="validation_msg_box_sapn" Enabled="false" ErrorMessage="Enter Resident In Oman Since" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblResidenceOmanSince" CssClass="styleFieldLabel" Text="Resident In Oman Since"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtPassportNumber" runat="server" MaxLength="15" ToolTip="Passport Number"
                                                                                        Style="text-align: Left;" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftePassportNumber" ValidChars=" /" TargetControlID="txtPassportNumber"
                                                                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                                                        Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvPassportNumber" runat="server"
                                                                                            ControlToValidate="txtPassportNumber" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Passport Number" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblPassportNumber" CssClass="styleReqFieldLabel" Text="Passport Number" ToolTip="Passport Number"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtPassportIssueDate" runat="server" AutoPostBack="true" OnTextChanged="txtPassportIssueDate_TextChanged" ToolTip="Passport Issue Date" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtPassportIssueDate" PopupButtonID="imgPassportIssueDate"
                                                                                        Format="dd/MM/YYYY" ID="calPassportIssueDate" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                                    </cc1:CalendarExtender>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftePassportIssueDate" runat="server" ValidChars="/-"
                                                                                        FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                                        Enabled="true" TargetControlID="txtPassportIssueDate">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvPassportIssueDate" runat="server"
                                                                                            ControlToValidate="txtPassportIssueDate" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Passport Issue Date" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblPassportIssueDate" Text="Passport Issue Date" CssClass="styleReqFieldLabel" ToolTip="Passport Issue Date"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtPassportExpDate" runat="server" AutoPostBack="true" OnTextChanged="txtPassportExpDate_TextChanged" ToolTip="Passport Expiry Date" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtPassportExpDate" PopupButtonID="imgPassportExpDate"
                                                                                        Format="dd/MM/YYYY" ID="calPassportExpDate" Enabled="True">
                                                                                    </cc1:CalendarExtender>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftePassportExpDate" runat="server" ValidChars="/-"
                                                                                        FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                                        Enabled="true" TargetControlID="txtPassportExpDate">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvPassportExpDate" runat="server"
                                                                                            ControlToValidate="txtPassportExpDate" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Passport Expiry Date" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblPassportExpDate" Text="Passport Expiry Date" CssClass="styleReqFieldLabel" ToolTip="Passport Expiry Date"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtProfession" runat="server" MaxLength="40" ToolTip="Profession" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <%--<div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvProfession" runat="server"
                                                                                            ControlToValidate="txtProfession" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Profession" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>--%>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblProfession" CssClass="styleFieldLabel" Text="Profession"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtDrivingNumber" runat="server" MaxLength="20" ToolTip="Driving License Number"
                                                                                        Style="text-align: Left;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <%--<div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvDrivingNumber" runat="server"
                                                                                            ControlToValidate="txtDrivingNumber" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Driving License Number" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>--%>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblDrivingNumber" CssClass="styleDisplayLabel" Text="Driving License Number" ToolTip="Driving License Number"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtVisaNo" runat="server" MaxLength="15" ToolTip="Visa Number"
                                                                                        Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="fteVisaNo" runat="server" ValidChars=""
                                                                                        FilterType="Numbers" Enabled="true" TargetControlID="txtVisaNo">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <%-- <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvVisaNo" runat="server"
                                                                                            ControlToValidate="txtVisaNo" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Visa Number" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>--%>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblVisaNumber" CssClass="styleDisplayLabel" Text="Visa Number"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtLabourCardNo" runat="server" MaxLength="15" ToolTip="Labour Card No"
                                                                                        Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="fteLabourCardNo" runat="server" ValidChars=""
                                                                                        FilterType="Numbers" Enabled="true" TargetControlID="txtLabourCardNo">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvLabourCardNo" runat="server"
                                                                                            ControlToValidate="txtLabourCardNo" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Labour Card No" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lbl_LaborCardNo" CssClass="styleReqFieldLabel" Text="Labour Card No"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtLabourCardDate" runat="server" Enabled="true" ToolTip="Labour Card Issue Date"
                                                                                        class="md-form-control form-control login_form_content_input requires_true" AutoPostBack="true" OnTextChanged="txtLabourCardDate_TextChanged"></asp:TextBox>
                                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtLabourCardDate" PopupButtonID="ImgLabourCardDate"
                                                                                        Format="DD/MM/YYYY" ID="calLabourCardDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                                    </cc1:CalendarExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvLabourCardDate" runat="server"
                                                                                            ControlToValidate="txtLabourCardDate" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Labour Card Issue Date" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lbl_LaborCardIssueDate" CssClass="styleReqFieldLabel" Text="Labour Card Issue Date"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtLaborExpDate" runat="server" Enabled="true" AutoPostBack="true" OnTextChanged="txtLaborExpDate_TextChanged" ToolTip="Labour Card Expiry Date" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtLaborExpDate" PopupButtonID="ImgLaborExpDate"
                                                                                        Format="DD/MM/YYYY" ID="calLaborExpDate" OnClientDateSelectionChanged="checkDate_PrevSystemDateNotEqualToSystemdate">
                                                                                    </cc1:CalendarExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvLaborExpDate" runat="server"
                                                                                            ControlToValidate="txtLaborExpDate" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Labour Card Expiry Date" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lbl_LaborCardExpiryDate" CssClass="styleReqFieldLabel" Text="Labour Card Expiry Date"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:DropDownList ID="cmbOccupation" runat="server"
                                                                                        CssClass="md-form-control form-control" ToolTip="Occupation" ValidationGroup="Personal Details" AutoPostBack="true"
                                                                                        OnSelectedIndexChanged="cmbOccupation_OnSelectedIndexChanged">
                                                                                    </asp:DropDownList>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvOccupation" runat="server" ControlToValidate="cmbOccupation"
                                                                                            Display="Dynamic" InitialValue="0" ValidationGroup="Personal Details"
                                                                                            ErrorMessage="Select Occupation" SetFocusOnError="true" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label class="tess">
                                                                                        <asp:Label runat="server" ID="lbl_Occupation" CssClass="styleReqFieldLabel" Text="Occupation" ToolTip="Occupation"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtQualification" runat="server" MaxLength="40" ToolTip="Qualification" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="fteQualification" ValidChars=" ," TargetControlID="txtQualification"
                                                                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                                                        Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <%--<div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvQualification" runat="server"
                                                                                            ControlToValidate="txtQualification" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Qualification" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>--%>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblQualification" CssClass="styleFieldLabel" Text="Qualification"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:DropDownList ID="ddlHouseType" runat="server" CssClass="md-form-control form-control" ToolTip="House/Flat">
                                                                                    </asp:DropDownList>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvHouseType" runat="server"
                                                                                            ControlToValidate="ddlHouseType" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="0" ErrorMessage="Select House/Flat" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label class="tess">
                                                                                        <asp:Label runat="server" ID="lblHouseType" CssClass="styleDisplayLabel" Text="House/Flat"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:RadioButtonList ID="rbnOwn" runat="server" RepeatDirection="Horizontal" ToolTip="Own"
                                                                                        CssClass="md-form-control form-control radio" AutoPostBack="true" OnSelectedIndexChanged="rbnOwn_OnSelectedIndexChanged">
                                                                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                                    </asp:RadioButtonList>
                                                                                    <label class="tess">
                                                                                        <asp:Label runat="server" ID="lblOwn" CssClass="styleDisplayLabel" Text="Own"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtCurrentMarketValue" runat="server" Enabled="false" MaxLength="16" ToolTip="Current Market Value"
                                                                                        Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftxtCurrentMarketValue" runat="server" ValidChars="."
                                                                                        FilterType="Custom, Numbers" Enabled="true" TargetControlID="txtCurrentMarketValue">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvCurrentMarketValue" runat="server"
                                                                                            ControlToValidate="cmbEmployerName" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Current Market Value" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblCurrentMarketValue" CssClass="styleDisplayLabel"
                                                                                            Text="Current Market Value"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtRemainingLoanValue" runat="server" Enabled="false" MaxLength="16" ToolTip="Remaining Loan Value"
                                                                                        Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftxtRemainingLoanValue" runat="server" ValidChars="."
                                                                                        FilterType="Custom, Numbers" Enabled="true" TargetControlID="txtRemainingLoanValue">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblRemainingLoanValue" CssClass="styleDisplayLabel"
                                                                                            Text="Remaining Loan Value"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtTotNetWorth" runat="server" MaxLength="16" Enabled="false" ToolTip="Total Net Worth" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftxtTotNetWorth" runat="server" ValidChars="." FilterType="Custom, Numbers"
                                                                                        Enabled="true" TargetControlID="txtTotNetWorth">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblTotNetWorth" CssClass="styleDisplayLabel" Text="Total Net Worth"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:RadioButtonList ID="rbnMFCEmpIndi" runat="server" RepeatDirection="Horizontal"
                                                                                        ToolTip="MFC Employee Indicator" class="md-form-control form-control radio" AutoPostBack="true"
                                                                                        OnSelectedIndexChanged="rbnMFCEmpIndi_OnSelectedIndexChanged">
                                                                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                                    </asp:RadioButtonList>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvrbnMFCEmpIndi" runat="server"
                                                                                            ControlToValidate="rbnMFCEmpIndi" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Select MFC Employee Indicator" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <label class="tess">
                                                                                        <asp:Label runat="server" ID="lbl_MFCEmployeeIndicator" CssClass="styleReqFieldLabel" Text="MFC Employee Indicator" ToolTip="MFC Employee Indicator"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <uc2:Suggest ID="txtMfcCode" runat="server" ServiceMethod="GetUserList" ToolTip="MFC Employee Code" IsMandatory="false" AutoPostBack="true"
                                                                                        ValidationGroup="Personal Details" ErrorMessage="MFC Employee Code" OnItem_Selected="txtMfcCode_OnItem_Selected" />
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lbl_MFCEmployeeCode" CssClass="styleDisplayLabel" Text="MFC Employee Code" ToolTip="MFC Employee Code"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <cc1:ComboBox ID="cmbEmployerName" ValidationGroup="Personal Details" ToolTip="Employer Name"
                                                                                        runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDown"
                                                                                        AppendDataBoundItems="true" MaxLength="150" AutoPostBack="false" CaseSensitive="false"
                                                                                        CssClass="WindowsStyle">
                                                                                    </cc1:ComboBox>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvEmployerName" runat="server"
                                                                                            ControlToValidate="cmbEmployerName" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="0" ErrorMessage="Select/Enter Employer Name" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label class="tess">
                                                                                        <asp:Label runat="server" ID="lbl_EmployerName" CssClass="styleDisplayLabel" Text="Employer Name" ToolTip="Employer Name"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtEmployeeCode" runat="server" MaxLength="25"
                                                                                        Style="text-align: Left;" ToolTip="Employee Code" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" ValidChars="" TargetControlID="txtEmployeeCode"
                                                                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                                                        Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvEmployeeCode" runat="server"
                                                                                            ControlToValidate="txtEmployeeCode" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Employee Code" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lbl_EmployeeCode" CssClass="styleDisplayLabel" Text="Employee Code" ToolTip="Employee Code"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <cc1:ComboBox ID="cmEmpEcoCode" AutoPostBack="false" ValidationGroup="Personal Details" ToolTip="Employer Eco Act Code"
                                                                                        runat="server" AutoCompleteMode="Suggest" DropDownStyle="DropDownList"
                                                                                        AppendDataBoundItems="false" InitialValue="--Select--" CaseSensitive="false"
                                                                                        CssClass="WindowsStyle">
                                                                                    </cc1:ComboBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label class="tess">
                                                                                        <asp:Label runat="server" ID="lbl_EmployerEcoActCode" CssClass="styleDisplayLabel" Text="Employer Eco Act Code"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtDepartmentName" runat="server" MaxLength="75" ToolTip="Department Name"
                                                                                        Style="text-align: Left;" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="fteDepartmentName" ValidChars=" " TargetControlID="txtDepartmentName"
                                                                                        FilterType="Custom, UppercaseLetters, LowercaseLetters" runat="server"
                                                                                        Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvDepartmentName" runat="server"
                                                                                            ControlToValidate="txtDepartmentName" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Department Name" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lbl_DepartmentName" CssClass="styleDisplayLabel" Text="Department Name" ToolTip="Department Name"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtDesignation" runat="server" MaxLength="75" ToolTip="Designation"
                                                                                        Style="text-align: Left;" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="fteDesignations" ValidChars=" " TargetControlID="txtDesignation"
                                                                                        FilterType="Custom, UppercaseLetters, LowercaseLetters" runat="server"
                                                                                        Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvDesignation" runat="server"
                                                                                            ControlToValidate="txtDesignation" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Designation" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lbl_Designation" CssClass="styleDisplayLabel" Text="Designation" ToolTip="Designation"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtPlaceofWork" runat="server" MaxLength="75"
                                                                                        Style="text-align: Left;" ToolTip="Place of Work" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvPlaceofWork" runat="server"
                                                                                            ControlToValidate="txtPlaceofWork" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Place of Work" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lbl_PlaceofWork" CssClass="styleDisplayLabel" Text="Place of Work" ToolTip="Place of Work"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtDateOfJoin" runat="server" Enabled="true" ToolTip="Date Of Join" class="md-form-control form-control login_form_content_input requires_false" AutoPostBack="true" OnTextChanged="txtDateOfJoin_TextChanged"></asp:TextBox>
                                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtDateOfJoin" PopupButtonID="ImgDateOfJoin"
                                                                                        Format="DD/MM/YYYY" ID="calDateOfJoin"
                                                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                                    </cc1:CalendarExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvDateOfJoin" runat="server"
                                                                                            ControlToValidate="txtDateOfJoin" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Date Of Joining" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lbl_DateOfJoin" CssClass="styleDisplayLabel" Text="Date Of Joining" ToolTip="Date Of Joining"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtBussinessFirm" runat="server" MaxLength="100"
                                                                                        Style="text-align: Left;" ToolTip="Business Firm Name" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="fteBussinessFirm" ValidChars=" " TargetControlID="txtBussinessFirm"
                                                                                        FilterType="Custom, UppercaseLetters, LowercaseLetters" runat="server"
                                                                                        Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvBussinessFirm" runat="server"
                                                                                            ControlToValidate="txtBussinessFirm" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Business Firm Name" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblBussinessFirm" CssClass="styleDisplayLabel" Text="Business Firm Name" ToolTip="Business Firm Name"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtCRNumber" runat="server" MaxLength="11"
                                                                                        Style="text-align: Left;" ToolTip="CR Number" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="fteCRNumber" TargetControlID="txtCRNumber"
                                                                                        FilterType="Numbers" runat="server"
                                                                                        Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvCRNumber" runat="server"
                                                                                            ControlToValidate="txtCRNumber" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter CR Number" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtCRNumber" ID="rfvtxtCRNumber" ValidationExpression="^[\s\S]{7,11}$" runat="server"
                                                                                            ErrorMessage="Minimum 7 and Maximum 11 characters required." CssClass="validation_msg_box_sapn" SetFocusOnError="true" ValidationGroup="Personal Details" Enabled="true"></asp:RegularExpressionValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblCRNumber" CssClass="styleDisplayLabel" Text="CR Number" ToolTip="CR Number"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtMonBusIncome" runat="server" MaxLength="15"
                                                                                        Style="text-align: Left;" ToolTip="Monthly Business Income" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="fteMonBusIncome" runat="server" ValidChars="." FilterType="Custom, Numbers"
                                                                                        Enabled="true" TargetControlID="txtMonBusIncome">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvMonBusIncome" runat="server"
                                                                                            ControlToValidate="txtMonBusIncome" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="" ErrorMessage="Enter Monthly Business Income" SetFocusOnError="true">
                                                                                        </asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lbl_MonthlyBusinessIncome" CssClass="styleDisplayLabel" Text="Monthly Business Income" ToolTip="Monthly Business Income"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtNRID" runat="server" MaxLength="12"
                                                                                        Style="text-align: Left;" ToolTip="NRID Number" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="fteNRID" TargetControlID="txtNRID"
                                                                                        FilterType="Numbers" runat="server"
                                                                                        Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtNRID" ID="RegularExpressionValidator1" ValidationExpression="^[\s\S]{8,12}$" runat="server"
                                                                                            ErrorMessage="Minimum 8 and Maximum 12 characters required." CssClass="validation_msg_box_sapn" SetFocusOnError="true" ValidationGroup="Personal Details" Enabled="true"></asp:RegularExpressionValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblNRID" CssClass="styleDisplayLabel" Text="NRID Number" ToolTip="NRID Number"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtFamilyName" runat="server" MaxLength="50" Enabled="false"
                                                                                        Style="text-align: Left;" ToolTip="Family Name" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="Label1" CssClass="styleDisplayLabel" Text="Family Name" ToolTip="Family Name"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                    <div class="row">
                                                        <asp:Panel GroupingText="Non Individual Customer" ID="pnlNonIndividual" runat="server"
                                                            CssClass="stylePanel">
                                                            <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="row">
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtKeyDecisionMaker" MaxLength="50" runat="server" class="md-form-control form-control login_form_content_input requires_false"
                                                                                    ToolTip="Key Decision Maker"></asp:TextBox>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvKeyDecisionMaker" runat="server" ValidationGroup="Personal Details"
                                                                                        ControlToValidate="txtKeyDecisionMaker" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="" ErrorMessage="Enter Key Decision Maker" SetFocusOnError="true">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <cc1:FilteredTextBoxExtender ID="fteKeyDecisionMaker" ValidChars=" " TargetControlID="txtKeyDecisionMaker"
                                                                                    FilterType="Custom, UppercaseLetters, LowercaseLetters" runat="server"
                                                                                    Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblKeyDecisionMaker" CssClass="styleReqFieldLabel" Text="Key Decision Maker" ToolTip="Key Decision Maker"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtDirectors" runat="server" MaxLength="2" Style="text-align: right;" ToolTip="No.of Directors/Partners"
                                                                                    onblur="ChkIsZero(this, 'No.of Directors/Partners')" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtDirectors" runat="server" ValidChars="" FilterType="Numbers"
                                                                                    Enabled="true" TargetControlID="txtDirectors">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvDirectors" runat="server"
                                                                                        ControlToValidate="txtDirectors" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter No.of Directors/Partners" InitialValue="" SetFocusOnError="true" Enabled="false"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblDirectors" CssClass="styleReqFieldLabel" Text="No.of Directors/Partners"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:RadioButtonList ID="rbnFinancialRequired" runat="server" RepeatDirection="Horizontal"
                                                                                    ToolTip="Financial Required" class="md-form-control form-control radio" AutoPostBack="true" OnSelectedIndexChanged="rbnFinancialRequired_SelectedIndexChanged">
                                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                                </asp:RadioButtonList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvFinancialRequired" runat="server"
                                                                                        ControlToValidate="rbnFinancialRequired" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="" ErrorMessage="Select Financial Required" SetFocusOnError="true">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lbl_FinancialRequired" CssClass="styleDisplayLabel" Text="Financial Required" ToolTip="Financial Required"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="cmbFinancialReceived" ValidationGroup="Personal Details" ToolTip="Financial Received"
                                                                                    runat="server" CssClass="md-form-control form-control" Enabled="false">
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvFinancialReceived" runat="server"
                                                                                        ControlToValidate="cmbFinancialReceived" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="0" ErrorMessage="Select Financial Received" SetFocusOnError="true">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lbl_FinancialReceived" CssClass="styleDisplayLabel" Text="Financial Received" ToolTip="Financial Received"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlGovernment" runat="server" CssClass="md-form-control form-control" ToolTip="Economic Activity">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lbl_EconomicActivity" CssClass="styleDisplayLabel" Text="Economic Activity" ToolTip="Economic Activity"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtPercentageStake" ToolTip="Omani Staff"
                                                                                    runat="server" Style="text-align: right;" onchange="TotalEmployeeAdd();" onblur="ChkIsZero(this, 'Omani Staff')" AutoPostBack="true" OnTextChanged="txtPercentageStake_TextChanged"
                                                                                    MaxLength="4" class="md-form-control form-control login_form_contentinput requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftePercentageStake" runat="server" ValidChars="" FilterType="Numbers"
                                                                                    Enabled="true" TargetControlID="txtPercentageStake">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvOmaniStaff"
                                                                                        runat="server" ControlToValidate="txtPercentageStake" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Enter Omani Staff" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lbl_OmaniStaff" CssClass="styleReqFieldLabel" Text="Omani Staff" ToolTip="Omani Staff"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtJVPartnerStake" ToolTip="Expat Staff"
                                                                                    runat="server" Style="text-align: right;" onchange="TotalEmployeeAdd();" AutoPostBack="true" OnTextChanged="txtJVPartnerStake_TextChanged"
                                                                                    MaxLength="4" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="fteJVPartnerStake" runat="server" ValidChars="" FilterType="Numbers"
                                                                                    Enabled="true" TargetControlID="txtJVPartnerStake">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvJVPartnerStake"
                                                                                        runat="server" ControlToValidate="txtJVPartnerStake" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Enter Expat Staff" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblJVPartnerStake" CssClass="styleReqFieldLabel" Text="Expat Staff"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtNoOfEmployees" runat="server" MaxLength="4" Enabled="false" class="md-form-control form-control login_form_content_input requires_false" ToolTip="Number Of Employees"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="fteNoOfEmployees" runat="server" ValidChars="" FilterType="Numbers"
                                                                                    Enabled="true" TargetControlID="txtNoOfEmployees">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvNoOfEmployees"
                                                                                        runat="server" ControlToValidate="txtNoOfEmployees" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Enter No Of Employees " Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lblNoOfEmployees" CssClass="styleReqFieldLabel" Text="No Of Employees" ToolTip="No Of Employees"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtAnnualSales" runat="server" MaxLength="15" Style="text-align: right;"
                                                                                    ToolTip="Annual Sales" class="md-form-control form-control login_form_content_input requires_false" AutoPostBack="true" OnTextChanged="txtAnnualSales_TextChanged"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="fteAnnualSales" runat="server" ValidChars="." FilterType="Custom, Numbers"
                                                                                    Enabled="true" TargetControlID="txtAnnualSales">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvAnnualSales"
                                                                                        runat="server" ControlToValidate="txtAnnualSales" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Enter Annual Sales(Turn Over)" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblAnnualSales" CssClass="styleReqFieldLabel" Text="Annual Sales" ToolTip="Annual Sales(Turn Over)"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtTotalAssets" runat="server" MaxLength="15" Style="text-align: right;" ToolTip="Total Assets"
                                                                                    class="md-form-control form-control login_form_content_input requires_false" AutoPostBack="true" OnTextChanged="txtTotalAssets_TextChanged"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="fteTotalAssets" runat="server" ValidChars="." FilterType="Custom, Numbers"
                                                                                    Enabled="true" TargetControlID="txtTotalAssets">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvTotalAssets"
                                                                                        runat="server" ControlToValidate="txtTotalAssets" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Enter Total Assets" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblTotal_Assets" CssClass="styleReqFieldLabel" Text="Total Assets"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtBussinessActivity" runat="server" class="md-form-control form-control login_form_content_input requires_false" ToolTip="Business Activity(Primary)"></asp:TextBox>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvBussinessActivity"
                                                                                        runat="server" ControlToValidate="txtBussinessActivity" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Enter Business Activity(Primary)" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblBussinessActivity" CssClass="styleReqFieldLabel"
                                                                                        Text="Business Activity(Primary)" ToolTip="Business Activity(Primary)"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtAuditorName" runat="server" MaxLength="20"
                                                                                    Style="text-align: Left;" ToolTip="Auditor Name" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvAuditorName"
                                                                                        runat="server" ControlToValidate="txtAuditorName" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Enter Auditor Name" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <cc1:FilteredTextBoxExtender ID="fteAuditorName" ValidChars=" " TargetControlID="txtAuditorName"
                                                                                    FilterType="Custom, UppercaseLetters, LowercaseLetters" runat="server"
                                                                                    Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblAuditorName" CssClass="styleDisplayLabel" Text="Auditor Name" ToolTip="Auditor Name"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtOCCIIssueDate" runat="server" ToolTip="OCCI Issue Date" AutoPostBack="true" OnTextChanged="txtOCCIIssueDate_TextChanged" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtOCCIIssueDate" PopupButtonID="imgOCCIIssueDate"
                                                                                    Format="DD/MM/YYYY" ID="calOCCIIssueDate" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                                </cc1:CalendarExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvOCCIIssueDate"
                                                                                        runat="server" ControlToValidate="txtOCCIIssueDate" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Enter OCCI Issue Date" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lbl_OCCIIssueDate" CssClass="styleReqFieldLabel" Text="OCCI Issue Date" ToolTip="OCCI Issue Date"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtOCCIExpiryDate" runat="server" AutoPostBack="true" OnTextChanged="txtOCCIExpiryDate_TextChanged" ToolTip="OCCI Expiry Date" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtOCCIExpiryDate" PopupButtonID="imgOCCIExpiryDate"
                                                                                    Format="DD/MM/YYYY" ID="calOCCIExpiryDate" Enabled="True">
                                                                                </cc1:CalendarExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvOCCIExpiryDate"
                                                                                        runat="server" ControlToValidate="txtOCCIExpiryDate" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Enter OCCI Expiry Date" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lbl_OCCIExpiryDate" CssClass="styleReqFieldLabel" Text="OCCI Expiry Date" ToolTip="OCCI Expiry Date"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtNonMoci" runat="server" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_false"
                                                                                    MaxLength="12" ToolTip="NON-MOCI"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftetxtNonMoci" runat="server" ValidChars="" FilterType="Numbers"
                                                                                    Enabled="true" TargetControlID="txtNonMoci">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvNonMoci"
                                                                                        runat="server" ControlToValidate="txtNonMoci" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Enter NON-MOCI" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblNonMoci" CssClass="styleDisplayLabel"
                                                                                        Text="NON-MOCI" ToolTip="NON-MOCI"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="cmbPublic" AutoPostBack="true" ValidationGroup="Personal Details" ToolTip="Public/Closely held"
                                                                                    runat="server" CssClass="md-form-control form-control" OnSelectedIndexChanged="cmbPublic_OnSelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lblPublic" CssClass="styleFieldLabel" Text="Public/Closely held"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtSE" runat="server" MaxLength="40" ToolTip="Listed Exchange" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvLimitedExchange" runat="server"
                                                                                        ControlToValidate="txtSE" CssClass="validation_msg_box_sapn" Display="Dynamic" Enabled="false" InitialValue="" ErrorMessage="Enter Listed Exchange" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblStockExchange" CssClass="styleFieldLabel" Text="Listed Exchange"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtPaidCapital" runat="server" MaxLength="15" Style="text-align: right;" ToolTip="Paid Up Capital" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtPaidCapital" runat="server" ValidChars="." FilterType="Custom, Numbers"
                                                                                    Enabled="true" TargetControlID="txtPaidCapital">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvPaidCapital" runat="server"
                                                                                        ControlToValidate="txtPaidCapital" CssClass="validation_msg_box_sapn" Display="Dynamic" Enabled="false" InitialValue=""
                                                                                        ErrorMessage="Enter Paid Up Capital" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblPaidCapital" CssClass="styleFieldLabel" Text="Paid Up Capital"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtfacevalue" runat="server" MaxLength="16" ToolTip="Face Value of Shares" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtfacevalue" runat="server" ValidChars="." FilterType="Custom, Numbers"
                                                                                    Enabled="true" TargetControlID="txtfacevalue">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvfacevalue" runat="server"
                                                                                        ControlToValidate="txtfacevalue" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="" ErrorMessage="Enter Face Value of Shares" SetFocusOnError="true" Enabled="false"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblfacevalue" CssClass="styleFieldLabel" Text="Face Value of Shares"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtbookvalue" runat="server" MaxLength="16" ToolTip="Book Value of Shares" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtbookvalue" runat="server" ValidChars="." FilterType="Custom, Numbers"
                                                                                    Enabled="true" TargetControlID="txtbookvalue">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvbookvalue" runat="server"
                                                                                        ControlToValidate="txtbookvalue" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue=""
                                                                                        ErrorMessage="Book Value of Shares" SetFocusOnError="true" Enabled="false"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblbookvalue" CssClass="styleFieldLabel" Text="Book Value of Shares"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtBusinessProfile" runat="server" MaxLength="240" ToolTip="Business Profile" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtBusinessProfile" runat="server" ValidChars=" .~`!@#$%^&*()_-+=[]{};':<>,?/"
                                                                                    FilterType="Custom,LowercaseLetters,UppercaseLetters,Numbers" Enabled="true"
                                                                                    TargetControlID="txtBusinessProfile">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <%--<div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvBusinessProfile" runat="server"
                                                                                        ControlToValidate="txtBusinessProfile" CssClass="validation_msg_box_sapn" ErrorMessage="Enter Business Profile" Display="Dynamic" InitialValue="" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>--%>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblBusinessProfile" CssClass="styleFieldLabel" Text="Business Profile"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtGeographical" runat="server" MaxLength="120" ToolTip="Geographical Coverage" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <%-- <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvGeographical" runat="server"
                                                                                        ControlToValidate="txtGeographical" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Geographical Coverage" InitialValue="" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>--%>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblGeographical" CssClass="styleFieldLabel" Text="Geographical Coverage"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtnobranch" runat="server" MaxLength="4" Style="text-align: right;" ToolTip="No. Of Staff" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtnobranch" runat="server" ValidChars="" FilterType="Numbers"
                                                                                    Enabled="true" TargetControlID="txtnobranch">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblnobranch" CssClass="styleDisplayLabel" Text="No. Of Staff" ToolTip="No. Of Staff"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtJVPartnerName" runat="server" MaxLength="120" ToolTip="JV Partner Name" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="fteJVPartnerName" ValidChars=" " TargetControlID="txtJVPartnerName"
                                                                                    FilterType="Custom, UppercaseLetters, LowercaseLetters" runat="server"
                                                                                    Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lbl_JVPartnerName" CssClass="styleDisplayLabel" Text="JV Partner Name" ToolTip="JV Partner Name"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCEOName" runat="server" MaxLength="50" ToolTip="CEO Name" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="fteCEOName" ValidChars=" " TargetControlID="txtCEOName"
                                                                                    FilterType="Custom, UppercaseLetters, LowercaseLetters" runat="server"
                                                                                    Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lbl_CEOName" CssClass="styleDisplayLabel" Text="CEO Name" ToolTip="CEO Name"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCEOAge" runat="server" MaxLength="2" Style="text-align: right;" ToolTip="Age Of CEO"
                                                                                    onchange="ChkIsZero(this, 'Age of CEO')" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtCEOAge" runat="server" ValidChars="" FilterType="Numbers"
                                                                                    Enabled="true" TargetControlID="txtCEOAge">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtCEOAge" ID="rfvCEOAge" ValidationExpression="^[\s\S]{2,2}$" runat="server"
                                                                                        ErrorMessage="Minimum 2 characters required." CssClass="validation_msg_box_sapn" SetFocusOnError="true" ValidationGroup="Personal Details" Enabled="true"></asp:RegularExpressionValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lbl_AgeOfCEO" CssClass="styleDisplayLabel" Text="Age Of CEO" ToolTip="Age Of CEO"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCEOexperience" runat="server" MaxLength="2" Style="text-align: right;" ToolTip="CEO Experience (in Years)"
                                                                                    class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtCEOexperience" runat="server" ValidChars=""
                                                                                    FilterType="Numbers" Enabled="true" TargetControlID="txtCEOexperience">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lbl_CEOExp" CssClass="styleDisplayLabel" Text="CEO Experience (in Years)" ToolTip="CEO Experience (in Years)"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row" style="margin-top: 10px;">
                                                                <asp:Panel GroupingText="Share Holder Details" ToolTip="Share Holder Details"
                                                                    ID="pnlUsers" runat="server" CssClass="stylePanel" Width="100%">
                                                                    <div class="gird">
                                                                        <asp:GridView runat="server" ShowFooter="true" ToolTip="Share Holder Details"
                                                                            OnRowCommand="grvShars_RowCommand" EmptyDataText="No Share Holder Details Found!..."
                                                                            ID="grvShars" Width="100%" OnRowDeleting="grvShars_RowDeleting" OnRowDataBound="grvShars_RowDataBound"
                                                                            AutoGenerateColumns="False" HeaderStyle-CssClass="styleGridHeader" class="gird_details">
                                                                            <Columns>
                                                                                <asp:TemplateField ItemStyle-Width="2%" HeaderText="Sl.No.">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>' ToolTip="Sl.No."></asp:Label>
                                                                                        <asp:Label runat="server" ID="lblSNO" Text='<%#Eval("Sno")%>' Visible="false"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Share Holder Name">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" ID="lblSHARE_HOLDER_NAME" Text='<%#Eval("SHARE_HOLDER_NAME")%>' ToolTip="Share Holder Name"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:TextBox ID="txtFSholderName" runat="server" CssClass="md-form-control form-control login_form_content_input"
                                                                                                ToolTip="Share Holder Name" MaxLength="75"></asp:TextBox>
                                                                                            <cc1:FilteredTextBoxExtender ID="fteFSholderName" ValidChars=" " TargetControlID="txtFSholderName"
                                                                                                FilterType="Custom, UppercaseLetters, LowercaseLetters" runat="server"
                                                                                                Enabled="True">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator ValidationGroup="ShareAdd" ID="rfvFSholderName"
                                                                                                    runat="server" ControlToValidate="txtFSholderName" CssClass="validation_msg_box_sapn"
                                                                                                    ErrorMessage="Enter Share Holder Name" Display="Dynamic" InitialValue="" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Share Holder&#8217;s ID No">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" ID="lblSHARE_HOLDER_NO" Text='<%#Eval("SHARE_HOLDER_NO")%>' ToolTip="Share Holder&#8217;s ID No"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:TextBox ID="txtFSHARE_HOLDER_NO" runat="server" CssClass="md-form-control form-control login_form_content_input"
                                                                                                ToolTip="Share Holder&#8217;s ID No" MaxLength="50"></asp:TextBox>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <cc1:FilteredTextBoxExtender ID="fteFSHARE_HOLDER_NO" runat="server" ValidChars="/"
                                                                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                                                Enabled="True" TargetControlID="txtFSHARE_HOLDER_NO">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator ValidationGroup="ShareAdd" ID="rfvFSHARE_HOLDER_NO"
                                                                                                    runat="server" ControlToValidate="txtFSHARE_HOLDER_NO" CssClass="validation_msg_box_sapn"
                                                                                                    ErrorMessage="Enter Share Holders ID No" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Share Holder&#8217;s Nationality">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" ID="lblSHARE_HOLDER_NATION" Text='<%#Eval("SHARE_HOLDER_NATION")%>' ToolTip="Nationality"></asp:Label>
                                                                                        <asp:Label runat="server" ID="lblSHARE_HOLDER_NATIONID" Text='<%#Eval("SHARE_HOLDER_NATION_ID")%>' Visible="false"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <uc2:Suggest ID="ddlFSHARE_HOLDER_NATION" runat="server" ServiceMethod="GetNationalList" ErrorMessage="Select a Nationality"
                                                                                                IsMandatory="true" ValidationGroup="ShareAdd" Enabled="true" />
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Share Holder&#8217;s Percentage">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" ID="lblSHARE_HOLDER_PERC" Text='<%#Eval("SHARE_HOLDER_PERC")%>' ToolTip="Percentage"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:TextBox ID="txtFSHARE_HOLDER_PERC" runat="server" CssClass="md-form-control form-control login_form_content_input"
                                                                                                ToolTip="Percentage" MaxLength="7"></asp:TextBox>
                                                                                            <cc1:FilteredTextBoxExtender ID="ftFSHARE_HOLDER_PERC" runat="server" ValidChars="." FilterType="Custom, Numbers"
                                                                                                Enabled="true" TargetControlID="txtFSHARE_HOLDER_PERC">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator ValidationGroup="ShareAdd" ID="rfvFSHARE_HOLDER_PERC"
                                                                                                    runat="server" ControlToValidate="txtFSHARE_HOLDER_PERC" CssClass="validation_msg_box_sapn"
                                                                                                    ErrorMessage="Enter Share Holder Percentage" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" Width="15%" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="lnkDelete" runat="server" CssClass="grid_btn_delete" CommandName="Delete" CausesValidation="false" Text="Remove"
                                                                                            OnClientClick="return confirm('Are you sure you want to Remove this record?');" ToolTip="Remove the Details, Alt+Shift+E" AccessKey="E"></asp:Button>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:Button ID="btnAddShare" Width="50px" runat="server" CommandName="AddNew"
                                                                                            CssClass="grid_btn" Text="Add" ValidationGroup="ShareAdd" ToolTip="Add the Details, Alt+T" AccessKey="T"></asp:Button>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <RowStyle HorizontalAlign="left" />
                                                                        </asp:GridView>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                    <div class="row">
                                                        <asp:Panel GroupingText="Factoring Customers" ID="pnlFacCustPnl" runat="server"
                                                            CssClass="stylePanel">
                                                            <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="row">
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:RadioButtonList ID="rbnFactoringApplicable" runat="server" RepeatDirection="Horizontal"
                                                                                    ToolTip="Factoring Applicable" class="md-form-control form-control radio" AutoPostBack="true" OnSelectedIndexChanged="rbnFactoringApplicable_OnSelectedIndexChanged">
                                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="No" Value="2" Selected="True"></asp:ListItem>
                                                                                </asp:RadioButtonList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvFactoringApplicable" runat="server"
                                                                                        ControlToValidate="rbnFactoringApplicable" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="" ErrorMessage="Select Factoring Applicable" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lbl_FactoringApplicable" CssClass="styleDisplayLabel" Text="Factoring Applicable" ToolTip="Factoring Applicable"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="cmbFactoringType" runat="server" Enabled="false"
                                                                                    CssClass="md-form-control form-control" ToolTip="Factoring Type">
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvFactoringType" runat="server"
                                                                                        ControlToValidate="cmbFactoringType" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="0" ErrorMessage="Select Factoring Type" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lbl_FactoringType" CssClass="styleDisplayLabel" Text="Factoring Type" ToolTip="Factoring Type"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtFactoringLimit" runat="server" MaxLength="20"
                                                                                    Style="text-align: Left;" ToolTip="Factoring Limit" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="fteFactoringLimit" runat="server" ValidChars="." FilterType="Custom, Numbers"
                                                                                    Enabled="true" TargetControlID="txtFactoringLimit">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" Enabled="false" ID="rfvFactoringLimit" runat="server"
                                                                                        ControlToValidate="txtFactoringLimit" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="" ErrorMessage="Enter Factoring Limit" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lbl_FactoringLimit" CssClass="styleDisplayLabel" Text="Factoring Limit" ToolTip="Factoring Limit"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtFacLimitExp" runat="server" Enabled="true" ToolTip="Factoring Limit Expiry date"
                                                                                    class="md-form-control form-control login_form_content_input requires_false" AutoPostBack="true" OnTextChanged="txtFacLimitExp_TextChanged"></asp:TextBox>
                                                                                <%--<asp:Image ID="ImgFacLimitExp" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtFacLimitExp" PopupButtonID="ImgFacLimitExp"
                                                                                    Format="DD/MM/YYYY" ID="calFacLimitExp" Enabled="true"
                                                                                    OnClientDateSelectionChanged="checkDate_PrevSystemDateNotEqualToSystemdate">
                                                                                </cc1:CalendarExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" Enabled="false" ID="rfvFacLimitExp" runat="server"
                                                                                        ControlToValidate="txtFacLimitExp" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="" ErrorMessage="Enter Factoring Limit Expiry date" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lbl_Fac_LimitExp_Date" CssClass="styleDisplayLabel" Text="Factoring Limit Expiry date"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:RadioButtonList ID="rbnCovenantApplicable" runat="server" RepeatDirection="Horizontal"
                                                                                    ToolTip="Factoring Applicable" class="md-form-control form-control radio" AutoPostBack="true" OnSelectedIndexChanged="rbnCovenantApplicable_SelectedIndexChanged">
                                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                                </asp:RadioButtonList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvCovenantApplicable" runat="server"
                                                                                        ControlToValidate="rbnCovenantApplicable" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="" ErrorMessage="Select Covenants Applicable" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lbl_CovenantsApplicable" CssClass="styleDisplayLabel" Text="Covenants Applicable"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCovenantClause" runat="server" MaxLength="75" Enabled="false"
                                                                                    Style="text-align: Left;" ToolTip="Covenants Clause" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="fteCovenantClause" ValidChars=" " TargetControlID="txtCovenantClause"
                                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                                                    Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lbl_CovenantsClause" CssClass="styleDisplayLabel" Text="Covenants Clause"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="rbnCreditType" runat="server"
                                                                                    ToolTip="Credit Type" CssClass="md-form-control form-control">
                                                                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                                                    <asp:ListItem Text="Oneshot" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="Revolving" Value="2"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvCreditType" runat="server"
                                                                                        ControlToValidate="rbnCreditType" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="0" ErrorMessage="Select Credit Type" SetFocusOnError="true">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lblCreditType" CssClass="styleReqFieldLabel" Text="Credit Type"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:RadioButtonList ID="rbnAssignmentCollection" runat="server" RepeatDirection="Horizontal"
                                                                                    ToolTip="Assignment Collection" class="md-form-control form-control radio">
                                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                                </asp:RadioButtonList>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lbl_AssignmentCollection" CssClass="styleDisplayLabel" Text="Assignment Collection"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                    <div class="row">
                                                        <asp:Panel GroupingText="Common Details" ID="Panel2" runat="server"
                                                            CssClass="stylePanel">
                                                            <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="row">
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlVIP" runat="server" CssClass="md-form-control form-control" ToolTip="VIP Customer">
                                                                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvVIP" runat="server" ValidationGroup="Personal Details"
                                                                                        ControlToValidate="ddlVIP" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="0" ErrorMessage="Select VIP Customer(Yes/No)" SetFocusOnError="true">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lbl_VICustomer" CssClass="styleReqFieldLabel" Text="VIP Customer" ToolTip="VIP Customer"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:RadioButtonList ID="rbnSMEIndicator" runat="server" RepeatDirection="Horizontal"
                                                                                    ToolTip="SME Indicator" CssClass="md-form-control form-control radio" AutoPostBack="true" OnSelectedIndexChanged="rbnSMEIndicator_OnSelectedIndexChanged">
                                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                                </asp:RadioButtonList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvSMEIndicator" runat="server"
                                                                                        ControlToValidate="rbnSMEIndicator" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="" ErrorMessage="Select SME Indicator" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <asp:CheckBox runat="server" ID="chkIS_SME_FORCED" Text="Customer" ToolTip="Customer" Visible="false" />
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lblSMEIndication" CssClass="styleDisplayLabel" Text="SME Indicator"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:RadioButtonList ID="rbnSenAppli" runat="server" RepeatDirection="Horizontal"
                                                                                    ToolTip="Senior Member Applicability" class="md-form-control form-control radio" AutoPostBack="true" OnSelectedIndexChanged="rbnSenAppli_OnSelectedIndexChanged">
                                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                                </asp:RadioButtonList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvSenAppli" runat="server"
                                                                                        ControlToValidate="rbnSenAppli" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="" ErrorMessage="Select Senior Member Applicability" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lbl_SeniorMemberApplicability" CssClass="styleDisplayLabel" Text="Senior Member Applicability" ToolTip="Senior Member Applicability"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:RadioButtonList ID="rbnSenMemStatus" runat="server" RepeatDirection="Horizontal"
                                                                                    ToolTip="Senior Member Status" class="md-form-control form-control radio">
                                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                                </asp:RadioButtonList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvSenMemStatus" runat="server"
                                                                                        ControlToValidate="rbnSenMemStatus" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="" ErrorMessage="Select Senior Member Status" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lbl_SeniorMemberStatus" CssClass="styleDisplayLabel" Text="Senior Member Status" ToolTip="Senior Member Status"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:RadioButtonList ID="rbnSenMemRelInd" runat="server" RepeatDirection="Horizontal"
                                                                                    ToolTip="Senior Member Relation Indicator" class="md-form-control form-control radio">
                                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                                </asp:RadioButtonList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvSenMemRelInd" runat="server"
                                                                                        ControlToValidate="rbnSenMemRelInd" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="" ErrorMessage="Select Senior Member Relation Indicator" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lbl_SeniorMemberRelationIndicator" CssClass="styleDisplayLabel" Text="Senior Member Relation Indicator" ToolTip="Senior Member Relation Indicator"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:RadioButtonList ID="rbnRelaPartyind" runat="server" RepeatDirection="Horizontal"
                                                                                    ToolTip="Related Party Indicator" class="md-form-control form-control radio">
                                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                                </asp:RadioButtonList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvRelaPartyind" runat="server"
                                                                                        ControlToValidate="rbnRelaPartyind" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="" ErrorMessage="Select Related Party Indicator" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lbl_RelPartyIndi" CssClass="styleReqFieldLabel" Text="Related Party Indicator" ToolTip="Related Party Indicator"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="cmbSenMemProfession" runat="server" ValidationGroup="Personal Details"
                                                                                    CssClass="md-form-control form-control" ToolTip="Senior Member Profession">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="Label3" CssClass="styleDisplayLabel" Text="Senior Member Profession" ToolTip="Senior Member Profession"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtMaxLenLimit" Enabled="false" runat="server" MaxLength="20"
                                                                                    Style="text-align: Left;" ToolTip="Maximum Lending Limit" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftetMaxLenLimit" runat="server" ValidChars="."
                                                                                    FilterType="Custom, Numbers" Enabled="true" TargetControlID="txtMaxLenLimit">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvMaxLenLimit" Enabled="false" runat="server"
                                                                                        ControlToValidate="txtMaxLenLimit" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="" ErrorMessage="Enter Maximum Lending Limit" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lbl_MaximumLendingLimit" CssClass="styleDisplayLabel" Text="Maximum Lending Limit" ToolTip="Maximum Lending Limit"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtMaxLenLimiExpDate" runat="server" Enabled="true" AutoPostBack="true" OnTextChanged="txtMaxLenLimiExpDate_TextChanged"
                                                                                    ToolTip="Factoring Limit Expiry date" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <%--<asp:Image ID="ImgMaxLenLimiExpDate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtMaxLenLimiExpDate" PopupButtonID="ImgMaxLenLimiExpDate"
                                                                                    Format="DD/MM/YYYY" ID="calMaxLenLimiExpDate" Enabled="true"
                                                                                    OnClientDateSelectionChanged="checkDate_PrevSystemDateNotEqualToSystemdate">
                                                                                </cc1:CalendarExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvMaxLenLimiExpDate" Enabled="false" runat="server"
                                                                                        ControlToValidate="txtMaxLenLimiExpDate" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="" ErrorMessage="Enter Maximum Lending Limit Expiry Date" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lbl_MaxLimitExpDate" CssClass="styleReqFieldLabel" Text="Maximum Lending Limit Expiry Date"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="cmbIndustryType" runat="server" ValidationGroup="Personal Details"
                                                                                    CssClass="md-form-control form-control" ToolTip="Industry Type">
                                                                                </asp:DropDownList>
                                                                                <%-- <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvIndustryType" runat="server"
                                                                                        ControlToValidate="cmbIndustryType" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                        InitialValue="0" ErrorMessage="Select Industry Type" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                </div>--%>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lbl_IndustryType" CssClass="styleFieldLabel" Text="Industry Type" ToolTip="Industry Type"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:RadioButtonList ID="rbnLanCollateral" runat="server" RepeatDirection="Horizontal"
                                                                                    ToolTip="Land Collateral" class="md-form-control form-control radio">
                                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                                                </asp:RadioButtonList>
                                                                                <%--<asp:TextBox ID="txtLanCollateral" runat="server" Enabled="true" MaxLength="100"
                                                                                    ToolTip="Land Collateral" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="fteLanCollateral" ValidChars=" " TargetControlID="txtLanCollateral"
                                                                                    FilterType="Custom, UppercaseLetters, LowercaseLetters" runat="server"
                                                                                    Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                                <%-- <span class="highlight"></span>
                                                                                <span class="bar"></span>--%>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lblLanCollateral" CssClass="styleDisplayLabel" Text="Land Collateral"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvLimitHis" visible="false">
                                                                            <div class="md-input">
                                                                                <button class="css_btn_enabled" id="btnLimitHistory" onserverclick="btnLimitHistory_Click" runat="server" causesvalidation="false" title="Limit History[Alt+Shift+H]"
                                                                                    type="button" accesskey="H">
                                                                                    <i aria-hidden="true"></i>&emsp;Limit <u>H</u>istory
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <asp:Panel ID="pnlGroupCustomerLimit" class="container" GroupingText="Customer Limit"
                                                                            runat="server" Width="100%" CssClass="stylePanel">
                                                                            <div class="gird">
                                                                                <asp:GridView ID="grvCustSubLimit" HorizontalAlign="Center" runat="server" AutoGenerateColumns="false" ToolTip="Factoring  Sublimit"
                                                                                    Width="100%" ShowFooter="true" OnRowDataBound="grvCustSubLimit_RowDataBound"
                                                                                    OnRowCommand="grvCustSubLimit_RowCommand" OnRowDeleting="grvCustSubLimit_RowDeleting"
                                                                                    OnRowEditing="grvCustSubLimit_RowEditing" HeaderStyle-CssClass="styleGridHeader" class="gird_details" OnRowCancelingEdit="grvCustSubLimit_RowCancelingEdit"
                                                                                    OnRowUpdating="grvCustSubLimit_RowUpdating">
                                                                                    <Columns>
                                                                                        <asp:TemplateField HeaderText="S.No">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex%>'></asp:Label>
                                                                                                <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />
                                                                                                <asp:Label ID="lbldelst" Visible="false" runat="server" Text='<%#Eval("DEL_STAT") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:Label ID="lblSerialNo" Value='<%#Eval("Serial_Number") %>' runat="server"></asp:Label>
                                                                                            </FooterTemplate>
                                                                                            <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                            <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                                                            <FooterStyle Width="5%" HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Line of Business">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblLobId" Text='<%#Eval("Lob_Id") %>' Visible="false" runat="server" />
                                                                                                <asp:Label ID="lblLobName" Text='<%#Eval("Lob_Name") %>' runat="server"></asp:Label>
                                                                                            </ItemTemplate>
                                                                                           <%-- <EditItemTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:DropDownList ID="ddlLOBE" runat="server" Width="98%" ToolTip="Lob Name" />
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <div class="validation_msg_box">
                                                                                                        <asp:RequiredFieldValidator ID="rfvddlLOBE" CssClass="validation_msg_box_sapn" runat="server" Display="Dynamic"
                                                                                                            ErrorMessage="Select the Line of Business" ControlToValidate="ddlLOBE"
                                                                                                            InitialValue="0" ValidationGroup="vgEUpdate" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </EditItemTemplate>--%>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:DropDownList ID="ddlLOBF" runat="server" onmouseover="ddl_itemchanged(this)"
                                                                                                        ToolTip="Line of Business" />
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <div class="validation_msg_box">
                                                                                                        <asp:RequiredFieldValidator ID="rfvddlLOB" CssClass="validation_msg_box_sapn" runat="server" Display="Dynamic"
                                                                                                            ErrorMessage="Select the Line of Business" ControlToValidate="ddlLOBF"
                                                                                                            InitialValue="0" ValidationGroup="vgAdd" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                            <HeaderStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                            <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                                                            <FooterStyle Width="10%" HorizontalAlign="Center" />

                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Limit">
                                                                                            <ItemTemplate>
                                                                                                <asp:TextBox ID="txtLimitAmnt" runat="server"
                                                                                                    ToolTip="Limit" Enabled="false" Text='<%#Eval("Limit") %>' Style="width: 90%; text-align: right; border-color: White;" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                            </ItemTemplate>
                                                                                            <%--<EditItemTemplate>
                                                                                                <asp:TextBox ID="txtLimitAmntE" Text='<%#Eval("Limit") %>' AutoPostBack="true" OnTextChanged="txtLimitAmnt_OntextChanged" Style="width: 90%; text-align: right; border-color: White;"
                                                                                                    ToolTip="Limit" runat="server"
                                                                                                    onblur="funChkDecimial(this,16,3,'Limit');" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                                <cc1:FilteredTextBoxExtender ID="ftbeLimitE" runat="server" FilterMode="ValidChars"
                                                                                                    FilterType="Custom,Numbers" ValidChars="." TargetControlID="txtLimitAmntE">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                <div class="validation_msg_box">
                                                                                                    <asp:RequiredFieldValidator ID="rfvLimitAmntE" runat="server" Display="Dynamic" ErrorMessage="Enter the Limit Value."
                                                                                                        ControlToValidate="txtLimitAmntE" ValidationGroup="vgEUpdate" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                                </div>
                                                                                            </EditItemTemplate>--%>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtLimitF" AutoPostBack="false"  runat="server" Style="width: 90%; text-align: right;"
                                                                                                        ToolTip="Limit" onblur="funChkDecimial(this,16,3,'Limit');" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                                    <cc1:FilteredTextBoxExtender ID="ftbeFPostPercent" runat="server" FilterMode="ValidChars"
                                                                                                        FilterType="Custom,Numbers" ValidChars="." TargetControlID="txtLimitF">
                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <div class="validation_msg_box">
                                                                                                        <asp:RequiredFieldValidator ID="rfvFCuttOffDate" runat="server" Display="Dynamic" ErrorMessage="Enter the Limit Value."
                                                                                                            ControlToValidate="txtLimitF" ValidationGroup="vgAdd" CssClass="validation_msg_box_sapn" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                            <HeaderStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                                                            <FooterStyle Width="10%" HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Expiry Date">
                                                                                            <ItemTemplate>

                                                                                                <asp:TextBox ID="txtCutOffDate" Enabled="false" runat="server"
                                                                                                    ToolTip="Cut off Date" ContentEditable="false" Text='<%#Eval("CuttOffDate") %>' Style="width: 90%; text-align: right; border-color: White;" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                            </ItemTemplate>
                                                                                            <%-- <EditItemTemplate>
                                                                                                <asp:TextBox ID="txtCutOffDateE" Text='<%#Eval("CuttOffDate") %>' runat="server"
                                                                                                    ToolTip="Cut off Date" Style="width: 90%; border-color: White; text-align: right;" CssClass="styleDisplayText"></asp:TextBox>
                                                                                              
                                                                                                <div class="validation_msg_box">
                                                                                                    <asp:RequiredFieldValidator ID="rfvCutoffDate" runat="server" Display="Dynamic"
                                                                                                        ErrorMessage="Enter the Cut off date." ControlToValidate="txtCutOffDateE"
                                                                                                        ValidationGroup="vgEUpdate" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                                </div>
                                                                                                <asp:Image ID="imgDOB" Visible="false" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtCutOffDateE" PopupButtonID="imgDOB"
                                                                                                    ID="CalendarExtenderCuttOffDateE" Enabled="True">
                                                                                                </cc1:CalendarExtender>

                                                                                            </EditItemTemplate>--%>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtCutOffDateF" runat="server" Width="90%" ToolTip="Cut off Date"
                                                                                                        Style="text-align: right;" CssClass="styleDisplayText"></asp:TextBox>
                                                                                                    <asp:Image ID="imgExpiry" Visible="false" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                                                    <cc1:CalendarExtender runat="server"  TargetControlID="txtCutOffDateF" PopupButtonID="imgExpiry"
                                                                                                        ID="CalendarExtenderCuttOffDate" Enabled="True">
                                                                                                    </cc1:CalendarExtender>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>

                                                                                                    <div class="validation_msg_box">
                                                                                                        <asp:RequiredFieldValidator ID="rfvCutOffDateF" CssClass="validation_msg_box_sapn" runat="server" Display="Dynamic"
                                                                                                            ErrorMessage="Enter the Expiry Date" ControlToValidate="txtCutOffDateF"
                                                                                                            ValidationGroup="vgAdd" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                                    </div>
                                                                                                </div>


                                                                                            </FooterTemplate>
                                                                                            <HeaderStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                                                            <FooterStyle Width="10%" HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <asp:LinkButton ID="lnkRemove" CssClass="grid_btn_delete" AccessKey="Z" ToolTip="Add [Alt+Z]"  runat="server" Text="Delete" CommandName="Delete"
                                                                                                    OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                                                            </ItemTemplate>
                                                                                            <%--<ItemTemplate>
                                                                                                &nbsp;
                                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex%>'
                                                                        CommandName="Edit" CausesValidation="false"></asp:LinkButton>
                                                                                                &nbsp;
                                                                    <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                        OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                                                            </ItemTemplate>--%>
                                                                                            <%-- <EditItemTemplate>
                                                                                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                                                    ValidationGroup="vgEUpdate" CausesValidation="true"></asp:LinkButton>
                                                                                                &nbsp;
                                                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                        CausesValidation="false"></asp:LinkButton>
                                                                                            </EditItemTemplate>--%>
                                                                                            <FooterTemplate>
                                                                                                <asp:LinkButton ID="lnkAdd" runat="server" CssClass="grid_btn" AccessKey="Y" ToolTip="Add [Alt+Y]"  Text="Add" CommandName="Add" ValidationGroup="vgAdd"
                                                                                                    CausesValidation="true"></asp:LinkButton>
                                                                                            </FooterTemplate>
                                                                                            <ItemStyle Width="12%" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            <FooterStyle Width="12%" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            <HeaderStyle Width="12%" Font-Bold="true" HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </asp:Panel>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                </div>
                            </div>
                            <cc1:TabPanel runat="server" ID="tbBankDetails" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Bank Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:Panel GroupingText="Customer Account Informations" ID="pnlBankDtls" runat="server" ToolTip="Customer Account Informations"
                                        CssClass="stylePanel">
                                        <div id="tblBankDetails" runat="server" style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlAccountType" runat="server" CssClass="md-form-control form-control" ToolTip="Account Type">
                                                            </asp:DropDownList>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Add" ID="rfvAccountType" runat="server"
                                                                    ControlToValidate="ddlAccountType" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                    InitialValue="-1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label class="tess">
                                                                <asp:Label runat="server" ID="lblAccountType" CssClass="styleReqFieldLabel" Text="Account Type"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtAccountNumber" runat="server" MaxLength="16" ToolTip="Account Number" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtAccountNumber" runat="server" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                Enabled="True" TargetControlID="txtAccountNumber">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Add" ID="rfvAccountNumber" runat="server"
                                                                    ControlToValidate="txtAccountNumber" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblAccountNumber" CssClass="styleReqFieldLabel" Text="Account Number"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvIFSCCODE" runat="server" visible="false">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtIFSC_Code" runat="server" MaxLength="11" ToolTip="IFSC Code" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FTEtxtIFSC_Code" runat="server" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                Enabled="True" TargetControlID="txtIFSC_Code">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblIFSC_Code" CssClass="styleDisplayLabel" Text="IFSC Code"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <%--<asp:TextBox ID="txtBankName" runat="server" MaxLength="40" ToolTip="Bank Name" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>                                                            --%>
                                                            <uc2:Suggest ID="txtBankName" runat="server" ServiceMethod="GetBankList" ToolTip="Bank Name" IsMandatory="true"
                                                                ValidationGroup="Add" ErrorMessage="Select Bank Name" AutoPostBack="true" OnItem_Selected="txtBankName_Item_Selected" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblBankName" CssClass="styleReqFieldLabel" Text="Bank Name"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <%--<asp:TextBox ID="txtBankBranch" runat="server" MaxLength="40" ToolTip="Bank Branch" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>--%>
                                                            <asp:DropDownList ID="ddlBankBranch" runat="server" ToolTip="Bank Branch" CssClass="md-form-control form-control"></asp:DropDownList>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Add" ID="rfvBankBranch" runat="server"
                                                                    ControlToValidate="ddlBankBranch" InitialValue="0" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblBankBranch" CssClass="styleReqFieldLabel" Text="Bank Branch"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMICRCode" runat="server" ToolTip="MICR Code" MaxLength="25" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtMICRCode" runat="server" ValidChars="" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                Enabled="True" TargetControlID="txtMICRCode">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblMICRCode" CssClass="styleDisplayLabel" Text="MICR Code"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvBankAddress" visible="false">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtBankAddress" runat="server" MaxLength="300" ToolTip="Bank Address" TextMode="MultiLine"
                                                                class="md-form-control form-control login_form_content_input requires_false lowercase" onkeyup="maxlengthfortxt(300);"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtBankAddress" runat="server" ValidChars="  :;!@$%^&*_-'.#,/(`)?+<>\~[]{}=|"
                                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"
                                                                TargetControlID="txtBankAddress">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblBankAddress" CssClass="styleReqFieldLabel" Text="Bank Address"></asp:Label>
                                                            </label>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Add" ID="rfvBankAddress" runat="server"
                                                                    ControlToValidate="txtBankAddress" CssClass="validation_msg_box_sapn" Enabled="false" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <asp:CheckBox runat="server" ID="chkDefaultAccount" CssClass="styleDisplayLabel"
                                                            Text="Default Account" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="row" style="float: right; margin-top: 5px;">
                                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" align="right">
                                                    <button class="css_btn_enabled" id="btnAdd" onserverclick="btnAdd_Click" runat="server" onclick="if(fnCheckPageValidators('Add','f'))"
                                                        type="button" accesskey="A" causesvalidation="false" title="Add the Details[Alt+A]" validationgroup="Add">
                                                        <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                    </button>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" align="right">
                                                    <button class="css_btn_enabled" id="btnModify" onserverclick="btnModify_Click" runat="server" onclick="if(fnCheckPageValidators('Add','f'))"
                                                        type="button" accesskey="F" causesvalidation="false" title="Modify the Details[Alt+F]" validationgroup="Add">
                                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Modi<u>f</u>y
                                                    </button>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" align="right">
                                                    <button class="css_btn_enabled" id="btnBnkClear" onserverclick="btnBnkClear_Click" runat="server"
                                                        type="button" accesskey="C" causesvalidation="false" title="Clear the Details[Alt+C]" validationgroup="Add">
                                                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u>C</u>lear
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="row">
                                                <input id="hdnBankId" runat="server" type="hidden" />
                                                <div style="margin-top: 10px;" class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <div class="gird">
                                                            <asp:GridView ID="grvBankDetails" runat="server" AllowPaging="True" AutoGenerateColumns="False" ToolTip="Bank Details"
                                                                EmptyDataText="No Bank Details Found!..." OnRowDataBound="grvBankDetails_RowDataBound"
                                                                OnRowDeleting="grvBankDetails_RowDeleting" OnSelectedIndexChanged="grvBankDetails_SelectedIndexChanged"
                                                                class="gird_details" HeaderStyle-CssClass="styleGridHeader">
                                                                <Columns>
                                                                    <asp:CommandField ShowSelectButton="True" Visible="false" />
                                                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBankMappingId" runat="server" Text='<%#Bind("BankMapping_ID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Entity ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblMasterId" runat="server" Text='<%#Bind("Master_ID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Account Type">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAccountType" runat="server" Text='<%#Bind("AccountType") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="AccountType_ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAccountTypeId" runat="server" Text='<%#Bind("AccountType_ID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="Account_Number" HeaderText="Account Number">
                                                                        <ItemStyle Width="5%" Wrap="True" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="IFSC_Code" HeaderText="IFSC Code" Visible="false">
                                                                        <ItemStyle Width="10%" Wrap="True" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="PANum" HeaderText="Contract Number" Visible="false">
                                                                        <ItemStyle Width="10%" Wrap="True" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="SANum" HeaderText="Sub Contract Number" Visible="false">
                                                                        <ItemStyle Width="10%" Wrap="True" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="MICR_Code" HeaderText="MICR Code">
                                                                        <ItemStyle Width="10%" Wrap="True" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Bank_Name" HeaderText="Bank Name">
                                                                        <ItemStyle Width="10%" Wrap="True" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Branch_Name" HeaderText="Bank Branch">
                                                                        <ItemStyle Width="10%" Wrap="True" />
                                                                    </asp:BoundField>
                                                                    <asp:TemplateField HeaderText="Bank ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBank_ID" runat="server" Text='<%#Bind("Bank_ID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Branch ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBranch_ID" runat="server" Text='<%#Bind("Branch_ID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Bank Address" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="lblBankAddress" Enabled="false" runat="server" Text='<%#Bind("Bank_Address") %>'
                                                                                TextMode="MultiLine"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Default Account">
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="chkDefaultAccount" Enabled="false" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "IsDefaultAccount")))%>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="lnkbtnDeleteBank" runat="server" CommandName="Delete" CssClass="grid_btn_delete" Text="Remove" AccessKey="B" OnClientClick="return confirm('Are you sure you want to Remove this record?');" ToolTip="Remove,Alt+B" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <br />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-9 col-sm-12 col-xs-12" style="display: none;">
                                                    <asp:ValidationSummary ID="Bank" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                                        ShowMessageBox="false" HeaderText="Correct the following validation(s):" Enabled="false" ValidationGroup="Add" />
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="TabConstitution" CssClass="tabpan" BackColor="Red" ToolTip="Constitution Document Details">
                                <HeaderTemplate>
                                    Constitution Document Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel51" runat="server">
                                        <ContentTemplate>
                                            <div style="margin-top: 10px;" class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="gird">
                                                    <asp:GridView ID="gvConstitutionalDocuments" runat="server" AutoGenerateColumns="False"
                                                        HeaderStyle-CssClass="styleGridHeader" OnRowDataBound="gvConstitutionalDocuments_RowDataBound" ToolTip="Constitution Document Details">
                                                        <Columns>
                                                            <asp:BoundField DataField="ID" HeaderText="ID" />
                                                            <asp:BoundField DataField="DocumentFlag" HeaderText="Document Flag">
                                                                <HeaderStyle Width="5%" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DocumentDescription" HeaderText="Document Description">
                                                                <HeaderStyle Width="35%" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <table>
                                                                        <thead>
                                                                            <tr>
                                                                                <td colspan="2">Mandatory</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left">Doc</td>
                                                                                <td align="right">Image Copy</td>
                                                                            </tr>
                                                                        </thead>
                                                                    </table>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <table>
                                                                        <thead>
                                                                            <tr>
                                                                                <td align="left"><%--<%# Bind("IsMandatory") %>--%>
                                                                                    <asp:CheckBox ID="chkIsMandatory" runat="server" Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "IsMandatory")))%>'></asp:CheckBox></td>
                                                                                <td align="right"><%--<%# Bind("IsNeedImageCopy") %>--%>
                                                                                    <asp:CheckBox ID="chkIsNeedImageCopy" runat="server" Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "IsNeedImageCopy")))%>'></asp:CheckBox></td>
                                                                            </tr>
                                                                        </thead>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <HeaderStyle Width="5%" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="Remark" HeaderText="Remarks">
                                                                <HeaderStyle Width="35%" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="Collected">
                                                                <ItemTemplate>
                                                                    <%--<%# Bind("Collected") %>--%>
                                                                    <asp:CheckBox ID="chkCollected" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Collected")))%>'></asp:CheckBox>
                                                                </ItemTemplate>
                                                                <HeaderStyle Width="5%" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Values">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtValues" ValidationGroup="Customer" runat="server" MaxLength="30"
                                                                        Text='<%# Bind("Values") %>' Width="150px" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Scanned">
                                                                <ItemTemplate>
                                                                    <%--<%# Bind("Scanned") %>--%>
                                                                    <asp:CheckBox ID="chkScanned" AutoPostBack="true" OnCheckedChanged="chkScanned_CheckedChanged" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Scanned")))%>'></asp:CheckBox>
                                                                </ItemTemplate>
                                                                <HeaderStyle Width="5%" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <%-- <asp:TemplateField HeaderText="File Upload" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txOD" runat="server" Width="100px" MaxLength="500" Text='<%# Bind("Document_Path") %>'
                                                                    Visible="false"></asp:TextBox><cc1:AsyncFileUpload ID="asyFileUpload" runat="server"
                                                                        Width="175px" OnClientUploadComplete="uploadComplete" OnUploadedComplete="asyncFileUpload_UploadedComplete" />
                                                                <asp:Label runat="server" ID="myThrobber" Visible="false" Text='<%# Bind("Document_Path") %>'></asp:Label><asp:HiddenField
                                                                    ID="hidThrobber" runat="server" />
                                                                <asp:TextBox ID="txthidden" runat="server" Width="100px" MaxLength="500" Text='<%# Bind("Document_Path") %>'
                                                                    Visible="false"></asp:TextBox><input id="bOD" onclick="return openFileDialog(this.id, 'bOD', 'fileOpenDocument', 'txOD', 'paper')"
                                                                        style="width: 17px; height: 22px" type="button" runat="server" title="Click to browse file"
                                                                        value="..." visible="False" />
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                        </asp:TemplateField>--%>
                                                            <asp:TemplateField HeaderText="File Upload">
                                                                <ItemTemplate>
                                                                    <div>
                                                                        <asp:UpdatePanel ID="updFileUpload" runat="server">
                                                                            <ContentTemplate>
                                                                                <asp:Label ID="lblActualPath" runat="server" Visible="false" Text='<%# Bind("Document_Path") %>'></asp:Label>
                                                                                <asp:FileUpload runat="server" ID="flUpload" Width="150px" ToolTip="Upload File" />
                                                                                <asp:Button ID="btnBrowse" runat="server" OnClick="btnBrowse_OnClick" CausesValidation="false" Style="display: none"></asp:Button>
                                                                                <asp:TextBox ID="txtFileupld" runat="server" Visible="false" Style="position: absolute; margin-left: -153px; width: 65px"
                                                                                    ContentEditable="false" class="md-form-control form-control login_form_content_input" />
                                                                            </ContentTemplate>
                                                                            <Triggers>
                                                                                <asp:PostBackTrigger ControlID="btnBrowse" />
                                                                            </Triggers>
                                                                        </asp:UpdatePanel>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <HeaderStyle Width="150px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Document_Path" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblActualDocument_Path" runat="server" Text='<%# Bind("Document_Path") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="View">
                                                                <ItemTemplate>
                                                                    <%--<%# Bind("IsNeedImageCopy") %>--%>
                                                                    <asp:LinkButton ID="hlnkView" runat="server" CausesValidation="false" OnClick="hlnkView_Click" Enabled="false" Text="View"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <HeaderStyle Width="5%" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" Visible="false" />
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-top: 10px;">
                                            </div>
                                            <div class="gird col-lg-6 col-md-9 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="Additional Parameter Informations" ID="pnlAddiotnalInfo" runat="server" ToolTip="Additional Parameter Informations"
                                                    CssClass="stylePanel">
                                                    <asp:GridView ID="grvAdditionalInfo" runat="server" EmptyDataText="No Additional Parameter Informations Found!..." AutoGenerateColumns="False"
                                                        OnRowDataBound="grvAdditionalInfo_RowDataBound" class="gird_details">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Parameter Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblParamName" runat="server" Text='<%# Bind("Param_Name") %>'></asp:Label>
                                                                    <asp:Label ID="lblParamType" runat="server" Text='<%# Bind("Param_Type") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblLookupType" runat="server" Text='<%# Bind("Lookup_Type") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblParamSize" runat="server" Text='<%# Bind("Param_Size") %>' Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Values">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtValues" runat="server" Visible="false" class="md-form-control form-control login_form_content_input requires_true" Text='<%# Bind("PARAM_VALUES") %>'></asp:TextBox>
                                                                    <asp:DropDownList ID="ddlValues" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlValues_SelectedIndexChanged" Visible="false" CssClass="md-form-control form-control"></asp:DropDownList>
                                                                    <cc1:FilteredTextBoxExtender ID="fteValues" runat="server" FilterType="Custom"
                                                                        Enabled="True" TargetControlID="txtValues">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtValues"
                                                                        Format="dd/MM/YYYY" ID="calAddValues" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="PARAM_ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPARAM_ID" runat="server" Text='<%# Bind("PARAM_ID") %>' Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="PARAM_DET_ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPARAM_DET_ID" runat="server" Text='<%# Bind("PARAM_DET_ID") %>' Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="CONSTANT_TRAN_ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCONSTANT_TRAN_ID" runat="server" Text='<%# Bind("CONSTANT_TRAN_ID") %>' Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="TabCustomerTrack" CssClass="tabpan" BackColor="Red" ToolTip="Customer Track">
                                <HeaderTemplate>
                                    Customer Track
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div style="margin-top: 10px;" class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:CheckBox runat="server" ID="chkBadTrack" Text="Black Listed" TextAlign="Left"
                                                    Font-Bold="true" Font-Size="Larger" Visible="false" />
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Label ID="lblNoCustomerTrack" CssClass="styleDisplayLabel" runat="server" Text="No Customer Track Details Found!..." Visible="false"></asp:Label>
                                    <div id="divTrack" style="overflow: auto; width: 98%; padding-left: 1%;"
                                        runat="server" border="1">
                                        <div class="gird">
                                            <asp:GridView ID="gvTrack" AutoGenerateColumns="false" EmptyDataText="No Customer Track Details Found!..." HorizontalAlign="Center" ShowFooter="false" HeaderStyle-CssClass="styleGridHeader" class="gird_details"
                                                runat="server" Width="100%" OnRowDataBound="gvTrack_RowDataBound" ToolTip="Customer Track Details">
                                                <Columns>
                                                    <asp:TemplateField Visible="false" HeaderText="Lob Id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLobId" runat="server" Text='<%#Bind("LOB_ID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Line of Business">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLOBName" runat="server" Text='<%#Bind("LOB_NAME") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:DropDownList ID="ddlLOBTrack" runat="server" CssClass="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="grid_validation_msg_box">
                                                                    <asp:RequiredFieldValidator ValidationGroup="Track" ID="rfvFLOBTrack"
                                                                        runat="server" ControlToValidate="ddlLOBTrack" CssClass="validation_msg_box_sapn"
                                                                        ErrorMessage="Select Line of Business" Display="Dynamic" InitialValue="-1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false" HeaderText="PA SA REF ID">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPASAREFId" runat="server" Text='<%#Bind("PA_SA_REF_ID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Branch">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTypeId" runat="server" Text='<%#Bind("TRACK_TYPE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:DropDownList ID="ddlType" runat="server" CssClass="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="grid_validation_msg_box">
                                                                    <asp:RequiredFieldValidator ValidationGroup="Track" ID="rfvFddlType"
                                                                        runat="server" ControlToValidate="ddlType" CssClass="validation_msg_box_sapn"
                                                                        ErrorMessage="Select Type" Display="Dynamic" InitialValue="-1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAccountNo" runat="server" Text='<%#Bind("ACCOUNTNO") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:DropDownList ID="ddlAccountNo" runat="server" CssClass="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="grid_validation_msg_box">
                                                                    <asp:RequiredFieldValidator ValidationGroup="Track" ID="rfvFddlAccountNo"
                                                                        runat="server" ControlToValidate="ddlAccountNo" CssClass="validation_msg_box_sapn"
                                                                        ErrorMessage="Select Account No" Display="Dynamic" InitialValue="-1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account Status">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblReason" runat="server" Text='<%#Bind("REASON") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtReason" runat="server" MaxLength="100" TextMode="MultiLine"
                                                                    onkeyup="maxlengthfortxt(100)" CssClass="md-form-control form-control login_form_content_input requires_true lowercase"></asp:TextBox>
                                                                <div class="grid_validation_msg_box" style="margin: 0px;">
                                                                    <asp:RequiredFieldValidator ValidationGroup="Track" ID="rfvFtxtReason"
                                                                        runat="server" ControlToValidate="txtReason" CssClass="validation_msg_box_sapn"
                                                                        ErrorMessage="Enter Reason" Display="Dynamic" InitialValue="" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false" HeaderText="TRACKTYPEID">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTrackTypeId" runat="server" Text='<%#Bind("TRACK_TYPE_ID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Creation Date" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDate" runat="server" Text='<%#Bind("DATE")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:FilteredTextBoxExtender
                                                                    ID="ftbDate" runat="server" ValidChars="/-" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                    Enabled="true" TargetControlID="txtDate">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtDate" ID="CalendarDate"
                                                                    Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                </cc1:CalendarExtender>
                                                                <div class="grid_validation_msg_box" style="margin: 0px;">
                                                                    <asp:RequiredFieldValidator ValidationGroup="Track" ID="rfvFtxtDate"
                                                                        runat="server" ControlToValidate="txtDate" CssClass="validation_msg_box_sapn"
                                                                        ErrorMessage="Enter Date" Display="Dynamic" InitialValue="" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Finance Amount" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblReleaseDate" runat="server" Text='<%#Bind("RELEASEDATE")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtReleaseDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:FilteredTextBoxExtender
                                                                    ID="ftbReleaseDate" runat="server" ValidChars="/-" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                    Enabled="true" TargetControlID="txtReleaseDate">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtReleaseDate" ID="CalendarReleaseDate"
                                                                    Enabled="True" OnClientDateSelectionChanged="checkDate_PrevSystemDateNotEqualToSystemdate">
                                                                </cc1:CalendarExtender>
                                                                <div class="grid_validation_msg_box" style="margin: 0px;">
                                                                    <asp:RequiredFieldValidator ValidationGroup="Track" ID="rfvFReleaseDate"
                                                                        runat="server" ControlToValidate="txtReleaseDate" CssClass="validation_msg_box_sapn"
                                                                        ErrorMessage="Enter Release Date" Display="Dynamic" InitialValue="" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="LoginBy" HeaderText="Maturity Date" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:TemplateField HeaderText="Released By Id" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblReleasedBy" runat="server" Text='<%#Bind("RELEASED_BY") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="ReleasedBy" HeaderText="Closure Date" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:TemplateField ItemStyle-Width="15%" FooterStyle-Width="15%">
                                                        <FooterTemplate>
                                                            <asp:Button ID="btnAddTrack" runat="server" Text="Add" CausesValidation="true" ValidationGroup="Track"
                                                                CssClass="grid_btn" OnClick="Track_AddRow_OnClick" />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="TabCreditDetails" CssClass="tabpan" BackColor="Red" ToolTip="Customer Credit Details">
                                <HeaderTemplate>
                                    Customer Credit Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:Label ID="lblNoCreditDetails" CssClass="styleDisplayLabel" runat="server" Text="No Records Found!..."
                                        Visible="False"></asp:Label>
                                    <asp:Panel ID="Panel1" runat="server">
                                        <asp:GridView ID="gvCredit" HorizontalAlign="Center" EmptyDataText="No Customer Credit Details Found!..."
                                            OnRowDataBound="gvCredit_RowDataBound" HeaderStyle-CssClass="styleGridHeader" class="gird_details" runat="server" Width="100%" ToolTip="Customer Credit Details">
                                        </asp:GridView>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlCustomerCreditDetails" runat="server" Visible="False">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtLOBName" runat="server" Width="200px" ToolTip="Customer Credit Details" ReadOnly="True" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblLOBName" CssClass="styleDisplayLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtFinanceAmount" runat="server" Style="text-align: right;" Width="200px"
                                                            ReadOnly="True" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblFinanceAmount" CssClass="styleDisplayLabel" Style="text-align: right;"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtSanctionamt" runat="server" Width="200px" ReadOnly="True" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblSanctionamt" CssClass="styleDisplayLabel" Style="text-align: right;"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtValidupto" runat="server" Width="178px" ReadOnly="True" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                        <%--  <asp:Image ID="imgValidupto" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtValidupto" PopupButtonID="imgValidupto"
                                                            ID="CalendarValidupto" Enabled="True" OnClientDateSelectionChanged="checkDate_PrevSystemDateNotEqualToSystemdate">
                                                        </cc1:CalendarExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblValid" CssClass="styleDisplayLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtUtilizedAmt" runat="server" Width="200px" ReadOnly="True" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblUtilizedAmt" CssClass="styleDisplayLabel" Style="text-align: right;"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtRemainingAmount" runat="server" Width="200px" ReadOnly="True"
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblRemainingAmount" CssClass="styleDisplayLabel" Style="text-align: right;"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtFacilityType" runat="server" Width="200px" ReadOnly="True" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblFacilityType" CssClass="styleDisplayLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>



                                            </div>
                                        </div>
                                    </asp:Panel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="TabPanel1" CssClass="tabpan" BackColor="Red" Visible="false" ToolTip="Factoring  Sublimit">
                                <HeaderTemplate>
                                    Factoring  Sublimit
                                </HeaderTemplate>
                                <ContentTemplate>
                                   <%-- <asp:Panel ID="pnlFactoringSublimit" runat="server">
                                        <div style="margin-top: 10px;" class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <div>
                                                    <asp:GridView ID="grvCustSubLimit_1" HorizontalAlign="Center" runat="server" AutoGenerateColumns="false" ToolTip="Factoring  Sublimit"
                                                        Width="100%" ShowFooter="true" OnRowDataBound="grvCustSubLimit_RowDataBound"
                                                        OnRowCommand="grvCustSubLimit_RowCommand" OnRowDeleting="grvCustSubLimit_RowDeleting"
                                                        OnRowEditing="grvCustSubLimit_RowEditing" HeaderStyle-CssClass="styleGridHeader" class="gird_details" OnRowCancelingEdit="grvCustSubLimit_RowCancelingEdit"
                                                        OnRowUpdating="grvCustSubLimit_RowUpdating">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex%>'></asp:Label>
                                                                    <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />
                                                                    <asp:Label ID="lbldelst" Visible="false" runat="server" Text='<%#Eval("DEL_STAT") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Label ID="lblSerialNo" Value='<%#Eval("Serial_Number") %>' runat="server"></asp:Label>
                                                                </FooterTemplate>
                                                                <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                                <FooterStyle Width="5%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Entity Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEntityId" Text='<%#Eval("Entity_Id") %>' Visible="false" runat="server" />
                                                                    <asp:Label ID="lblEntityName" Text='<%#Eval("ENTITY_NAME") %>' runat="server"
                                                                        Width="90%"></asp:Label>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:DropDownList ID="ddlEntityTypeE" runat="server" Width="98%" ToolTip="Entity Name" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtEntitytType" runat="server" Display="Dynamic"
                                                                            ErrorMessage="Select the Entity Type." ControlToValidate="ddlEntityTypeE"
                                                                            InitialValue="0" ValidationGroup="vgEUpdate" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:DropDownList ID="ddlEntityTypeF" runat="server" onmouseover="ddl_itemchanged(this)"
                                                                        Width="98%" ToolTip="Entity Type" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtEntitytTypeF" runat="server" Display="Dynamic"
                                                                            ErrorMessage="Select the Entity Type." ControlToValidate="ddlEntityTypeF"
                                                                            InitialValue="0" ValidationGroup="vgAdd" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle Width="25%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                <ItemStyle Width="25%" HorizontalAlign="Left" />
                                                                <FooterStyle Width="25%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Limit">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtLimitAmnt" runat="server"
                                                                        ToolTip="Limit" ContentEditable="false" Text='<%#Eval("Limit") %>' Style="width: 90%; text-align: right; border-color: White;" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="txtLimitAmntE" Text='<%#Eval("Limit") %>' AutoPostBack="true" OnTextChanged="txtLimitAmnt_OntextChanged" Style="width: 90%; text-align: right; border-color: White;"
                                                                        ToolTip="Limit" runat="server"
                                                                        onblur="funChkDecimial(this,16,3,'Limit');" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="ftbeLimitE" runat="server" FilterMode="ValidChars"
                                                                        FilterType="Custom,Numbers" ValidChars="." TargetControlID="txtLimitAmntE">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvLimitAmntE" runat="server" Display="Dynamic" ErrorMessage="Enter the Limit Value."
                                                                            ControlToValidate="txtLimitAmntE" ValidationGroup="vgEUpdate" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtLimitF" AutoPostBack="true" OnTextChanged="txtLimitAmnt_OntextChanged" runat="server" Style="width: 90%; text-align: right;"
                                                                        ToolTip="Limit" onblur="funChkDecimial(this,16,3,'Limit');" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="ftbeFPostPercent" runat="server" FilterMode="ValidChars"
                                                                        FilterType="Custom,Numbers" ValidChars="." TargetControlID="txtLimitF">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvFCuttOffDate" runat="server" Display="Dynamic" ErrorMessage="Enter the Limit Value."
                                                                            ControlToValidate="txtLimitF" ValidationGroup="vgAdd" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <HeaderStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                                <FooterStyle Width="10%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Cut Off Date">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtCutOffDate" runat="server"
                                                                        ToolTip="Cut off Date" ContentEditable="false" Text='<%#Eval("CuttOffDate") %>' Style="width: 90%; text-align: right; border-color: White;" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="txtCutOffDateE" Text='<%#Eval("CuttOffDate") %>' runat="server"
                                                                        ToolTip="Cut off Date" Style="width: 90%; border-color: White; text-align: right;" CssClass="styleDisplayText"></asp:TextBox>
                                                                    
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvCutoffDate" runat="server" Display="Dynamic"
                                                                            ErrorMessage="Enter the Cut off date." ControlToValidate="txtCutOffDateE"
                                                                            ValidationGroup="vgEUpdate" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <asp:Image ID="imgDOB" Visible="false" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtCutOffDateE" PopupButtonID="imgDOB"
                                                                        ID="CalendarExtenderCuttOffDateE" Enabled="True">
                                                                    </cc1:CalendarExtender>

                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtCutOffDateF" runat="server" Width="90%" ToolTip="Cut off Date"
                                                                        Style="text-align: right;" CssClass="styleDisplayText"></asp:TextBox>
                                                                   
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvCutOffDateF" runat="server" Display="Dynamic"
                                                                            ErrorMessage="Enter the Cut off Date" ControlToValidate="txtCutOffDateF"
                                                                            ValidationGroup="vgAdd" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <asp:Image ID="imgDOB" Visible="false" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtCutOffDateF" PopupButtonID="imgDOB"
                                                                        ID="CalendarExtenderCuttOffDate" Enabled="True">
                                                                    </cc1:CalendarExtender>

                                                                </FooterTemplate>
                                                                <HeaderStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                                <FooterStyle Width="10%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    &nbsp;
                                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex%>'
                                                                        CommandName="Edit" CausesValidation="false"></asp:LinkButton>
                                                                    &nbsp;
                                                                    <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                        OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                        ValidationGroup="vgEUpdate" CausesValidation="true"></asp:LinkButton>
                                                                    &nbsp;
                                                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                        CausesValidation="false"></asp:LinkButton>
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" CommandName="Add" ValidationGroup="vgAdd"
                                                                        CausesValidation="true"></asp:LinkButton>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="12%" Font-Bold="true" HorizontalAlign="Center" />
                                                                <FooterStyle Width="12%" Font-Bold="true" HorizontalAlign="Center" />
                                                                <HeaderStyle Width="12%" Font-Bold="true" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>--%>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                </div>
                <div class="row" style="display: none">
                    <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                    <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                    <asp:Button ID="btndummy" Style="display: none" OnClick="btndummy_Click" CausesValidation="false" runat="server" Text="" />
                    <asp:HiddenField runat="server" ID="hdnCustAge" />
                    <asp:HiddenField runat="server" ID="hdnExpiryMonth" />
                    <asp:HiddenField runat="server" ID="HiddenField1" />
                    <asp:Label ID="txtEffectiveToDate" Visible="false" runat="server" />
                </div>
                <div class="row">
                    <div>
                        <asp:ValidationSummary ID="vsCustomerMaster" runat="server" ShowSummary="true" CssClass="styleSummaryStyle"
                            ShowMessageBox="false" HeaderText="Correct the following validation(s):" ValidationGroup="Main" Enabled="true" />
                        <asp:ValidationSummary ID="vsPersonalDetail" runat="server" ShowSummary="true" CssClass="styleSummaryStyle"
                            ShowMessageBox="false" HeaderText="Correct the following validation(s):" ValidationGroup="Personal Details" Enabled="true" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                            CssClass="styleSummaryStyle" ShowMessageBox="false" HeaderText="Correct the following validation(s):"
                            ValidationGroup="Customer" Enabled="true" />
                        <%--<asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowSummary="true"
                        CssClass="styleMandatoryLabel" ShowMessageBox="false" HeaderText="Correct the following validation(s):"
                        ValidationGroup="vgAdd" Enabled="false" />
                    <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowSummary="true"
                        CssClass="styleMandatoryLabel" ShowMessageBox="false" HeaderText="Correct the following validation(s):"
                        ValidationGroup="vgEUpdate" Enabled="false" />--%>
                    </div>
                </div>
                <%--  <div class="btn_height"></div>--%>
                <div align="right">

                    <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(fnSaveValidation())"
                        type="button" accesskey="S" causesvalidation="false" title="Save the Details[Alt+S]">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                    <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                    <asp:Button ID="btnProceedSave" runat="server" CssClass="save_btn fa fa-floppy-o" CausesValidation="False"
                        Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />
                </div>
            </div>
            <div class="row" style="display: none;">
                <asp:CustomValidator ID="cvCustomerMaster" runat="server" CssClass="styleMandatoryLabel" />
            </div>

            <asp:TextBox ID="txthiddenfield" runat="server" Visible="false"></asp:TextBox>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblSMEIndicator" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="MPSMEIndicator" runat="server" PopupControlID="plSMEIndicator" TargetControlID="lblSMEIndicator"
        BackgroundCssClass="modalBackground" Enabled="true" BehaviorID="ModalBID" />
    <asp:Panel ID="plSMEIndicator" GroupingText="" Height="150px" Width="300px" runat="server" Style="padding: 8px; text-wrap: normal; display: none;"
        BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="md-input">
                            <asp:Label ID="lblSMEErrorMessage" runat="server" Text="SME Error Message"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <button class="css_btn_enabled" id="btnOk" title="Ok" causesvalidation="false" onserverclick="btnOk_Click"
                            runat="server" type="button">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Ok
                        </button>
                        <button class="css_btn_enabled" id="btnSMECancel" title="Exit" causesvalidation="false" onserverclick="btnSMECancel_Click"
                            runat="server" type="button">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Cancel
                        </button>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

    <asp:Label ID="lblCreditHistory" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpeCreditLimithis" runat="server" PopupControlID="dvAdjustmentDtl" TargetControlID="lblCreditHistory"
        BackgroundCssClass="modalBackground" Enabled="true" BehaviorID="ModalBID" />
    <div runat="server" id="dvAdjustmentDtl" style="display: none; width: 65%; height: 450px;">
        <div>
            <asp:Panel ID="plCreditLimithis" GroupingText="Limit History Details" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Panel GroupingText="Factoring Limit History Details" ToolTip="Factoring Limit History Details"
                                    ID="pnlFactoingLimitHis" runat="server" CssClass="stylePanel" Width="100%">
                                    <div class="gird" style="max-height: 250px; overflow-y: scroll;">
                                        <asp:GridView ID="grvFacLimit" runat="server" AllowPaging="false" AutoGenerateColumns="False" ToolTip="Factoring Limit History Details"
                                            EmptyDataText="No Bank Details Found!..."
                                            class="gird_details" HeaderStyle-CssClass="styleGridHeader" Width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="Factoring_Limit" ItemStyle-HorizontalAlign="Right" HeaderText="Factoring Limit">
                                                    <ItemStyle Width="5%" Wrap="True" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Factoring_Exp_Date" HeaderText="Factoring Limit Expiry Date">
                                                    <ItemStyle Width="5%" Wrap="True" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Modified_By" HeaderText="Modified By">
                                                    <ItemStyle Width="5%" Wrap="True" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Modified_Date" HeaderText="Modified Date">
                                                    <ItemStyle Width="5%" Wrap="True" />
                                                </asp:BoundField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Panel GroupingText="Limit History Details" ToolTip="Limit History Details"
                                    ID="pnlMaxLimitHis" runat="server" CssClass="stylePanel" Width="100%">
                                    <div class="gird" style="max-height: 250px; overflow-y: scroll;">
                                        <asp:GridView ID="grvMaximumLimitHis" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                            ToolTip="Limit History Details"
                                            EmptyDataText="No Bank Details Found!..."
                                            class="gird_details" HeaderStyle-CssClass="styleGridHeader">
                                            <Columns>
                                                <asp:BoundField DataField="Lob_NAME" ItemStyle-HorizontalAlign="Right" HeaderText="Line of Business">
                                                    <ItemStyle Width="5%" Wrap="True" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Limit" ItemStyle-HorizontalAlign="Right" HeaderText="Limit">
                                                    <ItemStyle Width="5%" Wrap="True" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="CuttOffDate" HeaderText="Expiry Date">
                                                    <ItemStyle Width="5%" Wrap="True" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="MODIFIED_BY_name" HeaderText="Modified By">
                                                    <ItemStyle Width="5%" Wrap="True" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="MODIFIED_ON" HeaderText="Modified Date">
                                                    <ItemStyle Width="5%" Wrap="True" />
                                                </asp:BoundField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <button class="css_btn_enabled" id="btnHistoryCancel" title="Exit[Alt+I]" accesskey="I" causesvalidation="false" onserverclick="btnHistoryCancel_Click"
                                    runat="server" type="button">
                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Ex<u>i</u>t
                                </button>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>


    <asp:Label ID="lblHotListShow" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpeHotList" runat="server" PopupControlID="plHotList" TargetControlID="lblHotListShow"
        BackgroundCssClass="modalBackground" Enabled="true" BehaviorID="ModalBID" />
    <asp:Panel ID="plHotList" GroupingText="" Height="150px" Width="300px" runat="server" Style="padding: 8px; text-wrap: normal; display: none;"
        BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="md-input">
                            <asp:Label ID="lblDedupeErrorMsg" runat="server" Text=""></asp:Label>
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

    <script src="../Content/Scripts/UserScript.js"></script>
</asp:Content>
