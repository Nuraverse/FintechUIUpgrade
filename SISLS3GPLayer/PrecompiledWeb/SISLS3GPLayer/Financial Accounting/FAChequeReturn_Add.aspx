<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="false" inherits="Financial_Accounting_FAChequeReturn_Add, App_Web_4hds5vgj" title="Cheque Return" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function cvReceiptCheque_Number_ClientValidate(source, args) {
            var varchequeNo = document.getElementById('<%=txtChequeNo.ClientID %>')
            var comboHidden = $get('ctl00_ContentPlaceHolder1_txtReceiptNumber');
            if (varchequeNo.value != "" || comboHidden.value != "") {
                args.IsValid = true;
            }
            else {
                args.IsValid = false;
            }
        }

        function ChequeCancelmsg() {
            if (confirm('Are you sure you want to cancel the Cheque return?')) {
                return true;
            }
            else
                return false;
        }

    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Cheque Returns" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlChequeInformation" runat="server" GroupingText="Cheque/Receipt Information"
                                CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLocation" onmouseover="ddl_itemchanged(this)" runat="server" ServiceMethod="GetBranchList"
                                                AutoPostBack="true" OnItem_Selected="ddlLocation_SelectedIndexChanged" ItemToValidate="Value"
                                                IsMandatory="true" ErrorMessage="Select Branch" class="md-form-control form-control"
                                                ValidationGroup="btnSave">
                                            </asp:DropDownList>
                                            <%--<UC:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" OnItem_Selected="ddlLocation_SelectedIndexChanged"
                                                ItemToValidate="Value" IsMandatory="true" ErrorMessage="Select Branch" ValidationGroup="btnSave" />--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblBranch" CssClass="styleReqFieldLabel" Text="Branch"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtChequeRetNo" runat="server" ContentEditable="false" onmouseover="txt_MouseoverTooltip(this)"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblChequeRetNo" CssClass="styleReqFieldLabel" Text="Cheque Return Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtReceiptNumber" runat="server" AutoPostBack="true"
                                                onmouseover="txt_MouseoverTooltip(this)" OnTextChanged="txtReceiptNumber_OnTextChanged"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:AutoCompleteExtender ID="auceReceiptNumber" runat="server" TargetControlID="txtReceiptNumber"
                                                ServiceMethod="GetReceiptNumberList" MinimumPrefixLength="2" CompletionSetCount="15"
                                                Enabled="True" CompletionInterval="100" FirstRowSelected="true">
                                            </cc1:AutoCompleteExtender>
                                            <%-- <cc1:TextBoxWatermarkExtender ID="tbwmeReceiptNumber" runat="server" TargetControlID="txtReceiptNumber"
                                                WatermarkText="Enter Receipt Number">
                                            </cc1:TextBoxWatermarkExtender>--%>
                                            <cc1:FilteredTextBoxExtender ID="ftbeReceiptNumber" runat="server" TargetControlID="txtReceiptNumber"
                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"
                                                ValidChars="/">
                                            </cc1:FilteredTextBoxExtender>
                                            <asp:CustomValidator ID="cvReceiptNumber" runat="server" ErrorMessage="" Display="None"
                                                ControlToValidate="txtReceiptNumber" ClientValidationFunction="cvReceiptCheque_Number_ClientValidate" />
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvReceiptNo" BackColor="White" runat="server" ValidationGroup="btnSave"
                                                    ControlToValidate="txtReceiptNumber" InitialValue="" Display="Dynamic"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvChequeReceiptNoDuplicate" BackColor="White" runat="server"
                                                    ValidationGroup="btnSave" ControlToValidate="txtChequeNo" InitialValue="" ErrorMessage="Enter either a Receipt Number or Cheque Number"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblReceiptNumber" CssClass="styleReqFieldLabel" Text="Receipt Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDocumentDate" runat="server" ContentEditable="false"
                                                onmouseover="txt_MouseoverTooltip(this)" ToolTip="Document Date"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="ceDocumentDatee" runat="server" Enabled="false" Format="DD/MM/YYYY"
                                                PopupButtonID="imgDocumentDate" TargetControlID="txtDocumentDate">
                                            </cc1:CalendarExtender>
                                            <asp:Image ID="imgDocumentDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                Visible="false" />
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvValueDate" runat="server" ControlToValidate="txtDocumentDate"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the Value Date"
                                                    SetFocusOnError="True" ValidationGroup="BtnSave"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblDocumentDate" CssClass="styleReqFieldLabel" Text="Document Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtChequeNo" runat="server" AutoPostBack="true"
                                                onblur="ChkIsZero(this,'Instrument Number');"
                                                onmouseover="txt_MouseoverTooltip(this)"
                                                OnTextChanged="txtChequeNo_TextChanged"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FTEtxtChequeNo" runat="server"
                                                FilterType="Numbers" TargetControlID="txtChequeNo">
                                            </cc1:FilteredTextBoxExtender>
                                            <%-- <cc1:TextBoxWatermarkExtender ID="TWEtxtChequeNo" runat="server"
                                                TargetControlID="txtChequeNo" WatermarkText="Enter Cheque Number">
                                            </cc1:TextBoxWatermarkExtender>--%>
                                            <asp:RangeValidator ID="rngChequeNo" runat="server"
                                                ControlToValidate="txtChequeNo" Display="None"
                                                ErrorMessage="The number can be of 6 digits only" MaximumValue="999999"
                                                MinimumValue="1" Type="Double" ValidationGroup="btnGo"></asp:RangeValidator>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvChequeNo" runat="server" BackColor="White"
                                                    ControlToValidate="txtChequeNo" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                    ErrorMessage="Enter either a Receipt Number or Cheque Number" InitialValue=""
                                                    ValidationGroup="btnGo"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblChequeNo" CssClass="styleReqFieldLabel" Text="Cheque Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtChequeValueDate" runat="server" ContentEditable="false" onmouseover="txt_MouseoverTooltip(this)"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblChequeValueDate" CssClass="styleReqFieldLabel" Text="Cheque Return Value Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlBankInfo" runat="server" GroupingText="Bank Information" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDepositBank" runat="server" ContentEditable="false" onmouseover="txt_MouseoverTooltip(this)"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblDepositBank" CssClass="styleReqFieldLabel" Text="Deposit Bank"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtBankAccNo" runat="server" ContentEditable="false" onmouseover="txt_MouseoverTooltip(this)"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblBankAccNo" CssClass="styleReqFieldLabel" Text="Bank Account Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtChequeAmount" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                ContentEditable="false" Style="text-align: right;"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender runat="server" ID="FTEtxtChequeAmount" FilterType="Numbers, Custom"
                                                FilterMode="ValidChars" ValidChars="." TargetControlID="txtChequeAmount">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblChequeAmount" CssClass="styleReqFieldLabel" Text="Cheque Amount"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlReasons" runat="server" onmouseover="ddl_itemchanged(this)"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvReasons" runat="server" SetFocusOnError="true"
                                                    CssClass="validation_msg_box_sapn" ValidationGroup="btnSave" ControlToValidate="ddlReasons"
                                                    InitialValue="0" ErrorMessage="Select the Reason for Return" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblReasons" CssClass="styleReqFieldLabel" Text="Reason for Return"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtBankCharges" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                onkeypress="fnAllowNumbersOnly(true,false,this)" Style="text-align: right;"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvBankCharges" runat="server" SetFocusOnError="true"
                                                    ControlToValidate="txtBankCharges" ErrorMessage="Enter the Bank Charges" Display="Dynamic"
                                                    ValidationGroup="btnSave" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblBankCharges" CssClass="styleReqFieldLabel" Text="Bank Charges"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtBankAdvicedate" runat="server" ContentEditable="false"
                                                onmouseover="txt_MouseoverTooltip(this)" ToolTip="Bank Advice Date"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CEBankadvicedate" runat="server" Enabled="false" Format="DD/MM/YYYY"
                                                PopupButtonID="imgbankadvicedate" TargetControlID="txtBankAdvicedate">
                                            </cc1:CalendarExtender>
                                            <asp:Image ID="imgbankadvicedate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                Visible="false" />
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvBankadvicedate" runat="server" ControlToValidate="txtDocumentDate"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the Bank Advice Date"
                                                    SetFocusOnError="True" ValidationGroup="BtnSave"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblBankAdvicedate" CssClass="styleReqFieldLabel" Text="Bank Advice Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlAccount" runat="server" GroupingText="Account Level Amount" CssClass="stylePanel">
                                <div class="container" style="width: 100%; min-height: 120px; max-height: 250px; overflow-x: auto; overflow-y: auto;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="gvAccount" runat="server" Width="98%" AutoGenerateColumns="false"
                                                    ShowFooter="false" HeaderStyle-CssClass="styleGridHeader"
                                                    RowStyle-HorizontalAlign="Center">
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Receipt Description" DataField="ReceiptDescription" ItemStyle-HorizontalAlign="Left"
                                                            ItemStyle-Width="18%" />
                                                        <asp:BoundField HeaderText="Account" DataField="GLAccountDesc" ItemStyle-HorizontalAlign="Left"
                                                            ItemStyle-Width="18%" />
                                                        <asp:BoundField HeaderText="Sub Account" DataField="SLAccountDesc" ItemStyle-HorizontalAlign="Left"
                                                            ItemStyle-Width="18%" />
                                                        <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblchequeAmt" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Cheque Amount" DataField="Transaction_Amount" ItemStyle-HorizontalAlign="Right"
                                                            Visible="false" />
                                                        <asp:TemplateField HeaderText="Remarks" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="18%">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtRemarks" runat="server" Rows="2" TextMode="MultiLine" ReadOnly="true"
                                                                    Text='<%#Bind("Remarks") %>' Width="100%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
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
                            <asp:Panel ID="pnlAddLessDetails" runat="server" GroupingText="Account Level Add Less Amount"
                                Visible="false" CssClass="stylePanel">
                                <div class="container" style="width: 100%; min-height: 80px; max-height: 200px; overflow-x: auto; overflow-y: auto;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="gvAddLess" runat="server" Width="98%" AutoGenerateColumns="false"
                                                    ShowFooter="false" HeaderStyle-CssClass="styleGridHeader"
                                                    RowStyle-HorizontalAlign="Center">
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Add/Less" DataField="AddLess" />
                                                        <asp:BoundField HeaderText="Receipt Description" DataField="ReceiptDescription" ItemStyle-HorizontalAlign="Left"
                                                            ItemStyle-Width="25%" />
                                                        <asp:BoundField HeaderText="Account" DataField="GLAccountDesc" ItemStyle-HorizontalAlign="Left"
                                                            ItemStyle-Width="25%" />
                                                        <asp:BoundField HeaderText="Sub Account" DataField="SLAccountDesc" ItemStyle-HorizontalAlign="Left"
                                                            ItemStyle-Width="25%" />
                                                        <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblchequeAmt" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Cheque Amount" DataField="Transaction_Amount" ItemStyle-HorizontalAlign="Right"
                                                            Visible="false" />
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <asp:UpdatePanel ID="upButton" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(fnCheckPageValidators('btnSave'))"
                                    type="button" accesskey="S" causesvalidation="false" title="Save,Alt+S" validationgroup="btnSave">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                </button>
                                <button class="css_btn_enabled" id="btnClear" causesvalidation="false" onserverclick="btnClear_Click" runat="server" onclick="if(fnConfirmClear())"
                                    type="button" accesskey="L" title="Clear_FA,Alt+L">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                </button>
                                <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                                    type="button" accesskey="X" title="Exit,Alt+X">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>
                                <%--<asp:Button runat="server" ID="btnPDF" Text="Print" CausesValidation="false" CssClass="styleSubmitButton" />--%>
                                <asp:Button runat="server" ID="btnPrint" Text="Print" CausesValidation="false" CssClass="styleSubmitButton"
                                    ToolTip="Print" Visible="false" />
                                <asp:Button runat="server" ID="btnCancelCR" OnClick="btnCancelCR_Click" Text="Cancel Cheque Return"
                                    ToolTip="Cancel Cheque Return" Enabled="false" CausesValidation="false" CssClass="styleSubmitLongButton"
                                    OnClientClick="return fnCancelClick();" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <tr>
                        <td align="center" colspan="4">
                            <asp:CustomValidator ID="cvChequeReturn" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" Width="98%" />
                            <asp:ValidationSummary ID="vsChequeReturn" runat="server" CssClass="styleMandatoryLabel"
                                HeaderText="Correct the following validation(s):" ShowSummary="false" ValidationGroup="btnSave" />
                        </td>
                    </tr>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
