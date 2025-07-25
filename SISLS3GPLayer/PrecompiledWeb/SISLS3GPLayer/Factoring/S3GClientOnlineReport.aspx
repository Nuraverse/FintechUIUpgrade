<%@ page language="C#" autoeventwireup="true" title="Payment Request" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="Client_Online_Report, App_Web_2i2ukaeu" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc3" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC6" %>
<asp:Content ID="ContentPaymentRequest" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="Server">
    <script language="javascript" type="text/javascript">
        function fnLoadCustomer() {
            ////debugger;
            document.getElementById("<%= btnLoadCustomer.ClientID %>").click();

        }
    </script>
    <asp:UpdatePanel ID="updPayment" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="" ID="lblHeading"> </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div>

                        <div class="row">
                            <asp:Panel ID="pnlPaymentInformation1" runat="server" ToolTip="Input Criteria "
                                GroupingText="Client Information - Input" CssClass="stylePanel" Width="100%">
                                <div>
                                    <div class="row">

                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="padding: 0px !important; padding-right: 5px !important">
                                                            <asp:TextBox ID="txtCustomerCodeLease" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                Style="display: none;" MaxLength="50"></asp:TextBox>
                                                            <UC6:ICM ID="ucCustomerCodeLov" ToolTip="Customer Name" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" ShowHideAddressImageButton="true" AutoPostBack="true" DispalyContent="Both"
                                                                strLOV_Code="CUS_CLIENTFACAPR" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                                            <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_Click"
                                                                Style="display: none" />
                                                            <input id="hdnCustID" type="hidden" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>

                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvcmbCustomer" runat="server" ControlToValidate="txtCustomerCodeLease"
                                                        ErrorMessage="Select a Customer Code" ValidationGroup="Main Page" CssClass="validation_msg_box_sapn"
                                                        Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvCustomer" runat="server" ControlToValidate="txtCustomerCodeLease"
                                                        ErrorMessage="Select a Customer Code" ValidationGroup="tcAsset" CssClass="validation_msg_box_sapn"
                                                        Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Client Name" ID="lblCustomerNameSelect" CssClass="styleDisplayLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>


                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="divAccountno" runat="server">
                                            <div class="md-input">
                                                <%--<uc:Suggest ID="ucAccountLov" runat="server" ServiceMethod="GetAccuntNoList" AutoPostBack="true" />--%>
                                                <asp:TextBox ID="txtAccountNoDummy" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                    Style="display: none;" MaxLength="100"></asp:TextBox>
                                                <UC6:ICM ID="ddlPAN" onblur="fnLoadAccount()" ButtonVisible="false" runat="server" ToolTip="Account No" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ddlPAN_SelectedIndexChanged"
                                                    strLOV_Code="ACC_INVOICELOAD_CR" ServiceMethod="GetPANUM" class="md-form-control form-control login_form_content_input requires_true" />
                                                <asp:Button ID="btnLoadAccount" runat="server" Text="Load Account" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                    Style="display: none" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" ID="lblAccountNo" Text="Account No"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvStartDateSearch" runat="server">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtStartDateSearch" runat="server"  autocomplete="off"
                                                    OnTextChanged="txtStartDateSearch_TextChanged" AutoPostBack="false"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <asp:Image ID="imgStartDateSearch" runat="server"
                                                    ImageUrl="~/Images/calendaer.gif" ToolTip="Start Date" Visible="false" />
                                                <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                                    PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                                    <%--OnClientDateSelectionChanged="checkDate_NextSystemDate"--%>
                                                </cc1:CalendarExtender>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="GO" CssClass="validation_msg_box_sapn"
                                                        runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                                                        ErrorMessage="Enter the Start Date" Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Cut off Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <button class="css_btn_enabled" id="BtnGo" title="Go[Alt+G]" causesvalidation="false" onserverclick="BtnGo_click" runat="server"
                                                    type="button" accesskey="G">
                                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                </button>


                                                <%--                                                <button class="css_btn_enabled" id="btnViewClientBalance" title="Go[Alt+Y]" causesvalidation="false" runat="server" onclick="BtnGo_click"
                                                    type="button" accesskey="Y">
                                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                </button>--%>
                                            </div>
                                        </div>



                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                        <div class="row" id="dvFacInformation" runat="server">
                            <asp:Panel ID="pnlFactoringAccounts" Visible="false" runat="server" ToolTip="Client Information" GroupingText="Client Information"
                                CssClass="stylePanel" Width="100%">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView runat="server" ID="grvTransLander" Width="100%" AutoGenerateColumns="true"
                                            OnRowCommand="grvTransLander_RowCommand" HeaderStyle-CssClass="styleGridHeader"
                                            RowStyle-HorizontalAlign="Left" OnRowDataBound="grvTransLander_RowDataBound">
                                        </asp:GridView>

                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                        <%--  <div class="row" runat="server" id="dvFacInformationw" visible="false">
                            <asp:Panel ID="pnlFactoringAccounts" Visible="false" runat="server" ToolTip="Client Information" GroupingText="Client Information"
                                CssClass="stylePanel" Width="100%">
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDebtPurchaselimit" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDebtPurchaselimit" runat="server" CssClass="styleDisplayLabel" Text="Debt Purchase limit" ToolTip="Debt Purchase limit"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtPrepaymentLimit" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblPrepaymentLimit" runat="server" CssClass="styleDisplayLabel" Text="Prepayment Limit"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtMargin" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblMargin" runat="server" CssClass="styleDisplayLabel" Text="Margin" ToolTip="Margin"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDebtsOutstanding" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDebtsOutstanding" runat="server" CssClass="styleDisplayLabel" Text="Debts Outstanding" ToolTip="Debts Outstanding"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDebtsApproved" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDebtsApproved" runat="server" CssClass="styleDisplayLabel" Text="Debts Approved" ToolTip="Debts Approved"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtUnDebtsApproved" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblUnDebtsApproved" runat="server" CssClass="styleDisplayLabel" Text="Debts Un Approved" ToolTip="Debts Un Approved"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtOverdueInvoices" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblOverdueInvoices" runat="server" CssClass="styleDisplayLabel" Text="Overdue Invoices" ToolTip="Overdue Invoices"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDefaultInvoices" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDefaultInvoices" runat="server" CssClass="styleDisplayLabel" Text="Default Invoices" ToolTip="Default Invoices"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDrawingPower" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDrawingPower" runat="server" CssClass="styleDisplayLabel" Text="Drawing Power" ToolTip="Drawing Power"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtFundsinUse" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblFundsinUse" runat="server" CssClass="styleDisplayLabel" Text="Funds in Use" ToolTip="Funds in Use"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAvailableFunds" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblAvailableFunds" runat="server" CssClass="styleDisplayLabel" Text="Available Funds" ToolTip="Available Funds"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtFundsInUseAfterDis" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lbltxtFundsInUseAfterDis" runat="server" CssClass="styleDisplayLabel" Text="Funds in use after Disbursement" ToolTip="Funds in use after Disbursement"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="TxtInvoiceCapValue" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="Label1" runat="server" CssClass="styleDisplayLabel" Text="Invoice Cap Value" ToolTip="Invoice Cap Value"></asp:Label>
                                            </label>
                                        </div>
                                    </div>


                                    <%--                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtMarginPer" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="Label2" runat="server" CssClass="styleDisplayLabel" Text="Margin Percentage" ToolTip="Margin Percentage"></asp:Label>
                                            </label>
                                        </div>
                                    </div>--%>



                        <%--                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCreditPeriod" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="Label3" runat="server" CssClass="styleDisplayLabel" Text="Credit Period" ToolTip="Credit Period"></asp:Label>
                                            </label>
                                        </div>
                                    </div>



                                </div>
                            </asp:Panel>
                        </div>--%>
                    </div>
                </div>

            </div>

            <div style="float: right;" class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="row" style="float: right; margin-top: 5px;">

                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="l">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnPrint" title="Go[Alt+P]" causesvalidation="false" onserverclick="btnPrint_ServerClick" runat="server"
                            type="button" accesskey="p">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u></u>Print
                        </button>


                    </div>
                </div>
            </div>


            </div>
        </ContentTemplate>

        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>


</asp:Content>
