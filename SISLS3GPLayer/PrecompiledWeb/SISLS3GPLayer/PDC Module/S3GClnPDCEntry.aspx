<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnPDCEntry, App_Web_lpzlcdye" title="PDC Entry" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">

        function Calculate(amt, other, total, suftxn_datefixlen) {

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

        function fnLoadAccount() {
            document.getElementById('<%=btnLoadAccount.ClientID%>').click();
        }
        //Added By Arunkumar K on 02-Aug-2016 For CR 010 
        function instrchanged() {
           <% Session["hdnValue"] = "2";  %>
        }
        //Added By Arunkumar K on 02-Aug-2016 For CR 010 

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
                    $get("<%=txtTransactionDate.ClientID %>").focus();
                }
            }
        }

        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {

            var TC = $find("<%=tcPDCEntry.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=txtTransactionDate.ClientID %>").focus();
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

        function fnTrashAccountCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtAccountCode.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtAccountCode.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtAccountCode.ClientID %>').value = "";
                }
            }
        }

        function fnTrashCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtFactCustomerLov.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtFactCustomerLov.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtFactCustomerLov.ClientID %>').value = "";
                }
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
                    <asp:UpdatePanel ID="upanelPDCEntry" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <cc1:TabContainer ID="tcPDCEntry" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                                ScrollBars="None">
                                <cc1:TabPanel runat="server" HeaderText="General" ID="tbgeneral" CssClass="tabpan" BackColor="Red" ToolTip="General">
                                    <HeaderTemplate>
                                        General
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:UpdatePanel ID="UpGeneral" runat="server">
                                                    <ContentTemplate>

                                                        <asp:Panel ID="pnlGeneral" runat="server" CssClass="stylePanel" GroupingText="General">

                                                            <div class="row">

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox runat="server" ID="txtTransactionDate" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:Image ID="imgTransactionDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                            ToolTip="Collection Date" Visible="false" />
                                                                        <cc1:CalendarExtender ID="CECTransactiondate" runat="server" Enabled="false" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                                            PopupButtonID="imgTransactionDate" TargetControlID="txtTransactionDate">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Collection Date" ID="lblTransactionDate" CssClass="styleReqFieldLabel" ToolTip="Collection Date"></asp:Label>
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

                                                                                <asp:TextBox ID="txtAccountCode" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                                    Style="display: none;" MaxLength="100"></asp:TextBox>
                                                                                <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both"
                                                                                    OnItem_Selected="ucAccountLov_Item_Selected" strLOV_Code="ACC_ACCPDC" ServiceMethod="GetAccountList" />
                                                                                <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                                                    Style="display: none" />
                                                                                <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" Text="Account Number" ID="lblprimeaccno" CssClass="styleDisplayLabel"></asp:Label>
                                                                                </label>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvAccountCode" CssClass="validation_msg_box_sapn"
                                                                                        runat="server" ControlToValidate="txtAccountCode" ValidationGroup="VGPDC"
                                                                                        Display="Dynamic" ErrorMessage="Select the Account Number"></asp:RequiredFieldValidator>
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
                                                                        <uc4:ICM ID="ucCustomerCodeLov" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                            strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" Visible="true" />

                                                                        <asp:HiddenField ID="hdnCustId" runat="server" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code / Name" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtFactCustomerLov" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                            Style="display: none;" MaxLength="100"></asp:TextBox>
                                                                        <uc4:ICM ID="ucFactCustomerLov" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                            ServiceMethod="GetFactoringCustomerList" Visible="true" OnItem_Selected="ucFactCustomerLov_Item_Selected" ToolTip="Factoring Customer Name" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblFactoringCustomerName" runat="server" Text="Factoring Customer Name" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvFactCustomerLov" CssClass="validation_msg_box_sapn"
                                                                                runat="server" ControlToValidate="txtFactCustomerLov" ValidationGroup="VGPDC"
                                                                                Display="Dynamic" ErrorMessage="Enter Factoring Customer Name"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox runat="server" ID="txtPDCEntryNo" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="PDC Entry Number" ID="lblPDCEntryNo" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>



                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                                            ToolTip="Line of Business" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlBranch" runat="server" class="md-form-control form-control" ToolTip="Branch">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Branch" ID="lblBranch" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlPDCNature" runat="server" ToolTip="PDC Nature" AutoPostBack="true" OnSelectedIndexChanged="ddlPDCNature_SelectedIndexChanged"
                                                                            class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="PDC Nature" ID="lblPDCNature" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvPDCNature" CssClass="validation_msg_box_sapn"
                                                                                runat="server" ControlToValidate="ddlPDCNature" InitialValue="0" ValidationGroup="VGPDC"
                                                                                Display="Dynamic" ErrorMessage="Select the PDC Nature"></asp:RequiredFieldValidator>
                                                                        </div>
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
                                                                        <cc1:FilteredTextBoxExtender ID="ftbxNoofPDC" runat="server" TargetControlID="txtNoofPDC"
                                                                            FilterType="Numbers" Enabled="true">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="No. of PDC" ID="lblNoofPDC" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RFVNoofPDC" CssClass="validation_msg_box_sapn" runat="server"
                                                                                ValidationGroup="VGPDC" ControlToValidate="txtNoofPDC" Display="Dynamic" ErrorMessage="Enter the Number of PDC"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox runat="server" ID="txtFromInstallmentNo" MaxLength="3" onkeypress="fnAllowNumbersOnly(false,false,this);"
                                                                            class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftbxFromInstallmentNo" runat="server" TargetControlID="txtFromInstallmentNo"
                                                                            FilterType="Numbers" Enabled="true">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="From Installment No" ID="lblFromInstallmentNo" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvFromInstallmentNo" CssClass="validation_msg_box_sapn" runat="server"
                                                                                ValidationGroup="VGPDC" ControlToValidate="txtFromInstallmentNo" Display="Dynamic" ErrorMessage="Enter the From Installment No"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlInstrmentSequence" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlInstrmentSequence_SelectedIndexChanged"
                                                                            ToolTip="Instrument Sequence" Style="border-color: White; border-bottom-style: double;" class="md-form-control form-control"
                                                                            BackColor="White">
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
                                                                        <asp:TextBox runat="server" ID="txtInstrumentStartNo" MaxLength="15"
                                                                            onkeypress="fnAllowNumbersOnly(false,false,this);" AutoPostBack="true" OnTextChanged="txtInstrumentStartNo_TextChanged"
                                                                            class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftbeInstrumentStartNo" runat="server" TargetControlID="txtInstrumentStartNo"
                                                                            FilterType="Numbers" Enabled="true">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Cheque Start Number" ID="lblInstrumentStartNo" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RFVInstrumentStartNo" CssClass="validation_msg_box_sapn"
                                                                                runat="server" ValidationGroup="VGPDC" ControlToValidate="txtInstrumentStartNo"
                                                                                Display="Dynamic" ErrorMessage="Enter the Cheque Start Number"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlCategory" runat="server" ToolTip="Collateral category" Enabled="false" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Collateral category" ID="lblCategory" CssClass="styleDisplayLabel" ToolTip="Collateral category"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <uc:Suggest ID="ddlDraweeBank" ToolTip="Drawee Bank" runat="server" AutoPostBack="true"
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
                                                                        <asp:TextBox ID="txtAccountNumber" runat="server" ToolTip="Drawee Bank Account No" AutoPostBack="true" MaxLength="50"
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
                                                                        <asp:TextBox ID="txtMICR" runat="server" AutoPostBack="true" OnTextChanged="txtMICR_TextChanged" ToolTip="MICR" MaxLength="25"
                                                                            class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true">
                                                                        </asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftbeMICR" runat="server" TargetControlID="txtMICR"
                                                                            FilterType="LowercaseLetters,UppercaseLetters,Numbers" Enabled="true">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="MICR" ID="lblMICR" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                        <%--<div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvMICR" CssClass="validation_msg_box_sapn" runat="server"
                                                                                ControlToValidate="txtMICR" ValidationGroup="VGPDC" Display="Dynamic" ErrorMessage="Enter the MICR Number"></asp:RequiredFieldValidator>
                                                                        </div>--%>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAuthorizedSign" runat="server" MaxLength="100" ToolTip="Authorized Signatory"
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
                                                                        <asp:DropDownList ID="ddlClearingType" runat="server" ToolTip="Clearing Type" class="md-form-control form-control"></asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Clearing Type" ID="lblClearing_Type" CssClass="styleDisplayLabel" ToolTip="Clearing Type"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlOperatingBranch" runat="server" class="md-form-control form-control" ToolTip="Operating Branch"></asp:DropDownList>
                                                                        <uc:Suggest ID="sugOperatingBranch" ToolTip="Operating Branch" runat="server"
                                                                            ServiceMethod="GetBranchList"
                                                                            IsMandatory="false" ValidationGroup="VGPDC" ErrorMessage="Select a Operating Branch" WatermarkText="--Select--" Visible="false" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Operating Branch" ID="lblOperatingBranch" CssClass="styleDisplayLabel" ToolTip="Operating Branch"></asp:Label></td>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlIssuerBy" runat="server" ToolTip="Issuer By" class="md-form-control form-control"
                                                                            AutoPostBack="true" OnSelectedIndexChanged="ddlIssuerBy_SelectedIndexChanged">
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
                                                                            ToolTip="Given By" MaxLength="100"></asp:TextBox>
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

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlDepositBankCodes" runat="server" 
                                                                            CssClass="md-form-control form-control requires_true" ToolTip="Deposit Bank" 
                                                                             AutoPostBack="true" OnSelectedIndexChanged="ddlDepositBankCodes_Item_Selected" >
                                                                        </asp:DropDownList>
                                                                       
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
                                                                        <button class="css_btn_enabled" id="btnGo" title="Go,[Alt+G]" onclick="if(fnCheckPageValidators('VGPDC','false'))" causesvalidation="false" onserverclick="btnGo_Click"
                                                                            runat="server" type="button" accesskey="G">
                                                                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                                        </button>
                                                                    </div>
                                                                </div>



                                                                <asp:HiddenField ID="hidcuscode" runat="server" />
                                                                <asp:HiddenField ID="hidinststatus" runat="server" EnableViewState="true" />
                                                                <asp:HiddenField ID="hdnFromInstallmentNo" runat="server" />
                                                                <asp:HiddenField ID="hdnmaxInstallmentNo" runat="server" />

                                                            </div>
                                                        </asp:Panel>

                                                        <div>
                                                            <asp:UpdatePanel ID="UpPDCDetails" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:Panel ID="pnlGRDSeqYes" runat="server" CssClass="stylePanel" GroupingText="PDC Information"
                                                                        Visible="false">
                                                                        <div class="gird">
                                                                            <asp:GridView runat="server" ID="GRVPDCDetails" AutoGenerateColumns="False" OnRowDataBound="GRVPDCDetails_RowDataBound" 
                                                                                ToolTip="PDC Entry Details" EmptyDataText="No Pending Installments found">
                                                                                <Columns>
                                                                                    <%--Prime A/c No--%>
                                                                                    <asp:TemplateField HeaderText="Account Number" Visible="false">
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
                                                                                    <%--Installment No--%>
                                                                                    <asp:TemplateField HeaderText="Inst.No">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblInstallmentNo" runat="server" Text='<%#Eval("InstallmentNo")%>' ToolTip="Inst.No"></asp:Label>
                                                                                            <asp:LinkButton ID="lnkbtnInstallmentNo" runat="server" Text='<%#Eval("InstallmentNo")%>' ToolTip="Inst.No" OnClick="lnkbtnInstallmentNo_Click" Style="color: red;"></asp:LinkButton>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                    </asp:TemplateField>
                                                                                    <%--Installment Date--%>
                                                                                    <asp:TemplateField HeaderText="Cheque Date">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblInstallmentDate" runat="server" Text='<%#Eval("InstallmentDate")%>' ToolTip="Inst. Date"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left" Width="100px"></ItemStyle>
                                                                                    </asp:TemplateField>
                                                                                    <%--Installment Amount--%>
                                                                                    <asp:TemplateField HeaderText="Installment Amount">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblgvInstallmentAmount" runat="server" Text='<%#Eval("Installment_Amount")%>' ToolTip="Installment Amount"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                    </asp:TemplateField>
                                                                                    <%--Insurance--%>
                                                                                    <asp:TemplateField HeaderText="Insurance">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblgvInsurance" runat="server" Text='<%#Eval("Insurance")%>' ToolTip="Insurance"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                    </asp:TemplateField>
                                                                                    <%--Other Charges--%>
                                                                                    <asp:TemplateField HeaderText="Other Charges">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblgvOtherCharges" runat="server" Text='<%#Eval("othercharges")%>' ToolTip="Other Charges"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                    </asp:TemplateField>
                                                                                    <%-- Status--%>
                                                                                    <asp:TemplateField HeaderText="Status">
                                                                                        <ItemTemplate>
                                                                                            <asp:DropDownList ID="ddlPDCStatus" runat="server" OnSelectedIndexChanged="ddlPDCStatus_SelectedIndexChanged"
                                                                                                AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input" ToolTip="Status">
                                                                                            </asp:DropDownList>
                                                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status")%>' Visible="false"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle Width="10%" />
                                                                                    </asp:TemplateField>
                                                                                    <%--  Instrument No--%>
                                                                                    <asp:TemplateField HeaderText="Cheq. No">
                                                                                        <ItemTemplate>
                                                                                            <%--<div class="md-input">--%>
                                                                                            <asp:TextBox ID="txtInstrumentNo" runat="server" MaxLength="15" Text='<%# Bind("InstrumentNo")%>' onchange="instrchanged()"
                                                                                                class="md-form-control form-control login_form_content_input requires_true" ToolTip="Cheq. No"
                                                                                                Style="text-align: right;"></asp:TextBox>
                                                                                            <cc1:FilteredTextBoxExtender ID="FTEInstrumentNo" runat="server" TargetControlID="txtInstrumentNo"
                                                                                                FilterType="Numbers" Enabled="true">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <%--</div>--%>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                                    </asp:TemplateField>
                                                                                    <%--Instrument Date--%>
                                                                                    <asp:TemplateField HeaderText="Cheq. Date">
                                                                                        <ItemTemplate>
                                                                                            <%--<div class="md-input">--%>
                                                                                            <asp:TextBox ID="txtInstrumentDate" runat="server" Text='<%# Bind("InstrumentDate")%>' ToolTip="Cheq. Date"
                                                                                                ContentEditable="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                            <cc1:CalendarExtender ID="CECInstrumentDate" runat="server" Enabled="true" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate"
                                                                                                TargetControlID="txtInstrumentDate">
                                                                                            </cc1:CalendarExtender>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <%--</div>--%>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                                    </asp:TemplateField>

                                                                                    <%--MICR--%>
                                                                                    <asp:TemplateField HeaderText="MICR" Visible="false">
                                                                                        <ItemTemplate>
                                                                                            <%--<div class="md-input">--%>
                                                                                            <asp:TextBox ID="txtMICRD" runat="server" MaxLength="25" Text='<%# Bind("MICR")%>' ToolTip="MICR"
                                                                                                class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                                                            <cc1:FilteredTextBoxExtender ID="ftbegvMICRD" runat="server" TargetControlID="txtMICRD"
                                                                                                FilterType="LowercaseLetters,UppercaseLetters,Numbers" Enabled="true">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <%--</div>--%>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                                    </asp:TemplateField>

                                                                                    <%-- Amount--%>
                                                                                    <asp:TemplateField HeaderText="Amount">
                                                                                        <ItemTemplate>
                                                                                            <%--<div class="md-input">--%>
                                                                                            <asp:TextBox ID="txtAmount" runat="server" Text='<%# Bind("Amount")%>' ToolTip="Amount"
                                                                                                class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                                                            <cc1:FilteredTextBoxExtender ID="FTEAmount" runat="server" TargetControlID="txtAmount"
                                                                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <%--</div>--%>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField HeaderText="Drawee Bank">
                                                                                        <ItemTemplate>
                                                                                            <%--<div class="md-input">--%>
                                                                                            <uc:Suggest ID="ucgvDraweeBank" ToolTip="Drawee Bank" runat="server"
                                                                                                ServiceMethod="GetDraweeBankList" WatermarkText="--Select--" AutoPostBack="true" 
                                                                                                OnItem_Selected="ucgvDraweeBank_Item_Selected" />
                                                                                            <asp:Label ID="lblgvDraweeBankID" runat="server" Text='<%#Eval("Drawee_Bank_ID")%>' Visible="false"></asp:Label>
                                                                                            <asp:Label ID="lblgvDraweeBankName" runat="server" Text='<%#Eval("Drawee_Bank_Name")%>' Visible="false"></asp:Label>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <%--</div>--%>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle Width="200px" />
                                                                                    </asp:TemplateField>

                                                                                     <asp:TemplateField HeaderText="Deposit Bank">
                                                                                        <ItemTemplate>
                                                                                            <%--<div class="md-input">--%>

                                                                                            <asp:DropDownList ID="ddlDepositBank" runat="server" 
                                                                                                CssClass="md-form-control form-control login_form_content_input" ToolTip="Deposit Bank">
                                                                                            </asp:DropDownList>

                                                                                            <asp:Label ID="lblgvDepositBankID" runat="server" Text='<%#Eval("Deposit_Bank_ID")%>' Visible="false"></asp:Label>                                                                                            
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <%--</div>--%>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle Width="100px" />
                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField HeaderText="Drawee Account No">
                                                                                        <ItemTemplate>
                                                                                            <%--<div class="md-input">--%>
                                                                                            <asp:TextBox ID="txtDraweeAccountNo" runat="server" Text='<%# Eval("Drawee_Account_No")%>' ToolTip="Drawee Account No"
                                                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <%--</div>--%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>

                                                                                    <%-- Remarks--%>
                                                                                    <asp:TemplateField HeaderText="Remarks">
                                                                                        <ItemTemplate>
                                                                                            <%--<div class="md-input">--%>
                                                                                            <asp:TextBox ID="txtRemarks" runat="server" MaxLength="60" TextMode="MultiLine" ToolTip="Remarks" onkeyup="maxlengthfortxt(60);"
                                                                                                class="md-form-control form-control login_form_content_input requires_true" Text='<%# Eval("Remarks")%>'></asp:TextBox>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <%--</div>--%>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                                    </asp:TemplateField>

                                                                                    <%-- Revised Bank Date 15--%>
                                                                                    <asp:TemplateField HeaderText="Banking Date">
                                                                                        <ItemTemplate>
                                                                                            <asp:TextBox ID="txtgvBankingDate" runat="server" Text='<%# Eval("Revised_Bank_Date")%>' ToolTip="Banking Date"
                                                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                            <asp:Image ID="imggvBankingDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                                                ToolTip="Banking Date" Visible="false" />
                                                                                            <cc1:CalendarExtender ID="CEgvBankingDate" runat="server" PopupButtonID="imggvBankingDate" TargetControlID="txtgvBankingDate">
                                                                                            </cc1:CalendarExtender>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField HeaderText="Tax" Visible="false">
                                                                                        <ItemTemplate>
                                                                                            <asp:TextBox ID="txtTax" runat="server" MaxLength="14" Text='<%# Eval("Tax")%>'
                                                                                                ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                            <cc1:FilteredTextBoxExtender ID="FTETax" runat="server" TargetControlID="txtTax"
                                                                                                FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                        </ItemTemplate>
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
                                                                    </asp:Panel>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>

                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnViewStructure" />
                                                        <asp:PostBackTrigger ControlID="btnGo" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="ExistingPDC" ID="tbExistingPDC" CssClass="tabpan"
                                    BackColor="Red" ToolTip="Existing PDC" Enabled="false">
                                    <HeaderTemplate>
                                        Existing PDC
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:UpdatePanel ID="UpExisting" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Panel ID="pnlExistingPDC" runat="server" CssClass="stylePanel" GroupingText="Existing PDC">
                                                            <div class="gird">
                                                                <asp:GridView runat="server" ID="GrvExisting" AutoGenerateColumns="false">
                                                                    <Columns>
                                                                        <%--Status--%>
                                                                        <asp:TemplateField HeaderText="PDC Entry Number" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvexPDCEntryNumber" runat="server" Text='<%#Eval("PDC_Entry_No")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <%--Installment No--%>
                                                                        <asp:TemplateField HeaderText="Inst.No" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgvexInstallmentNo" runat="server" Text='<%#Eval("InstallmentNo")%>'></asp:Label>
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
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>

            <div class="row" style="display: none" class="col">
                <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
            </div>
            <div class="btn_height"></div>
            <div align="right" class="fixed_btn">
                <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('VGPDC'))" causesvalidation="false" onserverclick="btnSave_Click"
                    runat="server" type="button" accesskey="S">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click"
                    runat="server" type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
                <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click"
                    runat="server" type="button" accesskey="X">
                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                </button>
            </div>

            <div>
                <asp:CustomValidator ID="CVPDCEntry" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
                <asp:ValidationSummary runat="server" ID="vsPDCEntry" HeaderText="Correct the following validation(s):"
                    CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="false" ValidationGroup="VGPDC" />
                <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
            <cc1:ModalPopupExtender ID="mpeViewStructure" runat="server" TargetControlID="btnModal" PopupControlID="pnlAccountStructure"
                BackgroundCssClass="styleModalBackground" Enabled="true" />
            <asp:Panel ID="pnlAccountStructure" Style="display: none; vertical-align: middle; padding-top: 50px;" runat="server"
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

                        <div id="divReceipt" runat="server" class="gird" style="height: 400px; display: none;">
                            <asp:GridView ID="grvReceiptDetails" runat="server" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField HeaderText="Inst.No" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvrcptInstNo" runat="server" Text='<%#Eval("Installment_No")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cheque Date" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvrcptInstDate" runat="server" Text='<%#Eval("Installment_Date")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bank Date" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvrcptBankDate" runat="server" Text='<%#Eval("Bank_Date")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Installment Amount" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvrcptInstAmount" runat="server" Text='<%#Eval("Installment_Amount")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Others" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvrcptOthers" runat="server" Text='<%#Eval("Others")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Receipt No" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvrcptReceiptNo" runat="server" Text='<%#Eval("Receipt_No")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Challan No" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvrcptChallanNo" runat="server" Text='<%#Eval("Challan_No")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Deposit Bank" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvrcptDepositBank" runat="server" Text='<%#Eval("Deposit_Bank")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cheque Return No" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgvrcptChequeReturnNo" runat="server" Text='<%#Eval("Cheque_Return_No")%>'></asp:Label>
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
                <div id="div1" runat="server" class="gird" style="height: 200px; display: block;">

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top: 25px;">
                        <asp:Literal runat="server" ID="lblAlertMessage"></asp:Literal>
                    </div>

                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-top: 25px;">
                        <div align="center">
                            <button class="css_btn_enabled" id="btnModalCNF" title="Ok" causesvalidation="false" onserverclick="btnModalCNF_Click"
                                runat="server" type="button">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Ok
                            </button>
                            <button class="css_btn_enabled" id="btnCanelModalCNF" title="Ok" causesvalidation="false"
                                runat="server" type="submit">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exit
                            </button>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Button ID="btnModal1" Style="display: none" runat="server" />
        </div>
    </div>

</asp:Content>
