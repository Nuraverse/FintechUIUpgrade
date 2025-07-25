<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FACheque_Printing_Add, App_Web_4hds5vgj" title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" Text="Cheque Printing" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <cc1:TabContainer ID="tcChequePrinting" runat="server" CssClass="styleTabPanel"
                        TabStripPlacement="top" ActiveTabIndex="0">

                        <cc1:TabPanel runat="server" HeaderText="Main details" ID="tpMaindetails" CssClass="tabpan"
                            BackColor="Red" TabIndex="0">
                            <HeaderTemplate>
                                Installments  
                            </HeaderTemplate>

                            <ContentTemplate>
                                <asp:UpdatePanel ID="upMaindetails" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="pnldett" runat="server" CssClass="stylePanel" GroupingText="Installment Details">
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <UC:Suggest ID="ddlAccountNo" ServiceMethod="GetBankList" runat="server" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblLoanAccountNumber" Text="Account Number" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <UC:Suggest ID="ddlProposalNumber" ServiceMethod="GetBankList" runat="server" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblProposalNumber" Text="Proposal Number" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <UC:Suggest ID="ddlDMSRef" ServiceMethod="GetBankList" runat="server" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblDMS" Text="DMS Ref" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <UC:Suggest ID="ddlBankName" ServiceMethod="GetBankList" runat="server" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblBankName" Text="Bank Name" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtfavourname" runat="server" Text="Muscat Finance SAOG"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblInFavour" Text="In Favour of" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtstartdate" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <asp:Image ID="imgstartdate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                <cc1:CalendarExtender ID="calstartdate" runat="server" Enabled="True" PopupButtonID="imgstartdate"
                                                                    OnClientDateSelectionChanged="checkDate_NextSystemDate1" TargetControlID="txtstartdate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblStartDate" Text="Start Date" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtRepayment" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblRepaymentFrequency" Text="Repayment Frequency" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtnoofinstallments" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblnoofInstallments" Text="No of Installments" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtEMIAmount" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblEMIAmount" Text="EMI Amount" />
                                                                </label>
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

                        <cc1:TabPanel runat="server" HeaderText="Disbursements" ID="tpDisbursement" CssClass="tabpan"
                            BackColor="Red">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="upDisbursement" runat="server">
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel ID="pnlDisbursement" runat="server" CssClass="stylePanel" GroupingText="Disbursement Details">
                                                            <div class="row">
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <UC:Suggest ID="ddldisBankName" ServiceMethod="GetBankList" runat="server" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lbldisBankName" Text="Bank Name" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <UC:Suggest ID="ddlVoucherno" ServiceMethod="GetBankList" runat="server" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblVoucherno" Text="Voucher No" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtFavour" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblDisburseInfavour" Text="In Favour OF" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtTopmark" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblTopMark" Text="Top Mark" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtchequeno" runat="server" Text=""
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblChequeNo" Text="Cheque No." />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtRevisedChequno" runat="server" Text=""
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblRevisedChequeno" Text="Revised Cheque No" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtDisbDate" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:Image ID="imgDisbDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                        <cc1:CalendarExtender ID="calDisDate" runat="server" Enabled="True" PopupButtonID="imgDisbDate"
                                                                            OnClientDateSelectionChanged="checkDate_NextSystemDate1" TargetControlID="txtDisbDate">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblDate" Text="Date" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAmount" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblAmount" Text="Amount" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                    <%--   <Triggers>
                                    <asp:PostBackTrigger ControlID="btnExcel" />
                                </Triggers>--%>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>


                        <cc1:TabPanel runat="server" HeaderText="FA Payments" ID="TabPanel1" CssClass="tabpan"
                            BackColor="Red">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel ID="pnlFAPayments" runat="server" CssClass="stylePanel" GroupingText="FA Payments">
                                                            <div class="row">
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <UC:Suggest ID="ddlFABank" ServiceMethod="GetBankList" runat="server" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblFAPayment" Text="Bank Name" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <UC:Suggest ID="ddlFAVoucherNo" ServiceMethod="GetBankList" runat="server" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblFAVoucherno" Text="Voucher No" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtFAInfavour" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblFAInFavoour" Text="In Favour OF" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtFATopmark" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblFATopMark" Text="Top Mark" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="TextBox3" runat="server" Text=""
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label5" Text="Cheque No." />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="TextBox4" runat="server" Text=""
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label6" Text="Revised Cheque No" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="TextBox5" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label7" Text="Date" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="TextBox6" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label8" Text="Amount" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                    <%--   <Triggers>
                                    <asp:PostBackTrigger ControlID="btnExcel" />
                                </Triggers>--%>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" causesvalidation="false" onclick="if(return fnCheckPageValidators('Save'))" runat="server"
                                    type="button" accesskey="S" validationgroup="Save">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                </button>
                                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                                    type="button" accesskey="L">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                </button>
                                <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                    type="button" accesskey="X">
                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>

                                <button class="css_btn_enabled" id="btnCancelTrans" causesvalidation="false" runat="server"
                                    type="button">
                                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u></u>Cancel Trans
                                </button>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ValidationGroup="Save" ID="vs_AssetTransaction" runat="server"
                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ValidationGroup="AssetcodeAdd" ID="VSAssetcodeAdd" runat="server"
                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                    &nbsp;
                <asp:ValidationSummary ValidationGroup="InvoiceAdd" ID="VSInvoiceAdd" runat="server"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ValidationGroup="btnadd" ID="vs_expense_add" runat="server"
                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:CustomValidator ID="CVAssetTransaction" runat="server" CssClass="styleMandatoryLabel"
                        Enabled="true" />
                </div>
            </div>
            <script type="text/javascript" language="javascript">

                function checkValueDate_NextSystemDate(sender, args) {

                    debugger;
                    var today = new Date();
                    var currentyear = today.getYear();
                    var currentmonth = today.getMonth() + 1;


                    if (currentmonth > 3) {
                        pastvalidyear = currentyear;
                        futurevalidyear = currentyear + 1;

                    }
                    else {
                        pastvalidyear = currentyear - 1;
                        futurevalidyear = currentyear;

                    }
                    if ((sender._selectedDate.getMonth() + 1) > currentmonth && (sender._selectedDate.getYear() == currentyear))//Future month date cannot be selected
                    {
                        alert('You cannot select a date greater than the current month end and lesser than the current year');
                        sender._textbox.set_Value(today.format(sender._format));
                        return;
                    }
                    if (sender._selectedDate.getYear() == pastvalidyear || sender._selectedDate.getYear() == futurevalidyear) {
                        if (sender._selectedDate.getYear() == futurevalidyear && (sender._selectedDate.getMonth() + 1) > 3) {
                            alert('You cannot select a date greater than the current month end and lesser than the current year');
                            sender._textbox.set_Value(today.format(sender._format));
                            return;
                        }
                        if (sender._selectedDate.getYear() == pastvalidyear && (sender._selectedDate.getMonth() + 1) <= 3) {
                            alert('You cannot select a date greater than the current month end and lesser than the current year');
                            sender._textbox.set_Value(today.format(sender._format));
                            return;
                        }
                    }
                    else {
                        alert('You cannot select a date greater than the current month end and lesser than the current year');
                        sender._textbox.set_Value(today.format(sender._format));
                        return;

                    }

                }







                function checkDate_NextSystemDate1(sender, args) {

                    var today = new Date();
                    if (sender._selectedDate > today) {

                        //alert('You cannot select a date greater than system date');
                        alert('Expenses Date cannot be greater than system date');
                        sender._textbox.set_Value(today.format(sender._format));

                    }
                    document.getElementById(sender._textbox._element.id).focus();

                }
            </script>
        </div>
    </div>
</asp:Content>









