<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnBulkReceiptProcessing_Add, App_Web_k0kfymif" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        function fnLoadCustomer() {
            document.getElementById("<%= btnLoadCustomer.ClientID %>").click();

        }

        function fnLoadAccount() {
            document.getElementById('<%=btnLoadAccount.ClientID%>').click();
        }

        function fnTrashCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustomerCode.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustomerCode.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustomerCode.ClientID %>').value = "";


                }
            }
        }

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

        function fnSelectAllPDC(chkSelectAllPDC, chkPDC)        //
        {
            var gvPDC = document.getElementById('<%=grvPDCStatusSummary.ClientID%>');
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
            var gv = document.getElementById('<%= grvPDCStatusSummary.ClientID%>');
            var chk = document.getElementById('ctl00_ContentPlaceHolder1_grvPDCStatusSummary_ctl01_cbxSelectAll');

            if (chkSelect.checked == false) {
                chk.checked = false;
            }
            else {
                var gvRwCnt = gv.rows.length - 2;
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

    <asp:UpdatePanel ID="updtpnlPDCPicklist" runat="server">
        <ContentTemplate>

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
                            <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" GroupingText="General">
                                <div class="row">

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtPicklistNumber" ToolTip="Picklist Number" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblPicklistNumber" runat="server" Text="Picklist Number" CssClass="styleDisplayLabel"></asp:Label>
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
                                                <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLOB" runat="server" Display="Dynamic" InitialValue="0"
                                                    ControlToValidate="ddlLOB" SetFocusOnError="True" ValidationGroup="GenRcpt" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                                ToolTip="Branch" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBranch" runat="server" Text="Branch" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" Display="Dynamic" InitialValue="0" Enabled="false"
                                                    ControlToValidate="ddlBranch" SetFocusOnError="True" ValidationGroup="GenRcpt" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDepositBank" ToolTip="Deposit Bank" runat="server" class="md-form-control form-control" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlDepositBank_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Deposit Bank" ID="lblDepositBank" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvDepositBank" runat="server" Display="Dynamic" InitialValue="0" Enabled="false"
                                                    ControlToValidate="ddlDepositBank" SetFocusOnError="true" ValidationGroup="GenRcpt" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlPicklistType" ToolTip="Picklist Type" runat="server" class="md-form-control form-control" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlPicklistType_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Picklist Type" ID="lblPicklistType" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvPicklistType" runat="server" Display="Dynamic" InitialValue="0"
                                                    ControlToValidate="ddlPicklistType" SetFocusOnError="true" ValidationGroup="GenRcpt" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtBankingFromDate" AutoPostBack="True" ToolTip="Banking From Date" class="md-form-control form-control login_form_content_input requires_true"
                                                OnTextChanged="txtBankingFromDate_TextChanged"></asp:TextBox>
                                            <asp:Image ID="imgPDCDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Banking From Date" Visible="false" />
                                            <cc1:CalendarExtender ID="ceBankingFromDate" runat="server" Enabled="True"
                                                PopupButtonID="imgPDCDate" TargetControlID="txtBankingFromDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBankingFromDate" runat="server" Text="Banking From Date" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvBankingFromDate" runat="server" ControlToValidate="txtBankingFromDate" Display="Dynamic"
                                                    ValidationGroup="GenRcpt" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtBankingToDate" ToolTip="Banking To Date" AutoPostBack="true"
                                                class="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtBankingToDate_TextChanged"></asp:TextBox>
                                            <asp:Image ID="imgBankToDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Banking To Date" Visible="false" />
                                            <cc1:CalendarExtender ID="ceBankingToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgBankToDate" TargetControlID="txtBankingToDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBankToDate" runat="server" Text="Banking To Date" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvBankingToDate" runat="server" ControlToValidate="txtBankingToDate" Display="Dynamic"
                                                    ValidationGroup="GenRcpt" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAccountCode" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                Style="display: none;" MaxLength="100"></asp:TextBox>
                                            <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both"
                                                OnItem_Selected="ucAccountLov_Item_Selected" strLOV_Code="ACC_ACCPKL" ServiceMethod="GetAccountList" />
                                            <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                Style="display: none" />
                                            <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Account Number" ID="lblprimeaccno" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCustomerCode" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                Style="display: none;" MaxLength="200"></asp:TextBox>
                                            <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" ToolTip="Customer/Entity"
                                                OnItem_Selected="ucCustomerCodeLov_Item_Selected" />

                                            <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" OnClick="btnLoadCustomer_Click"
                                                Style="display: none" /><input id="Hidden2" type="hidden" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code/Name" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlClearingType" runat="server" ToolTip="Clearing Type" class="md-form-control form-control" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlClearingType_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Clearing Type" ID="lblClearing_Type" CssClass="styleDisplayLabel" ToolTip="Clearing Type"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDraweeBank" runat="server" ToolTip="Drawee Bank" class="md-form-control form-control"
                                                OnSelectedIndexChanged="ddlDraweeBank_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Drawee Bank" ID="lblDraweeBank" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc:Suggest ID="ucDraweeBranch" ToolTip="Drawee Branch" runat="server" ServiceMethod="GetDraweeBranchList"
                                                IsMandatory="false" AutoPostBack="true" OnItem_Selected="ucDraweeBranch_Item_Selected" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Drawee Branch" ID="lblDraweeBranch" CssClass="styleDisplayLabel" ToolTip="Drawee Branch"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDraweeAccountNumber" runat="server" ToolTip="Drawee Bank Account No" class="md-form-control form-control login_form_content_input requires_true"
                                                AutoPostBack="true" OnTextChanged="txtDraweeAccountNumber_TextChanged" MaxLength="50">
                                            </asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="ftbeAccountNumber" runat="server" TargetControlID="txtDraweeAccountNumber"
                                                FilterType="LowercaseLetters,UppercaseLetters,Numbers" Enabled="true">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Drawee Bank Account No" ID="lblAccountNumber" CssClass="styleDisplayLabel" ToolTip="Drawee Bank Account No"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtChequeFromDate" ToolTip="Cheque Return From Date"
                                                class="md-form-control form-control login_form_content_input requires_true" AutoPostBack="true" OnTextChanged="txtChequeFromDate_TextChanged"></asp:TextBox>
                                            <asp:Image ID="imgChequeFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Cheque Return From Date" Visible="false" />
                                            <cc1:CalendarExtender ID="ceChequeFromDate" runat="server" Enabled="True"
                                                PopupButtonID="imgChequeFromDate" TargetControlID="txtChequeFromDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblChequeFromDate" runat="server" Text="Cheque Return From Date" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtChequeToDate" ToolTip="Cheque Return To Date"
                                                class="md-form-control form-control login_form_content_input requires_true" AutoPostBack="true" OnTextChanged="txtChequeToDate_TextChanged"></asp:TextBox>
                                            <asp:Image ID="imgChequeToDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Cheque Return To Date" Visible="false" />
                                            <cc1:CalendarExtender ID="ceChequeToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgChequeToDate" TargetControlID="txtChequeToDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblChequeToDate" runat="server" Text="Cheque Return To Date" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>
                                    <%--Added on 03-Sep-2019 Starts Here WRF Live Observation
                                        To provide cheque date filter WRF Live Observation--%>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <%--<div class="md-input">--%>

                                        <asp:RadioButtonList ID="rbbtnlstDateType" runat="server" RepeatDirection="Vertical">
                                            <asp:ListItem>Banking Date</asp:ListItem>
                                            <asp:ListItem>Cheque Date</asp:ListItem>
                                        </asp:RadioButtonList>

                                        <%--</div>--%>
                                    </div>
                                    <%--Added on 03-Sep-2019 Ends Here WRF Live Observation--%>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div align="center">
                        <button class="css_btn_enabled" id="btnGetCheques" title="Get Cheques[Alt+Q]" onclick="if(fnCheckPageValidators('GenRcpt',false))" causesvalidation="false" onserverclick="btnGetCheques_ServerClick"
                            runat="server" type="button" accesskey="Q">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;Get Che<u>q</u>ues
                        </button>
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('GenRcpt'))" causesvalidation="false" onserverclick="btnSave_ServerClick"
                            runat="server" type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnExcel" title="Export Cheque Details[Alt+P]" causesvalidation="false" onserverclick="btnExcel_ServerClick"
                            runat="server" type="button" accesskey="P">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Ex<u>p</u>ort
                        </button>
                        <button class="css_btn_enabled" id="btnPDF" title="PDF[Alt+Shift+D]" causesvalidation="false" onserverclick="btnPDF_ServerClick"
                            runat="server" type="button" accesskey="D">
                            <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;P<u>D</u>F
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_ServerClick"
                            runat="server" type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_ServerClick"
                            runat="server" type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>

                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlCheque" runat="server" CssClass="stylePanel" GroupingText="Cheque Details">
                                <div class="gird">
                                    <asp:GridView ID="grvPDCStatusSummary" runat="server" CssClass="styleInfoLabel" AutoGenerateColumns="false" ToolTip="Cheque Details" EmptyDataText="No Records Found"
                                        ShowFooter="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Drawee Bank">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblgvDraweeBankID" runat="server" Text='<%# Eval("Drawee_Bank_ID") %>' Visible="false" />
                                                    <asp:Label ID="lblgvDraweeBankName" runat="server" Text='<%# Eval("Drawee_Bank_Name") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PDC Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPDCStatusID" runat="server" Text='<%# Eval("Status_ID") %>' Visible="false" />
                                                    <asp:Label ID="lblPDCStatusDesc" runat="server" Text='<%# Eval("Status_Desc") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblgvftrTotalDesc" runat="server" Text="Total" CssClass="styleDisplayLabel" />
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cheque Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPDCCount" runat="server" Text='<%# Eval("PDC_Cheque_Count") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblgvftrTotalCheque" runat="server" CssClass="styleDisplayLabel" />
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cheque Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPDCChequeAmount" runat="server" Text='<%# Eval("Total_Cheque_Amount") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblgvftrTotalAmount" runat="server" CssClass="styleDisplayLabel" />
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbxSelectAll" runat="server" OnClick="javascript:fnSelectAllPDC(this,'cbxSelect');" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbxSelect" runat="server" OnClick="javascript:fnSelectPDC(this);" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <asp:ValidationSummary runat="server" ID="vsPDC" HeaderText="Correct the following validation(s):"
                        Height="177px" CssClass="styleMandatoryLabel" ShowMessageBox="false"
                        ShowSummary="false" ValidationGroup="GenRcpt" />
                    <asp:CustomValidator ID="cvPDC" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>
                    <asp:Label ID="lblErrorMessage" runat="server" Style="color: Red; font-size: medium"></asp:Label>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
            <asp:PostBackTrigger ControlID="btnPDF" />
        </Triggers>
    </asp:UpdatePanel>


</asp:Content>
