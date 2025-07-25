<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnChequeReturn_Add, App_Web_la20gqab" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GCustomerAddress.ascx" TagName="CustomerDetails"
    TagPrefix="CD" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">

        function ChequeCancelmsg() {
            if (confirm('Do you want to cancel the Cheque return?')) {
                return true;
            }
            else
                return false;
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


    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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

                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="Panel2" runat="server" GroupingText="Cheque/Receipt Information" CssClass="stylePanel">
                        <div class="row">

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business" class="md-form-control form-control"
                                        AutoPostBack="true" Visible="true" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvLOB" runat="server" SetFocusOnError="true" ValidationGroup="btnSave"
                                            ControlToValidate="ddlLOB" InitialValue="0" CssClass="validation_msg_box_sapn"
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Branch" class="md-form-control form-control"
                                        AutoPostBack="true" Visible="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblBranch" runat="server" Text="Branch" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvBranch" runat="server" SetFocusOnError="true" ValidationGroup="btnSave"
                                            ControlToValidate="ddlBranch" InitialValue="0" CssClass="validation_msg_box_sapn"
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <uc:Suggest ID="ddlchequeNumber" runat="server" ServiceMethod="GetChequeList" IsMandatory="true"
                                        ValidationGroup="btnSave" AutoPostBack="true" OnItem_Selected="ddlchequeNumber_Item_Selected"
                                        ToolTip="Cheque Number - Receipt Number" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblChequeNo" runat="server" Text="Cheque Number" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                <div class="row" style="width: 95%; overflow: hidden;">
                                    <div style="width: 90%; vertical-align: bottom;">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtReceiptNumber" runat="server" MaxLength="50" OnTextChanged="txtReceiptNumber_OnTextChanged"
                                                AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                            <cc1:FilteredTextBoxExtender ID="ftbeReceiptNumber" runat="server" TargetControlID="txtReceiptNumber"
                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"
                                                ValidChars="/-">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Receipt Number" ID="lblReceiptNo" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvReceiptNumber" runat="server" SetFocusOnError="true" ValidationGroup="btnSave"
                                                    ControlToValidate="txtReceiptNumber" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="width: 10%;">
                                        <div class="md-input">
                                            <button class="btn_5" id="btnViewReceipt" title="View Receipt Details, Alt+V" causesvalidation="false" runat="server" type="button"
                                                accesskey="V" onserverclick="btnViewReceipt_ServerClick">
                                                <u>V</u>R+
                                            </button>
                                            <%--<asp:LinkButton ID="lnkReceiptView" runat="server" Text="View Receipt" Style="color: red; text-underline-position: below;" ToolTip="View Receipt Details"
                                            Enabled="false" OnClick="lnkReceiptView_Click"></asp:LinkButton>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtChequeRetNo" runat="server" ToolTip="Cheque Return Number"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Cheque Return Number" ID="lblChkRetNo" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" DispalyContent="Both"
                                        strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" ToolTip="Customer Name" Enabled="false" />
                                    <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="true" UseSubmitBehavior="false"
                                        Style="display: none" />
                                    <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name">  </asp:TextBox>
                                    <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <uc:Suggest ID="ddlDraweeBank" runat="server" ServiceMethod="GetDraweeBankList" IsMandatory="true" ValidationGroup="btnSave" AutoPostBack="true"
                                        OnItem_Selected="ddlDraweeBank_Item_Selected" ToolTip="Drawee Bank" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblDraweeBank" runat="server" Text="Drawee Bank" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <uc:Suggest ID="ddlDraweeBranch" runat="server" ServiceMethod="GetDraweeBranchList" IsMandatory="true" ValidationGroup="btnSave" AutoPostBack="true"
                                        OnItem_Selected="ddlDraweeBranch_Item_Selected" ToolTip="Drawee Branch" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblDraweeBranch" runat="server" Text="Drawee Branch" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtDocuDate" runat="server" ToolTip="Document Date"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Document Date" ID="lblDocuDate" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtChequeDate" runat="server" ToolTip="Receipt Date"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblChequeDate" runat="server" Text="Receipt Date" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtChequeInstrumentDate" runat="server" ToolTip="Cheque Date"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblChequeInstrumentDate" runat="server" Text="Cheque Date" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtChequeBankDate" runat="server" ToolTip="Bank Date"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblChequeBankDate" runat="server" Text="Bank Date" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlReceiptMode" runat="server" ToolTip="Instrument Type" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblReceiptMode" runat="server" Text="Instrument Type" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtRemarks" TextMode="MultiLine" MaxLength="200" onkeyup="maxlengthfortxt(200)" runat="server" ToolTip="Remarks"
                                        class="md-form-control form-control login_form_content_input requires_true lowercase"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblChequeRemarks" runat="server" Text="Remarks" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtDocumentGroupNo" runat="server" ToolTip="Document Group No"
                                        class="md-form-control form-control login_form_content_input requires_true lowercase" ReadOnly="true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblDocumentGroupNo" runat="server" Text="Document Group No" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel3" runat="server" GroupingText="Bank Information" CssClass="stylePanel">
                        <div class="row">

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtDepositBank" runat="server" ToolTip="Deposit Bank - Branch"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Deposit Bank - Branch" ID="lblDepositBank" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtAcNo" runat="server" ToolTip="Bank Account Number"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblBankAccountNumber" runat="server" Text="Bank Account Number" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtDepositDate" AutoPostBack="true" runat="server" ToolTip="Deposit Date"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Deposit Date" ID="lblDepositDate" CssClass="styleDisplayLabel" ToolTip="Deposit Date"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtChkAmt" runat="server" Style="text-align: right;" ToolTip="Cheque Amount"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Cheque Amount" ID="lblChequeAmount" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtBnkCharges" runat="server" ToolTip="Bank Charges" ReadOnly="true" Style="text-align: right;"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender runat="server" ID="FilteredTextBoxExtender2" FilterType="Numbers,Custom"
                                        TargetControlID="txtBnkCharges" ValidChars=".">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblBankCharges" runat="server" Text="Bank Charges" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rqvCharges" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                            ControlToValidate="txtBnkCharges" Display="Dynamic"
                                            ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtBankAdviceNo" runat="server" MaxLength="25" ToolTip="Bank Advice Number"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender runat="server" ID="FilteredTextBoxExtender3" FilterType="LowercaseLetters,Numbers,UppercaseLetters,Custom"
                                        TargetControlID="txtBankAdviceNo" ValidChars=" \/-()">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Bank Advice Number" ID="lblBankAdviceNumber" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rqvAdvice" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                            ControlToValidate="txtBankAdviceNo" Display="Dynamic" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtBankAdviceDate" runat="server" ToolTip="Bank Advice Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:CalendarExtender ID="ceBankAdviceDate" runat="server" Enabled="True" PopupButtonID="imgBankAdviceDate" TargetControlID="txtBankAdviceDate">
                                    </cc1:CalendarExtender>
                                    <asp:Image ID="imgBankAdviceDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblBankAdviceDate" runat="server" Text="Bank Advice Date" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvBankAdviceDate" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                            ValidationGroup="btnSave" ControlToValidate="txtBankAdviceDate" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlReasons" runat="server" ToolTip="--Select--" class="md-form-control form-control"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlReasons_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Reason for Return" ID="lblReturnReason" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rqvReasons" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                            ValidationGroup="btnSave" ControlToValidate="ddlReasons" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtNextDepositDate" AutoPostBack="false" OnTextChanged="txtNextDepositDate_TextChanged" runat="server"
                                        ToolTip="Revised Banking Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:CalendarExtender ID="ceReviseBankingDate" runat="server" Enabled="True" PopupButtonID="imgDocdate" TargetControlID="txtNextDepositDate">
                                    </cc1:CalendarExtender>
                                    <asp:Image ID="imgDocdate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblNextDepositDate" runat="server" Text="Revised Banking Date" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel4" runat="server" GroupingText="Account Level Cheque Amount" CssClass="stylePanel" Style="display: none;">
                        <div class="row">
                            <div class="gird">
                                <asp:GridView ID="grvCheque" runat="server" AutoGenerateColumns="false"
                                    HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" OnRowDataBound="grvCheque_RowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="Account No" DataField="PANum" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Sub Account No" Visible="false" DataField="SANum" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Account Description" DataField="Account Description"
                                            ItemStyle-HorizontalAlign="Left" />
                                        <asp:TemplateField HeaderText="Cheque Amount" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:Label ID="lblchequeAmt" runat="server" Text='<%#Bind("Transaction_Amount") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Cheque Amount" DataField="Transaction_Amount" ItemStyle-HorizontalAlign="Right"
                                            Visible="false" />
                                        <asp:BoundField HeaderText="VAT Amount" DataField="Taxamount" ItemStyle-HorizontalAlign="Right" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnlRevisedBankHistory" runat="server" GroupingText="Revised Bank History"
                        CssClass="stylePanel" Style="display: none;">
                        <div class="row">
                            <div class="gird">
                                <asp:GridView ID="grvRevisedBankHistory" runat="server" AutoGenerateColumns="false"
                                    HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" OnRowDataBound="grvRevisedBankHistory_RowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="Cheque Retun Advice No" DataField="CHEQUE_RETURN_ADVICE_NO" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Receipt No" DataField="RECEIPT_NO" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Cheque Number" DataField="CHEQUE_NUMBER"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Cheque Return Date" DataField="CHEQUE_DATE"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Remarks" DataField="REMARKS" ItemStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Rev.Banking Date" DataField="NEXT_DEPOSIT_DATE" ItemStyle-HorizontalAlign="Center" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </asp:Panel>

                </div>
            </div>

            <div class="btn_height"></div>
            <div align="right" class="fixed_btn">

                <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('btnSave'))" causesvalidation="false" onserverclick="btnSave_Click"
                    runat="server" type="button" accesskey="S">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                </button>
                <button class="css_btn_enabled" id="btnTranWithdrawl" title="Withdraw[Alt+W]" onclick="if(fnConfirmWithdraw('btnSave'))" causesvalidation="false" onserverclick="btnTranWithdrawl_ServerClick"
                    runat="server" type="button" accesskey="W">
                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>W</u>ithDraw
                </button>
                <button class="css_btn_enabled" id="btnPDF" title="Print[Alt+P]" causesvalidation="false" onserverclick="btnPDF_Click"
                    runat="server" type="button" accesskey="P">
                    <i class="fa fa-file-pdf-o" aria-hidden="true"></i></i>&emsp;<u>P</u>rint
                </button>
                <button class="css_btn_enabled" id="btnViewGroup" title="View Group[Alt+G]" causesvalidation="false" onserverclick="btnViewGroup_ServerClick"
                    runat="server" type="button" accesskey="G">
                    View <u>G</u>roup
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click"
                    runat="server" type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
                <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false"
                    runat="server" type="button" accesskey="X" onserverclick="btnCancel_Click">
                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                </button>

            </div>

            <div>
                <asp:CustomValidator ID="custOption" runat="server" ValidationGroup="btnSave" OnServerValidate="custOption_ServerValidate"
                    Display="None"></asp:CustomValidator>
                <asp:CustomValidator ID="cvChequeReturn" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
                <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                    HeaderText="Correct the following validation(s):" ShowSummary="false" ValidationGroup="btnSave" />
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
            <asp:PostBackTrigger ControlID="btnPDF" />
            <asp:PostBackTrigger ControlID="btnViewGroup" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
