<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnPDCPickList_Add, App_Web_4kkykzxm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        function fnLoadCustomer() {
            ////debugger;
            document.getElementById("<%= btnLoadCustomer.ClientID %>").click();

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
                                            <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                ToolTip="Line of Business" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLOB" runat="server" Display="Dynamic" InitialValue="0"
                                                    ControlToValidate="ddlLOB" SetFocusOnError="True" ValidationGroup="GenRcpt"></asp:RequiredFieldValidator>
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
                                                <asp:Label ID="lblBranch" runat="server" Text="Branch" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" Display="Dynamic" InitialValue="0"
                                                    ControlToValidate="ddlBranch" SetFocusOnError="True" ValidationGroup="GenRcpt"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCustomerCode" runat="server" MaxLength="50" Style="display: none;" class="md-form-control form-control login_form_content_input requires_true">
                                            </asp:TextBox>
                                            <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" ToolTip="Customer/Entity" />
                                            
                                            <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" OnClick="btnLoadCustomer_Click"
                                                Style="display: none" /><input id="Hidden2" type="hidden" runat="server" />
                                            <asp:CheckBox ID="CbxInclude" runat="server" AutoPostBack="True" OnCheckedChanged="CbxInclude_CheckedChanged" Visible="false" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code/Name" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtDate" AutoPostBack="True" ToolTip="Banking From Date" class="md-form-control form-control login_form_content_input requires_true"
                                                OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                                            <asp:Image ID="imgPDCDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Banking From Date" Visible="false" />
                                            <cc1:CalendarExtender ID="CECPDCdate" runat="server" Enabled="True"
                                                PopupButtonID="imgPDCDate" TargetControlID="txtDate" Format="dd/MM/yyyy">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblPDCDate" runat="server" Text="Banking From Date" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVPDCDate" CssClass="styleMandatoryLabel" runat="server"
                                                    ControlToValidate="txtDate" Display="Dynamic" ErrorMessage="Select the PDC Banking Date"
                                                    ValidationGroup="GenRcpt"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtBankTodate" AutoPostBack="True" ToolTip="Banking To Date" class="md-form-control form-control login_form_content_input requires_true"
                                                OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                                            <asp:Image ID="imgBankToDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Banking To Date" Visible="false" />
                                            <cc1:CalendarExtender ID="calBankToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgBankToDate" TargetControlID="txtBankTodate" Format="dd/MM/yyyy">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBankToDate" runat="server" Text="Banking To Date" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlClearingType" runat="server" ToolTip="Issuer By" class="md-form-control form-control">
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
                                            <asp:TextBox runat="server" ID="txtChequeFromDate" AutoPostBack="True" ToolTip="Banking From Date" class="md-form-control form-control login_form_content_input requires_true"
                                                OnTextChanged="txtChequeFromDate_TextChanged"></asp:TextBox>
                                            <asp:Image ID="imgChequeFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Cheque Return-From Date" Visible="false" />
                                            <cc1:CalendarExtender ID="calChequeFromDate" runat="server" Enabled="True"
                                                PopupButtonID="imgChequeFromDate" TargetControlID="txtChequeFromDate" Format="dd/MM/yyyy">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblChequeFromDate" runat="server" Text="Cheque Return-From Date" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtChequeToDate" AutoPostBack="True" ToolTip="Cheque Return-To Date" class="md-form-control form-control login_form_content_input requires_true"
                                                OnTextChanged="txtChequeToDate_TextChanged"></asp:TextBox>
                                            <asp:Image ID="imgChequeToDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Cheque Return-To Date" Visible="false" />
                                            <cc1:CalendarExtender ID="calChequeToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgChequeToDate" TargetControlID="txtChequeToDate" Format="dd/MM/yyyy">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblChequeToDate" runat="server" Text="Cheque Return-To Date" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDraweeBank" runat="server" ToolTip="Drawee Bank" class="md-form-control form-control"
                                                onchange="itemchanged()">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Drawee Bank & Place" ID="lblDraweeBank" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDepositBank" ToolTip="Deposit Bank" runat="server" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Deposit Bank" ID="Label1" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDraweeAccountNumber" runat="server" ToolTip="Drawee Bank Account No" class="md-form-control form-control login_form_content_input requires_true">
                                            </asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Drawee Bank Account No" ID="lblAccountNumber" CssClass="styleDisplayLabel" ToolTip="Drawee Bank Account No"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div align="center">
                        <button class="css_btn_enabled" id="btnGetLines" title="Get Cheques,Alt+Q" onclick="if(fnCheckPageValidators('GenRcpt'))" causesvalidation="false" onserverclick="btnGetLines_Click"
                            runat="server" type="button" accesskey="Q">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Get Che<u>q</u>es
                        </button>

                        <button class="css_btn_enabled" id="btnXLPorting" title="Export Cheque Details,Alt+E" onclick="if(fnCheckPageValidators('GenRcpt'))" causesvalidation="false" onserverclick="btnXLPorting_Click"
                            runat="server" type="button" accesskey="E">
                            <i class="fa fa-file-excel-o btn_i" aria-hidden="true"></i>&emsp;<u>E</u>xport
                        </button>

                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click"
                            runat="server" type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click"
                            runat="server" type="button" accesskey="X">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlCheque" runat="server" CssClass="stylePanel" GroupingText="Cheque Details">
                                <div class="gird">
                                    <asp:GridView ID="gvPDCReceipts" runat="server" CssClass="styleInfoLabel" AutoGenerateColumns="False"
                                        OnRowDataBound="gvPDCReceipts_RowDataBound" ToolTip="Cheque Details">
                                        <Columns>
                                            <asp:TemplateField Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPDCNO" runat="server" Text='<%# Eval("PDC_ENTRY_NO") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prime Account No" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPAN" runat="server" Text='<%# Eval("PANum")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sub Account No" Visible="false" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSAN" runat="server" Text='<%# Eval("SANum")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustID" runat="server" Text='<%# Eval("Customer_ID") %>' Visible="false" />
                                                    <asp:Label ID="lblCustomer" runat="server" Text='<%# Eval("Customer")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Installment No" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblINSTALLMENTNUMBER" runat="server" Text='<%# Eval("InstallmentNumber")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Installment Date" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstallmentDate" runat="server" Text='<%# Eval("InstallmentDate")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Instrument Date" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstrumentDate" runat="server" Text='<%# Eval("Instrument_Date")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Revised Bank Date" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRevisedBankDate" runat="server" Text='<%# Eval("REVISED_BANKDATE")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Drawee Bank" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <%-- <asp:HiddenField ID="hidBankID" runat="server" Value='<%# Eval("Drawee_Bank_ID") %>' />--%>
                                                    <asp:Label ID="lblBank" runat="server" Text='<%# Eval("Drawee_Bank_Name")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MICR" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMICR" runat="server" Text='<%# Eval("MICR")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Instrument No" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstrumentNo" runat="server" Text='<%# Eval("Instrument_No")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Installment Amount" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstrumentAmount" runat="server" Text='<%# Eval("Instrument_Amount")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Others Charges" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblothers" runat="server" Text='<%# Eval("Others_Amount")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Receipt No" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReceiptNo" runat="server" Text='<%# Eval("Receipt_No")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <%--Columns newly added - Kuppu - June 13 - Starts---%>
                                            <asp:TemplateField HeaderText="Insurance" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInsurance" runat="server" Text='<%# Eval("Insurance")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Tax" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTax" runat="server" Text='<%# Eval("Tax")%>' />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Amount" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalAmount" runat="server" />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <%--Columns newly added - Kuppu - June 13 - Ends---%>
                                            <asp:TemplateField HeaderText="Exclude" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CbxExculde" runat="server" />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
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
            <asp:PostBackTrigger ControlID="btnGetLines" />
            <asp:PostBackTrigger ControlID="txtDate" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

