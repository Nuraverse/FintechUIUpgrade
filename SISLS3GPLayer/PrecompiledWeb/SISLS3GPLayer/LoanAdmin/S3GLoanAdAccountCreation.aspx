<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="S3GLoanAdAccountCreation, App_Web_kvnfu4pv" enableeventvalidation="false" %>

<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="AutoSugg" TagPrefix="UC3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        var querymode;
        querymode = location.search.split("qsMode=");
        querymode = querymode[1];
        var tab;
        function pageLoad() {

            tab = $find('ctl00_ContentPlaceHolder1_tcAccountCreation');
            querymode = location.search.split("qsMode=");
            querymode = querymode[1];

            if (querymode != 'Q') {

                tab.add_activeTabChanged(on_Change);
                var newindex = tab.get_activeTabIndex(index);
                var btnSave = document.getElementById('<%=btnSave.ClientID %>');
                var btnclear = document.getElementById('<%=btnClear.ClientID %>');
                //if (newindex == tab._tabs.length - 1)
                //    btnSave.disabled = false;
                //else

                //    btnSave.disabled = true;

            }
        }
        function fnLoadCustomerg() {
            //debugger;

            document.getElementById('ctl00_ContentPlaceHolder1_tcAccountCreation_tbAdditionDeactivationofGuarantor_btnGuar').click();
        }

        function fnLoadCustomer() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabMainPage_btnLoadCustomer').click();
        }
        function checkDate_ApplicationDate(sender, args) {
            var varApplicationDate = document.getElementById('ctl00_ContentPlaceHolder1_tcAccountCreation_TabMainPage_txtApplicationDate').value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 0;
            if (selectedDate < varapplndate) {
                alert('Account Date should be greater than or equal to Application Date');
                document.getElementById('ctl00_ContentPlaceHolder1_tcAccountCreation_TabMainPage_txtAccountDate').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_tcAccountCreation_TabMainPage_txtAccountDate').value = vartoday.format(sender._format);
            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_tcAccountCreation_TabMainPage_txtAccountDate').value = selectedDate.format(sender._format);
                intValid = 1;
            }
            if (vartoday < selectedDate) {
                alert('Account Date should be less than or equal to Current Date');
                document.getElementById('ctl00_ContentPlaceHolder1_tcAccountCreation_TabMainPage_txtAccountDate').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_tcAccountCreation_TabMainPage_txtAccountDate').value = vartoday.format(sender._format);
            }
            else {
                if (intValid == 1) {
                    document.getElementById('ctl00_ContentPlaceHolder1_tcAccountCreation_TabMainPage_txtAccountDate').value = selectedDate.format(sender._format);
                }
            }

        }


        function SetData(ObJ, data) {

            if ((document.getElementById(ObJ).value == "___.__") || (document.getElementById(ObJ).value == "")) {
                document.getElementById(ObJ).value = data;
            }
        }
        function fnCalculateTotalAssetValue(txtNoofUnits, varUnitValue) {
            if (txtNoofUnits != null) {
                var NoofUnits = txtNoofUnits.value;
                return NoofUnits * varUnitValue;
            }
        }

        function FunRestIrr() {
            //document.getElementById('<%=txtCompanyIRR_Repay.ClientID %>').value = "";
            document.getElementById('<%=txtBusinessIRR_Repay.ClientID %>').value = "";

        }
        function FunDateRestIrr() {
            var varAccountDate = document.getElementById('ctl00_ContentPlaceHolder1_tcAccountCreation_TabMainPage_txtAccountDate').value;
            var vartoday = new Date();
            if (vartoday != varAccountDate) {
                document.getElementById('<%=txtBusinessIRR_Repay.ClientID %>').value = "";
            }
        }

        function ValidGuarantorAmt(ObJ1) {

            //var ObjJ = 'ctl00_ContentPlaceHolder1_tcAccountCreation_TabInvoice_gvGuarantor_ctl03_txtGuaranteeamount_GuarantorTab_Footer';
            var amt = document.getElementById(ObJ1).value;
            if (amt == 0 && document.getElementById(ObJ1).value != "") {
                document.getElementById(ObJ1).value = 1;
            }
        }


        function fnValidateEMail(ObJ1, ObJ2) {

            // alert('ctl00_ContentPlaceHolder1_tcAccountCreation_TabAlerts_gvAlert_ctl03_ChkEmail').value;
            //alert('ctl00_ContentPlaceHolder1_tcAccountCreation_TabAlerts_gvAlert_ctl03_ChkSMS').value;

            var email = document.getElementById(ObJ1).checked;
            var sms = document.getElementById(ObJ2).checked;

            if (email == false && sms == false) {
                alert(' select EMail or SMS');
                return false;
            }
            else
                return true;
        }

        function fnAllowNumbersOnlyZero(isSpaceAllowed, Obj1) {
            var sKeyCode = window.event.keyCode;
            var anyval = document.getElementById(Obj1).value;

            //alert(sKeyCode);
            if ((!isSpaceAllowed) && (sKeyCode == 32)) {
                window.event.keyCode = 0;
                return false;
            }
            if ((sKeyCode < 48 || sKeyCode > 57) && (sKeyCode != 32 && sKeyCode != 95) || (sKeyCode == 48)) {
                if (anyval == 0) {
                    window.event.keyCode = 0;
                    return false;
                }
            }
        }

        function MultipleTwo(ObJ1, ObJ2, Obj3) {
            var Val1 = document.getElementById(ObJ1).value;
            var Val2 = document.getElementById(ObJ2).value;

            if (Val1 != "" && Val2 != "") {
                document.getElementById(Obj3).value = Val1 * parseFloat(Val2);
            }
            return CheckFinanceAmt();
        }
        function checkApplicationDate(sender, args) {
            var varApplicationDate = document.getElementById('<%=txtAccountDate.ClientID %>').value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var today = new Date();
            var varOfferDate = document.getElementById('<%=txtApplicationDate.ClientID %>');
            if (varOfferDate != null) {
                var varOfferDateValue = document.getElementById('<%=txtApplicationDate.ClientID %>').value;
                if (varOfferDateValue != "") {
                    var varOffdate = Date.parseInvariant(varOfferDateValue, sender._format);
                    if (selectedDate < varOffdate) {
                        alert('InflowDate should be greater than or equal to Application Date');
                        sender._textbox.set_Value(today.format(sender._format));
                    }
                    else {
                        sender._textbox.set_Value(selectedDate.format(sender._format));

                    }
                }
                else {
                    if (selectedDate < varapplndate) {
                        alert('InflowDate should be greater than or equal to Account Date');
                        sender._textbox.set_Value(today.format(sender._format));
                    }
                    else {
                        sender._textbox.set_Value(selectedDate.format(sender._format));
                    }
                }
            }

        }

        function checkOutflowApplicationDate(sender, args) {
            var varApplicationDate = document.getElementById('<%=txtAccountDate.ClientID %>').value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var today = new Date();
            var varOfferDate = document.getElementById('<%=txtApplicationDate.ClientID %>');
            if (varOfferDate != null) {
                var varOfferDateValue = document.getElementById('<%=txtApplicationDate.ClientID %>').value;
                if (varOfferDateValue != "") {
                    var varOffdate = Date.parseInvariant(varOfferDateValue, sender._format);
                    if (selectedDate < varOffdate) {
                        alert('OutflowDate should be greater than or equal to Application Date');
                        sender._textbox.set_Value(today.format(sender._format));
                    }
                    else {
                        sender._textbox.set_Value(selectedDate.format(sender._format));

                    }
                }
                else {
                    if (selectedDate < varapplndate) {
                        alert('OutflowDate should be greater than or equal to Account Date');
                        sender._textbox.set_Value(today.format(sender._format));
                    }
                    else {
                        sender._textbox.set_Value(selectedDate.format(sender._format));
                    }
                }
            }

        }



        var index = 0;
        function on_Change(sender, e) {

            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            var Valgrp = document.getElementById('<%=vs_TabMainPage.ClientID %>')
            var btnConfigure = document.getElementById('<%=btnConfigure.ClientID %>')
            Valgrp.validationGroup = strValgrp;
            btnConfigure.validationGroup = strValgrp;
            var newindex = tab.get_activeTabIndex(index);
            var txtStatus = document.getElementById('ctl00_ContentPlaceHolder1_tcAccountCreation_TabMainPage_txtStatus');
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            var btnclear = document.getElementById('<%=btnClear.ClientID %>')
            //if (newindex == tab._tabs.length - 1)
            //    btnSave.disabled = false;
            //else
            //    btnSave.disabled = true;
            var status = txtStatus.value;
            var queryConsolidate;
            queryConsolidate = location.search.split("qsAccConNo=");
            var querySplit;
            querySplit = location.search.split("qsAccSplitNo=");
            if (querymode != "C" && querymode != "W") {
                if (queryConsolidate.length == 1 && querySplit.length == 1) {
                    //if (status.substr(0, 1) == "7" || status.substr(0, 2) == "11" || status.substr(0, 2) == "13" || status.substr(0, 2) == "3 " || status.substr(0, 1) == "0" || status.substr(0, 1) == "6") {
                    //    btnSave.disabled = true;
                    //}
                }
            }
            if (newindex > index) {
                if (!fnCheckPageValidators(strValgrp, false)) {
                    tab.set_activeTabIndex(index);

                }
                else {
                    var lobcode = FunGetSelectedLob();
                    var IsAssetAvail;
                    var IsCheckAssetAvail;
                    switch (lobcode.toLowerCase()) {
                        case "te": //Term loan Extensible
                        case "tl": //Term loan
                        case "ft": //Factoring 
                        case "wc": //Working Capital
                            IsAssetAvail = "No";
                            break;
                        default:
                            IsAssetAvail = "Yes";
                            break;
                    }
                    switch (lobcode.toLowerCase()) {
                        case "te": //Term loan Extensible
                        case "tl": //Term loan
                        case "ft": //Factoring 
                        case "wc": //Working Capital
                        case "ln": //Working Capital
                            IsCheckAssetAvail = false;
                            break;
                        default:
                            IsCheckAssetAvail = true;
                            break;
                    }

                    switch (index) {
                        case 0:
                            if (IsAssetAvail == "No") {
                                if (IsCheckAssetAvail) {
                                    if (FunCheckGridIsEmpty('<%=gvAssetDetails.ClientID %>', 'No')) {
                                        index = tab.get_activeTabIndex(index);

                                    }
                                    else {
                                        tab.set_activeTabIndex(index);
                                        alert('Add atleast one asset details');
                                    }
                                }
                                else {
                                    index = tab.get_activeTabIndex(index);
                                }
                            }
                            else {
                                if (IsCheckAssetAvail) {
                                    if (FunCheckGridIsEmpty('<%=gvAssetDetails.ClientID %>', 'No')) {
                                        index = tab.get_activeTabIndex(index);
                                    }
                                    else {
                                        tab.set_activeTabIndex(index);
                                        alert('Add atleast one asset details');
                                    }
                                }
                                else {
                                    index = tab.get_activeTabIndex(index);
                                }
                            }


                            break;
                        case 1:

                            if (FunCheckGridIsEmpty('<%=gvOutFlow.ClientID %>', 'Yes')) {
                                if (document.getElementById('<%=txtBusinessIRR_Repay.ClientID %>').value == "") {
                                    document.getElementById('<%=btnGenerateRepay.ClientID %>').click();
                                }
                                index = tab.get_activeTabIndex(index);

                            }
                            else {

                                if ((querymode != "C" && status.substr(0, 2) == "11") || status.substr(0, 2) == "13" || status.substr(0, 2) == "3 " || status.substr(0, 1) == "0" || status.substr(0, 1) == "7" || status.substr(0, 1) == "6") {

                                    index = tab.get_activeTabIndex(index);

                                }
                                else {
                                    if (lobcode.toLowerCase() != "ol") {
                                        tab.set_activeTabIndex(index);
                                        alert('Add atleast one Outflow details');
                                    }
                                    else {
                                        if (document.getElementById('<%=txtBusinessIRR_Repay.ClientID %>').value == "") {
                                            document.getElementById('<%=btnGenerateRepay.ClientID %>').click();
                                        }
                                        index = tab.get_activeTabIndex(index);
                                    }

                                }
                            }

                            break;
                        case 2:

                            if (FunCheckGridIsEmpty('<%=gvRepaymentSummary.ClientID %>', 'No')) {
                                if (document.getElementById('<%=txtBusinessIRR_Repay.ClientID %>').value == "") {
                                    document.getElementById('<%=btnGenerateRepay.ClientID %>').click();
                                }
                                index = tab.get_activeTabIndex(index);
                            }
                            else {
                                tab.set_activeTabIndex(index);
                                alert('Add atleast one Repayment details');
                            }


                            break;
                        case 4:
                            index = tab.get_activeTabIndex(index);
                            break;
                        case 5:
                            index = tab.get_activeTabIndex(index);
                            break;
                        default:
                            index = tab.get_activeTabIndex(index);
                            break;

                    }


                }
            }
            else {
                tab.set_activeTabIndex(newindex);
                index = tab.get_activeTabIndex(newindex);





            }

        }
        function FunGetSelectedLob() {
            var ddlLob = document.getElementById('<%=ddlLOB.ClientID %>');
            return ddlLob.item(ddlLob.selectedIndex).text.split('-')[0].trim();
        }
        function FunCheckGridIsEmpty(gridview, isfooterexists) {
            if (document.getElementById(gridview) == null) {
                return false;
            }
            var table = document.getElementById(gridview);
            var rows = table.getElementsByTagName("tr");
            if (isfooterexists == 'No') {
                if (rows.length > 1) {
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                if (rows.length > 2) {
                    return true;
                }
                else {
                    return false;
                }
            }
        }

        function FunChkAllFooterValues(gridid) {


            //Get all the control of the type INPUT in the base control.
            var Combos = gridid.getElementsByTagName("select");
            for (var n = 0; n < Combos.length; ++n) {
                if (Combos[n].innerText == "") {
                    return false;
                }
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

        function fnSaveValidation() {

            if (!fnCheckPageValidators("Assignment of Accounts", true)) {
                alert("Fill the Mandatory value in Assignment of Accounts Tab");
                return false;
            }


            if (confirm('Do you want to save?')) {
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

        }

    </script>
    <script type="text/javascript">

        //Added By Shibu Resize Grid
        function GetChildGridResize(ImageType) {
            if (ImageType == "Hide Menu") {
                document.getElementById('<%=DivFollow.ClientID %>').style.width = parseInt(screen.width) - 20;
                document.getElementById('<%=DivFollow.ClientID %>').style.overflow = "scroll";
            }
            else {
                document.getElementById('<%=DivFollow.ClientID %>').style.width = parseInt(screen.width) - 260;
                document.getElementById('<%=DivFollow.ClientID %>').style.overflow = "scroll";
            }
        }

        function funcalassetvalue() {
            var vUnitCount = document.getElementById('<%=txtUnitCount.ClientID %>').value;
            if (vUnitCount == "") {
                vUnitCount = 0;
            }
            if (parseFloat(vUnitCount) > 500) {
                alert('Asset Unit Count Should not exceed the 500');
                document.getElementById('<%=txtUnitCount.ClientID %>').value = "";
                return;
            }
            var VUnitValue = document.getElementById('<%=txtUnitValue.ClientID %>').value;
            var str = VUnitValue.split('.');
            if (str.length > 2) {
                document.getElementById('<%=txtUnitValue.ClientID %>').value = "";
                alert('Invalid Amount');
                document.getElementById('<%=txtUnitValue.ClientID %>').value = "";
                document.getElementById('<%=txtTotalAssetValue.ClientID %>').value = "";
                document.getElementById('<%=txtLpoAssetAmount.ClientID %>').value = "";
                document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = "";
                document.getElementById('<%=txtMarginPercentage.ClientID %>').value = "";
                document.getElementById('<%=txtMargintoDealer.ClientID %>').value = "";
                document.getElementById('<%=txtMargintoMFC.ClientID %>').value = "";
                document.getElementById('<%=txtTradeIn.ClientID %>').value = "";
                return false;
            }
            var VUnitCount = document.getElementById('<%=txtUnitCount.ClientID %>').value;
            if (VUnitCount == "") {
                return;
            }
            if (VUnitValue == "") {
                return;
            }
            if (parseFloat(document.getElementById('<%=txtUnitCount.ClientID %>').value) != 0 && parseFloat(document.getElementById('<%=txtUnitValue.ClientID %>').value) != 0) {

                var varTotalAmt;
                var varSetZero;
                varSetZero = 0;
                varTotalAmt = 0;

                document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = 0;
                varTotalAmt = ((parseFloat(document.getElementById('<%=txtUnitCount.ClientID %>').value) *
                    parseFloat(document.getElementById('<%=txtUnitValue.ClientID %>').value)).toFixed(3));
                if (document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value != "") {
                    varTotalAmt = (varTotalAmt - parseFloat(document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value)).toFixed(3);
                }

                document.getElementById('<%=txtTotalAssetValue.ClientID %>').value = varTotalAmt; //-varMarginAmt;
                document.getElementById('<%=txtLpoAssetAmount.ClientID %>').value = parseFloat(document.getElementById('<%=txtUnitValue.ClientID %>').value).toFixed(3);
                funcalassetMarginAmt();
            }
            document.getElementById('<%=txtMargintoDealer.ClientID %>').value = varSetZero.toFixed(3);
            document.getElementById('<%=txtMargintoMFC.ClientID %>').value = varSetZero.toFixed(3);
            document.getElementById('<%=txtTradeIn.ClientID %>').value = varSetZero.toFixed(3);
        }

        function funcalassetMarginAmt_dp() {
            //Added by Sathish R on 20-Aug-2018
            var VMargintoDealer = document.getElementById('<%=txtMargintoDealer.ClientID %>').value;
            var VtxtMargintoMFC = document.getElementById('<%=txtMargintoMFC.ClientID %>').value;
            var VtxtTradeIn = document.getElementById('<%=txtTradeIn.ClientID %>').value;
            var VtxtTotalMargin = 0;
            var VtxtLpoAssetAmount = document.getElementById('<%=txtLpoAssetAmount.ClientID %>').value;
            var VtxtTotalAssetValue = document.getElementById('<%=txtTotalAssetValue.ClientID %>').value;
            var VUnitValue = document.getElementById('<%=txtUnitValue.ClientID %>').value;
            var VUnitCount = document.getElementById('<%=txtUnitCount.ClientID %>').value;
            if (VUnitCount == "") {

                if (!fnCheckPageValidators('TabAddAssetDetails', false)) {
                    return false;
                }
            }
            if (VUnitValue == "") {

                if (!fnCheckPageValidators('TabAddAssetDetails', false)) {
                    return false;
                }
            }
            if (parseFloat(VUnitValue) <= 0) {

                alert('Unit Value should be greater than the Zero');
                return false;
                if (!fnCheckPageValidators('TabAddAssetDetails', false)) {
                    return false;
                }
            }
            if (parseFloat(document.getElementById('<%=txtUnitCount.ClientID %>').value) != 0 && parseFloat(document.getElementById('<%=txtUnitValue.ClientID %>').value) != 0) {

                if (VMargintoDealer == "") {
                    VMargintoDealer = 0;
                }
                if (VtxtMargintoMFC == "") {
                    VtxtMargintoMFC = 0;
                }
                if (VtxtLpoAssetAmount == "") {
                    VtxtLpoAssetAmount = 0;
                }
                if (VtxtTotalAssetValue == "") {
                    VtxtTotalAssetValue = 0;
                }
                if (VtxtTradeIn == "") {
                    VtxtTradeIn = 0;
                }
                if (parseFloat(VUnitValue) <= 0) {

                    alert('Unit Value should be greater than the Zero');
                    return false;
                }
                VtxtTotalMargin = parseFloat(VMargintoDealer) + parseFloat(VtxtMargintoMFC) + parseFloat(VtxtTradeIn);
                document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = parseFloat(VtxtTotalMargin).toFixed(3);
                document.getElementById('<%=txtLpoAssetAmount.ClientID %>').value = (parseFloat(VUnitValue) - (parseFloat(VMargintoDealer) + parseFloat(VtxtTradeIn))).toFixed(3);
                if (parseFloat(VUnitValue) <= parseFloat(VtxtTotalMargin)) {
                    alert('Total margin amount should be less than the Unit Value');
                    //document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = "0";
                    return false;
                }
                document.getElementById('<%=txtMarginPercentage.ClientID %>').value = (parseFloat(VtxtTotalMargin) / parseFloat(VtxtTotalAssetValue) * 100).toFixed(3);
            }
            if (!fnCheckPageValidators('TabAddAssetDetails', false)) {
                return false;
            }
        }


    </script>

    <asp:UpdatePanel ID="upMain" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Account Creation">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel runat="server" ID="pnlActionControlAll" HorizontalAlign="Left" CssClass="stylePanel" GroupingText="">
                                <asp:RadioButtonList runat="server" ID="rbtnActionControlAll" AutoPostBack="true" class="checkmark" Font-Bold="true" ForeColor="Black" RepeatDirection="Horizontal"
                                    OnSelectedIndexChanged="rbtnActionControlAll_SelectedIndexChanged"
                                    CssClass="md-form-control form-control radio">
                                    <asp:ListItem Text="Assignemen of Accounts" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Addition and Deactivation of Guarantor" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Asset Replacement" Value="3"></asp:ListItem>
                                </asp:RadioButtonList>
                            </asp:Panel>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <cc1:TabContainer ID="tcAccountCreation" runat="server" CssClass="styleTabPanel"
                                Width="100%" ScrollBars="None">
                                <cc1:TabPanel runat="server" ID="TabInvoice" CssClass="tabpan" BackColor="Red" Width="98%">
                                    <HeaderTemplate>
                                        Assignment of Accounts
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="updAssignemnetofaccounts" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel runat="server" ID="pnlAssignMentDeatils" HorizontalAlign="Left" CssClass="stylePanel" GroupingText="Assignment"
                                                            Width="99%">
                                                            <div class="row">
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAccountNumber" Enabled="false" onkeyup="maxlengthfortxt(150);" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblAccountNumber" CssClass="styleDisplayLabel" Text="Account Number"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtBranchAssignment" Enabled="false" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblBranchAssignment" CssClass="styleDisplayLabel" Text="Branch"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCustomerCodeAssign" Enabled="false" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblCustomerCodeAssign" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAssetDescription" Enabled="false" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblAssetDescription" CssClass="styleDisplayLabel" Text="Asset Description"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>


                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAssetClass" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblAssetClass" CssClass="styleDisplayLabel" Text="Class"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMake" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblMake" CssClass="styleDisplayLabel" Text="Make"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAssetType" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblType" CssClass="styleDisplayLabel" Text="Type"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtModel" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblModel" CssClass="styleDisplayLabel" Text="Model"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPurpose" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lbltxtPurpose" CssClass="styleDisplayLabel" Text="Purpose"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>



                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAssignmentName" onkeyup="maxlengthfortxt(150);" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvTextAssignmentName" runat="server" ErrorMessage="Assignee Name"
                                                                                SetFocusOnError="true" ControlToValidate="txtAssignmentName" CssClass="validation_msg_box_sapn" ValidationGroup="Assignment of Accounts"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblAssignmentName" CssClass="styleReqFieldLabel" Text="Assignee Name"></asp:Label>
                                                                        </label>

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAssinmentEffectivedate" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="flttxtAssinmentEffectivedate" runat="server" ValidChars="/-"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"
                                                                            TargetControlID="txtAssinmentEffectivedate">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <asp:Image ID="imgtxtAssinmentEffectivedate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                            Visible="false" />
                                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtAssinmentEffectivedate" PopupButtonID="imgtxtAssinmentEffectivedate"
                                                                            Format="DD/MM/YYYY" ID="CEtxtAssinmentEffectivedate" Enabled="True" OnClientDateSelectionChanged="checkDate_ApplicationDate">
                                                                        </cc1:CalendarExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtAssinmentEffectivedate" runat="server" ErrorMessage="Effective Date"
                                                                                SetFocusOnError="true" ControlToValidate="txtAssinmentEffectivedate" CssClass="validation_msg_box_sapn" ValidationGroup="Assignment of Accounts"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblEffectiveDate" CssClass="styleReqFieldLabel" Text="Effective date"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlAssignmentStatus" runat="server"
                                                                            class="md-form-control form-control">
                                                                            <asp:ListItem Value="1" Text="Assigned" Selected="True">  </asp:ListItem>
                                                                            <asp:ListItem Value="2" Text="Revoked">  </asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblAssignmentStatus" CssClass="styleReqFieldLabel" Text="Assignment Status"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAssigneeRemarks" ToolTip="Risk Remarks" TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true" onkeyup="maxlengthfortxt(200);" runat="server"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>

                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtRiskRemarks" runat="server" ErrorMessage="Enter the Assignee Remarks"
                                                                                SetFocusOnError="true" ControlToValidate="txtAssigneeRemarks" CssClass="validation_msg_box_sapn" ValidationGroup="Assignment of Accounts"
                                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>

                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblAssignmentofAccounts" ToolTip="Assignee Remarks" CssClass="styleReqFieldLabel" Text="Assignee Remarks"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel runat="server" ID="pnlAssignmentHistory" HorizontalAlign="Left" CssClass="stylePanel" GroupingText="Assignment History"
                                                            Width="99%">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="gird">
                                                                        <asp:GridView ID="grvAssignmentDetails" runat="server" AutoGenerateColumns="false" Width="100%">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="Sno">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblSno" runat="server" Text='<%# Bind("Sno") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Assignee Name">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAssignmentName" runat="server" Text='<%# Bind("Assignment_Name") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Effetive Date">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblEffetiveDate" runat="server" Text='<%# Bind("Effetive_Date") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Assignee Status">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAssignmentStatus" runat="server" Text='<%# Bind("Assignment_Status") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Assignee Remarks">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAssigneeRemarks" runat="server" Text='<%# Bind("ASSIGNEE_REMARKS") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Updated by">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblChangedby" runat="server" Text='<%# Bind("USER_BY") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Updated on">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblChangedOn" runat="server" Text='<%# Bind("USER_ON") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="gird">
                                                            <asp:GridView ID="gvCollateralDetails" runat="server" AutoGenerateColumns="false"
                                                                Width="98%" Caption="Collateral reference">
                                                                <Columns>
                                                                    <asp:BoundField DataField="ID" HeaderText="ID" />
                                                                    <asp:BoundField DataField="Collateralreference" HeaderText="Collateral reference" />
                                                                    <asp:BoundField DataField="Description" HeaderText="Description" />
                                                                    <asp:BoundField DataField="Collateralvalue" HeaderText="Collateral value" />
                                                                    <asp:BoundField DataField="viewcollateral" HeaderText="View Collateral" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div style="display: none" class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel runat="server" ID="pnlInvoiceDetails" CssClass="stylePanel" GroupingText="Invoice Details"
                                                            Width="99%">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="gird">
                                                                        <asp:GridView ID="gvInvoiceDetails" runat="server" AutoGenerateColumns="false" Width="100%"
                                                                            OnRowDataBound="gvInvoiceDetails_RowDataBound">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="Invoice Transaction reference" ItemStyle-HorizontalAlign="Right"
                                                                                    Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblInvoiceReferNo" runat="server" Text='<%#Bind("Invoice_Id") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="Doc_Invoice_No" HeaderText="Invoice Reference" ItemStyle-Width="15%" />
                                                                                <asp:BoundField DataField="Invoice_No" HeaderText="Invoice No" />
                                                                                <asp:BoundField DataField="Vendor" HeaderText="Vendor Name" />
                                                                                <asp:TemplateField HeaderText="Invoice Details" ItemStyle-HorizontalAlign="Center">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="lbtnViewInvoice" CausesValidation="false" runat="server" Text="View"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" ID="tbAdditionDeactivationofGuarantor" CssClass="tabpan" BackColor="Red" Width="98%">
                                    <HeaderTemplate>
                                        Addition and Deactivation of Guarantor
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div style="display:none" class="row">
                                                    <div class="col">
                                                        <asp:Button ID="btnGuar" Style="display: none" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnGuar_Click" />
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel runat="server" ID="Panel1" CssClass="stylePanel" GroupingText="Guarantor Details">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="gird">
                                                                        <asp:GridView ID="gvGuarantor" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                                                                            Width="100%" OnRowDeleting="gvGuarantor_RowDeleting" OnRowDataBound="gvGuarantor_RowDataBound">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="Customer type">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="ddlGuarantortype_GuarantorTab" runat="server" Text='<%# Bind("Guarantor") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:DropDownList ID="ddlGuarantortype_GuarantorTab" CssClass="md-form-control form-control login_form_content_input" runat="server" AutoPostBack="true"
                                                                                                OnSelectedIndexChanged="ddlGuarantortype_SelectedIndexChanged">
                                                                                            </asp:DropDownList>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator ID="rfvddlGuarantortype_GuarantorTab" runat="server"
                                                                                                    ControlToValidate="ddlGuarantortype_GuarantorTab" CssClass="validation_msg_box_sapn"
                                                                                                    ValidationGroup="Guarantor" Display="Dynamic" InitialValue="-1" SetFocusOnError="True"
                                                                                                    ErrorMessage="Select a Guarantor type"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>

                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Nature of Relation">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblNatureofRelationId" Visible="false" runat="server" Text='<%# Bind("Nature_of_Relation_ID") %>'>
                                                                                        </asp:Label>
                                                                                        <asp:Label ID="lblNatureofRelation" runat="server" Text='<%# Bind("Nature_of_Relation") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:DropDownList ID="ddlNatureofRelation" CssClass="md-form-control form-control login_form_content_input" runat="server" AutoPostBack="true">
                                                                                            </asp:DropDownList>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator ID="rfvNatureofRelation" runat="server"
                                                                                                    ControlToValidate="ddlNatureofRelation" CssClass="validation_msg_box_sapn"
                                                                                                    ValidationGroup="Guarantor" Display="Dynamic" InitialValue="-1" SetFocusOnError="True"
                                                                                                    ErrorMessage="Select Nature of Relation"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="GuaranteeID" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblGuaranteeID" runat="server" Text='<%# Bind("Code") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Guarantor">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="ddlCode_GuarantorTab" runat="server" Text='<%# Bind("Name") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <%-- <uc2:LOV ID="ucCustomerLov" runat="server" TextWidth="400px" strLOV_Code="CMD" strControlID="ctl00_ContentPlaceHolder1_tcAccountCreation_TabInvoice_gvGuarantor_ctl03_ucCustomerLov" />--%>
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <UC6:ICM ID="ucCustomerLov" ReadOnly="true" ButtonEnabled="false" ToolTip="Guarantor Name" onblur="fnLoadCustomerg()" HoverMenuExtenderLeft="true" runat="server" ShowHideAddressImageButton="false" AutoPostBack="false" DispalyContent="Both"
                                                                                                        strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" />
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Guarantee Amount" ItemStyle-HorizontalAlign="Right"
                                                                                    FooterStyle-HorizontalAlign="Right">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="txtGuaranteeamount_GuarantorTab" runat="server" Text='<%# Bind("Amount") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:TextBox ID="txtGuaranteeamount_GuarantorTab_Footer" Class="md-form-control form-control login_form_content_input" runat="server" Style="text-align: right"
                                                                                                MaxLength="10">
                                                                                            </asp:TextBox>
                                                                                            <cc1:FilteredTextBoxExtender ID="ftxtGuarateeAmount" runat="server" TargetControlID="txtGuaranteeamount_GuarantorTab_Footer"
                                                                                                FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator ID="rfvtxtGuaranteeamount_GuarantorTab" runat="server"
                                                                                                    ControlToValidate="txtGuaranteeamount_GuarantorTab_Footer" CssClass="validation_msg_box_sapn"
                                                                                                    ValidationGroup="Guarantor" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter the Guarantee Amount"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Charge Sequence">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="ddlChargesequence_GuarantorTab" runat="server" Text='<%# Bind("ChargeSequence") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:DropDownList ID="ddlChargesequence_GuarantorTab" Class="md-form-control form-control login_form_content_input" runat="server">
                                                                                            </asp:DropDownList>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator ID="rfvddlChargesequence_GuarantorTab" runat="server"
                                                                                                    ControlToValidate="ddlChargesequence_GuarantorTab" CssClass="validation_msg_box_sapn"
                                                                                                    ValidationGroup="Guarantor" Display="Dynamic" InitialValue="-1" SetFocusOnError="True"
                                                                                                    ErrorMessage="Select a Charge Sequence"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="View Customer">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="lbtnViewCustomer" CausesValidation="false" runat="server" CommandName="Edit"
                                                                                            Text="View"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField Visible="false" HeaderText="From Date">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblFromDate" runat="server" Text='<%# Bind("From_Date") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:TextBox ID="txtFromDate" CssClass="md-form-control form-control login_form_content_input" runat="server" AutoPostBack="false">
                                                                                            </asp:TextBox>
                                                                                            <asp:Image ID="imgGuarantee" Visible="false" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                                            <cc1:CalendarExtender runat="server" TargetControlID="txtFromDate" PopupButtonID="imgGuarantee" ID="CalGuarantee" Enabled="True">
                                                                                            </cc1:CalendarExtender>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator ID="rfvGuarantee" runat="server"
                                                                                                    ControlToValidate="txtFromDate" CssClass="validation_msg_box_sapn"
                                                                                                    ValidationGroup="Guarantor" Display="Dynamic" SetFocusOnError="True"
                                                                                                    ErrorMessage="Select the Guarantee"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Is Active">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblIsActive" Visible="false" Text='<%# Bind("Is_Active") %>' runat="server">
                                                                                        </asp:Label>
                                                                                        <asp:CheckBox ID="ChkIsActive" runat="server"></asp:CheckBox>

                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="">
                                                                                    <ItemTemplate>
                                                                                        <%-- <asp:LinkButton ID="lnRemove" CausesValidation="false" runat="server" CommandName="Delete"
                                                                                    Text="Remove"></asp:LinkButton>--%>
                                                                                        <asp:LinkButton ID="lnRemove" CausesValidation="false" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" AccessKey="1" ToolTip="Remove [Alt+1]" CommandName="Delete"
                                                                                            Text="Remove" CssClass="grid_btn_delete"></asp:LinkButton>

                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:Button ID="LbtnAddInvoice" runat="server" AccessKey="A" ToolTip="Add [Alt+A]" CausesValidation="true" OnClick="Guarantor_AddRow_OnClick"
                                                                                                Text="Add" ValidationGroup="Guarantor" class="grid_btn"></asp:Button>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" ID="tbAssetReplacement" CssClass="tabpan" BackColor="Red" Width="98%">
                                    <HeaderTemplate>
                                        Asset Replacement
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpdAssetReplacement" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                        <asp:Panel GroupingText="Existing Asset" ToolTip="Existing Asset"
                                                            ID="pnlExistAsset" runat="server" CssClass="stylePanel">
                                                            <div style="height: 150px; overflow-y: scroll">
                                                                <asp:GridView ID="grvOldAssetDetails" runat="server" AutoGenerateColumns="False"
                                                                    OnRowDataBound="grvOldAssetDetails_RowDataBound" Width="50%" EnableModelValidation="True">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="SI No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblID" runat="server" Text='<%#Eval("SNO")%>'> </asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" Width="3%" />
                                                                            <ItemStyle HorizontalAlign="Left" Width="3%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Asset Number">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAssetCode" runat="server" Text='<%#Eval("ASSET_NUMBER")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" Width="25%" />
                                                                            <ItemStyle HorizontalAlign="Left" Width="25%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Asset Description">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAssetDesc" runat="server" Text='<%#Eval("ASSET_DESC")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Left" Width="50%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Amount Financed">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAssetAmountFinanced" runat="server" Text='<%#Eval("AMOUNT_FINANCED")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Right" Width="50%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Replace Indicator">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkReplaceIndicator"   runat="server"></asp:CheckBox>
                                                                                <asp:Label ID="lblReplaceIndicator" runat="server" Visible="false" Text='<%#Eval("ASSET_STATUS_CODE")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Right" Width="50%" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                    <RowStyle HorizontalAlign="Center" />
                                                                </asp:GridView>
                                                            </div>
                                                        </asp:Panel>

                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="gird">
                                                            <div class="row">
                                                                <asp:Panel runat="server" ID="pnlAssetDetails" CssClass="stylePanel" Width="99%" GroupingText="New Asset Details">
                                                                    <div>
                                                                        <div class="row">
                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <UC3:AutoSugg ID="ddlAssetCodeList1" runat="server" ToolTip="Asset Code" ErrorMessage="Select the Asset" ValidationGroup="TabAddAssetDetails"
                                                                                        OnItem_Selected="ddlAssetCodeList1_SelectedIndexChanged"
                                                                                        ServiceMethod="GetAsset" ItemToValidate="Value" IsMandatory="true" AutoPostBack="true" />
                                                                                    <asp:Button ID="btnLoadAssetCode" Visible="false" runat="server" ToolTip="Load Code" CssClass="styleSubmitButton" CausesValidation="false" AccessKey="O" OnClick="btnLoadAssets_Click"
                                                                                        Text="Load Asset Code" UseSubmitBehavior="False" />
                                                                                    <asp:HiddenField ID="hdnLobId" runat="server" />
                                                                                    <asp:HiddenField ID="hdnLobCode" runat="server" />
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblAssetCodeList" ToolTip="Asset Code" CssClass="styleReqFieldLabel" Text="Asset Code"></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="row">
                                                                            <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtRequiredFromDate" ToolTip="Required From" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                                    <cc1:CalendarExtender ID="CalendarExtenderSD_RequiredFromDate" runat="server" Enabled="True"
                                                                                        OnClientDateSelectionChanged="checkDate_PrevSystemDate" TargetControlID="txtRequiredFromDate">
                                                                                    </cc1:CalendarExtender>

                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="Label3" ToolTip="Required From" CssClass="styleReqFieldLabel"
                                                                                            Text="Required From"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtUnitCount" runat="server" MaxLength="3" Text="1" ToolTip="Unit Count" class="md-form-control form-control login_form_content_input requires_true"
                                                                                        onblur="ChkIsZero(this,'Unit Count')" onchange="funcalassetvalue();" Style="text-align: right"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftextExtxtUnitCount" runat="server" FilterType="Numbers"
                                                                                        TargetControlID="txtUnitCount" Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvUnitCount" runat="server" ControlToValidate="txtUnitCount"
                                                                                            ValidationGroup="TabAddAssetDetails" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            SetFocusOnError="False" ErrorMessage="Enter the Unit count"></asp:RequiredFieldValidator>
                                                                                    </div>

                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblUnitCount" CssClass="styleReqFieldLabel" Text="Unit Count"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtUnitValue" onblur="ChkIsZero(this,'Unit Count')" runat="server" onchange="funcalassetvalue();" ToolTip="Unit Value" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvUnitValue" runat="server" ControlToValidate="txtUnitValue"
                                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="False" ValidationGroup="TabAddAssetDetails"
                                                                                            ErrorMessage="Enter the Unit value"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <cc1:FilteredTextBoxExtender ID="flttxtUnitValue" runat="server" TargetControlID="txtUnitValue"
                                                                                        FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <input id="HdnGPSDecimal" type="hidden" runat="server" />



                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="Label4" CssClass="styleReqFieldLabel" Text="Unit Value"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtTotalAssetValue" ToolTip="Total Asset Value" Style="text-align: right" TabIndex="-1" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>



                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblTotalAssetValue" Text="Total Asset Value" CssClass="styleDisplayLabel"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>


                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtMarginPercentage" TabIndex="-1" ToolTip="Margin %" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>


                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblMarginPercentage" CssClass="styleDisplayLabel" Text="Margin %"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtMarginAmountAsset" Style="text-align: right" TabIndex="-1" ToolTip="Margin Amount" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblMarginAmountAsset" CssClass="styleDisplayLabel"
                                                                                            Text="Margin Amount"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtBookDepreciationPerc" runat="server" ToolTip="Book Depreciation %" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>


                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblBookDepreciationPerc" CssClass="styleDisplayLabel"
                                                                                            Text="Book Depreciation %"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:DropDownList ID="ddlPayTo" ToolTip="Pay To" runat="server" OnSelectedIndexChanged="ddlPayTo_SelectedIndexChanged"
                                                                                        AutoPostBack="true" class="md-form-control form-control">

                                                                                        <asp:ListItem Value="0">Entity</asp:ListItem>
                                                                                        <asp:ListItem Value="1">Customer</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvPayTo" runat="server" ControlToValidate="ddlPayTo"
                                                                                            ValidationGroup="TabAddAssetDetails" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                            InitialValue="-1" SetFocusOnError="True" ErrorMessage="Select a Pay To"></asp:RequiredFieldValidator>
                                                                                    </div>




                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblPayTo" CssClass="styleReqFieldLabel" Text="Pay To"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <UC3:AutoSugg ID="ddlEntityNameList" ToolTip="Customer Name/Entity Name" runat="server" ServiceMethod="GetVendors"
                                                                                        ErrorMessage="Select the Entity Name"
                                                                                        ValidationGroup="TabAddAssetDetails" IsMandatory="true" />
                                                                                    <asp:TextBox ID="txtCustomerName2" class="md-form-control form-control login_form_content_input requires_true" runat="server" ReadOnly="true" TabIndex="-1"></asp:TextBox>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvCustomerName" runat="server" ControlToValidate="txtCustomerName2"
                                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ValidationGroup="TabAddAssetDetails"
                                                                                            ErrorMessage="Enter Customer Name"></asp:RequiredFieldValidator>
                                                                                    </div>


                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label ID="lblCustomerName22" runat="server" CssClass="styleDisplayLabel" Text="Customer Name" Visible="False"></asp:Label>
                                                                                        <asp:Label runat="server" ID="lblEntityNameList" CssClass="styleReqFieldLabel" Text="Entity Name"></asp:Label>

                                                                                    </label>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtMargintoDealer" onchange="funcalassetMarginAmt_dp();" ToolTip="Margin to Dealer" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true" runat="server"
                                                                                        onkeypress="fnAllowNumbersOnly(false,false,this)"></asp:TextBox>

                                                                                    <cc1:FilteredTextBoxExtender ID="flttxtMargintoDealer" runat="server" TargetControlID="txtMargintoDealer"
                                                                                        FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>

                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblMargintoDealer" CssClass="styleDisplayLabel"
                                                                                            Text="Margin to Dealer"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtMargintoMFC" ToolTip="Margin to MFC" onchange="funcalassetMarginAmt_dp();" class="md-form-control form-control login_form_content_input requires_true" runat="server"
                                                                                        onkeypress="fnAllowNumbersOnly(false,false,this)"></asp:TextBox>

                                                                                    <cc1:FilteredTextBoxExtender ID="flttxtMargintoMFC" runat="server" TargetControlID="txtMargintoMFC"
                                                                                        FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>

                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblMargintoMFC" CssClass="styleDisplayLabel"
                                                                                            Text="Margin to MFC"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtTradeIn" onchange="funcalassetMarginAmt_dp();" ToolTip="Trade In" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                                        onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>

                                                                                    <cc1:FilteredTextBoxExtender ID="fttxtTradeIn" runat="server" TargetControlID="txtTradeIn"
                                                                                        FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>

                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblTradeIn" CssClass="styleDisplayLabel"
                                                                                            Text="Trade In"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtLpoAssetAmount" TabIndex="-1" Style="text-align: right" ToolTip="LPO Amount" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                                        onkeypress="fnAllowNumbersOnly(false,false,this)"></asp:TextBox>


                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>

                                                                                    <label>
                                                                                        <asp:Label runat="server" ID="lblLpoAssetamount" CssClass="styleDisplayLabel"
                                                                                            Text="LPO Amount"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>


                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:DropDownList ID="ddlAssetType" runat="server" ToolTip="Asset Type" MaxLength="10"
                                                                                        class="md-form-control form-control login_form_content_input requires_false">
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label ID="lblAssetTypeNew" ToolTip="Asset Type" runat="server" Text="Asset Type" CssClass="styleReqFieldLabel"></asp:Label>

                                                                                    </label>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvAssetType" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlAssetType"
                                                                                            ErrorMessage="Select the Asset Type" Display="Dynamic" InitialValue="0" ValidationGroup="TabAddAssetDetails" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:DropDownList ID="ddlTypeofVeh" runat="server" ToolTip="Type of Vehicle"
                                                                                        class="md-form-control form-control login_form_content_input requires_false">
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label ID="lblTypeofVehicle" ToolTip="Type of Vehicle" runat="server" Text="Type of Vehicle" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>


                                                                            <%--Asset Identification--%>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtRegNo1" MaxLength="10" Text='<%#Eval("REGN_NUMBER1")%>' CssClass="md-form-control form-control login_form_content_input requires_true"
                                                                                                        runat="server" ToolTip="Registration Number"></asp:TextBox>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtRegNo2" MaxLength="10" Text='<%#Eval("REGN_NUMBER2")%>' CssClass="md-form-control form-control login_form_content_input requires_true"
                                                                                                        runat="server" ToolTip="Registration Number"></asp:TextBox>

                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftxtRegAla" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                                        TargetControlID="txtRegNo1" ValidChars="">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftxtRegNo" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                                        TargetControlID="txtRegNo2" ValidChars="">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label class="tess">
                                                                                        <asp:Label ID="lblRegistrationNumber" ToolTip="Registration Number" runat="server" Text="Registration Number" CssClass="styleDisplayLabel"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtEngineNo" MaxLength="20" Text='<%#Eval("ENGINE_NUMBER")%>' CssClass="md-form-control form-control login_form_content_input requires_true"
                                                                                            runat="server" ToolTip="Engine Number"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="ftxtEngine" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                                            TargetControlID="txtEngineNo" ValidChars="">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                    <label class="tess">
                                                                                        <asp:Label ID="lblEngineNumber" ToolTip="Engine Number" runat="server" Text="Engine Number" CssClass="styleDisplayLabel"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtChassisNo" MaxLength="20" Text='<%#Eval("CHASIS_NUMBER")%>' CssClass="md-form-control form-control login_form_content_input requires_true"
                                                                                            runat="server" ToolTip="Chassis Number"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="ftxtChassis" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                                            TargetControlID="txtChassisNo" ValidChars="">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                    <label class="tess">
                                                                                        <asp:Label ID="lblChassisNumber" ToolTip="Chassis Number" runat="server" Text="Chassis Number" CssClass="styleDisplayLabel"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtSerialNo" MaxLength="20" Text='<%#Eval("SERIAL_NUMBER")%>' CssClass="md-form-control form-control login_form_content_input requires_true"
                                                                                            runat="server" ToolTip="Serial Number"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="ftxtSerialNo" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                                            TargetControlID="txtSerialNo" ValidChars="">
                                                                                        </cc1:FilteredTextBoxExtender>

                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                    <label class="tess">
                                                                                        <asp:Label ID="lblSerialNumber" ToolTip="Serial Number" runat="server" Text="Serial Number" CssClass="styleDisplayLabel"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtInstallationNo" MaxLength="20" Text='<%#Eval("INSTALLATION_REF_NO")%>' CssClass="md-form-control form-control login_form_content_input requires_true"
                                                                                            runat="server" ToolTip="Installation Ref Number"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="ftxtInstRefNo" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                                            TargetControlID="txtInstallationNo" ValidChars="">
                                                                                        </cc1:FilteredTextBoxExtender>

                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                    <label class="tess">
                                                                                        <asp:Label ID="lblInstallationRefNumber" ToolTip="Installation Ref Number" runat="server" Text="Installation Ref Number" CssClass="styleDisplayLabel"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtInstallationDate" MaxLength="20" runat="server" CssClass="md-form-control form-control login_form_content_input requires_true" AutoPostBack="true" OnTextChanged="txtInstallationDate_TextChanged"
                                                                                            ToolTip="Installation Date" Text='<%#Eval("INSTALLATION_DATE")%>'></asp:TextBox>
                                                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtInstallationDate"
                                                                                            ID="CEInsDate" Enabled="True">
                                                                                        </cc1:CalendarExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                    <label class="tess">
                                                                                        <asp:Label ID="lblInstallationDate" ToolTip="Installation Date" runat="server" Text="Installation Date" CssClass="styleDisplayLabel"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtFirstRegistrationDate" AutoPostBack="true" OnTextChanged="txtFirstRegistrationDate_TextChanged" MaxLength="20" runat="server" CssClass="md-form-control form-control login_form_content_input requires_true"
                                                                                            ToolTip="First Registration Date" Text='<%#Eval("FIRST_REGISTRATION_DATE")%>'></asp:TextBox>
                                                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtFirstRegistrationDate"
                                                                                            ID="CEFirstRegisDate" Enabled="True">
                                                                                        </cc1:CalendarExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                    <label class="tess">
                                                                                        <asp:Label ID="lblFirstRegistrationDate" ToolTip="First Registration Date" runat="server" Text="First Registration Date" CssClass="styleDisplayLabel"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtRegistrationDate" MaxLength="20" runat="server" AutoPostBack="true" OnTextChanged="txtRegistrationDate_TextChanged" CssClass="md-form-control form-control login_form_content_input requires_true"
                                                                                            ToolTip="Registration Date" Text='<%#Eval("REGISTRATION_DATE")%>'></asp:TextBox>
                                                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtRegistrationDate"
                                                                                            ID="CERegisDate" Enabled="True">
                                                                                        </cc1:CalendarExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                    <label class="tess">
                                                                                        <asp:Label ID="lblRegistrationDate" ToolTip="Registration Date" runat="server" Text="Registration Date" CssClass="styleDisplayLabel"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtRenewalDate" MaxLength="20" runat="server" AutoPostBack="true" OnTextChanged="txtRenewalDate_TextChanged" CssClass="md-form-control form-control login_form_content_input requires_true"
                                                                                            ToolTip="Renewal Date" Text='<%#Eval("RENEWAL_DATE")%>'></asp:TextBox>
                                                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtRenewalDate"
                                                                                            ID="CERenewalDate" Enabled="True">
                                                                                        </cc1:CalendarExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                    <label class="tess">
                                                                                        <asp:Label ID="lblRenewalDate" ToolTip="Renewal Date" runat="server" Text="Renewal Date" CssClass="styleDisplayLabel"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>




                                                                            <%--</div>--%>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">

                                                                                <asp:Button ID="btnAddNew" runat="server" AccessKey="C" ToolTip="Add [Alt+C]" OnClientClick="return funcalassetMarginAmt_dp();" CausesValidation="true" ValidationGroup="TabAddAssetDetails" CssClass="grid_btn" OnClick="btnAddAsset_OnClick"
                                                                                    Text="Add" />
                                                                                <asp:Button ID="btnClearAssetReplace" runat="server" CausesValidation="true" CssClass="grid_btn" OnClick="btnClearAssetReplace_Click"
                                                                                    Text="Clear" />
                                                                            </div>
                                                                        </div>
                                                                        <asp:Panel runat="server" ID="pnlAssetDtl" CssClass="stylePanel" GroupingText="Asset Details"
                                                                            Width="98%">
                                                                            <div style="width: 98%; padding-left: 1%">
                                                                                <div>
                                                                                    <table width="100%">
                                                                                        <tr align="right">
                                                                                            <td>
                                                                                                <asp:Label ID="lblAssetAmt" runat="server" Text="Total Lpo Amount :"></asp:Label>
                                                                                                <asp:Label ID="lblTotalAssetAmount" ToolTip="Total Lpo Amount " runat="server"
                                                                                                    Text="0"></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>
                                                                                <div class="gird">
                                                                                    <asp:GridView ID="grvAsset" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvAssetDetails_SelectedIndexChanged" OnRowDeleting="gvAssetDetails_RowDeleting" class="gird_details"
                                                                                        Width="100%" OnRowDataBound="gvAssetDetails_RowDataBound">
                                                                                        <Columns>
                                                                                            <asp:TemplateField HeaderText="S.No">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblRecordSno" CssClass="styleDisplayLabel" CausesValidation="false" runat="server" Text='<%#Container.DataItemIndex+1 %>' Style="text-align: right"></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Asset Number">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="lblAssetNo" OnClientClick="return confirm('Are you sure want to Modify this record?');" CssClass="grid_btn" CausesValidation="false" ToolTip="Edit" OnClick="lblAssetNo_Click" runat="server" Text='<%#Bind("PAGE_SNO") %>' Style="text-align: right"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Asset Id">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblAssetId" runat="server" Text='<%# Bind("Asset_Id") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Asset Code">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblAssetCode" runat="server" Text='<%# Bind("Asset_Code") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Asset Description">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblAssetDescription" runat="server" Text='<%# Bind("Asset_Description") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Asset Type">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblAssetTypeId" Visible="false" runat="server" Text='<%# Bind("ASSET_TYPE_ID") %>'></asp:Label>
                                                                                                    <asp:Label ID="lblAssetType" runat="server" Text='<%# Bind("ASSET_TYPE") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Unit Count">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblUnitCount" runat="server" Text='<%# Bind("Noof_Units") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Unit Value">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblUnitVal" runat="server" Text='<%# Bind("Unit_Value") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Asset Value">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblAssetVal" runat="server" Text='<%# Bind("AssetValue") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Margin to Dealer">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblMargintoDealer" runat="server" Text='<%# Bind("Margin_Dealer") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Margin to MFC">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblMargintoMFC" runat="server" Text='<%# Bind("Margin_MFC") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Trade In">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblTradeIn" runat="server" Text='<%# Bind("Trade_In") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="LPO Amount">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblLpoAmount" runat="server" Text='<%# Bind("LPO_Amount") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField Visible="false" HeaderText="Margin Percentage">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblMarginPer" runat="server" Text='<%# Bind("Margin_Percentage") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Down Payment Amount">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblMarginAmt" runat="server" Text='<%# Bind("Margin_Amount") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField Visible="false" HeaderText="Book Depreciation Percentage">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblBookRate" runat="server" Text='<%# Bind("Book_Depreciation_Percentage") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField Visible="false" HeaderText="Block Depreciation Percentage">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblBlockRate" runat="server" Text='<%# Bind("Block_Depreciation_Percentage") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Pay Type">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblpaytype" runat="server" Text='<%# Bind("paytype") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Pay To" Visible="false">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblpayto" runat="server" Text='<%# Bind("pay_to") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Payid" Visible="false">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblpayid" runat="server" Text='<%# Bind("pay_id") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Dealer/Customer Name">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblpayname" Width="100%" runat="server" Text='<%# Bind("payname") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Type of Vehicle">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblTypeofVehicle" runat="server" Text='<%# Bind("Veh_Type") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Registration No">
                                                                                                <ItemTemplate>
                                                                                                    <table>
                                                                                                        <tr>
                                                                                                            <td>
                                                                                                                <asp:Label ID="lblREGNNUMBER1" Style="border-style: outset;" runat="server" Text='<%# Bind("REGN_NUMBER1") %>'></asp:Label>
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <asp:Label ID="lblREGNNUMBER2" Style="border-style: outset;" runat="server" Text='<%# Bind("REGN_NUMBER2") %>'></asp:Label>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Engine No">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblENGINENUMBER" runat="server" Text='<%# Bind("ENGINE_NUMBER") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Chasis Number">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblCHASISNUMBER" runat="server" Text='<%# Bind("CHASIS_NUMBER") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Chasis Number">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblSERIALNUMBER" runat="server" Text='<%# Bind("SERIAL_NUMBER") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Installation Ref No">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblINSTALLATIONREFNO" runat="server" Text='<%# Bind("INSTALLATION_REF_NO") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Installation Date">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblINSTALLATIONDATE" runat="server" Text='<%# Bind("INSTALLATION_DATE") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="First Registration Date">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblFirstRegistrationDate" runat="server" Text='<%# Bind("FIRST_REGISTRATION_DATE") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Registration Date">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblREGISTRATIONDATE" runat="server" Text='<%# Bind("REGISTRATION_DATE") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Renewal Date">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblRENEWALDATE" runat="server" Text='<%# Bind("RENEWAL_DATE") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Action">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="LnkDelete" CssClass="grid_btn_delete" CausesValidation="false" AccessKey="K" ToolTip="Delete [Alt+K]" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure want to delete this record?');" Width="100%" runat="server"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                        </Columns>
                                                                                    </asp:GridView>
                                                                                </div>

                                                                            </div>
                                                                        </asp:Panel>
                                                                        <div class="row">
                                                                            <div class="col">
                                                                                <asp:ValidationSummary ID="vsTabAddAssetDetails" runat="server" CssClass="styleMandatoryLabel"
                                                                                    HeaderText="Correct the following validation(s):" ShowMessageBox="false" ShowSummary="true" ValidationGroup="TabAddAssetDetails" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col">
                                                                                <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
                                                                                <input type="hidden" id="hdnSortDirection" runat="server" />
                                                                                <input type="hidden" id="hdnSortExpression" runat="server" />
                                                                                <input type="hidden" id="hdnSearch" runat="server" />
                                                                                <input type="hidden" id="hdnOrderBy" runat="server" />
                                                                                <input type="hidden" id="hdnAssetID" runat="server" />
                                                                                '
                                                                            </div>
                                                                        </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <cc1:TabPanel runat="server" ID="TabMainPage" Visible="false" CssClass="tabpan" BackColor="Red" HeaderText="TabMainPage"
                                            Width="100%">
                                            <HeaderTemplate>
                                                Main Page
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="Panel_Input" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                                                                    Width="99%">
                                                                    <div class="row">
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                                                    class="md-form-control form-control">
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                                                        ErrorMessage="Select a Line of Business" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblLOB" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <UC3:AutoSugg ID="ddlBranchList" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true"
                                                                                    ErrorMessage="Select a Location" IsMandatory="true" ValidationGroup="Main Page" OnItem_Selected="ddlBranchList_SelectedIndexChanged" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblBranch" Text="Location" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlApplicationReferenceNo" runat="server" AutoPostBack="True"
                                                                                    OnSelectedIndexChanged="ddlApplicationReferenceNo_SelectedIndexChanged"
                                                                                    class="md-form-control form-control">
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvApplicationReferenceNo" runat="server" ControlToValidate="ddlApplicationReferenceNo"
                                                                                        InitialValue="0" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                                        ErrorMessage="Select an Application Reference No" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvApplicationwithoutlob" runat="server" ControlToValidate="ddlApplicationReferenceNo"
                                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Select an Application Reference No"
                                                                                        ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                                </div>

                                                                                <input type="hidden" value="0" runat="server" id="hdnID" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblApplicationReferenceNo" Text="Application Reference No."
                                                                                        CssClass="styleReqFieldLabel"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <button class="css_btn_enabled" id="btnApplicationReferenceNo" causesvalidation="false" runat="server" onserverclick="btnApplicationReferenceNo_Click"
                                                                                    type="button">
                                                                                    <i class="fa fa-eye" aria-hidden="true"></i>&emsp;<u></u>View Application
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCustomerNameLease" runat="server" Style="display: none;" MaxLength="50"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <UC6:ICM ID="ucCustomerCodeLov" TextWidth="122px" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                                    strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                                                                <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_Click"
                                                                                    Style="display: none" />
                                                                                <input id="hdnCustID" type="hidden" runat="server" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" Text="Customer Name" ID="lblCustomerNameLease" CssClass="styleDisplayLabel"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtAccountDate" onchange="FunDateRestIrr();" runat="server"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtAccountDate" runat="server" ValidChars="/-"
                                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"
                                                                                    TargetControlID="txtAccountDate">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:Image ID="imgAccountdate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtAccountDate" PopupButtonID="imgAccountdate"
                                                                                    Format="DD/MM/YYYY" ID="CalendarAccountDate" Enabled="True" OnClientDateSelectionChanged="checkDate_ApplicationDate">
                                                                                </cc1:CalendarExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvAccountDate" runat="server" ControlToValidate="txtAccountDate"
                                                                                        Display="Dynamic" ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" SetFocusOnError="True"
                                                                                        ErrorMessage="Enter an Account Date"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblAccountDate" CssClass="styleReqFieldLabel" Text="Account Date"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="pnlApplicationDetails" runat="server" GroupingText="Account Details"
                                                                    CssClass="stylePanel" Width="99%">
                                                                    <div class="row">
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtPrimeAccountNo" runat="server" ReadOnly="True"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblPrimeAccountNo" CssClass="styleReqFieldLabel" Text="Prime Account No."></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="True" Visible="False">
                                                                                </asp:DropDownList>
                                                                                <asp:TextBox ID="txtStatus" runat="server" ReadOnly="True"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblStatus" CssClass="styleReqFieldLabel" Text="Status"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtApplicationDate" runat="server" ReadOnly="True"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblApplicationDate" CssClass="styleDisplayLabel" Text="Application Date"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtSubAccountNo" Visible="false" runat="server" ReadOnly="True"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblSubAccountNo" Visible="false" CssClass="styleReqFieldLabel" Text="Sub Account No."></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtProductCode" runat="server" ReadOnly="True"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblProductCode" CssClass="styleDisplayLabel" Text="Product Code"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div style="display: none" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="Panel3" runat="server" GroupingText="Customer details" CssClass="stylePanel"
                                                                    Width="99%">
                                                                    <div class="row">
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCustomerCode" runat="server" ReadOnly="True"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblCustomerCode" CssClass="styleDisplayLabel" Text="Customer Code"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCustomerName" runat="server" ReadOnly="True"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblCustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtAddress1" runat="server" ReadOnly="True"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblAddress1" CssClass="styleDisplayLabel" Text="Address1"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtAddress2" runat="server" ReadOnly="True"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblAddress2" CssClass="styleDisplayLabel" Text="Address2"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCity" runat="server" ReadOnly="True"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblCity" CssClass="styleDisplayLabel" Text="City"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtState" runat="server" ReadOnly="True"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblState" CssClass="styleDisplayLabel" Text="State"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCountry" runat="server" ReadOnly="True"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblCountry" CssClass="styleDisplayLabel" Text="Country"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtPincode" runat="server" ReadOnly="True"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblPincode" CssClass="styleDisplayLabel" Text="Pincode/ZipCode"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <uc1:S3GCustomerAddress ID="S3GCustomerAddress1" runat="server" ShowCustomerCode="false"
                                                                                    FirstColumnStyle="styleFieldLabel" SecondColumnStyle="styleFieldAlign" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="Panel_Finance" runat="server" GroupingText="Finance details" CssClass="stylePanel"
                                                                    Width="98%" Style="padding-left: 7px; padding-right: 2px">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtFinanceAmount" runat="server" ValidationGroup="Main Page" MaxLength="10" ReadOnly="true"
                                                                                    onkeypress="fnAllowNumbersOnly(false,false,this)" onkeyup="fnNotAllowPasteSpecialChar(this,'special')"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFinanceAmount"
                                                                                        ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                                        ErrorMessage="Enter Finance Amount"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblFinanceAmount" CssClass="styleReqFieldLabel" Text="Finance Amount"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtTenure" runat="server" MaxLength="3" ReadOnly="True" Style="text-align: right;"
                                                                                    onchange="FunRestIrr();" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvTenure" runat="server" ControlToValidate="txtTenure"
                                                                                        ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                                        ErrorMessage="Enter the Tenure"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblTenure" CssClass="styleReqFieldLabel" Text="Tenure"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlTenureType" runat="server" onchange="FunRestIrr();"
                                                                                    class="md-form-control form-control">
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvTenureType" runat="server" ControlToValidate="ddlTenureType"
                                                                                        ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="-1"
                                                                                        SetFocusOnError="True" ErrorMessage="Select the Tenure Type"></asp:RequiredFieldValidator>
                                                                                </div>

                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblTenureType" CssClass="styleReqFieldLabel" Text="Tenure Type"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <UC3:AutoSugg ID="ddlSalePersonCodeList" runat="server" Width="250px" ServiceMethod="GetSalePersonList"
                                                                                    ErrorMessage="Select a Sales Person Code" IsMandatory="true" ValidationGroup="Main Page" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="lblSalePersonCode" runat="server" CssClass="styleReqFieldLabel" Text="Sales Person Code"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="Panel8" runat="server" GroupingText="IRR details" CssClass="stylePanel"
                                                                    Width="98%" Style="padding-left: 7px; padding-right: 2px">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtAccountingIRR" runat="server" Style="text-align: right;"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblAccountingIRR" CssClass="styleDisplayLabel" Text="Accounting IRR"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtBusinessIRR" runat="server" Style="text-align: right;"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblBusinessIRR" CssClass="styleReqFieldLabel" Text="Business IRR"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCompanyIRR" runat="server" Style="text-align: right;"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblCompanyIRR" CssClass="styleDisplayLabel" Text="Company IRR"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <cc1:TabContainer ID="TabContainerMainTab" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                                                                    Width="99%">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <cc1:TabPanel ID="TabDocumentDetails" runat="server" BackColor="Red" CssClass="tabpan"
                                                                                Style="padding-left: 7px; padding-right: 2px; width: 99%">
                                                                                <HeaderTemplate>
                                                                                    Document Details
                                                                                </HeaderTemplate>
                                                                                <ContentTemplate>
                                                                                    <div class="row">
                                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                            <div class="md-input">
                                                                                                <asp:TextBox ID="txtConstitutionCode" runat="server" CssClass="styleTExtBox" ReadOnly="True"
                                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>
                                                                                                <label>
                                                                                                    <asp:Label ID="lblConstitutionCodeList" runat="server" CssClass="styleDisplayLabel"
                                                                                                        Text="Constitution Code"></asp:Label>
                                                                                                </label>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="row">
                                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                            <asp:Panel runat="server" ID="Panel6" Visible="false" CssClass="stylePanel" GroupingText="Document Details"
                                                                                                Width="99%">
                                                                                                <div class="row">
                                                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                                        <div class="gird">
                                                                                                            <asp:GridView runat="server" ID="grvConsDocuments" Width="100%" OnRowDataBound="grvConsDocs_RowDataBound"
                                                                                                                AutoGenerateColumns="False" EnableModelValidation="True">
                                                                                                                <Columns>
                                                                                                                    <asp:BoundField DataField="ID" HeaderText="ID" />
                                                                                                                    <asp:BoundField DataField="DocumentFlag" HeaderText="Document Flag" />
                                                                                                                    <asp:BoundField DataField="DocumentDescription" HeaderText="Document Description">
                                                                                                                        <ItemStyle Width="15%" />
                                                                                                                    </asp:BoundField>
                                                                                                                    <asp:TemplateField HeaderText="Is_Mandatory">
                                                                                                                        <HeaderTemplate>
                                                                                                                            <asp:Label ID="lblOptman" runat="server" Text="Optional / Mandatory"></asp:Label>
                                                                                                                        </HeaderTemplate>
                                                                                                                        <ItemTemplate>
                                                                                                                            <%--'<%# Bind("IsMandatory") %>'--%>
                                                                                                                            <asp:CheckBox ID="chkIsMandatory" runat="server" Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "IsMandatory")))%>'></asp:CheckBox>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle Width="10%" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField HeaderText="Image Copy">
                                                                                                                        <ItemTemplate>
                                                                                                                            <%-- '<%# Bind("IsNeedImageCopy") %>'--%>
                                                                                                                            <asp:CheckBox ID="chkIsNeedImageCopy" Enabled="false" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "IsNeedImageCopy")))%>'></asp:CheckBox>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle Width="10%" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField HeaderText="Collected">
                                                                                                                        <ItemTemplate>
                                                                                                                            <%--'<%# Bind("Collected") %>'--%>
                                                                                                                            <asp:CheckBox ID="chkCollected" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Collected")))%>'></asp:CheckBox>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle Width="10%" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField HeaderText="Scanned">
                                                                                                                        <ItemTemplate>
                                                                                                                            <%--'<%# Bind("Scanned") %>'--%>
                                                                                                                            <asp:CheckBox ID="chkScanned" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Scanned")))%>'></asp:CheckBox>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle Width="10%" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField HeaderText="Remark">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:TextBox ID="txtRemark" runat="server" onkeypress="fnCheckSpecialChars(true)"
                                                                                                                                Width="130px" onkeyup="maxlengthfortxt(60)" Text='<%# Bind("Remark") %>' MaxLength="60"
                                                                                                                                TextMode="MultiLine"></asp:TextBox>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle Width="7%" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField HeaderText="Value">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:TextBox ID="txtValues" runat="server" onkeypress="fnCheckSpecialChars(true)"
                                                                                                                                Width="130px" onkeyup="fnNotAllowPasteSpecialChar(this,'special')" Text='<%# Bind("Values") %>'
                                                                                                                                MaxLength="40"></asp:TextBox>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle Width="15%" />
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField HeaderText="FollowUp">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:CheckBox ID="chkIs_FollowUp" runat="server"></asp:CheckBox>
                                                                                                                        </ItemTemplate>
                                                                                                                    </asp:TemplateField>
                                                                                                                    <asp:TemplateField HeaderText="Scanned Reference">
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:LinkButton ID="lnkScannedReference" runat="server" Text="View">
                                                                                                                            </asp:LinkButton>
                                                                                                                        </ItemTemplate>
                                                                                                                    </asp:TemplateField>
                                                                                                                </Columns>
                                                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                                                                <RowStyle HorizontalAlign="Center" />
                                                                                                            </asp:GridView>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </asp:Panel>
                                                                                        </div>
                                                                                    </div>
                                                                                </ContentTemplate>
                                                                            </cc1:TabPanel>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <cc1:TabPanel ID="TabAssetDetails" runat="server" BackColor="Red" CssClass="tabpan">
                                                                                <HeaderTemplate>
                                                                                    Asset Details
                                                                                </HeaderTemplate>
                                                                                <ContentTemplate>
                                                                                    <div class="row">
                                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                            <asp:UpdatePanel ID="updAsset" runat="server">
                                                                                                <ContentTemplate>
                                                                                                    <div class="row">
                                                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                                            <div class="gird">
                                                                                                                <asp:GridView ID="gvAssetDetails" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvAssetDetails_RowDeleting"
                                                                                                                    OnRowDataBound="gvAssetDetails_RowDataBound" Width="100%">
                                                                                                                    <Columns>
                                                                                                                        <asp:TemplateField HeaderText="SlNo">
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:LinkButton ID="lnkAssetSerialNo" runat="server" Text='<%#Bind("SlNo") %>' Style="text-align: right;"></asp:LinkButton>
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:BoundField DataField="Asset_Code" HeaderText="Asset Code" />
                                                                                                                        <asp:BoundField DataField="Noof_Units" HeaderText="Unit Count" ItemStyle-HorizontalAlign="Right" />
                                                                                                                        <asp:BoundField DataField="Unit_Value" HeaderText="Unit Value" ItemStyle-HorizontalAlign="Right" />
                                                                                                                        <asp:BoundField DataField="Finance_Amount" HeaderText="Finance Amount" ItemStyle-HorizontalAlign="Right" />

                                                                                                                        <asp:BoundField DataField="Engine_No" HeaderText="Engine No" ItemStyle-HorizontalAlign="Right" />
                                                                                                                        <asp:BoundField DataField="Chasis_No" HeaderText="Chasis No" ItemStyle-HorizontalAlign="Right" />
                                                                                                                        <asp:BoundField DataField="Date_of_Reg" HeaderText="Date of Registration" ItemStyle-HorizontalAlign="Right" />
                                                                                                                        <asp:BoundField DataField="Reg_No" HeaderText="Registration No" ItemStyle-HorizontalAlign="Right" />
                                                                                                                        <asp:BoundField DataField="Reg_No2" HeaderText="Registration No" ItemStyle-HorizontalAlign="Right" />
                                                                                                                        <asp:BoundField DataField="Reg_Expiry_Date" HeaderText="Registration Expiry Date" ItemStyle-HorizontalAlign="Right" />
                                                                                                                        <asp:BoundField DataField="ManuFactoring_Year" HeaderText="Manufactoring Year" ItemStyle-HorizontalAlign="Right" />

                                                                                                                        <asp:BoundField DataField="ast_discount" HeaderText="ast_discount" Visible="false" />
                                                                                                                        <asp:TemplateField HeaderText="Proforma">
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:LinkButton ID="lnkView" CausesValidation="false" runat="server" Text="View"></asp:LinkButton>
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField HeaderText="">
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:LinkButton ID="lnRemove" CausesValidation="false" runat="server" CommandName="Delete"
                                                                                                                                    Text="Remove"></asp:LinkButton>
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:TemplateField HeaderText="ProformaId" Visible="false">
                                                                                                                            <ItemTemplate>
                                                                                                                                <asp:Label ID="lblProformaId" runat="server" Text='<%#Bind("Proforma_Id") %>'></asp:Label>
                                                                                                                            </ItemTemplate>
                                                                                                                        </asp:TemplateField>
                                                                                                                        <asp:BoundField DataField="Lease_Asset_No" HeaderText="Lease Asset No" ItemStyle-HorizontalAlign="Right" />
                                                                                                                    </Columns>
                                                                                                                </asp:GridView>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </ContentTemplate>
                                                                                            </asp:UpdatePanel>
                                                                                        </div>
                                                                                    </div>
                                                                                </ContentTemplate>
                                                                            </cc1:TabPanel>
                                                                        </div>
                                                                    </div>
                                                                </cc1:TabContainer>
                                                            </div>
                                                        </div>
                                                        <div align="center">
                                                            <button class="css_btn_enabled" id="btnAddAsset" causesvalidation="false" runat="server" validationgroup="tcAsset"
                                                                type="button">
                                                                <i class="fa fa-plus-square-o" aria-hidden="true"></i>&emsp;<u></u>Add Asset
                                                            </button>
                                                            <div id="Div16" style="overflow: auto; text-align: center">
                                                                <button class="css_btn_enabled" id="btnConfigure" causesvalidation="false" runat="server" onserverclick="btnConfigure_Click"
                                                                    type="button">
                                                                    <i class="fa fa-podcast" aria-hidden="true"></i>&emsp;<u></u>Configure
                                                                </button>
                                                                <button class="css_btn_enabled" id="btnPrint" causesvalidation="false" runat="server"
                                                                    type="button" enabled="False">
                                                                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u></u>Print
                                                                </button>
                                                            </div>
                                                        </div>



                                                        <br />
                                                    </ContentTemplate>
                                                    <%-- <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnApplicationReferenceNo" />
                                                    </Triggers>--%>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </div>
                                </div>
                                <cc1:TabPanel runat="server" ID="TabOfferTerms" Visible="false" HeaderText="TabOfferTerms" CssClass="tabpan"
                                    BackColor="Red" Width="98%">
                                    <HeaderTemplate>
                                        Offer Terms
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:UpdatePanel ID="UpdTabOfferTerms" runat="server">
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div id="tbdivRoiRules" runat="server" width="99%" border="0">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <asp:Panel ID="divRoiRules" runat="server" CssClass="accordionHeader" Width="98.5%">
                                                                                <div style="float: left;">
                                                                                    ROI/Payment Rule Card details
                                                                                </div>
                                                                                <div style="float: left; margin-left: 20px;">
                                                                                    <asp:Label ID="lblDetails" runat="server">(Show Details...)</asp:Label>
                                                                                </div>
                                                                                <div style="float: right; vertical-align: middle;">
                                                                                    <asp:ImageButton ID="imgDetails" runat="server" ImageUrl="~/Images/expand_blue.jpg"
                                                                                        AlternateText="(Show Details...)" />
                                                                                </div>
                                                                            </asp:Panel>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <asp:Panel ID="divROIRuleInfo" CssClass="stylePanel" runat="server" Width="100%">
                                                                                <div class="row">
                                                                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                                        <div class="md-input">
                                                                                            <asp:DropDownList ID="ddlROIRuleList" runat="server" OnSelectedIndexChanged="ddlROIRuleList_SelectedIndexChanged"
                                                                                                AutoPostBack="True" class="md-form-control form-control">
                                                                                            </asp:DropDownList>
                                                                                            <div class="validation_msg_box">
                                                                                                <asp:RequiredFieldValidator ID="rfvddlROIRuleList" runat="server" ControlToValidate="ddlROIRuleList"
                                                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" InitialValue="0"
                                                                                                    ValidationGroup="Offer Terms" ErrorMessage="Select a ROI Rule"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <label>
                                                                                                <asp:Label ID="lblROIRuleList" runat="server" CssClass="styleReqFieldLabel" Text="ROI Rule"></asp:Label>
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>


                                                                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                                        <div class="md-input">
                                                                                            <asp:DropDownList ID="ddlPaymentRuleList" runat="server" OnSelectedIndexChanged="ddlPaymentRuleList_SelectedIndexChanged"
                                                                                                AutoPostBack="True" class="md-form-control form-control">
                                                                                            </asp:DropDownList>
                                                                                            <div class="validation_msg_box">
                                                                                                <asp:RequiredFieldValidator ID="rfvddlPaymentRuleList" runat="server" ControlToValidate="ddlPaymentRuleList"
                                                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" InitialValue="0"
                                                                                                    ValidationGroup="Offer Terms" ErrorMessage="Select a Payment Rule"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <label>
                                                                                                <asp:Label ID="lblPaymentRuleList" runat="server" CssClass="styleReqFieldLabel" Text="Payment Rule"></asp:Label>
                                                                                            </label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                        <asp:Panel ID="Panel9" runat="server" GroupingText="ROI/Payment Rule Card details"
                                                                                            CssClass="stylePanel" Width="99%">
                                                                                            <div class="row">
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:TextBox ID="txt_Model_Description" runat="server" ReadOnly="True"
                                                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblModel_Description" runat="server" CssClass="styleDisplayLabel"
                                                                                                                Text="Model Description"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblModel_Description" runat="server"></tr>
                                                                                                <%-- <td id="Td3" class="styleFieldLabel" runat="server"></td>--%>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:DropDownList ID="ddl_Rate_Type" runat="server"
                                                                                                            class="md-form-control form-control">
                                                                                                        </asp:DropDownList>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblRate_Type" runat="server" CssClass="styleDisplayLabel" Text="Rate Type"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <%--  <td id="Td4" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                <tr id="tr_lblRate_Type" runat="server"></tr>
                                                                                                <%--<td id="Td5" class="styleFieldLabel" runat="server"></td>
                                                                                                <td id="Td6" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:TextBox ID="txt_ROI_Rule_Number" runat="server" ReadOnly="True"
                                                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblROI_Rule_Number" runat="server" CssClass="styleDisplayLabel" Text="ROI Rule Number"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblROI_Rule_Number" runat="server">
                                                                                                    <%--  <td id="Td7" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td8" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:DropDownList ID="ddl_Return_Pattern" runat="server"
                                                                                                            class="md-form-control form-control">
                                                                                                        </asp:DropDownList>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblReturn_Pattern" runat="server" CssClass="styleDisplayLabel" Text="Return Pattern"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblReturn_Pattern" runat="server">
                                                                                                    <%-- <td id="Td9" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td10" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:DropDownList ID="ddl_Time_Value" runat="server" onchange="FunRestIrr();" AutoPostBack="true"
                                                                                                            OnSelectedIndexChanged="ddl_Time_Value_SelectedIndexChanged" class="md-form-control form-control">
                                                                                                        </asp:DropDownList>
                                                                                                        <div class="validation_msg_box">
                                                                                                            <asp:RequiredFieldValidator ID="rfvTimeValue" runat="server" ControlToValidate="ddl_Time_Value"
                                                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select a time Value from the list"
                                                                                                                InitialValue="-1" SetFocusOnError="True" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>
                                                                                                        </div>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblTime_Value" runat="server" CssClass="styleDisplayLabel" Text="Time Value"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblTime_Value" runat="server">
                                                                                                    <%-- <td id="Td11" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td12" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:DropDownList ID="ddl_Frequency" runat="server" onchange="FunRestIrr();" class="md-form-control form-control">
                                                                                                        </asp:DropDownList>
                                                                                                        <div class="validation_msg_box">
                                                                                                            <asp:RequiredFieldValidator ID="rfvFrequency" runat="server" ControlToValidate="ddl_Frequency"
                                                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select a frequency from the list"
                                                                                                                InitialValue="-1" SetFocusOnError="True" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>
                                                                                                        </div>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblFrequency" runat="server" CssClass="styleDisplayLabel" Text="Frequency"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblFrequency" runat="server">
                                                                                                    <%--<td id="Td13" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td14" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:DropDownList ID="ddl_Repayment_Mode" runat="server" class="md-form-control form-control">
                                                                                                        </asp:DropDownList>

                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblRepayment_Mode" runat="server" CssClass="styleDisplayLabel" Text="Repayment Mode"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblRepayment_Mode" runat="server">
                                                                                                    <%-- <td id="Td15" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td16" class="styleFieldAlign" runat="server"> </td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:TextBox ID="txtRate" runat="server" Style="text-align: right;"
                                                                                                            onchange="FunRestIrr();" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                        <div class="validation_msg_box">
                                                                                                            <asp:RequiredFieldValidator ID="rfvRate" runat="server" ControlToValidate="txtRate"
                                                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Rate" SetFocusOnError="True"
                                                                                                                ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>
                                                                                                        </div>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblRate" runat="server" CssClass="styleDisplayLabel" Text="Rate"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblRate" runat="server">
                                                                                                    <%--<td id="Td17" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td18" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:DropDownList ID="ddl_IRR_Rest" runat="server"
                                                                                                            class="md-form-control form-control">
                                                                                                        </asp:DropDownList>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblIRR_Rest" runat="server" CssClass="styleDisplayLabel" Text="IRR Rest"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblIRR_Rest" runat="server">
                                                                                                    <%--  <td id="Td19" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td20" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:DropDownList ID="ddl_Interest_Calculation" runat="server"
                                                                                                            class="md-form-control form-control">
                                                                                                        </asp:DropDownList>

                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblInterest_Calculation" runat="server" CssClass="styleDisplayLabel"
                                                                                                                Text="Interest Calculation"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblInterest_Calculation" runat="server">
                                                                                                    <%--<td id="Td21" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td22" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:DropDownList ID="ddl_Interest_Levy" runat="server"
                                                                                                            class="md-form-control form-control">
                                                                                                        </asp:DropDownList>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblInterest_Levy" runat="server" CssClass="styleDisplayLabel" Text="Interest Levy"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblInterest_Levy" runat="server">
                                                                                                    <%--  <td id="Td23" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td24" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:TextBox ID="txt_Recovery_Pattern_Year1" runat="server" Style="text-align: right;"
                                                                                                            ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblRecovery_Pattern_Year1" runat="server" CssClass="styleDisplayLabel"
                                                                                                                Text="Recovery Pattern Year1"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblRecovery_Pattern_Year1" runat="server">
                                                                                                    <%--   <td id="Td25" class="styleFieldLabel" runat="server">
                                                                                                        
                                                                                                    </td>
                                                                                                    <td id="Td26" class="styleFieldAlign" runat="server">
                                                                                                        
                                                                                                    </td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:TextBox ID="txt_Recovery_Pattern_Year2" runat="server" Style="text-align: right;"
                                                                                                            ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblRecovery_Pattern_Year2" runat="server" CssClass="styleDisplayLabel"
                                                                                                                Text="Recovery Pattern Year2"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblRecovery_Pattern_Year2" runat="server">
                                                                                                    <%--<td id="Td27" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td28" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:TextBox ID="txt_Recovery_Pattern_Year3" runat="server" Style="text-align: right;"
                                                                                                            ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblRecovery_Pattern_Year3" runat="server" CssClass="styleDisplayLabel"
                                                                                                                Text="Recovery Pattern Year3"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblRecovery_Pattern_Year3" runat="server">
                                                                                                    <%-- <td id="Td29" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td30" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:TextBox ID="txt_Recovery_Pattern_Rest" runat="server" Style="text-align: right;"
                                                                                                            ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblRecovery_Pattern_Rest" runat="server" CssClass="styleDisplayLabel"
                                                                                                                Text="Recovery Pattern Rest"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblRecovery_Pattern_Rest" runat="server">
                                                                                                    <%--<td id="Td31" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td32" class="styleFieldAlign" runat="server">
                                                                                                    </td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:DropDownList ID="ddl_Insurance" runat="server" onchange="FunRestIrr();"
                                                                                                            class="md-form-control form-control">
                                                                                                        </asp:DropDownList>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblInsurance" runat="server" CssClass="styleDisplayLabel" Text="Insurance"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblInsurance" runat="server">
                                                                                                    <%-- <td id="Td33" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td34" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:CheckBox ID="chk_lblResidual_Value" runat="server" />
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>

                                                                                                        <asp:Label ID="lblResidual_Value" runat="server" CssClass="styleDisplayLabel" Text="Residual Value"></asp:Label>

                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblResidual_Value" runat="server">
                                                                                                    <%--  <td id="Td35" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td36" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:CheckBox ID="chk_lblMargin" runat="server" />
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <asp:Label ID="lblMargin" runat="server" CssClass="styleDisplayLabel" Text="Margin"></asp:Label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblMargin" runat="server">
                                                                                                    <%--<td id="Td37" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td38" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                </tr>
                                                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                                    <div class="md-input">
                                                                                                        <asp:TextBox ID="txt_Margin_Percentage" runat="server" OnTextChanged="txt_Margin_Percentage_TextChanged"
                                                                                                            AutoPostBack="true" Style="text-align: right;" onchange="FunRestIrr();"
                                                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                        <div class="validation_msg_box">
                                                                                                            <asp:RequiredFieldValidator ID="rfvMarginPercent" runat="server" ControlToValidate="txt_Margin_Percentage"
                                                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Margin Percentage"
                                                                                                                SetFocusOnError="True" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>
                                                                                                        </div>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <label>
                                                                                                            <asp:Label ID="lblMargin_Percentage" runat="server" CssClass="styleDisplayLabel"
                                                                                                                Text="Margin Percentage"></asp:Label>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <tr id="tr_lblMargin_Percentage" runat="server">
                                                                                                    <%-- <td id="Td39" class="styleFieldLabel" runat="server"></td>
                                                                                                    <td id="Td40" class="styleFieldAlign" runat="server"></td>--%>
                                                                                                </tr>
                                                                                            </div>
                                                                                        </asp:Panel>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                        <asp:Panel runat="server" ID="Panel4" CssClass="stylePanel" GroupingText="Payment Rule"
                                                                                            Width="99%">
                                                                                            <div class="row">
                                                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                                    <div class="gird">
                                                                                                        <asp:GridView ID="gvPaymentRuleDetails" runat="server" Width="100%">
                                                                                                        </asp:GridView>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </asp:Panel>
                                                                                    </div>
                                                                                </div>
                                                                            </asp:Panel>
                                                                        </div>
                                                                    </div>
                                                                    <cc1:CollapsiblePanelExtender ID="cpeDemo" runat="Server" TargetControlID="divROIRuleInfo"
                                                                        ExpandControlID="divRoiRules" CollapseControlID="divRoiRules" Collapsed="True"
                                                                        TextLabelID="lblDetails" ImageControlID="imgDetails" ExpandedText="(Hide Details...)"
                                                                        CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                                                                        CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="tbCashFlow" runat="server" width="100%">
                                                            <div class="row">
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtResidualValue_Cashflow" runat="server" Style="text-align: right;"
                                                                            OnTextChanged="txtResidualValue_Cashflow_TextChanged" AutoPostBack="true"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtResidualPercentage" runat="server" TargetControlID="txtResidualValue_Cashflow"
                                                                            FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvResidualValue" runat="server" ControlToValidate="txtResidualValue_Cashflow"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Offer Terms" SetFocusOnError="True"
                                                                                ErrorMessage="Enter the Residual % or Amount"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblResidualValue_Cashflow" runat="server" CssClass="styleDisplayLabel"
                                                                                Text="Residual%"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtResidualAmt_Cashflow" runat="server" MaxLength="7" Style="text-align: right;"
                                                                            OnTextChanged="txtResidualAmt_Cashflow_TextChanged" AutoPostBack="true"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FtexResidualAmt_Cashflow" runat="server" TargetControlID="txtResidualAmt_Cashflow"
                                                                            FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblResidualAmt_Cashflow" runat="server" CssClass="styleDisplayLabel"
                                                                                Text="Amount"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMarginMoneyPer_Cashflow" runat="server" Style="text-align: right;"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtMarginPercentage" runat="server" TargetControlID="txtMarginMoneyPer_Cashflow"
                                                                            FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblMarginMoneyPer_Cashflow" runat="server" CssClass="styleDisplayLabel"
                                                                                Text="Margin%"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMarginMoneyAmount_Cashflow" runat="server" MaxLength="7" Style="text-align: right;"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FtexMarginMoneyAmount_Cashflow" runat="server" TargetControlID="txtMarginMoneyAmount_Cashflow"
                                                                            FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblMarginMoneyAmount_Cashflow" runat="server" CssClass="styleDisplayLabel"
                                                                                Text="Amount"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtFBDate" runat="server" MaxLength="2" Style="text-align: right;" onchange="FunRestIrr();"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtFBDate" runat="server" TargetControlID="txtFBDate"
                                                                            FilterType="Numbers" Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvFBDate" runat="server" ControlToValidate="txtFBDate"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Offer Terms" SetFocusOnError="True"
                                                                                ErrorMessage="Enter the FB Day"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <asp:RangeValidator ID="rvtxtFBDate" runat="server" ErrorMessage="FB Day should be between 1 and 31"
                                                                            ControlToValidate="txtFBDate" MinimumValue="1" Type="Integer" MaximumValue="31"
                                                                            Display="None" ValidationGroup="Offer Terms"></asp:RangeValidator>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblFBDate" CssClass="styleDisplayLabel" Text="FB Day"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="panInflow" runat="server" CssClass="stylePanel" GroupingText="Cash Inflow details"
                                                                    Width="100%">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="gird">
                                                                                <asp:GridView ID="gvInflow" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvInflow_RowDeleting"
                                                                                    ShowFooter="True" OnRowCreated="gvInflow_RowCreated" Width="100%">
                                                                                    <Columns>
                                                                                        <asp:TemplateField HeaderText="Date" ItemStyle-Width="12%" FooterStyle-Width="12%">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblDate_GridInflow" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"Date")).ToString(strDateFormat) %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:TextBox ID="txtDate_GridInflow" runat="server" Width="95%">
                                                                                                </asp:TextBox>
                                                                                                <cc1:CalendarExtender ID="CalendarExtenderSD_InflowDate" runat="server" Enabled="True"
                                                                                                    TargetControlID="txtDate_GridInflow" OnClientDateSelectionChanged="checkApplicationDate">
                                                                                                </cc1:CalendarExtender>
                                                                                                <asp:RequiredFieldValidator ID="rfvtxtDate_GridInflow" runat="server" ControlToValidate="txtDate_GridInflow"
                                                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                                                    ErrorMessage="Enter the Date in Inflow"></asp:RequiredFieldValidator>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Cash flow Id" Visible="False">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblInflowid" runat="server" Text='<%# Bind("CashInFlowID") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Cash flow Description" ItemStyle-Width="25%" FooterStyle-Width="25%">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblInflowDesc" runat="server" Text='<%# Bind("CashInFlow") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:DropDownList ID="ddlInflowDesc" runat="server" Width="99%">
                                                                                                </asp:DropDownList>
                                                                                                <asp:RequiredFieldValidator ID="rfvddlInflowDesc" runat="server" ControlToValidate="ddlInflowDesc"
                                                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                                                    InitialValue="-1" ErrorMessage="Select a Cashflow description in Inflow"></asp:RequiredFieldValidator>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="In flow from" ItemStyle-Width="13%" FooterStyle-Width="13%">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblInflowFrom" runat="server" Text='<%# Bind("InflowFrom") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:DropDownList ID="ddlEntityName_InFlowFrom" runat="server" AutoPostBack="True"
                                                                                                    Width="99%" OnSelectedIndexChanged="ddlEntityName_InFlowFrom_SelectedIndexChanged">
                                                                                                </asp:DropDownList>
                                                                                                <asp:RequiredFieldValidator ID="rfvddlEntityName_InFlowFrom" runat="server" ControlToValidate="ddlEntityName_InFlowFrom"
                                                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                                                    InitialValue="-1" ErrorMessage="Select a Inflow from"></asp:RequiredFieldValidator>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="In flow from ID" Visible="False">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblInflowFromId" runat="server" Text='<%# Bind("InflowFromID") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Entity ID" Visible="False">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblEntityID_InFlow" runat="server" Text='<%# Bind("EntityID") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Customer Name" ItemStyle-Width="35%" FooterStyle-Width="35%">
                                                                                            <HeaderTemplate>
                                                                                                <asp:Label ID="lblHeading" runat="server" Text="Customer/Entity Name"></asp:Label>
                                                                                            </HeaderTemplate>
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblEntityName_InFlow" runat="server" Text='<%# Bind("Entity") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <UC3:AutoSugg ID="ddlEntityName_InFlow" runat="server" ServiceMethod="GetVendors"
                                                                                                    ErrorMessage="Select a Customer/Entity Name in Inflow" ReadOnly="true" Width="250px"
                                                                                                    ValidationGroup="Inflow" IsMandatory="true" />
                                                                                                <%-- <asp:DropDownList ID="ddlEntityName_InFlow" runat="server" Width="99%">
                                                                                            </asp:DropDownList>
                                                                                            <asp:RequiredFieldValidator ID="rfvddlEntityName_InFlow" runat="server" ControlToValidate="ddlEntityName_InFlow"
                                                                                                CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                                                InitialValue="0" ErrorMessage="Select a Customer/Entity name in Inflow"></asp:RequiredFieldValidator>--%>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Amount" ItemStyle-Width="11%" FooterStyle-Width="11%">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblAmount_Inflow" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:TextBox ID="txtAmount_Inflow" runat="server" Width="94%" MaxLength="10" Style="text-align: right">
                                                                                                </asp:TextBox>
                                                                                                <cc1:FilteredTextBoxExtender ID="ftextExtxtAmount_Inflow" runat="server" FilterType="Numbers"
                                                                                                    TargetControlID="txtAmount_Inflow">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                <asp:RequiredFieldValidator ID="rfvtxtAmount_Inflow" runat="server" ControlToValidate="txtAmount_Inflow"
                                                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                                                    ErrorMessage="Enter the Inflow amount"></asp:RequiredFieldValidator>
                                                                                            </FooterTemplate>
                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField ItemStyle-Width="15%" FooterStyle-Width="15%">
                                                                                            <ItemTemplate>
                                                                                                <asp:LinkButton ID="lnRemove" runat="server" CausesValidation="false" CommandName="Delete"
                                                                                                    Text="Remove"></asp:LinkButton>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:Button ID="btnAdd" runat="server" Text="Add" CausesValidation="true" ValidationGroup="Inflow"
                                                                                                    OnClick="CashInflow_AddRow_OnClick" CssClass="styleGridShortButton" />
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <%-- Columns to be added for IRR Calculation--%>
                                                                                        <asp:TemplateField Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblAccountingIRR" runat="server" Text='<%# Bind("Accounting_IRR") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblBusinessIRR" runat="server" Text='<%# Bind("Business_IRR") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblComapnyIRR" runat="server" Text='<%# Bind("Company_IRR") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblCashFlow_Flag_ID" runat="server" Text='<%# Bind("CashFlow_Flag_ID") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <%-- Columns to be added for IRR Calculation Ends--%>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel runat="server" ID="div5" CssClass="stylePanel" GroupingText="Cash Outflow details"
                                                                    Width="100%">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="gird">
                                                                                <asp:GridView ID="gvOutFlow" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvOutFlow_RowDeleting"
                                                                                    ShowFooter="True" OnRowCreated="gvOutFlow_RowCreated" Width="100%">
                                                                                    <Columns>
                                                                                        <asp:TemplateField HeaderText="Date" ItemStyle-Width="12%" FooterStyle-Width="12%">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblDate_GridOutflow" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"Date")).ToString(strDateFormat) %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:TextBox ID="txtDate_GridOutflow" runat="server" Width="95%">
                                                                                                </asp:TextBox>
                                                                                                <cc1:CalendarExtender ID="CalendarExtenderSD_OutflowDate" runat="server" Enabled="True"
                                                                                                    TargetControlID="txtDate_GridOutflow" OnClientDateSelectionChanged="checkOutflowApplicationDate">
                                                                                                </cc1:CalendarExtender>
                                                                                                <asp:RequiredFieldValidator ID="rfvtxtDate_GridOutflow" runat="server" ControlToValidate="txtDate_GridOutflow"
                                                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Outflow" SetFocusOnError="True"
                                                                                                    ErrorMessage="Enter the Outflow Date"></asp:RequiredFieldValidator>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Cash flow Id" Visible="False">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblOutflowid" runat="server" Text='<%# Bind("CashOutFlowID") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Cash flow Description" ItemStyle-Width="25%" FooterStyle-Width="25%">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblOutflowDesc" runat="server" Text='<%# Bind("CashOutFlow") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:DropDownList ID="ddlOutflowDesc" runat="server" Width="99%">
                                                                                                </asp:DropDownList>
                                                                                                <asp:RequiredFieldValidator ID="rfvddlOutflowDesc" runat="server" ControlToValidate="ddlOutflowDesc"
                                                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Outflow" SetFocusOnError="True"
                                                                                                    InitialValue="-1" ErrorMessage="Select a Cash Outflow"></asp:RequiredFieldValidator>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Payement to ID" Visible="False">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblPayementToId" runat="server" Text='<%# Bind("OutflowFromID") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Payment to" ItemStyle-Width="13%" FooterStyle-Width="13%">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblPaymentto" runat="server" Text='<%# Bind("OutflowFrom") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:DropDownList ID="ddlPaymentto_OutFlow" Width="99%" runat="server" AutoPostBack="True"
                                                                                                    OnSelectedIndexChanged="ddlPaymentto_OutFlow_SelectedIndexChanged">
                                                                                                </asp:DropDownList>
                                                                                                <asp:RequiredFieldValidator ID="rfvddlPaymentto_OutFlow" runat="server" ControlToValidate="ddlPaymentto_OutFlow"
                                                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Outflow" SetFocusOnError="True"
                                                                                                    InitialValue="-1" ErrorMessage="Select Payment to"></asp:RequiredFieldValidator>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Entity ID" Visible="False">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblEntityID_OutFlow" runat="server" Text='<%# Bind("EntityID") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Entity Name" ItemStyle-Width="35%" FooterStyle-Width="35%">
                                                                                            <HeaderTemplate>
                                                                                                <asp:Label ID="lblHeading" runat="server" Text="Customer/Entity Name"></asp:Label>
                                                                                            </HeaderTemplate>
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblEntityName_OutFlow" runat="server" Text='<%# Bind("Entity") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <UC3:AutoSugg ID="ddlEntityName_OutFlow" runat="server" ServiceMethod="GetVendors"
                                                                                                    ErrorMessage="Select a Customer/Entity Name in Outflow" ReadOnly="true" Width="250px"
                                                                                                    ValidationGroup="Outflow" IsMandatory="true" />
                                                                                                <%-- <asp:DropDownList ID="ddlEntityName_OutFlow" runat="server" Width="99%">
                                                                                            </asp:DropDownList>
                                                                                            <asp:RequiredFieldValidator ID="rfvddlEntityName_OutFlow" runat="server" ControlToValidate="ddlEntityName_OutFlow"
                                                                                                CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Outflow" SetFocusOnError="True"
                                                                                                InitialValue="0" ErrorMessage="Select a Customer/Entity Name"></asp:RequiredFieldValidator>--%>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Amount" ItemStyle-Width="11%" FooterStyle-Width="11%">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblAmount_Outflow" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:TextBox ID="txtAmount_Outflow" runat="server" Width="94%" MaxLength="10" Style="text-align: right">
                                                                                                </asp:TextBox>
                                                                                                <cc1:FilteredTextBoxExtender ID="ftxtAmount_Outflow" runat="server" FilterType="Numbers,Custom"
                                                                                                    TargetControlID="txtAmount_Outflow" ValidChars=".">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                <asp:RequiredFieldValidator ID="rfvtxtAmount_Outflow" runat="server" ControlToValidate="txtAmount_Outflow"
                                                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Outflow" SetFocusOnError="True"
                                                                                                    ErrorMessage="Enter the Outflow amount"></asp:RequiredFieldValidator>
                                                                                            </FooterTemplate>
                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField ItemStyle-Width="15%" FooterStyle-Width="15%">
                                                                                            <ItemTemplate>
                                                                                                <asp:LinkButton ID="lnRemove" runat="server" CausesValidation="false" CommandName="Delete"
                                                                                                    Text="Remove"></asp:LinkButton>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:Button ID="btnAddOut" runat="server" Text="Add" CausesValidation="true" ValidationGroup="Outflow"
                                                                                                    OnClick="CashOutflow_AddRow_OnClick" CssClass="styleGridShortButton" />
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <%-- Columns to be added for IRR Calculation--%>
                                                                                        <asp:TemplateField Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblAccountingIRR" runat="server" Text='<%# Bind("Accounting_IRR") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblBusinessIRR" runat="server" Text='<%# Bind("Business_IRR") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblComapnyIRR" runat="server" Text='<%# Bind("Company_IRR") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblCashFlow_Flag_ID" runat="server" Text='<%# Bind("CashFlow_Flag_ID") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <%-- Columns to be added for IRR Calculation Ends--%>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Label ID="lblTotal" runat="server" Text="Total Out flow Amount :" Font-Bold="True"></asp:Label>
                                                                <asp:Label ID="lblTotalOutFlowAmount" runat="server" Font-Bold="True" Text="0"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div id="tbpnlFinanceDetailsFWC" runat="server" width="100%">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <asp:Panel ID="pnlFinanceDetailsFWC" runat="server" GroupingText="Finance Details" CssClass="stylePanel"
                                                                        Width="99%">
                                                                        <div class="row">
                                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtDebtPurchaseLimitFWC" ToolTip="Debt Purchase Limit" runat="server"
                                                                                        OnSelectedIndexChanged="ddlContType_SelectedIndexChanged" AutoPostBack="true"
                                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvDebtPurchaseLimit" runat="server" ErrorMessage="Select the Debt Purchase Limit"
                                                                                            SetFocusOnError="true" ControlToValidate="txtDebtPurchaseLimitFWC" InitialValue="0" ValidationGroup="Main Page"
                                                                                            Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label ID="lblDebtPurchaseLimit" CssClass="styleReqFieldLabel" runat="server" ToolTip="Debt Purchase Limit" Text="Debt Purchase Limit"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtMarginFWC" ToolTip="Margint" runat="server" OnSelectedIndexChanged="ddlContType_SelectedIndexChanged"
                                                                                        AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true">
                                                                                    </asp:TextBox>

                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvMargint" runat="server" ErrorMessage="Enter the Margin"
                                                                                            SetFocusOnError="true" ControlToValidate="txtMarginFWC" InitialValue="0" ValidationGroup="Main Page"
                                                                                            Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label ID="lblMarginFWC" CssClass="styleReqFieldLabel" runat="server" ToolTip="Margin" Text="Margin"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtPrePaymentLimitFWC" ToolTip="Margint" runat="server" OnSelectedIndexChanged="ddlContType_SelectedIndexChanged" AutoPostBack="true"
                                                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                                                    </asp:TextBox>

                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvtxtPrePaymentLimitFWC" runat="server" ErrorMessage="Enter the Margin"
                                                                                            SetFocusOnError="true" ControlToValidate="txtPrePaymentLimitFWC" InitialValue="0" ValidationGroup="Main Page"
                                                                                            Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label ID="lblPrePaymentLimit" CssClass="styleReqFieldLabel" runat="server" ToolTip="Pre Payment Limit" Text="Pre Payment Limit"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtInvoiceCapValue" ToolTip="Debt Purchase Limit" runat="server"
                                                                                        OnSelectedIndexChanged="ddlContType_SelectedIndexChanged" AutoPostBack="true"
                                                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                                                    </asp:TextBox>

                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Select the Debt Purchase Limit"
                                                                                            SetFocusOnError="true" ControlToValidate="txtDebtPurchaseLimitFWC" InitialValue="0" ValidationGroup="Main Page"
                                                                                            Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label ID="lblInvoiceCapValue" CssClass="styleReqFieldLabel" runat="server" ToolTip="Invoice Cap Value" Text="Invoice Cap Value"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtDiscountRateforLineofCredit" Style="text-align: right" ToolTip="Discount Rate for Line of Credit" runat="server"
                                                                                        OnSelectedIndexChanged="ddlContType_SelectedIndexChanged" AutoPostBack="true"
                                                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                                                    </asp:TextBox>

                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvDiscountRateforLineofCredit" runat="server" ErrorMessage="Select the Discount Rate for Line of Credit"
                                                                                            SetFocusOnError="true" ControlToValidate="txtDebtPurchaseLimitFWC" InitialValue="0" ValidationGroup="Main Page"
                                                                                            Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label ID="lblDiscountRateforLineofCredit" CssClass="styleReqFieldLabel" runat="server" ToolTip="Discount Rate for Line of Credit" Text="Discount Rate for Line of Credit"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtPenalRate" ToolTip="Penal Rate" runat="server"
                                                                                        OnSelectedIndexChanged="ddlContType_SelectedIndexChanged" AutoPostBack="true"
                                                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                                                    </asp:TextBox>

                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvPenalRate" runat="server" ErrorMessage="Select the Penal Rate"
                                                                                            SetFocusOnError="true" ControlToValidate="txtDebtPurchaseLimitFWC" InitialValue="0" ValidationGroup="Main Page"
                                                                                            Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label ID="lblPenalRate" CssClass="styleReqFieldLabel" runat="server" ToolTip="Penal Rate" Text="Penal Rate"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtCreditPeriodInDays" ToolTip="Penal Rate" runat="server"
                                                                                        OnSelectedIndexChanged="ddlContType_SelectedIndexChanged" AutoPostBack="true"
                                                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                                                    </asp:TextBox>

                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvCreditPeriodInDays" runat="server" ErrorMessage="Select the Credit Period In Days"
                                                                                            SetFocusOnError="true" ControlToValidate="txtCreditPeriodInDays" InitialValue="0" ValidationGroup="Main Page"
                                                                                            Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label ID="lblCreditPeriodInDays" CssClass="styleReqFieldLabel" runat="server" ToolTip="Credit Period In Days" Text="Credit Period In Days"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtGracePeriodInDays" ToolTip="Penal Rate" runat="server"
                                                                                        OnSelectedIndexChanged="ddlContType_SelectedIndexChanged" AutoPostBack="true"
                                                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                                                    </asp:TextBox>

                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvGracePeriodInDays" runat="server" ErrorMessage="Select the Grace Period In Days"
                                                                                            SetFocusOnError="true" ControlToValidate="txtCreditPeriodInDays" InitialValue="0" ValidationGroup="Main Page"
                                                                                            Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label ID="lblGracePeriodInDays" CssClass="styleReqFieldLabel" runat="server" ToolTip="Grace Period In Days" Text="Grace Period In Days"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtDisbuteGracePeriodInDays" ToolTip="Disbute Grace Period In Days" runat="server"
                                                                                        OnSelectedIndexChanged="ddlContType_SelectedIndexChanged" AutoPostBack="true"
                                                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                                                    </asp:TextBox>

                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvDisbuteGracePeriodInDays" runat="server" ErrorMessage="Select the Disbute Grace Period In Days"
                                                                                            SetFocusOnError="true" ControlToValidate="txtDisbuteGracePeriodInDays" InitialValue="0" ValidationGroup="Main Page"
                                                                                            Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label ID="lblDisbuteGracePeriodInDays" CssClass="styleReqFieldLabel" runat="server"
                                                                                            ToolTip="Disbute Grace Period In Days" Text="Disbute Grace Period In Days"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtResolutionPeriodinDays" ToolTip="Resolution Period in Days" runat="server"
                                                                                        OnSelectedIndexChanged="ddlContType_SelectedIndexChanged" AutoPostBack="true"
                                                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                                                    </asp:TextBox>

                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvResolutionPeriodinDays" runat="server" ErrorMessage="Select the Resolution Period in Days"
                                                                                            SetFocusOnError="true" ControlToValidate="txtDisbuteGracePeriodInDays" InitialValue="0" ValidationGroup="Main Page"
                                                                                            Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label ID="lblResolutionPeriodinDays" CssClass="styleReqFieldLabel" runat="server"
                                                                                            ToolTip="Resolution Period in Days" Text="Resolution Period in Days"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtRemarks" ToolTip="Remarks" TextMode="MultiLine" runat="server"
                                                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                                                    </asp:TextBox>

                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <label>
                                                                                        <asp:Label ID="lblRemarks" CssClass="styleReqFieldLabel" runat="server"
                                                                                            ToolTip="Remarks" Text="Remarks"></asp:Label>
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="tbpnlChargesFWC" runat="server" width="100%">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <asp:Panel ID="pnlChargesFWC" runat="server" HorizontalAlign="Left" ItemStyle-Width="2%" GroupingText="Other Charges" CssClass="stylePanel"
                                                                        Width="99%">
                                                                        <div class="row">
                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                <div class="gird">
                                                                                    <asp:GridView ID="gvFACCharges" runat="server" AutoGenerateColumns="False" EditRowStyle-CssClass="styleFooterInfo"
                                                                                        ShowFooter="True" OnRowDataBound="gvFACCharges_RowDataBound" Width="100%" OnRowDeleting="gvFACCharges_RowDeleting"
                                                                                        DataKeyNames="Sno">
                                                                                        <%-- <RowStyle HorizontalAlign="Left" Width="100%" />--%>
                                                                                        <Columns>
                                                                                            <asp:TemplateField HeaderText="Sl.No." ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Right">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="SerialNoHidden" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                                                    <asp:Label ID="lblSerialNo" runat="server" Visible="false" Text='<%# Bind("Sno") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Cash Inflow">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblCashInflow" runat="server" Text='<%# Bind("Cashinflow") %>'></asp:Label>
                                                                                                    <asp:Label ID="lblCashInflow_ID" runat="server" Text='<%# Bind("Cashflow_ID") %>'
                                                                                                        Visible="false"></asp:Label>
                                                                                                    <asp:Label ID="lblchargetypee" runat="server" Text='<%# Bind("chargetype") %>' Visible="false"></asp:Label>
                                                                                                    <%-- <asp:Label ID="cashflowlabel" runat="server" Visible="false" Text='<%# Bind("Cashflow_IDD") %>'></asp:Label>--%>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:DropDownList ID="ddlCashInflow" AutoPostBack="false" Width="100%" OnSelectedIndexChanged="ddlCashInflow_SelectedIndexChanged"
                                                                                                        runat="server" ToolTip="Cash Inflow" CssClass="md-form-control form-control login_form_content_input">
                                                                                                    </asp:DropDownList>
                                                                                                </FooterTemplate>
                                                                                                <FooterStyle HorizontalAlign="Left" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Charge Sequence">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblchargetypevalue" Text='<%# Bind("ChargeType") %>' Visible="false"
                                                                                                        runat="server">
                                                                                                    </asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:DropDownList ID="ddlChargeSequence" Width="100%" AutoPostBack="true" OnSelectedIndexChanged="ddlChargeType_SelectedIndexChanged"
                                                                                                        runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                                                        <asp:ListItem Value="0" Text="--Select--" Selected="True"></asp:ListItem>
                                                                                                        <asp:ListItem Value="1" Text="Monthly"></asp:ListItem>
                                                                                                        <asp:ListItem Value="2" Text="Daily"></asp:ListItem>
                                                                                                        <asp:ListItem Value="3" Text="Per Invoice"></asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </FooterTemplate>
                                                                                                <FooterStyle HorizontalAlign="Left" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Charge Type">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblchargetype" Text='<%# Bind("Charge") %> ' runat="server"></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:DropDownList ID="ddlChargeType" Width="100%" AutoPostBack="true" OnSelectedIndexChanged="ddlChargeType_SelectedIndexChanged"
                                                                                                        runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                                                    </asp:DropDownList>
                                                                                                </FooterTemplate>
                                                                                                <FooterStyle HorizontalAlign="Left" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Charge Amount">
                                                                                                <ItemTemplate>

                                                                                                    <asp:Label ID="lblChargeAmount" Visible="false"
                                                                                                        runat="server">
                                                                                                    </asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:TextBox ID="txtChargeAmount" Width="100%" AutoPostBack="true"
                                                                                                        runat="server" class="md-form-control form-control login_form_content_input requires_true">
                                                                                                    </asp:TextBox>
                                                                                                </FooterTemplate>
                                                                                                <FooterStyle HorizontalAlign="Left" />
                                                                                            </asp:TemplateField>


                                                                                            <asp:TemplateField HeaderText="Active" ItemStyle-HorizontalAlign="Center">
                                                                                                <ItemTemplate>
                                                                                                    <asp:CheckBox ID="chkActive" runat="server" Checked='<%#DataBinder.Eval(Container.DataItem, "Is_Active").ToString().ToUpper() == "TRUE"%>' />
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:CheckBox ID="chkActiveF" runat="server" ToolTip="Active" Checked="true" Enabled="false"></asp:CheckBox>
                                                                                                </FooterTemplate>
                                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete"
                                                                                                        OnClientClick="return confirm('Are you sure want to Delete this record?');" ToolTip="Delete">
                                                                                                    </asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:Button ID="btnAdd" runat="server" CommandName="Add" CssClass="grid_btn"
                                                                                                        OnClick="btnAdd_Click" Text="Add" ValidationGroup="Grid" ToolTip="Add" />
                                                                                                </FooterTemplate>
                                                                                                <FooterStyle HorizontalAlign="Center" Width="10%" />
                                                                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                                            </asp:TemplateField>
                                                                                        </Columns>
                                                                                        <EditRowStyle CssClass="styleFooterInfo" />
                                                                                    </asp:GridView>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        </tr>
                                                                    </asp:Panel>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="tbpnlDiscountRateforUtilizationFWC" runat="server" width="100%">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <asp:Panel ID="pnlDiscountRateforUtilizationFWC" runat="server" HorizontalAlign="Left" GroupingText="Discount Rate for Utilization" CssClass="stylePanel"
                                                                        Width="99%">
                                                                        <div class="row">
                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                <div class="gird">
                                                                                    <asp:GridView ID="grvDiscountRateforUtilization" runat="server" AutoGenerateColumns="False" EditRowStyle-CssClass="styleFooterInfo"
                                                                                        ShowFooter="True" OnRowDataBound="grvDiscountRateforUtilization_RowDataBound" Width="100%" OnRowDeleting="grvDiscountRateforUtilization_RowDeleting"
                                                                                        DataKeyNames="Sno">
                                                                                        <%-- <RowStyle HorizontalAlign="Left" Width="100%" />--%>
                                                                                        <Columns>
                                                                                            <asp:TemplateField HeaderText="Sl.No." ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Right">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="SerialNoHidden" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                                                    <asp:Label ID="lblSerialNo" runat="server" Visible="false" Text='<%# Bind("Sno") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Start Slab">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblStartSlab" runat="server" ToolTip="Start Slab" Text='<%# Bind("Start_Slab") %>' Visible="false"></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:TextBox ID="txtStartSlabF" Width="100%" AutoPostBack="true" OnSelectedIndexChanged="ddlCashInflow_SelectedIndexChanged"
                                                                                                        runat="server" ToolTip="Cash Inflow" class="md-form-control form-control login_form_content_input requires_true">
                                                                                                    </asp:TextBox>
                                                                                                </FooterTemplate>
                                                                                                <FooterStyle HorizontalAlign="Left" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="End Slab">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblEndSlab" Text='<%# Bind("End_Slab") %>' Visible="false"
                                                                                                        runat="server">
                                                                                                    </asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:TextBox ID="txtEndSlabF" Width="100%" AutoPostBack="true" OnSelectedIndexChanged="ddlChargeType_SelectedIndexChanged"
                                                                                                        runat="server" class="md-form-control form-control login_form_content_input requires_true">
                                                                                                    </asp:TextBox>
                                                                                                </FooterTemplate>
                                                                                                <FooterStyle HorizontalAlign="Left" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Disc.Rate">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblDiscRate" Text='<%# Bind("Discount_Rate") %>' runat="server"></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:TextBox ID="txtDiscRateF" Width="100%" AutoPostBack="true" OnSelectedIndexChanged="ddlChargeType_SelectedIndexChanged"
                                                                                                        runat="server" class="md-form-control form-control login_form_content_input requires_true">
                                                                                                    </asp:TextBox>
                                                                                                </FooterTemplate>
                                                                                                <FooterStyle HorizontalAlign="Left" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete"
                                                                                                        OnClientClick="return confirm('Are you sure want to Delete this record?');" ToolTip="Delete">
                                                                                                    </asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:Button ID="btnAdd" runat="server" CommandName="Add" CssClass="grid_btn"
                                                                                                        OnClick="btnAdd_Click" Text="Add" ValidationGroup="Grid" ToolTip="Add" />
                                                                                                </FooterTemplate>
                                                                                                <FooterStyle HorizontalAlign="Center" Width="10%" />
                                                                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                                            </asp:TemplateField>
                                                                                        </Columns>
                                                                                        <EditRowStyle CssClass="styleFooterInfo" />
                                                                                    </asp:GridView>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" ID="TabRepayment" Visible="false" HeaderText="TabRepayment" CssClass="tabpan"
                                    BackColor="Red" Width="98%">
                                    <HeaderTemplate>
                                        Repayment Details
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:UpdatePanel ID="upRepayment" runat="server">
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                                <asp:Panel ID="Panel11" runat="server" CssClass="stylePanel" GroupingText="Repayment Details"
                                                                    Width="99%">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <asp:Label runat="server" ID="lblTotalAmount" CssClass="styleDisplayLabel" Font-Bold="false"></asp:Label>

                                                                            <asp:Label ID="lblFrequency_Display" runat="server" CssClass="styleDisplayLabel"
                                                                                Font-Bold="false"></asp:Label>

                                                                            <asp:Label ID="lblMarginResidual" runat="server" CssClass="styleDisplayLabel" Font-Bold="false"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                                <asp:Panel ID="Panel10" runat="server" CssClass="stylePanel" GroupingText="Repayment Summary"
                                                                    Width="99%">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="gird">
                                                                                <asp:GridView ID="gvRepaymentSummary" runat="server" AutoGenerateColumns="false"
                                                                                    Width="100%">
                                                                                    <Columns>
                                                                                        <asp:BoundField DataField="CashFlow" HeaderText="Cash Flow Description" />
                                                                                        <asp:BoundField DataField="TotalPeriodInstall" HeaderText="Amount" ItemStyle-HorizontalAlign="Right" />
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="panIRR" runat="server" CssClass="stylePanel" GroupingText="IRR Details"
                                                                    Width="99%">
                                                                    <div class="row">
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtAccountIRR_Repay" runat="server" Style="text-align: right"
                                                                                    Font-Bold="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvAccountingIRR" runat="server" Display="Dynamic" ValidationGroup="Repayment Details"
                                                                                        ErrorMessage="Calculate Accounting IRR" ControlToValidate="txtAccountIRR_Repay"
                                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblAccountIRR_Repay" CssClass="styleReqFieldLabel"
                                                                                        Text="Accounting IRR" Font-Bold="true"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtBusinessIRR_Repay" runat="server" Style="text-align: right"
                                                                                    Font-Bold="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvBusinessIRR" runat="server" Display="Dynamic" ValidationGroup="Repayment Details"
                                                                                        ErrorMessage="Calculate Business IRR" ControlToValidate="txtBusinessIRR_Repay"
                                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblBusinessIRR_Repay" CssClass="styleReqFieldLabel"
                                                                                        Font-Bold="true" Text="Business IRR"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCompanyIRR_Repay" runat="server" Style="text-align: right"
                                                                                    Font-Bold="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvCompanyIRR" runat="server" Display="Dynamic" ValidationGroup="Repayment Details"
                                                                                        ErrorMessage="Calculate Company IRR" ControlToValidate="txtCompanyIRR_Repay"
                                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblCompanyIRR_Repay" CssClass="styleReqFieldLabel"
                                                                                        Font-Bold="true" Text="Company IRR"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel runat="server" ID="Panel2" CssClass="stylePanel" GroupingText="Repayment Details"
                                                                    Width="99%">
                                                                    <div id="div6" style="overflow: auto; width: 100%;" runat="server">
                                                                        <div class="row">
                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                <div class="gird">
                                                                                    <asp:GridView ID="gvRepaymentDetails" runat="server" AutoGenerateColumns="False"
                                                                                        ShowFooter="True" OnRowDeleting="gvRepaymentDetails_RowDeleting" OnRowDataBound="gvRepaymentDetails_RowDataBound"
                                                                                        OnRowCreated="gvRepaymentDetails_RowCreated" Width="100%">
                                                                                        <Columns>
                                                                                            <asp:BoundField DataField="slno" HeaderText="Sl.No" ItemStyle-HorizontalAlign="Center">
                                                                                                <FooterStyle Width="2%" />
                                                                                                <ItemStyle HorizontalAlign="Center" Width="2%" />
                                                                                            </asp:BoundField>
                                                                                            <asp:TemplateField HeaderText="Repayment CashFlow" ItemStyle-Width="23%" FooterStyle-Width="23%">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblCashFlow" runat="server" Text='<%# Bind("CashFlow") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:DropDownList ID="ddlRepaymentCashFlow_RepayTab" runat="server" Width="98%" AutoPostBack="true"
                                                                                                        OnSelectedIndexChanged="ddlRepaymentCashFlow_RepayTab_SelectedIndexChanged">
                                                                                                    </asp:DropDownList>
                                                                                                    <asp:RequiredFieldValidator ID="rfvddlRepaymentCashFlow_RepayTab" runat="server"
                                                                                                        ControlToValidate="ddlRepaymentCashFlow_RepayTab" CssClass="styleMandatoryLabel"
                                                                                                        Display="None" ValidationGroup="TabRepayment1" SetFocusOnError="True" InitialValue="-1"
                                                                                                        ErrorMessage="Select a Repayment cashflow"></asp:RequiredFieldValidator>
                                                                                                </FooterTemplate>
                                                                                                <FooterStyle Width="23%" />
                                                                                                <ItemStyle Width="23%" />
                                                                                            </asp:TemplateField>
                                                                                            <%--<asp:TemplateField HeaderText="Amount" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                <FooterStyle HorizontalAlign="Right" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAmountRepaymentCashFlow_RepayTab" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtAmountRepaymentCashFlow_RepayTab" runat="server" Width="97%"
                                                                        MaxLength="10">
                                                                    </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="ftextExtxtAmountRepaymentCashFlow_RepayTab" runat="server"
                                                                        FilterType="Numbers" TargetControlID="txtAmountRepaymentCashFlow_RepayTab">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <asp:RequiredFieldValidator ID="rfvtxtAmountRepaymentCashFlow_RepayTab" runat="server"
                                                                        ControlToValidate="txtAmountRepaymentCashFlow_RepayTab" CssClass="styleMandatoryLabel"
                                                                        Display="None" ValidationGroup="TabRepayment1" SetFocusOnError="True" ErrorMessage="Enter the amount"></asp:RequiredFieldValidator>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>--%>
                                                                                            <asp:TemplateField HeaderText="Per Installment Amount" ItemStyle-Width="10%" FooterStyle-Width="10%"
                                                                                                FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right">
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                                <FooterStyle HorizontalAlign="Right" />
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblPerInstallmentAmount_RepayTab" runat="server" Text='<%# Bind("PerInstall") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:TextBox ID="txtPerInstallmentAmount_RepayTab" runat="server" Width="95%" Style="text-align: right;"
                                                                                                        MaxLength="10">
                                                                                                    </asp:TextBox>
                                                                                                    <cc1:FilteredTextBoxExtender ID="ftextExtxtPerInstallmentAmount_RepayTab" runat="server"
                                                                                                        FilterType="Custom,Numbers" TargetControlID="txtPerInstallmentAmount_RepayTab" ValidChars=".">
                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                    <asp:RequiredFieldValidator ID="rfvtxtPerInstallmentAmount_RepayTab" runat="server"
                                                                                                        ControlToValidate="txtPerInstallmentAmount_RepayTab" CssClass="styleMandatoryLabel"
                                                                                                        Display="None" ValidationGroup="TabRepayment1" SetFocusOnError="True" ErrorMessage="Enter the Per installment amount"></asp:RequiredFieldValidator>
                                                                                                </FooterTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Breakup Percentage" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                                <FooterStyle HorizontalAlign="Right" />
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblBreakup_RepayTab" runat="server" Text='<%# Bind("Breakup") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:TextBox ID="txtBreakup_RepayTab" runat="server" Width="95%" onkeypress="fnAllowNumbersOnly(true,false,this)">
                                                                                                    </asp:TextBox>
                                                                                                </FooterTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="From Installment" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                                <FooterStyle HorizontalAlign="Right" />
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblFromInstallment_RepayTab" runat="server" Text='<%# Bind("FromInstall") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:TextBox ID="txtFromInstallment_RepayTab" runat="server" Width="95%" MaxLength="3"
                                                                                                        Style="text-align: right" Text="1"><%--ReadOnly="true" --%>
                                                                                                    </asp:TextBox>
                                                                                                    <cc1:FilteredTextBoxExtender ID="ftextExtxtFromInstallment_RepayTab" runat="server"
                                                                                                        FilterType="Numbers" TargetControlID="txtFromInstallment_RepayTab">
                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                    <%--<asp:RequiredFieldValidator ID="rfvtxtFromInstallment_RepayTab" runat="server" ControlToValidate="txtFromInstallment_RepayTab"
                                                                        CssClass="styleMandatoryLabel" Display="None" ValidationGroup="TabRepayment1"
                                                                        SetFocusOnError="True" ErrorMessage="Enter the From installment"></asp:RequiredFieldValidator>--%>
                                                                                                </FooterTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="To Installment" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                                                <FooterStyle HorizontalAlign="Right" />
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblToInstallment_RepayTab" runat="server" Text='<%# Bind("ToInstall") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:TextBox ID="txtToInstallment_RepayTab" runat="server" Width="95%" MaxLength="3"
                                                                                                        Style="text-align: right">
                                                                                                    </asp:TextBox>
                                                                                                    <cc1:FilteredTextBoxExtender ID="ftextExtxtToInstallment_RepayTab" runat="server"
                                                                                                        FilterType="Numbers" TargetControlID="txtToInstallment_RepayTab">
                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                    <asp:RequiredFieldValidator ID="rfvtxtToInstallment_RepayTab" runat="server" ControlToValidate="txtToInstallment_RepayTab"
                                                                                                        CssClass="styleMandatoryLabel" Display="None" ValidationGroup="TabRepayment1"
                                                                                                        SetFocusOnError="True" ErrorMessage="Enter the To installment"></asp:RequiredFieldValidator>
                                                                                                    <asp:CompareValidator ID="cmpvFromTOInstall" runat="server" ErrorMessage="To installment should be greater than From installment"
                                                                                                        ControlToValidate="txtToInstallment_RepayTab" ControlToCompare="txtFromInstallment_RepayTab"
                                                                                                        Display="None" ValidationGroup="TabRepayment1" Type="Integer" Operator="GreaterThanEqual"></asp:CompareValidator>
                                                                                                </FooterTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="From Date" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblfromdate_RepayTab" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"FromDate")).ToString(strDateFormat) %> '></asp:Label>
                                                                                                    <asp:TextBox ID="txRepaymentFromDate" runat="server" Visible="false" BackColor="Navy"
                                                                                                        ForeColor="White" Font-Names="calibri" Font-Size="12px" Width="95%" Style="color: White"
                                                                                                        Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"FromDate")).ToString(strDateFormat) %> '
                                                                                                        AutoPostBack="True" OnTextChanged="txRepaymentFromDate_TextChanged"></asp:TextBox>
                                                                                                    <cc1:CalendarExtender ID="calext_FromDate" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate"
                                                                                                        TargetControlID="txRepaymentFromDate">
                                                                                                    </cc1:CalendarExtender>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:TextBox ID="txtfromdate_RepayTab" runat="server" Width="95%">
                                                                                                    </asp:TextBox>
                                                                                                    <cc1:CalendarExtender ID="CalendarExtenderSD_fromdate_RepayTab" runat="server" Enabled="True"
                                                                                                        TargetControlID="txtfromdate_RepayTab">
                                                                                                    </cc1:CalendarExtender>
                                                                                                    <%--  <asp:RequiredFieldValidator ID="rfvtxtfromdate_RepayTab" runat="server" ControlToValidate="txtfromdate_RepayTab"
                                                                        CssClass="styleMandatoryLabel" Display="None" ValidationGroup="TabRepayment1"
                                                                        SetFocusOnError="True" ErrorMessage="Enter the from date"></asp:RequiredFieldValidator>--%>
                                                                                                </FooterTemplate>
                                                                                                <FooterStyle Width="10%" />
                                                                                                <ItemStyle Width="10%" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="To Date" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblTODate_ReapyTab" runat="server" Width="100%" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"ToDate")).ToString(strDateFormat) %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:TextBox ID="txtToDate_RepayTab" runat="server" Width="95%" Visible="false">
                                                                                                    </asp:TextBox>
                                                                                                    <cc1:CalendarExtender ID="CalendarExtenderSD_ToDate_RepayTab" runat="server" Enabled="True"
                                                                                                        OnClientDateSelectionChanged="checkDate_PrevSystemDate" TargetControlID="txtToDate_RepayTab">
                                                                                                    </cc1:CalendarExtender>
                                                                                                </FooterTemplate>
                                                                                                <FooterStyle Width="10%" />
                                                                                                <ItemStyle Width="10%" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Add" ItemStyle-Width="5%" FooterStyle-Width="5%">
                                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                                <FooterStyle HorizontalAlign="Center" />
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="lnRemoveRepayment" CausesValidation="false" runat="server" CommandName="Delete"
                                                                                                        Text="Remove" Visible="false"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <FooterTemplate>
                                                                                                    <asp:Button ID="btnAddRepayment" runat="server" Text="Add" CssClass="styleGridShortButton"
                                                                                                        OnClick="btnAddRepayment_OnClick" ValidationGroup="TabRepayment1" OnClientClick="return fnCheckPageValidators('TabRepayment1',false)"></asp:Button>
                                                                                                </FooterTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Repayment CashFlowId" Visible="False">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblCashFlowId" runat="server" Text='<%# Bind("CashFlowId") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <%-- Columns to be added for IRR Calculation--%>
                                                                                            <asp:TemplateField Visible="False">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblAccountingIRR" runat="server" Text='<%# Bind("Accounting_IRR") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField Visible="False">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblBusinessIRR" runat="server" Text='<%# Bind("Business_IRR") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField Visible="False">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblComapnyIRR" runat="server" Text='<%# Bind("Company_IRR") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField Visible="False">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblCashFlow_Flag_ID" runat="server" Text='<%# Bind("CashFlow_Flag_ID") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <%-- Columns to be added for IRR Calculation--%>
                                                                                        </Columns>
                                                                                    </asp:GridView>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div align="right">
                                                            <button class="css_btn_enabled" id="btnCalIRR" title="Calculate IRR [Alt+M]" onserverclick="btnCalIRR_Click" causesvalidation="false" runat="server" type="button" accesskey="M">
                                                                <i class="fa fa-calculator" aria-hidden="true"></i>&emsp;<u></u>Calculate IRR 
                                                            </button>
                                                            <button class="css_btn_enabled" id="btnReset" title="Reset [Alt+N]" onclick="if(Confirmmsg('Are you sure want to Reset Repayment Structure?'))" onserverclick="btnReset_Click" causesvalidation="false" runat="server" type="button" accesskey="N">
                                                                <i class="fa fa-calculator" aria-hidden="true"></i>&emsp;<u></u>Reset
                                                            </button>
                                                            <input id="Hidden1" type="hidden" runat="server" />
                                                            <input id="Hidden2" type="hidden" runat="server" />
                                                            <input id="hdnRoundOff" type="hidden" runat="server" />
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="gird">
                                                                    <asp:GridView ID="grvRepayStructure" runat="server" Width="100%" AutoGenerateColumns="false">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="InstallmentNo" HeaderText="Installment No" ItemStyle-HorizontalAlign="Center" />
                                                                            <asp:BoundField DataField="From_Date" HeaderText="From Date" ItemStyle-HorizontalAlign="Left" />
                                                                            <asp:BoundField DataField="To_Date" HeaderText="To Date" ItemStyle-HorizontalAlign="Left" />
                                                                            <asp:BoundField DataField="Installment_Date" HeaderText="Installment Date" ItemStyle-HorizontalAlign="Left" />
                                                                            <asp:BoundField DataField="NoofDays" HeaderText="No Of days" ItemStyle-HorizontalAlign="Right" />
                                                                            <asp:BoundField DataField="InstallmentAmount" HeaderText="Installment Amount" ItemStyle-HorizontalAlign="Right" />
                                                                            <asp:BoundField DataField="FinanceCharges" HeaderText="Finance Charges" ItemStyle-HorizontalAlign="Right"
                                                                                Visible="true" />
                                                                            <asp:BoundField DataField="PrincipalAmount" HeaderText="Principal Amount" ItemStyle-HorizontalAlign="Right"
                                                                                Visible="true" />
                                                                            <asp:BoundField DataField="Insurance" HeaderText="Insurance" ItemStyle-HorizontalAlign="Right" />
                                                                            <asp:BoundField DataField="Others" HeaderText="Cus OW" ItemStyle-HorizontalAlign="Right" />
                                                                            <asp:BoundField DataField="CUS_OW" HeaderText="Cus IW" ItemStyle-HorizontalAlign="Right" />
                                                                            <asp:BoundField DataField="ET_IW" HeaderText="ET IW" ItemStyle-HorizontalAlign="Right" />
                                                                            <asp:BoundField DataField="ET_OW" HeaderText="ET OW" ItemStyle-HorizontalAlign="Right" />
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div align="right">
                                                            <asp:Button ID="Button1" runat="server" Style="display: none" Text="Button" CausesValidation="false"
                                                                OnClick="btnGenerateRepay_Click" />
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="styleMandatoryLabel"
                                                                    Enabled="true" ValidationGroup="TabRepayment1" Width="98%" ShowMessageBox="false"
                                                                    HeaderText="Correct the following validation(s):  " ShowSummary="true" />
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                    <%--<Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnCalIRR" EventName="Click" />
                                                        <asp:AsyncPostBackTrigger ControlID="btnGenerateRepay" EventName="Click" />
                                                    </Triggers>--%>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>

                                <cc1:TabPanel runat="server" ID="TabAlerts" Visible="false" CssClass="tabpan" HeaderText="TabAlerts"
                                    BackColor="Red" Width="98%">
                                    <HeaderTemplate>
                                        Alerts
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" ID="Panel5" CssClass="stylePanel" GroupingText="Alert Details"
                                                    Width="100%">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="gvAlert" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                                                                    OnRowDataBound="gvAlert_RowDataBound" OnRowDeleting="gvAlert_RowDeleting" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="TypeId" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblTypeId" runat="server" Text='<%# Bind("TypeId") %>' />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Type">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlType_AlertTab" runat="server" Width="200px">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvAlertType" runat="server" ControlToValidate="ddlType_AlertTab"
                                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Alert" InitialValue="-1"
                                                                                    SetFocusOnError="True" ErrorMessage="Select a Type"></asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="User ContactId" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUserContactid" runat="server" Text='<%# Bind("UserContactId") %>' />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="User Contact" FooterStyle-Width="45%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUserContact" runat="server" Text='<%# Bind("UserContact") %>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <%-- <asp:DropDownList ID="ddlContact_AlertTab" runat="server" Width="99%">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvUserContact" runat="server" ControlToValidate="ddlContact_AlertTab"
                                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ErrorMessage="Select a User Contact"
                                                                                    InitialValue="-1" ValidationGroup="Alert"></asp:RequiredFieldValidator>--%>
                                                                                <UC3:AutoSugg ID="ddlContact_AlertTab" runat="server" Width="300px" ServiceMethod="GetSalePersonList"
                                                                                    ErrorMessage="Select a User Contact" IsMandatory="true" ValidationGroup="Alert" />
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="EMail">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="ChkEmail" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "EMail")))%>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:CheckBox ID="ChkEmail" runat="server"></asp:CheckBox>
                                                                            </FooterTemplate>
                                                                            <FooterStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="SMS">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="ChkSMS" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "SMS")))%>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:CheckBox ID="ChkSMS" runat="server"></asp:CheckBox>
                                                                            </FooterTemplate>
                                                                            <FooterStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnRemove" CausesValidation="false" runat="server" CommandName="Delete"
                                                                                    Text="Remove"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Button ID="btnAddAlert" runat="server" Text="Add" CausesValidation="true" CssClass="styleGridShortButton"
                                                                                    OnClick="Alert_AddRow_OnClick" ValidationGroup="Alert"></asp:Button>
                                                                            </FooterTemplate>
                                                                            <FooterStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <cc1:TabPanel runat="server" ID="TabFollowUp" Visible="false" BackColor="Red" CssClass="tabpan">
                                            <HeaderTemplate>
                                                Follow Up
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtLOB_Followup" runat="server" ReadOnly="True"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblLOB_Followup" CssClass="styleDisplayLabel" Text="Line of Business"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtBranch_Followup" runat="server" ReadOnly="True"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblBranch_Followup" CssClass="styleDisplayLabel" Text="Location"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtEnquiry_Followup" runat="server" ReadOnly="True"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblEnquiry_Followup" CssClass="styleDisplayLabel" Text="Enquiry No."></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtEnquiryDate_Followup" runat="server" ReadOnly="True"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblEnquiryDate_Followup" CssClass="styleDisplayLabel"
                                                                    Text="Date"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtCustNameAdd_Followup" runat="server" ReadOnly="True" TextMode="MultiLine"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblCustNameAdd_Followup" CssClass="styleDisplayLabel"
                                                                    Text="Prospect Name & Address"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtOfferNo_Followup" runat="server" ReadOnly="True"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblOfferNo_Followup" runat="server" CssClass="styleDisplayLabel" Text="Offer No."></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtApplication_Followup" runat="server" ReadOnly="True"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblApplication_Followup" runat="server" CssClass="styleDisplayLabel"
                                                                    Text="Application No."></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtAccount_Followup" runat="server" ReadOnly="True"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblAccount_Followup" runat="server" CssClass="styleDisplayLabel" Text="Account No."></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel runat="server" ID="Panel7" CssClass="stylePanel" GroupingText="Follow Up Details"
                                                            Width="100%">
                                                            <div id="DivFollow" runat="server">
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <div class="gird">
                                                                            <asp:GridView ID="gvFollowUp" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                                                                                OnRowDeleting="gvFollowUp_RowDeleting" OnRowCreated="gvFollowUp_RowCreated" Width="99%">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="Date">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblDate_GridFollowup" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"Date")).ToString(strDateFormat) %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="txtDate_GridFollowup" runat="server">
                                                                                            </asp:TextBox>
                                                                                            <cc1:CalendarExtender runat="server" TargetControlID="txtDate_GridFollowup" ID="CalendarExtenderSD_FollowupDate"
                                                                                                Enabled="True" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                                                                            </cc1:CalendarExtender>
                                                                                            <asp:RequiredFieldValidator ID="rfvtxtDate_GridFollowup" runat="server" ControlToValidate="txtDate_GridFollowup"
                                                                                                ValidationGroup="FollowUp" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                                                ErrorMessage="Select the Date"></asp:RequiredFieldValidator>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="From User" Visible="false">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblfrom_GridFollowup_ID" runat="server" Text='<% #Bind("FromUserId")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="From UserName">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblfrom_GridFollowup" runat="server" Text='<% #Bind("From")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <%--                                                                    <asp:DropDownList ID="ddlfrom_GridFollowup" runat="server" Width="180px">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="rfvFromUser" runat="server" ControlToValidate="ddlfrom_GridFollowup"
                                                                        InitialValue="-1" ValidationGroup="FollowUp" CssClass="styleMandatoryLabel" Display="None"
                                                                        SetFocusOnError="True" ErrorMessage="Select a From UserName"></asp:RequiredFieldValidator>--%>
                                                                                            <UC3:AutoSugg ID="ddlfrom_GridFollowup" runat="server" Width="180px" ServiceMethod="GetSalePersonList"
                                                                                                ErrorMessage="Select a From UserName" IsMandatory="true" ValidationGroup="FollowUp" />
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="To User" Visible="false">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblTo_GridFollowupid" runat="server" Text='<%#Bind("ToUserId")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="To UserName">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblTo_GridFollowup" runat="server" Text='<%#Bind("To")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <%--  <asp:DropDownList ID="ddlTo_GridFollowup" runat="server" Width="180px">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="rfvToUser" runat="server" ControlToValidate="ddlTo_GridFollowup"
                                                                        ValidationGroup="FollowUp" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                        InitialValue="-1" ErrorMessage="Select a To UserName"></asp:RequiredFieldValidator>--%>
                                                                                            <UC3:AutoSugg ID="ddlTo_GridFollowup" runat="server" Width="180px" ServiceMethod="GetSalePersonList"
                                                                                                ErrorMessage="Select a To UserName" IsMandatory="true" ValidationGroup="FollowUp" />
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Action">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblActionDetails" runat="server" Text='<%#Bind("Action")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="txtAction_GridFollowup" runat="server" MaxLength="80" onkeyup="maxlengthfortxt(80)"
                                                                                                TextMode="MultiLine">
                                                                                            </asp:TextBox>
                                                                                            <asp:RequiredFieldValidator ID="rfvtxtAction_GridFollowup" runat="server" ControlToValidate="txtAction_GridFollowup"
                                                                                                ValidationGroup="FollowUp" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                                                ErrorMessage="Enter the Action"></asp:RequiredFieldValidator>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Action Date">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblActionDate" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"ActionDate")).ToString(strDateFormat) %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="txtActionDate_GridFollowup" runat="server" Width="90px">
                                                                                            </asp:TextBox>
                                                                                            <cc1:CalendarExtender runat="server" TargetControlID="txtActionDate_GridFollowup"
                                                                                                ID="CalendarExtenderSD_FollowupActionDate" Enabled="True" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                                                                            </cc1:CalendarExtender>
                                                                                            <asp:RequiredFieldValidator ID="rfvtxtActionDate_GridFollowup" runat="server" ControlToValidate="txtActionDate_GridFollowup"
                                                                                                ValidationGroup="FollowUp" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                                                ErrorMessage="Select the Action Date"></asp:RequiredFieldValidator>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Customer Response">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblCustomerResponse" runat="server" Text='<%#Bind("CustomerResponse")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="txtCustomerResponse_GridFollowup" runat="server" MaxLength="80"
                                                                                                TextMode="MultiLine" onkeyup="maxlengthfortxt(80)">
                                                                                            </asp:TextBox>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Remarks">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblRemarks" runat="server" Text='<%#Bind("Remarks")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="txtRemarks_GridFollowup" runat="server" MaxLength="80" TextMode="MultiLine"
                                                                                                onkeyup="maxlengthfortxt(80)">
                                                                                            </asp:TextBox>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField>
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton ID="lnRemove" CausesValidation="false" runat="server" CommandName="Delete"
                                                                                                Text="Remove"></asp:LinkButton>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:Button ID="btnAddFollowup" runat="server" Text="Add" CausesValidation="true"
                                                                                                CssClass="styleSubmitButton" OnClick="FollowUp_AddRow_OnClick" ValidationGroup="FollowUp"></asp:Button>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <cc1:TabPanel runat="server" ID="TabAccountDetails" Visible="false" CssClass="tabpan" BackColor="Red"
                                            Width="98%" HeaderText="Prime/Sub Account Details">
                                            <HeaderTemplate>
                                                Prime/Sub Account Details
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlRepaymentMode" runat="server"
                                                                class="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblRepaymentMode" CssClass="styleReqFieldLabel" Text="Installment Repayment Mode"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtRepaymentTime" runat="server"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblRepaymentTime" CssClass="styleDisplayLabel" Text="Repayment Time"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtAdvanceInstallments" runat="server" MaxLength="2" Style="text-align: right;"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtAdvanceInstallments"
                                                                FilterType="Numbers" Enabled="True">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblAdvanceInstallments" CssClass="styleDisplayLabel"
                                                                    Text="Advance Installments"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:CheckBox ID="chkDORequired" runat="server" CssClass="styleCheckBox" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <asp:Label runat="server" ID="lblDOrequired" CssClass="styleReqFieldLabel" Text="DO Required"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtLastODICalcDate" runat="server" ReadOnly="true"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblLastODICalcDate" CssClass="styleDisplayLabel" Text="Last ODI Calculation Date"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel runat="server" ID="pnlMoratorium" CssClass="stylePanel" GroupingText="Moratorium Details"
                                                            Width="99%">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="gird">
                                                                        <asp:GridView ID="gvMoratorium" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                                                                            OnRowDeleting="gvMoratorium_RowDeleting" Width="100%">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="Moratorium type" ItemStyle-Width="30%" FooterStyle-Width="30%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="ddlMoratoriumtype_MoratoriumTab" runat="server" Text='<%#Bind("Moratoriumtype") %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:DropDownList ID="ddlMoratoriumtype_MoratoriumTab" runat="server">
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator ID="rfvddlMoratoriumtype_MoratoriumTab" runat="server"
                                                                                            ControlToValidate="ddlMoratoriumtype_MoratoriumTab" CssClass="styleMandatoryLabel"
                                                                                            Display="None" SetFocusOnError="True" ErrorMessage="Select the Moratorium type"
                                                                                            InitialValue="-1" ValidationGroup="Moratorium"></asp:RequiredFieldValidator>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="From date" ItemStyle-Width="20%" FooterStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="txtFromdate_MoratoriumTab" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"Fromdate")).ToString(strDateFormat) %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:TextBox ID="txtFromdate_MoratoriumTab" runat="server" ValidationGroup="TabMoratorium">
                                                                                        </asp:TextBox>
                                                                                        <cc1:CalendarExtender ID="CalendarExtenderSD_FromDate_MoratoriumTab" runat="server"
                                                                                            Enabled="True" OnClientDateSelectionChanged="checkDate_PrevSystemDate" TargetControlID="txtFromdate_MoratoriumTab">
                                                                                        </cc1:CalendarExtender>
                                                                                        <asp:RequiredFieldValidator ID="rfvtxtFromdate_MoratoriumTab" runat="server" ControlToValidate="txtFromdate_MoratoriumTab"
                                                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ErrorMessage="Enter the From date"
                                                                                            ValidationGroup="Moratorium"></asp:RequiredFieldValidator>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="To date" ItemStyle-Width="20%" FooterStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="txtTodate_MoratoriumTab" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"Todate")).ToString(strDateFormat) %>'>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:TextBox ID="txtTodate_MoratoriumTab" runat="server" ValidationGroup="TabMoratorium">
                                                                                        </asp:TextBox>
                                                                                        <cc1:CalendarExtender ID="CalendarExtenderSD_ToDate_MoratoriumTab" runat="server"
                                                                                            Enabled="True" OnClientDateSelectionChanged="checkDate_PrevSystemDate" TargetControlID="txtTodate_MoratoriumTab">
                                                                                        </cc1:CalendarExtender>
                                                                                        <asp:RequiredFieldValidator ID="rfvtxtTodate_MoratoriumTab" runat="server" ControlToValidate="txtTodate_MoratoriumTab"
                                                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ErrorMessage="Enter the To date"
                                                                                            ValidationGroup="Moratorium"></asp:RequiredFieldValidator>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="Noofdays" HeaderText="No.of days" ItemStyle-Width="15%"
                                                                                    ItemStyle-HorizontalAlign="Right" />
                                                                                <asp:TemplateField HeaderText="" ItemStyle-Width="15%">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="lnRemove" CausesValidation="false" runat="server" CommandName="Delete"
                                                                                            Text="Remove"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:Button ID="LbtnAddMoratorium" runat="server" CausesValidation="true" OnClick="Moratorium_AddRow_OnClick"
                                                                                            Text="Add" ValidationGroup="Moratorium" CssClass="styleSubmitButton"></asp:Button>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <cc1:TabPanel runat="server" ID="TabSLADetails" Visible="false" CssClass="tabpan" BackColor="Red"
                                            Width="98%" HeaderText="Sub Account User Details">
                                            <HeaderTemplate>
                                                Sub Account User Details
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtSLACustomerCode" runat="server" MaxLength="5" onkeyup="maxlengthfortxt(60)"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" ValidChars=""
                                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="true"
                                                                TargetControlID="txtSLACustomerCode">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Sub Account User Details" ID="rfvSLACustomerCode"
                                                                    runat="server" ControlToValidate="txtSLACustomerCode" CssClass="validation_msg_box_sapn"
                                                                    Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblSLAUserCode" CssClass="styleReqFieldLabel" Text="User Internal Code Reference"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtSLAUserName" runat="server" MaxLength="40"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" ValidChars=" -,.#&()/"
                                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="true"
                                                                TargetControlID="txtSLAUserName">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Sub Account User Details" ID="rfvSLAUserName"
                                                                    runat="server" ControlToValidate="txtSLAUserName" CssClass="validation_msg_box_sapn"
                                                                    Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblSLAUserName" CssClass="styleReqFieldLabel" Text="User Name"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtComAddress1" runat="server" MaxLength="60" onkeyup="maxlengthfortxt(60)"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Sub Account User Details" ID="rfvComAddress1"
                                                                    runat="server" ControlToValidate="txtComAddress1" CssClass="validation_msg_box_sapn"
                                                                    Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblComAddress1" CssClass="styleReqFieldLabel" Text="Address1"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtCOmAddress2" runat="server" MaxLength="60" onkeyup="maxlengthfortxt(60)"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Sub Account User Details" ID="RequiredFieldValidator3"
                                                                    runat="server" ControlToValidate="txtComAddress1" CssClass="validation_msg_box_sapn"
                                                                    Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblComAddress2" CssClass="styleDisplayLabel" Text="Address2"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <cc1:ComboBox ID="txtComCity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                AppendDataBoundItems="true" onpaste="return false;" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                            </cc1:ComboBox>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Sub Account User Details" ID="rfvComCity"
                                                                    runat="server" ControlToValidate="txtComCity" CssClass="validation_msg_box_sapn"
                                                                    Display="Dynamic" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label class="tess">
                                                                <asp:Label runat="server" ID="lblComcity" CssClass="styleReqFieldLabel" Text="City"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <cc1:ComboBox ID="txtComState" onpaste="return false;" runat="server" CssClass="WindowsStyle"
                                                                DropDownStyle="DropDown" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                            </cc1:ComboBox>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Sub Account User Details" ID="rfvComState"
                                                                    runat="server" ControlToValidate="txtComState" CssClass="validation_msg_box_sapn"
                                                                    Display="Dynamic" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label class="tess">
                                                                <asp:Label runat="server" ID="lblComState" CssClass="styleReqFieldLabel" Text="State"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <cc1:ComboBox ID="txtComCountry" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                AppendDataBoundItems="true" onpaste="return false;" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                            </cc1:ComboBox>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Sub Account User Details" ID="rfvComCountry"
                                                                    runat="server" ControlToValidate="txtComCountry" CssClass="validation_msg_box_sapn"
                                                                    Display="Dynamic" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label class="tess">
                                                                <asp:Label runat="server" ID="lblComCountry" CssClass="styleReqFieldLabel" Text="Country"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtComPincode" runat="server" MaxLength="10"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtComPincode" runat="server" ValidChars=" " FilterType="Custom,Numbers, UppercaseLetters, LowercaseLetters"
                                                                Enabled="true" TargetControlID="txtComPincode">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Sub Account User Details" ID="rfvComPincode"
                                                                    runat="server" ControlToValidate="txtComPincode" CssClass="validation_msg_box_sapn"
                                                                    Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label class="tess">
                                                                <asp:Label runat="server" ID="lblCompincode" CssClass="styleReqFieldLabel" Text="Pin"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtComPhone" runat="server" MaxLength="10"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtComPhone" runat="server" InvalidChars="." FilterType="Custom,Numbers"
                                                                Enabled="true" TargetControlID="txtComPhone">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Sub Account User Details" ID="RequiredFieldValidator1"
                                                                    runat="server" ControlToValidate="txtComPhone" CssClass="validation_msg_box_sapn"
                                                                    Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label class="tess">
                                                                <asp:Label runat="server" ID="lblComPhone" CssClass="styleReqFieldLabel" Text="Phone"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtComMobile" runat="server" MaxLength="10"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" FilterType="Numbers"
                                                                Enabled="true" TargetControlID="txtComMobile">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label class="tess">
                                                                <asp:Label runat="server" ID="lblComMobile" CssClass="styleDisplayLabel" Text="[M]"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtComEMail" runat="server" MaxLength="60" onkeyup="maxlengthfortxt(60)"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="revEmailId" runat="server" ControlToValidate="txtComEMail"
                                                                ValidationGroup="Entity Details" Display="None" SetFocusOnError="True" ErrorMessage="Enter a valid Email Id"
                                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" meta:resourcekey="revEmailIdResource1"></asp:RegularExpressionValidator>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label class="tess">
                                                                <asp:Label runat="server" ID="lblComEmail" CssClass="styleDisplayLabel" Text="EMail"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtComWebsite" runat="server" MaxLength="60" onkeyup="maxlengthfortxt(60)"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label class="tess">
                                                                <asp:Label runat="server" ID="lblComWebsite" CssClass="styleDisplayLabel" Text="Website"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </div>
                                </div>
                            </cc1:TabContainer>
                        </div>
                    </div>
                    <%-- Columns to be added for IRR Calculation Ends--%>
                    <input id="hdnCTR" type="hidden" runat="server" />
                    <input id="hdnPLR" type="hidden" runat="server" />
                    <br />
                    <div style="display: none" class="row">
                        <div class="col">
                            <asp:ValidationSummary ID="vs_TabMainPage" runat="server" CssClass="styleMandatoryLabel"
                                Width="98%" ValidationGroup="Submit" HeaderText="Correct the following validation(s):  " />
                            <asp:ValidationSummary ID="vsInflow" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" ValidationGroup="Inflow" Width="98%" ShowMessageBox="false" HeaderText="Correct the following validation(s):  "
                                ShowSummary="true" />
                            <asp:ValidationSummary ID="vsOutflow" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" ValidationGroup="Outflow" Width="98%" ShowMessageBox="false" HeaderText="Correct the following validation(s):  "
                                ShowSummary="true" />
                            <asp:ValidationSummary ID="vsRepayment" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" ValidationGroup="Repayment" Width="98%" ShowMessageBox="false"
                                HeaderText="Correct the following validation(s):  " ShowSummary="true" />
                            <asp:ValidationSummary ID="vsGuarantor" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" ValidationGroup="Guarantor" Width="98%" ShowMessageBox="false"
                                HeaderText="Correct the following validation(s):  " ShowSummary="true" />
                            <asp:ValidationSummary ID="vsAlert" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" ValidationGroup="Alert" Width="98%" ShowMessageBox="false" HeaderText="Correct the following validation(s):  "
                                ShowSummary="true" />
                            <asp:ValidationSummary ID="vsFollowUp" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" ValidationGroup="FollowUp" Width="98%" ShowMessageBox="false"
                                HeaderText="Correct the following validation(s):  " ShowSummary="true" />
                            <asp:ValidationSummary ID="vsMoratorium" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" ValidationGroup="Moratorium" Width="98%" ShowMessageBox="false"
                                HeaderText="Correct the following validation(s):  " ShowSummary="true" />
                            <asp:ValidationSummary ID="vsAsset" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" ValidationGroup="tcAsset" Width="98%" ShowMessageBox="false" HeaderText="Correct the following validation(s):  "
                                ShowSummary="true" />
                            <asp:CustomValidator ID="cv_TabMainPage" runat="server" CssClass="styleMandatoryLabel"
                                Display="None" ValidationGroup="Submit"></asp:CustomValidator>

                        </div>
                    </div>




                    <br />
                    <div id="div20" style="overflow: hidden; text-align: right">
                        <br />
                        <div class="btn_height"></div>
                        <div align="right">
                            <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" causesvalidation="false" onclick="if(fnSaveValidation())" onserverclick="btnSave_OnClick" runat="server"
                                type="button" accesskey="S">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                            </button>
                            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_OnClick" runat="server"
                                type="button" accesskey="L">
                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                            </button>
                            <button class="css_btn_enabled" id="btnCalcel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                type="button" accesskey="X">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                            </button>
                            <button class="css_btn_enabled" id="btnAcccountCancel" causesvalidation="false" runat="server"
                                type="button" visible="false">
                                <i class="fa fa-window-close" aria-hidden="true"></i>&emsp;<u></u>Account Cancel
                            </button>
                            <%-- <cc1:ConfirmButtonExtender ID="btnAcCancelConfirmButtonExtender" runat="server" ConfirmText="Are you sure want to cancel this Account?"
                                Enabled="True" TargetControlID="btnAcccountCancel">
                            </cc1:ConfirmButtonExtender>--%>
                            <asp:Button ID="btnGenerateRepay" runat="server" Style="display: none" Text="Button"
                                OnClick="btnGenerateRepay_Click" />

                        </div>

                        <input id="hdnCustomerId" type="hidden" runat="server" />
                        <input id="hdnConstitutionId" type="hidden" runat="server" />
                        <input id="hdnProductId" type="hidden" runat="server" />
                        <br />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
