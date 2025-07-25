<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnChequeReturn_Mlti, App_Web_3jwyxbhk" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
                    <asp:Panel ID="Panel2" runat="server" GroupingText="Genral" CssClass="stylePanel">

                        <div class="row">

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlmtBranch" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlmtBranch_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtBranch" runat="server" Text="Branch" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtDocumentDate" runat="server"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Document Date" ID="lblmtDocuDate" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtDocumentGroupNo" runat="server"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Document Group No" ID="lblmtDocumentGroupNo" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtDocumentType" runat="server"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Document Type" ID="lblmtDocumentType" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlmtDepositBank" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlmtDepositBank_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtDepositBank" runat="server" Text="Deposit Bank - Branch" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvDepositBank" runat="server" SetFocusOnError="true" ValidationGroup="btnSave"
                                            ControlToValidate="ddlmtDepositBank" InitialValue="0" CssClass="validation_msg_box_sapn"
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="rfvDepositBank_Add" runat="server" SetFocusOnError="true" ValidationGroup="btnAdd"
                                            ControlToValidate="ddlmtDepositBank" InitialValue="0" CssClass="validation_msg_box_sapn"
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtBankAdviceNo" runat="server" MaxLength="25"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender runat="server" ID="ftbxBankAdviceNo" FilterType="LowercaseLetters,Numbers,UppercaseLetters,Custom"
                                        TargetControlID="txtmtBankAdviceNo" ValidChars=" \/-()">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Bank Advice Number" ID="lblmtBankAdviceNumber" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rqvBankAdviceNumber" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                            ControlToValidate="txtmtBankAdviceNo" Display="Dynamic" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtBankAdviceDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:CalendarExtender ID="ceBankAdviceDate" runat="server" Enabled="True" PopupButtonID="imgBankAdviceDate" TargetControlID="txtmtBankAdviceDate">
                                    </cc1:CalendarExtender>
                                    <asp:Image ID="imgBankAdviceDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtBankAdviceDate" runat="server" Text="Bank Advice Date" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvBankAdviceDate" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                            ValidationGroup="btnSave" ControlToValidate="txtmtBankAdviceDate" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="rfvBankAdviceDate_Add" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                            ValidationGroup="btnAdd" ControlToValidate="txtmtBankAdviceDate" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtTotalCheques" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="text-align: right;" MaxLength="2"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtTotalCheques" runat="server" Text="Total Number" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvTotalCheques" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                            ValidationGroup="btnSave" ControlToValidate="txtmtTotalCheques" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel1" runat="server" GroupingText="Cheque/Receipt Information" CssClass="stylePanel">
                        <div class="row">

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtChequeNumber" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        AutoPostBack="true" OnTextChanged="txtmtChequeNumber_TextChanged" MaxLength="30"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtChequeNumber" runat="server" Text="Cheque Number" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvChequeNumber" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                            ValidationGroup="btnAdd" ControlToValidate="txtmtChequeNumber" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlmtAccountNumber" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlmtAccountNumber_SelectedIndexChanged"></asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtAccountNumber" runat="server" Text="Account Number" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvAccountNumber" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                            ValidationGroup="btnAdd" ControlToValidate="ddlmtAccountNumber" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlmtReceiptNumber" runat="server" class="md-form-control form-control"></asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtReceiptNumber" runat="server" Text="Receipt Number" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvReceiptNumber" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                            ValidationGroup="btnAdd" ControlToValidate="ddlmtReceiptNumber" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlmtReturnReason" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlmtReturnReason_SelectedIndexChanged"></asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtReturnReason" runat="server" Text="Reason for Return" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvReturnReason" runat="server" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                            ValidationGroup="btnAdd" ControlToValidate="ddlmtReturnReason" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtNextDepositDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:CalendarExtender ID="ceNextDepositDate" runat="server" Enabled="True" PopupButtonID="imgNextDepositDate" TargetControlID="txtmtNextDepositDate">
                                    </cc1:CalendarExtender>
                                    <asp:Image ID="imgNextDepositDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtNextDepositDate" runat="server" Text="Revised Banking Date" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtBankCharges" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtBankCharges" runat="server" Text="Bank Charges" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtReceiptDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtReceiptDate" runat="server" Text="Receipt Date" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtChequeDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtChequeDate" runat="server" Text="Cheque Date" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtChequeAmount" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="text-align: right;"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtChequeAmount" runat="server" Text="Cheque Amount" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <uc4:ICM ID="ucCustomerCodeLov" HoverMenuExtenderLeft="true" runat="server" DispalyContent="Both"
                                        ToolTip="Customer Name" Enabled="false" />
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
                                    <asp:TextBox ID="txtmtDraweeBank" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtDraweeBank" runat="server" Text="Drawee Bank - Branch" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtInstrumentType" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtInstrumentType" runat="server" Text="Instrument Type" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                        </div>

                        <div align="right">
                            <button class="css_btn_enabled" id="btnAdd" title="Add,Alt+A" onclick="if(fnCheckPageValidators('btnAdd','false'))" causesvalidation="false" onserverclick="btnAdd_ServerClick" runat="server"
                                type="button" accesskey="A">
                                <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>A</u>dd
                            </button>
                            <button class="css_btn_enabled" id="btnCleargrid" title="Clear,Alt+R" causesvalidation="false" onserverclick="btnCleargrid_ServerClick" runat="server"
                                type="button" accesskey="R">
                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clea<u>r</u>
                            </button>
                            <%----%>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtEnterChequeCount" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        style="text-align:right;"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtEnterChequeCount" runat="server" Text="Total Cheques" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtmtTotalChequeAmount" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        style="text-align:right;"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblmtTotalChequeAmount" runat="server" Text="Total Cheque Amount" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <asp:GridView ID="grvChequeDetails" runat="server" AutoGenerateColumns="False" OnRowDeleting="grvChequeDetails_RowDeleting">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:RadioButton ID="RBSelect" runat="server" Checked="false" OnCheckedChanged="RBSelect_CheckedChanged"
                                                    AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                <asp:Label ID="lblgvReceiptID" runat="server" Text='<%#Eval("Receipt_ID") %> ' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="15px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvChequeNumber" runat="server" Text='<%#Eval("Cheque_Number") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvChequeDate" runat="server" Text='<%#Eval("Cheque_Date") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Account Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvAccountNumber" runat="server" Text='<%#Eval("Account_Number") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Receipt Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvReceiptNumber" runat="server" Text='<%#Eval("Receipt_Number") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvChequeAmount" runat="server" Text='<%#Eval("Cheque_Amount") %> '></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Reason for Return">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvReturnReason" runat="server" Text='<%#Eval("Return_Reason_Desc") %> '></asp:Label>
                                                <asp:Label ID="lblgvReturnReasonID" runat="server" Text='<%#Eval("Return_Reason_ID") %> ' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Revised Banking Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvNextDepositDate" runat="server" Text='<%#Eval("Next_Deposit_Date") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bank Charges">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgvBankCharges" runat="server" Text='<%#Eval("Bank_Charges") %> '></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <%--9--%>
                                        <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnViewReceipt" runat="server" Text="View" CausesValidation="false" CssClass="grid_btn_delete" OnClick="btnViewReceipt_Click">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="10px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete"
                                                    CausesValidation="false" CssClass="grid_btn_delete" OnClientClick="return confirm('Do you want to Delete this record?');">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="10px" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('btnSave'))" causesvalidation="false" onserverclick="btnSave_ServerClick"
                        runat="server" type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_ServerClick"
                        runat="server" type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false"
                        runat="server" type="button" accesskey="X" onserverclick="btnCancel_ServerClick">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>

                <div>
                    <asp:CustomValidator ID="cvChequeReturn" runat="server" CssClass="styleMandatoryLabel"
                        Enabled="true" />
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

