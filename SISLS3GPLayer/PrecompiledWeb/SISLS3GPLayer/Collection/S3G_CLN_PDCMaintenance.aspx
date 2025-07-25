<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3G_CLN_PDCMaintenance, App_Web_x5tdsxrh" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">

        function Calculate(amt, other, total, suffixlen) {

            if (other.value.length != 0) {
                total.value = parseFloat(parseFloat(amt.value) + parseFloat(other.value)).toFixed(suffixlen);
                other.value = parseFloat(other.value).toFixed(suffixlen);
                total.setAttribute('title', total.value);
                other.setAttribute('title', other.value);

            }
            else if (other.value.length == 0) {
                other.value = parseFloat("0").toFixed(suffixlen);
                other.setAttribute('title', other.value);
            }
        }

        function fnLoadCustomer() {
            document.getElementById('<%=btnLoadCustomer.ClientID%>').click();
        }

        //Tab index code starts

        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_tcPDCEntry');

            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;

            }
            else if (Source_Invoker == 'btnPrevTab') {
                if (btnActive_index != 0) {
                    newindex = btnActive_index - 1;
                }
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }
            if (newindex > index) {


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
            else {
                tab.set_activeTabIndex(newindex);

                var TC = $find("<%=tcPDCEntry.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=ddlLOB.ClientID %>").focus();
                }
            }
        }

        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {

            var TC = $find("<%=tcPDCEntry.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlLOB.ClientID %>").focus();
            }

            tab = $find('ctl00_ContentPlaceHolder1_tcPDCEntry');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;

            function on_Change(sender, e) {
                debugger;
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
        //Tab index code end

        //Added on 26-Oct-2018 Starts here
        /*
        function onChequeStatus_Change(PDCStatus, InstrumentNumber, InstrumentDate, InstrumentAmount, DraweeBank, MICR, DraweeAcctNo, RevisedBankDate, Remarks) {

            var pdcstatus = $get(PDCStatus);
            if (pdcstatus.value == "0" || pdcstatus.value == "4" || pdcstatus.value == "6" || pdcstatus.value == "9") {
                //$get(InstrumentNumber).removeAttribute("disabled");
                //$get(InstrumentDate).removeAttribute("disabled");
                //$get(InstrumentAmount).removeAttribute("disabled");
                //$get(MICR).removeAttribute("disabled");
                //$get(DraweeAcctNo).removeAttribute("disabled");
                //$get(Remarks).removeAttribute("disabled");
                $get(DraweeBank).removeAttribute("disabled");
            }
            else {
                $get(InstrumentNumber).setAttribute("disabled", true);
                //$get(InstrumentDate).setAttribute("disabled", true);
                //$get(InstrumentAmount).setAttribute("disabled", true);
                $get(MICR).setAttribute("disabled", true);
                $get(DraweeAcctNo).setAttribute("disabled", true);
                $get(DraweeBank).setAttribute("disabled", true);
                //$get(Remarks).setAttribute("disabled", true);
            }

            //$get(RevisedBankDate).setAttribute("disabled", true);
            //if (pdcstatus.value == "7") {
            //    $get(RevisedBankDate).removeAttribute("disabled");
            //    $get(RevisedBankDate).focus();
            //}

            $get(InstrumentNumber).value = "";
            //$get(InstrumentDate).value = "";
            //$get(InstrumentAmount).value = "";
            $get(MICR).value = "";
            $get(DraweeAcctNo).value = "";
            //$get(RevisedBankDate).value = "";
            //$get(Remarks).value = "";
            $get(DraweeBank).value = "";
        }
        //Added on 26-Oct-2018 Ends here

        //Added on 08-Nov-2018 Starts here
        function onDraweeBank_Change(InstrumentNumber, InstrumentDate, InstrumentAmount, DraweeBank, MICR, DraweeAcctNo, RevisedBankDate, Remarks) {

            var DraweeBank = $get(DraweeBank);
            if (DraweeBank.value == "") {
                //$get(InstrumentDate).setAttribute("disabled", true);
                //$get(InstrumentAmount).setAttribute("disabled", true);
                $get(MICR).setAttribute("disabled", true);
                $get(DraweeAcctNo).setAttribute("disabled", true);
                //$get(Remarks).setAttribute("disabled", true);
                $get(InstrumentNumber).setAttribute("disabled", true);

                //$get(InstrumentDate).value = "";
                //$get(InstrumentAmount).value = "";
                $get(MICR).value = "";
                $get(DraweeAcctNo).value = "";
                //$get(RevisedBankDate).value = "";
                //$get(Remarks).value = "";
                $get(InstrumentNumber).value = "";
            }
            else {

                //$get(InstrumentDate).removeAttribute("disabled");
                //$get(InstrumentAmount).removeAttribute("disabled");
                $get(MICR).removeAttribute("disabled");
                $get(DraweeAcctNo).removeAttribute("disabled");
                //$get(Remarks).removeAttribute("disabled");
                $get(InstrumentNumber).removeAttribute("disabled");

                $get(InstrumentNumber).focus();
            }
        }
        //Added on 08-Nov-2018 Ends here
        */

        function fnSelectAllPDC(chkSelectAllPDC, chkPDC)        //
        {
            var gvPDC = document.getElementById('<%=GRVPDCDetails.ClientID%>');
            var TargetChildControl = chkPDC;
            //Get all the control of the type INPUT in the base control.
            var Inputs = gvPDC.getElementsByTagName("input");
            //Checked/Unchecked all the checkBoxes in side the GridView.
            for (var n = 0; n < Inputs.length; ++n)
                if (Inputs[n].type == 'checkbox' &&
            Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                    Inputs[n].checked = chkSelectAllPDC.checked;
        }

        function fnSelectPDC(chkPDC) {
            fnChkIsAllPDCSelected(chkPDC);
        }

        function fnChkIsAllPDCSelected(chkSelect) {
            var gv = document.getElementById('<%= GRVPDCDetails.ClientID%>');
            var chk = document.getElementById('ctl00_ContentPlaceHolder1_tcPDCEntry_tbgeneral_GRVPDCDetails_ctl01_cbxSelectAll');

            if (chkSelect.checked == false) {
                chk.checked = false;
            }
            else {
                var gvRwCnt = gv.rows.length - 1;
                var ChcCnt = 0;
                for (var i = 0; i < gv.rows.length; ++i) {
                    var Inputs = gv.rows[i].getElementsByTagName("input");
                    for (var n = 0; n < Inputs.length; ++n) {
                        if (Inputs[n].type == 'checkbox') {
                            if (Inputs[n].checked == true)
                                ++ChcCnt;
                        }
                    }
                }
                if (ChcCnt == gvRwCnt)
                    chk.checked = true;
                else
                    chk.checked = false;
            }
        }

    </script>


    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">

            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading"></asp:Label>
                    </h6>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:UpdatePanel ID="upanelPDCEntry111" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <cc1:TabContainer ID="tcPDCEntry" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel" ScrollBars="None">
                                <cc1:TabPanel runat="server" HeaderText="General" ID="tbgeneral" CssClass="tabpan"
                                    BackColor="Red" ToolTip="General">
                                    <HeaderTemplate>
                                        General
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpGeneral" runat="server">
                                            <ContentTemplate>
                                                <asp:Panel ID="pnlGeneral" runat="server" CssClass="stylePanel" GroupingText="General">
                                                    <div class="row">

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox runat="server" ID="txtTransactionDate" ContentEditable="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <asp:Image ID="imgTransactionDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                    ToolTip="Transaction Date" Visible="false" />
                                                                <cc1:CalendarExtender ID="CECTransactiondate" runat="server" Enabled="false" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                                    PopupButtonID="imgTransactionDate" TargetControlID="txtTransactionDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Transaction Date" ID="lblTransactionDate" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVTransactionDate" CssClass="validation_msg_box_sapn"
                                                                        runat="server" ValidationGroup="VGPDC" ControlToValidate="txtTransactionDate"
                                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <div class="row" style="width: 95%; overflow: hidden;">
                                                                    <div style="width: 90%; vertical-align: bottom;">
                                                                        <asp:DropDownList ID="ddlPAN" runat="server" class="md-form-control form-control" ToolTip="Account Number">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Account Number" ID="lblprimeaccno" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RFVMLA" CssClass="validation_msg_box_sapn" runat="server"
                                                                                ControlToValidate="ddlPAN" InitialValue="0" ValidationGroup="VGPDC" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                    <div style="width: 10%;">
                                                                        <button class="btn_5" id="btnViewStructure" title="View Structure Details, Alt+V" causesvalidation="false" runat="server" type="button"
                                                                            accesskey="V" onserverclick="btnViewStructure_ServerClick">
                                                                            <u>V</u>S+
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                    strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" ToolTip="Customer/Entity" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <uc4:ICM ID="ucFactCustomerLov" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                    Visible="true" Enabled="false" ToolTip="Factoring Customer Name" ButtonEnabled="false" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFactoringCustomerName" runat="server" Text="Factoring Customer Name" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox runat="server" ID="txtPDCEntryNo" ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="PDC Entry Number" ID="lblPDCEntryNo" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlLOB" runat="server" class="md-form-control form-control" ToolTip="Line of Business">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVLOB" CssClass="validation_msg_box_sapn" runat="server"
                                                                        ControlToValidate="ddlLOB" InitialValue="0" ValidationGroup="VGPDC" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlBranch" runat="server" class="md-form-control form-control" ToolTip="Branch">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Location" ID="lblBranch" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlPDCNature" runat="server" ToolTip="PDC Nature" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="PDC Nature" ID="lblPDCNature" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlInstrmentType" runat="server" ToolTip="Instrument Type" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Instrument Type" ID="lblInstrumentType" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVInstrumentType" CssClass="validation_msg_box_sapn"
                                                                        runat="server" ControlToValidate="ddlInstrmentType" InitialValue="0" ValidationGroup="VGPDC"
                                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox runat="server" ID="txtNoofPDC" MaxLength="3" onkeypress="fnAllowNumbersOnly(false,false,this);"
                                                                    class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                                <asp:TextBox runat="server" ID="txtFromInstallmentNo" onkeypress="fnAllowNumbersOnly(false,false,this);" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RFVNoofPDC" CssClass="validation_msg_box_sapn" runat="server"
                                                                    ValidationGroup="VGPDC" ControlToValidate="txtNoofPDC" Display="Dynamic" ErrorMessage="Enter the Number of PDC"></asp:RequiredFieldValidator>
                                                                <asp:HiddenField ID="hdnFromInstallmentNo" runat="server" />
                                                                <asp:HiddenField ID="hdnmaxInstallmentNo" runat="server" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="No. of PDC & From Installment No." ID="lblNoofPDC" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlInstrmentSequence" runat="server" ToolTip="Instrument Sequence" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Instrument Sequence" ID="lblInstrmentSequence" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVInstrmentSequence" CssClass="validation_msg_box_sapn"
                                                                        runat="server" ControlToValidate="ddlInstrmentSequence" InitialValue="0" ValidationGroup="VGPDC"
                                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtDepositBank" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                    ToolTip="Deposit Bank" ReadOnly="true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Deposit Bank" ID="lblDepositBank" CssClass="styleDisplayLabel" ToolTip="Deposit Bank"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtTotalRepayAmount" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                    ToolTip="SB Amount" ReadOnly="true" Style="text-align: right;"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="SB Amount" ID="lblSBAmount" CssClass="styleDisplayLabel" ToolTip="SB Amount"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlIssuerBy" runat="server" ToolTip="Issuer By" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Issuer By" ID="lblIssuerBy" CssClass="styleDisplayLabel" ToolTip="Issuer By"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtGivenBy" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                    ToolTip="Given By" MaxLength="100" ReadOnly="true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftbxGivenBy" runat="server" TargetControlID="txtGivenBy"
                                                                    FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=". " Enabled="true">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Given By" ID="lblGivenBy" CssClass="styleDisplayLabel" ToolTip="Given By"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </asp:Panel>

                                                <asp:Panel ID="pnlMaintenance" runat="server" CssClass="stylePanel" GroupingText="Maintenance">
                                                    <div class="row">

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlFromStatus" runat="server" ToolTip="From Status" class="md-form-control form-control"
                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlFromStatus_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="From Status" ID="lblFromStatus" CssClass="styleDisplayLabel" ToolTip="From Status"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlToStaus" runat="server" ToolTip="To Status" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="To Status" ID="lblToStatus" CssClass="styleDisplayLabel" ToolTip="To Status"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlReason" runat="server" ToolTip="Reason" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Reason" ID="lblReason" CssClass="styleDisplayLabel" ToolTip="Reason"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <uc:Suggest ID="ddlDraweeBank" ToolTip="Drawee Bank" runat="server" AutoPostBack="false"
                                                                    ServiceMethod="GetDraweeBankList" WatermarkText="--Select--" OnItem_Selected="ddlDraweeBank_Item_Selected" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Drawee Bank" ID="lblDraweeBank" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtInstrumentNumber" runat="server" AutoPostBack="false" OnTextChanged="txtInstrumentNumber_TextChanged" ToolTip="Cheque Start Number "
                                                                    MaxLength="15" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;">
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftbeInstrumentNumber" runat="server" TargetControlID="txtInstrumentNumber"
                                                                    FilterType="Numbers" Enabled="true">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Cheque Start Number" ID="lblInstrumentNumber" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtAccountNumber" runat="server" ToolTip="Drawee Bank Account No" AutoPostBack="false" MaxLength="50"
                                                                    class="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtAccountNumber_TextChanged">
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftbeAccountNumber" runat="server" TargetControlID="txtAccountNumber"
                                                                    FilterType="LowercaseLetters,UppercaseLetters,Numbers" Enabled="true">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Drawee Bank Account No" ID="lblAccountNumber" CssClass="styleDisplayLabel" ToolTip="Drawee Bank Account No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMICR" runat="server" ToolTip="MICR" MaxLength="25" OnTextChanged="txtCopyMICR_TextChanged" AutoPostBack="false"
                                                                    class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true">
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftbxMICR" runat="server" TargetControlID="txtMICR"
                                                                    FilterType="LowercaseLetters,UppercaseLetters,Numbers" Enabled="true">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="MICR" ID="lblMICR" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvMICR" CssClass="validation_msg_box_sapn" runat="server" Enabled="false"
                                                                        ControlToValidate="txtMICR" ValidationGroup="VGPDC" Display="Dynamic" ErrorMessage="Enter the MICR Number"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtAuthorizedSign" runat="server" onkeyup="maxlengthfortxt(100)" ToolTip="Authorized Signatory"
                                                                    class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftbxAuthorizedSign" runat="server" TargetControlID="txtAuthorizedSign"
                                                                    FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=". " Enabled="true">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Authorized Signatory" ID="lblAuthorizedSign" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCmnRemarks" runat="server" MaxLength="60" onkeyup="maxlengthfortxt(60)" ToolTip="Remarks"
                                                                    class="md-form-control form-control login_form_content_input requires_true" TextMode="MultiLine">
                                                                </asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Remarks" ID="lblCmnRemarks" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <button class="css_btn_enabled" id="btnGo" title="Go,[Alt+G]" causesvalidation="false" onserverclick="btnGo_ServerClick"
                                                                    runat="server" type="button" accesskey="G">
                                                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                                </button>
                                                            </div>
                                                        </div>

                                                        <asp:HiddenField ID="hidcuscode" runat="server" />
                                                    </div>
                                                </asp:Panel>


                                                <asp:Panel ID="pnlGRDSeqYes" runat="server" CssClass="stylePanel" GroupingText="PDC Information" Visible="false">
                                                    <asp:UpdatePanel ID="UpPDCDetails" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="gird">
                                                                        <asp:GridView runat="server" ID="GRVPDCDetails" AutoGenerateColumns="false" OnRowDataBound="GRVPDCDetails_RowDataBound" ToolTip="PDC Information"
                                                                            EmptyDataText="No PDC Details available for Maintenance.View Existing PDC on Next Tab">
                                                                            <Columns>
                                                                                <%--<asp:BoundField DataField="PDCEntryNo" HeaderText="PDC Entry No" ItemStyle-HorizontalAlign="Left"
                                                ItemStyle-Width="500px" />--%>
                                                                                <%--Prime A/c No--%>
                                                                                <asp:TemplateField HeaderText="Prime Account Number" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblPANUM" runat="server" Text='<%#Eval("PANUM")%>'></asp:Label>
                                                                                        <asp:Label ID="lblPDCDetailID" runat="server" Text='<%#Eval("PDC_DETAILS_ID")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                                </asp:TemplateField>
                                                                                <%--Sub A/c No--%>
                                                                                <asp:TemplateField HeaderText="Sub Account Number" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblSANUM" runat="server" Text='<%#Eval("SANUM")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                                </asp:TemplateField>
                                                                                <%--Select--%>
                                                                                <asp:TemplateField HeaderText="">
                                                                                    <HeaderTemplate>
                                                                                        <asp:CheckBox ID="cbxSelectAll" runat="server" OnClick="javascript:fnSelectAllPDC(this,'cbxSelect');" />
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="cbxSelect" runat="server" OnClick="javascript:fnSelectPDC(this);" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                                </asp:TemplateField>
                                                                                <%--Installment No--%>
                                                                                <asp:TemplateField HeaderText="Inst.No">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblInstallmentNo" runat="server" Text='<%#Eval("InstallmentNo")%>' ToolTip="Inst.No" Style="display: none;"></asp:Label>
                                                                                        <asp:LinkButton ID="lnkbtnInstallmentNo" runat="server" Text='<%#Eval("InstallmentNo")%>' ToolTip="Inst.No" OnClick="lnkbtnInstallmentNo_Click" Style="color: red;"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" Width="50px"></ItemStyle>
                                                                                </asp:TemplateField>
                                                                                <%--Installment Date--%>
                                                                                <asp:TemplateField HeaderText="Cheq. Date">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblInstallmentDate" runat="server" Text='<%#Eval("InstallmentDate")%>' ToolTip="Inst. Date" Width="100px"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                                </asp:TemplateField>
                                                                                <%--  Instrument No--%>
                                                                                <asp:TemplateField HeaderText="Cheq. No">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblgvInstrumentNo" runat="server" Text='<%# Bind("InstrumentNo")%>' ToolTip="Cheq. No"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                                </asp:TemplateField>
                                                                                <%--Instrument Date--%>
                                                                                <asp:TemplateField HeaderText="Banking Date">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txtgvBankingDate" runat="server" Text='<%# Bind("REVISED_BANKDATE")%>' ToolTip="Banking Date" Width="100px">
                                                                                        </asp:TextBox>
                                                                                        <asp:Image ID="imggvBankingDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                                            ToolTip="Banking Date" Visible="false" />
                                                                                        <cc1:CalendarExtender ID="CEgvBankingDate" runat="server" PopupButtonID="imggvBankingDate" TargetControlID="txtgvBankingDate">
                                                                                        </cc1:CalendarExtender>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                                </asp:TemplateField>

                                                                                <%--Drawee Bank--%>
                                                                                <asp:TemplateField HeaderText="Bank">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblDraweeBankG" runat="server" Text='<%# Bind("Drawee_Bank_Name")%>' ToolTip="Bank"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" Width="150px"></ItemStyle>
                                                                                </asp:TemplateField>

                                                                                <%--MICR--%>
                                                                                <asp:TemplateField HeaderText="MICR">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblgvMICRD" runat="server" Text='<%# Bind("MICR")%>' ToolTip="MICR"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                                </asp:TemplateField>

                                                                                <%-- Amount--%>
                                                                                <asp:TemplateField HeaderText="Amount">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblgvAmount" runat="server" Text='<%# Bind("Amount")%>' ToolTip="Amount"></asp:Label>
                                                                                        <asp:TextBox ID="txtgvAmount" runat="server" Text='<%# Bind("Amount")%>' ToolTip="Amount" Style="text-align: right;"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="FTEgvAmount" runat="server" TargetControlID="txtgvAmount"
                                                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                                                </asp:TemplateField>
                                                                                <%-- Status--%>
                                                                                <asp:TemplateField HeaderText="Status">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status")%>' Visible="false"></asp:Label>
                                                                                        <asp:Label ID="lblStatusDesc" runat="server" Text='<%#Eval("PDC_Current_Status_Desc")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Revised Status">
                                                                                    <ItemTemplate>
                                                                                        <asp:DropDownList ID="ddlPDCStatus" runat="server" CssClass="md-form-control form-control login_form_content_input" ToolTip="Revised Status"
                                                                                            AutoPostBack="true" OnSelectedIndexChanged="ddlPDCStatus_SelectedIndexChanged">
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="150px"></ItemStyle>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Revised Bank Date" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txtRevisedBankDate" runat="server" Text='<%# Bind("REVISED_BANKDATE")%>'
                                                                                            class="md-form-control form-control login_form_content_input requires_true" ToolTip="Revised Bank Date"></asp:TextBox>
                                                                                        <asp:Image ID="imgRevisedBankDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                                            ToolTip="Revised Bank Date" Visible="false" />
                                                                                        <cc1:CalendarExtender ID="ceRevisedBankDate" runat="server" Enabled="true"
                                                                                            PopupButtonID="imgRevisedBankDate" TargetControlID="txtRevisedBankDate">
                                                                                        </cc1:CalendarExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" Width="100px"></ItemStyle>
                                                                                </asp:TemplateField>

                                                                                <asp:TemplateField HeaderText="New Bank">
                                                                                    <ItemTemplate>
                                                                                        <uc:Suggest ID="ucgvDraweeBank" ToolTip="Drawee Bank" runat="server" ServiceMethod="GetDraweeBankList" WatermarkText="--Select--" />
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="220px" />
                                                                                </asp:TemplateField>

                                                                                <asp:TemplateField HeaderText="New Cheq. No">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txtgvNewInstrumentNumber" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                                            MaxLength="15" ToolTip="New Cheq. No" Style="text-align: right;"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="FTEInstrumentNo" runat="server" TargetControlID="txtgvNewInstrumentNumber"
                                                                                            FilterType="Numbers" Enabled="true">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="100px" HorizontalAlign="Right"></ItemStyle>
                                                                                </asp:TemplateField>

                                                                                <asp:TemplateField HeaderText="New MICR">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txtgvNewMICR" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                                            MaxLength="25" ToolTip="New MICR" ReadOnly="true"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="ftbxgvnewMICR" runat="server" TargetControlID="txtgvNewMICR"
                                                                                            FilterType="LowercaseLetters,UppercaseLetters,Numbers" Enabled="true">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="100px"></ItemStyle>
                                                                                </asp:TemplateField>

                                                                                <asp:TemplateField HeaderText="New Account No">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txtgvNewDraweeAccountNo" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                                            MaxLength="50" ToolTip="New Account No"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="ftbxgvNewDraweeAccountNo" runat="server" TargetControlID="txtgvNewDraweeAccountNo"
                                                                                            FilterType="LowercaseLetters,UppercaseLetters,Numbers" Enabled="true">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="100px"></ItemStyle>
                                                                                </asp:TemplateField>

                                                                                <asp:TemplateField HeaderText="New Instrument Date" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txtgvNewInstrumentDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <asp:Image ID="imggvNewInstrumentDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                                            ToolTip="New Instrument Date" Visible="false" />
                                                                                        <cc1:CalendarExtender ID="cegvNewInstrumentDate" runat="server" Enabled="true"
                                                                                            PopupButtonID="imggvNewInstrumentDate" TargetControlID="txtgvNewInstrumentDate">
                                                                                        </cc1:CalendarExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="150px"></ItemStyle>
                                                                                </asp:TemplateField>

                                                                                <asp:TemplateField HeaderText="New Amount" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txtgvNewInstrumentAmount" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="FTEAmount" runat="server" TargetControlID="txtgvNewInstrumentAmount"
                                                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="150px"></ItemStyle>
                                                                                </asp:TemplateField>

                                                                                <%-- Remarks--%>
                                                                                <asp:TemplateField HeaderText="Remarks" Visible="true">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txtRemarks" runat="server" MaxLength="60" TextMode="MultiLine" onkeyup="maxlengthfortxt(60);"
                                                                                            Text='<%# Eval("Remarks")%>' class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <%-- <asp:Label ID="lblTotal" runat="server" ContentEditable="true" ></asp:Label>--%>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" Width="100px"></ItemStyle>
                                                                                </asp:TemplateField>

                                                                                <%-- Other Charges--%>
                                                                                <asp:TemplateField HeaderText="Other Charges" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txtothercharges" runat="server" MaxLength="14" Text='<%# Eval("othercharges")%>'
                                                                                            ReadOnly="true" Style="border-color: White;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <%--<asp:Label ID="lblothercharges" runat="server" Text='<%#Eval("othercharges")%>'></asp:Label>--%>
                                                                                        <cc1:FilteredTextBoxExtender ID="FTEOtherchanrges" runat="server" TargetControlID="txtothercharges"
                                                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <%-- Total--%>
                                                                                <asp:TemplateField HeaderText="Total" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txttotal" runat="server" MaxLength="14" ContentEditable="false"
                                                                                            ReadOnly="true" Style="border-color: White;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <%-- <asp:Label ID="lblTotal" runat="server" ContentEditable="true" ></asp:Label>--%>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                                                </asp:TemplateField>

                                                                                <%-- User ID , txn_date--%>
                                                                                <asp:TemplateField HeaderText="user_id" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblUserID" runat="server" Text='<%#Eval("user_id")%>' Visible="false"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="txn_date" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblTxnDate" runat="server" Text='<%#Eval("txn_date")%>' Visible="false"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>

                                                                            </Columns>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:GridView>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </asp:Panel>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </cc1:TabPanel>

                                <cc1:TabPanel runat="server" HeaderText="ExistingPDC" ID="tbExistingPDC" CssClass="tabpan"
                                    BackColor="Red" ToolTip="Existing PDC" Width="99%" Enabled="false">
                                    <HeaderTemplate>
                                        Existing PDC
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpExisting" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Panel ID="pnlExistingPDC" runat="server" CssClass="stylePanel" GroupingText="Existing PDC"
                                                    Width="99%">
                                                    <div class="gird">
                                                        <asp:GridView runat="server" ID="GrvExisting" AutoGenerateColumns="false">
                                                            <Columns>
                                                                <%--Status--%>
                                                                <asp:TemplateField HeaderText="PDC Entry Number" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvexPDCEntryNumber" runat="server" Text='<%#Eval("PDC_Entry_No")%>'></asp:Label>
                                                                        <asp:Label ID="lblgvexPDCDetailID" runat="server" Text='<%#Eval("PDC_Details_ID")%>' Style="display: none;"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <%--Installment No--%>
                                                                <asp:TemplateField HeaderText="Inst.No" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvexInstallmentNo" runat="server" Text='<%#Eval("InstallmentNo")%>' Style="display: none;"></asp:Label>
                                                                        <asp:LinkButton ID="lnkbtngvexInstallmentNo" runat="server" Text='<%#Eval("InstallmentNo")%>' ToolTip="Inst.No" OnClick="lnkbtngvexInstallmentNo_Click" Style="color: red;"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <%--Installment Date--%>
                                                                <asp:TemplateField HeaderText="Cheque Date" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvexInstallmentDate" runat="server" Text='<%#Eval("InstallmentDate")%>'
                                                                            Style="padding-left: 20px"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <%--Instrument No--%>
                                                                <asp:TemplateField HeaderText="Cheq. No" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvexInstrumentNo" runat="server" Text='<%#Eval("InstrumentNo")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <%--Instrument Date--%>
                                                                <asp:TemplateField HeaderText="Banking Date" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvexstInstrumentDate" runat="server" Text='<%#Eval("Revised_Bank_Date")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <%--Amount--%>
                                                                <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvexAmount" runat="server" Text='<%#Eval("Amount")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <%--Drawee Bank--%>
                                                                <asp:TemplateField HeaderText="Drawee Bank" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvexDraweeBank" runat="server" Text='<%#Eval("Drawee_Bank_Name")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <%--MICR--%>
                                                                <asp:TemplateField HeaderText="MICR" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvexMICR" runat="server" Text='<%#Eval("MICR")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <%--Drawee Account No--%>
                                                                <asp:TemplateField HeaderText="Drawee Account No" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvexDraweeAccountNo" runat="server" Text='<%#Eval("Drawee_Account_No")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <%--Status--%>
                                                                <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgvexStatus" runat="server" Text='<%#Eval("Status_Desc")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                            <RowStyle HorizontalAlign="Center" />
                                                        </asp:GridView>
                                                    </div>
                                                </asp:Panel>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>

                            <div class="row" style="display: none" class="col">
                                <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                                <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                            </div>

                            <%-- <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 styleFieldLabel">--%>
                            <div align="right" class="fixed_btn">
                                <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('VGPDC'))" causesvalidation="false" onserverclick="btnSave_Click"
                                    runat="server" type="button" accesskey="S">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                </button>

                                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click"
                                    runat="server" type="button" accesskey="L" visible="false">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                </button>
                                <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click"
                                    runat="server" type="button" accesskey="X">
                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>
                            </div>
                            <%-- </div>
                            </div>--%>


                            <asp:Button ID="btnLoadCustomer" runat="server" Style="display: none" Text="Load Customer"
                                OnClick="btnLoadCustomer_OnClick" />

                            <asp:CustomValidator ID="CVPDCEntry" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" Width="98%" />
                            <asp:ValidationSummary runat="server" ID="vsPDCEntry" HeaderText="Correct the following validation(s):"
                                CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="false" ValidationGroup="VGPDC" />

                            <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>

                            <asp:TextBox runat="server" ID="txtPostingDate" Width="70%" ContentEditable="False"
                                Visible="false"></asp:TextBox>
                            <asp:Image ID="imgPostingDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Posting Date"
                                Visible="false" />
                            <asp:RequiredFieldValidator ID="RFVPostingDate" CssClass="validation_msg_box_sapn" runat="server"
                                ValidationGroup="VGPDC" ControlToValidate="txtPostingDate" Display="Dynamic"></asp:RequiredFieldValidator>
                            <cc1:CalendarExtender ID="CECPostingDate" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                PopupButtonID="imgPostingDate" TargetControlID="txtPostingDate">
                            </cc1:CalendarExtender>



                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>

        </div>
    </div>


    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <cc1:ModalPopupExtender ID="mpeViewStructure" runat="server" TargetControlID="btnModal" PopupControlID="pnlPDCHistory"
                BackgroundCssClass="styleModalBackground" Enabled="true" />
            <asp:Panel ID="pnlPDCHistory" Style="display: none; vertical-align: middle; padding-top: 50px;" runat="server"
                BorderStyle="Solid" BackColor="White" ScrollBars="None" Height="500px" Width="70%">
                <asp:UpdatePanel ID="updtpnlAccountStructure" runat="server">
                    <ContentTemplate>

                        <div id="divRepay" runat="server" class="gird" style="height: 400px; display: none;">
                            <asp:GridView ID="grvAccountStructure" runat="server" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField HeaderText="Account Number" DataField="Account Number" />
                                    <asp:TemplateField HeaderText="Installment Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvvsInstallmentAmount" runat="server" Text='<%#Eval("Installment Number")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>

                                    <asp:BoundField HeaderText="From Date" DataField="From Date" />
                                    <asp:BoundField HeaderText="To Date" DataField="To Date" />
                                    <asp:BoundField HeaderText="Installment Date" DataField="Installment Date" />
                                    <asp:TemplateField HeaderText="Installment Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvvsInstallmentAmount" runat="server" Text='<%#Eval("Installment Amount")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Insurance Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvvsInstallmentAmount" runat="server" Text='<%#Eval("Insurance Amount")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Other Charges">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvvsInstallmentAmount" runat="server" Text='<%#Eval("Other Charges")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div id="divStatus" runat="server" class="gird" style="height: 400px;">
                            <asp:GridView ID="grvPDCHistoryDetails" runat="server" AutoGenerateColumns="false" EmptyDataText="No History Found">
                                <Columns>
                                    <asp:TemplateField HeaderText="Start Date" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvhstStartDate" runat="server" Text='<%#Eval("Start_Date")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="End Date" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvhstEndDate" runat="server" Text='<%#Eval("End_Date")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvhstStatus" runat="server" Text='<%#Eval("Status")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Reason" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvrhstReason" runat="server" Text='<%#Eval("Reason")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvrhstRemarks" runat="server" Text='<%#Eval("Remarks")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div align="center">
                            <button class="css_btn_enabled" id="btnhldExit" title="Exit" causesvalidation="false" onserverclick="btnhldExit_ServerClick"
                                runat="server" type="button">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exit
                            </button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnhldExit" />
                    </Triggers>
                </asp:UpdatePanel>
            </asp:Panel>
            <asp:Button ID="btnModal" Style="display: none" runat="server" />
        </div>
    </div>

    <div class="row">
        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
            <cc1:ModalPopupExtender ID="mpeConfirmation" runat="server" TargetControlID="btnModal1" Enabled="true"
                PopupControlID="pnlConfirmation" BackgroundCssClass="styleModalBackground" CancelControlID="btnCanelModalCNF">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlConfirmation" runat="server" CssClass="styleTabPanel"
                Style="border: solid; width: 50%; background-color: white; display: block;">
                <asp:UpdatePanel ID="updtpnlConfirm" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="div1" runat="server" class="gird" style="height: 200px; display: block;">

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top: 25px;">
                                <asp:Literal runat="server" ID="lblAlertMessage" Text="12122"></asp:Literal>
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top: 25px;">
                                <div align="center">
                                    <button class="css_btn_enabled" id="btnModalCNF" title="Ok" causesvalidation="false" onserverclick="btnModalCNF_Click"
                                        runat="server" type="button">
                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Ok
                                    </button>
                                    <button class="css_btn_enabled" id="btnCanelModalCNF" title="Ok" causesvalidation="false" onserverclick="btnCanelModalCNF_ServerClick"
                                        runat="server" type="button">
                                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exit
                                    </button>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
            <asp:Button ID="btnModal1" Style="display: none" runat="server" />
        </div>
    </div>

</asp:Content>
