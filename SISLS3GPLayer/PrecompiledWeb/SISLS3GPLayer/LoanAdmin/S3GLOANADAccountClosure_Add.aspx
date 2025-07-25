<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GLOANADAccountClosure_Add, App_Web_yy0xp33b" enableeventvalidation="false" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GCustomerAddress.ascx" TagName="CustomerDetails"
    TagPrefix="CD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function EnableTabControl() {
            debugger;
            $find('ctl00_ContentPlaceHolder1_tcEnquiryAppraisal_tbAccDetails')._enabled = true;
            $find('ctl00_ContentPlaceHolder1_tcEnquiryAppraisal_tbCashFlow')._enabled = true;
            $find('ctl00_ContentPlaceHolder1_tcEnquiryAppraisal').set_activeTabIndex(1);
            $find('ctl00_ContentPlaceHolder1_tcEnquiryAppraisal').set_activeTabIndex(2);

        }


        function fnConfirmExit() {
            if (confirm('Do you want to Exit?'))
                return true;
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
                                <asp:Label runat="server" Text="Account Closure" ID="lblHeading" CssClass="styleDisplayLabel" BackColor=""> 
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <cc1:TabContainer ID="tcEnquiryAppraisal" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                                TabStripPlacement="top">
                                <cc1:TabPanel runat="server" HeaderText="General" ID="tbgeneral" CssClass="tabpan"
                                    BackColor="Red">
                                    <HeaderTemplate>
                                        Account Closure
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvLineOfBusiness" runat="server" Display="Dynamic"
                                                            ControlToValidate="ddlLOB" ValidationGroup="btnSave" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtAccClosureNo" TabIndex="-1" runat="server" ReadOnly="True"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:HiddenField ID="hidAccClosureNo" runat="server"></asp:HiddenField>
                                                    <asp:HiddenField ID="hidClosureDetailId" runat="server" Value="0"></asp:HiddenField>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Account Closure No" ID="lblAccountClosureNo" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtAccClosureDate" runat="server" ReadOnly="True"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Account Closure Date" ID="lblAccountClosureDate"
                                                            CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <uc2:Suggest ID="ddlBranch" ValidationGroup="btnSave" runat="server" ToolTip="Location"
                                                        ServiceMethod="GetBranchList" AutoPostBack="true" OnItem_Selected="ddlBranch_SelectedIndexChanged"
                                                        ErrorMessage="Select a Location" IsMandatory="true" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" ID="lblBranch" Text="Location" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <uc2:Suggest ID="ddlMLA" runat="server" ToolTip="Account No" ServiceMethod="GetPANUM" AutoPostBack="true"
                                                        OnItem_Selected="ddlMLA_SelectedIndexChanged" ValidationGroup="btnSave" IsMandatory="true"
                                                        ErrorMessage="Enter a Prime Account Number" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblMLA" runat="server" Text="Prime Account Number" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div style="display: none"
                                                class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">

                                                    <asp:DropDownList ID="ddlSLA" runat="server" Visible="false" AutoPostBack="True" OnSelectedIndexChanged="ddlSLA_SelectedIndexChanged"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvSLA" Enabled="False" runat="server" ControlToValidate="ddlSLA"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblSLA" runat="server" Text="Sub Account Number" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtStatus" runat="server" ReadOnly="True"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblStatus" Text="Account Closure Status" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlReason" runat="server"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblReason" runat="server" Text="Reason for Closure" CssClass="styleDisplayLabel"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlWriteOff" runat="server"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblReasonWriteoff" runat="server" Text="Reason for Write off" CssClass="styleDisplayLabel"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDrawingPower" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblDrawingPower" runat="server" Text="Drawing Power" CssClass="styleDisplayLabel"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFundsInUse" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFundsInUse" runat="server" Text="Funds In Use" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Panel ID="Panel3" runat="server" GroupingText="Customer Information" CssClass="stylePanel">
                                            <CD:CustomerDetails ID="ucdCustomer" runat="server" ActiveViewIndex="1" FirstColumnWidth="23%"
                                                SecondColumnWidth="25%" ThirdColumnWidth="21%" FourthColumnWidth="23%" />
                                            <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                            <table width="100%" border="0" style="display: none;">
                                                <tr>
                                                    <td class="styleFieldLabel" width="25%">
                                                        <asp:Label ID="lblCustCode" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign" width="27%">
                                                        <asp:TextBox ID="txtCustCode" ReadOnly="True" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="styleFieldLabel" width="23%">
                                                        <asp:Label ID="lblCustomerName" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtCustomerName" runat="server" ReadOnly="True"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblMAddress" runat="server" Text="Address1" CssClass="styleDisplayLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtMAddress" runat="server" ReadOnly="True"></asp:TextBox>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="Label3" runat="server" Text="Address2" CssClass="styleDisplayLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtMAddress2" runat="server" ReadOnly="True"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblMCity" runat="server" Text="City" CssClass="styleDisplayLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtMCity" runat="server" ReadOnly="True"></asp:TextBox>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblMState" runat="server" Text="State" CssClass="styleDisplayLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtMState" runat="server" ReadOnly="True"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblMCountry" runat="server" Text="Country" CssClass="styleDisplayLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtMCountry" runat="server" ReadOnly="True"></asp:TextBox>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblMPincode" runat="server" Text="Pincode/Zipcode" CssClass="styleDisplayLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtMPincode" runat="server" ReadOnly="True"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblMMobile" runat="server" Text="Mobile" CssClass="styleDisplayLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtMMobile" runat="server" ReadOnly="True"></asp:TextBox>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblMEmailid" runat="server" Text="EMail Id" CssClass="styleDisplayLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtMEmailid" runat="server" ReadOnly="True"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="General" ID="tbAccDetails" CssClass="tabpan"
                                    BackColor="Red" Enabled="false">
                                    <HeaderTemplate>
                                        Account Details
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtAccDate" runat="server" ReadOnly="True"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblAccDate" runat="server" Text="Account Date" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtMatureDate" runat="server" ReadOnly="True"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblMatureDate" runat="server" Text="Maturity Date" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtPrincipal" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblPrincipal" runat="server" Text="Total Principal" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFinanceCharge" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFinanceCharge" runat="server" Text="Total Finance Charge" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtIRR" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblAccIRR" runat="server" Text="Account IRR" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtBusinessIRR" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblBusinessIRR" runat="server" Text="Business IRR" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtCompanyIRR" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblCompanyIRR" runat="server" Text="Company IRR" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFlatRate" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFlatRate" runat="server" Text="Rate" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtTenure" runat="server" ReadOnly="True" Style="text-align: left;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblTenure" runat="server" Text="Tenure" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtMode" runat="server" ReadOnly="True"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblMode" runat="server" Text="Repayment Mode" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDiscountRate" Style="text-align: right" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvDiscountRate" runat="server" ControlToValidate="txtDiscountRate"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblDiscountRate" runat="server" Text="Discount Rate" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtoticePeriod" Style="text-align: right" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvoticePeriod" runat="server" ControlToValidate="txtoticePeriod"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblNoticePeriod" runat="server" Text="Notice Period" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDebitRate" Style="text-align: right" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvDebit" runat="server" ControlToValidate="txtDebitRate"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblDebitRate" runat="server" Text="Debit Rate" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtCreditRate" Style="text-align: right" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvCreditRate" runat="server" ControlToValidate="txtCreditRate"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblCreditRate" runat="server" Text="Credit Rate" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDelayDays" Style="text-align: right" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvDelayDays" runat="server" ControlToValidate="txtDelayDays"
                                                            CCssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblDelayDays" runat="server" Text="Delay Days" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtEarlyDays" Style="text-align: right" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtEarlyDays" runat="server" ControlToValidate="txtEarlyDays"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblEarlyDays" runat="server" Text="Early Days" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtODIBasis" Style="text-align: right" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtODIBasis" runat="server" ControlToValidate="txtODIBasis"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblODIBasis" runat="server" Text="ODI Basis" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlIgnoreLastCheques" runat="server"
                                                        class="md-form-control form-control">
                                                        <asp:ListItem Value="1" Text="Yes" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="No"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvIgnoreLastCheques" runat="server" ControlToValidate="ddlIgnoreLastCheques"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblIgnoreLastCheqs" runat="server" Text="Ignore Last Cheques" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Panel runat="server" ID="Panel7" CssClass="stylePanel" GroupingText="Asset Details">

                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="gird">
                                                        <asp:GridView ID="grvAsset" runat="server" HeaderStyle-CssClass="styleGridHeader"
                                                            RowStyle-HorizontalAlign="Center" AutoGenerateColumns="False" Width="100%">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sl.No.">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSlNo" Visible="true" runat="server" Text='<%#Container.DataItemIndex+1 %> '
                                                                            Style="text-align: center;"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAssetID" Visible="false" runat="server" Text='<%#Eval("Asset_ID")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField HeaderText="Asset Description" DataField="ASSET_DESCription" ItemStyle-HorizontalAlign="Left" />
                                                                <asp:TemplateField HeaderText="Registration No">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblRegNo" MaxLength="20" Text='<%#Eval("REGN_NUMBER")%>' Style="text-align: left;"
                                                                            runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                            <RowStyle HorizontalAlign="Center" />
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel runat="server" ID="Panel1" CssClass="stylePanel" GroupingText="Account Balance">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="gird">
                                                        <asp:GridView ID="grvAccountBalance" runat="server" AutoGenerateColumns="False" Width="100%">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Account Description">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDesc" MaxLength="20" Text='<%#Eval("Desc")%>' Style="text-align: left;"
                                                                            runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Due">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDue" MaxLength="20" Text='<%#Eval("Due")%>' Style="text-align: right;"
                                                                            runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Received">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblReceived" MaxLength="20" Text='<%#Eval("Received")%>' Style="text-align: right;"
                                                                            runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Outstanding">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblOutstanding" MaxLength="20" Text='<%#Eval("Outstanding")%>' runat="server"
                                                                            Style="text-align: right;"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                            <RowStyle HorizontalAlign="Center" />
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="General" ID="tbCashFlow" CssClass="tabpan"
                                    BackColor="Red" Enabled="false">
                                    <HeaderTemplate>
                                        Cash Flow Details
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:Panel runat="server" ID="Panel2" Width="99%" CssClass="stylePanel" GroupingText="Cash Flow Details">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtClosureBy" runat="server" ReadOnly="true"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvClsoureBy" runat="server" Display="Dynamic" ControlToValidate="txtClosureBy"
                                                                ValidationGroup="btnSave" CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblClosureBy" runat="server" Text="Account Closure Done By" CssClass="styleDisplayLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="grid">
                                                        <asp:GridView ID="grvCashFlow" runat="server" ShowFooter="True" AutoGenerateColumns="False"
                                                            OnRowDataBound="grvCashFlow_RowDataBound" OnDataBound="grvCashFlow_DataBound">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Cash flow description" ItemStyle-Width="20%">
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblTotal" runat="server" Text="Total" Style="text-align: left;"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCash" MaxLength="20" Text='<%#Eval("Description")%>' Style="text-align: left;"
                                                                            runat="server" ToolTip="Cash flow description"></asp:Label>
                                                                        <asp:HiddenField ID="hdnCashFlowID" Value='<%#Eval("ID")%>' runat="server" />
                                                                        <%-- <asp:HiddenField ID="hdnClosureID" Value='<%#Eval("Closure_Details_ID")%>' runat="server" />--%>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Due Amount" ItemStyle-Width="11%">
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblDueAmtFooter" runat="server" Text="" Style="text-align: right;"
                                                                            ToolTip="Total Due Amount"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDue" MaxLength="20" Text='<%#Eval("Due")%>' Style="text-align: right;"
                                                                            runat="server" ToolTip="Due Amount"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Waived Amount" ItemStyle-Width="11%" HeaderStyle-Wrap="true">
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblWaivedAmount" runat="server" Text="" Style="text-align: right;"
                                                                            ToolTip="Total Waived Amount"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtWaived" MaxLength="10" Width="100px" OnTextChanged="txtWaived_TextChanged"
                                                                            AutoPostBack="true" Style="text-align: right;" onkeypress="fnAllowNumbersOnly(true,false,this);"
                                                                            Text='<%#Eval("Waived")%>' runat="server" ToolTip="Waived Amount"></asp:TextBox>
                                                                        <%-- <cc1:FilteredTextBoxExtender ID="ftxtWaived" runat="server" FilterType="Numbers,Custom" ValidChars="."
                                                                                TargetControlID="txtWaived">
                                                                            </cc1:FilteredTextBoxExtender>--%>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Payable Amount" ItemStyle-Width="11%">
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblPayableAmount" runat="server" Text="" Style="text-align: right;"
                                                                            ToolTip="Total Payable Amount"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblPayable" MaxLength="20" Text='<%#Eval("Payable")%>' Style="text-align: right;"
                                                                            runat="server" ToolTip="Payable Amount"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Account Closure Amount" ItemStyle-Width="11%">
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblClosureAmount" runat="server" Text="" Style="text-align: right;"
                                                                            ToolTip="Total Account Closure Amount"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblClosure" MaxLength="20" Text='<%#Eval("Closure")%>' Style="text-align: right;"
                                                                            runat="server" ToolTip="Account Closure Amount"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Received Amount " ItemStyle-Width="11%" Visible="false">
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblReceviedAmount" runat="server" Text="" Style="text-align: right;"
                                                                            ToolTip="Total Received Amount "></asp:Label>
                                                                    </FooterTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblReceived" MaxLength="20" Text='<%#Eval("Received")%>' Style="text-align: right;"
                                                                            runat="server" ToolTip="Received Amount "></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="20%">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtRemarks" MaxLength="100" TextMode="MultiLine" Wrap="true" onkeyup="maxlengthfortxt(100);"
                                                                            ToolTip="Remarks" Rows="2" Columns="25" Text='<%#Eval("Remarks")%>' runat="server"
                                                                            Style="text-align: left;"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="fRemarks" runat="server" FilterType="UppercaseLetters,LowercaseLetters,Custom,Numbers"
                                                                            TargetControlID="txtRemarks" ValidChars=" ">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <FooterStyle HorizontalAlign="Center" />
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                            <RowStyle HorizontalAlign="Center" />
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>

                                            </table>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>
                        </div>
                    </div>

                    <div class="btn_height"></div>
                    <div align="right" class="fixed_btn">
                        <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]" validationgroup="btnSave"
                            onclientclick="return fnCheckPageValidators();">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" causesvalidation="false" runat="server" onclientclick="return confirm( Are you sure want Clear');"
                            onserverclick="btnClear_Click" type="button" accesskey="L" title="Clear[Alt+L]">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                            type="button" accesskey="X" title="Exit[Alt+X]">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                        <%--<div style="width: fit-content; margin-top: 15px;" align="right">--%>
                        <i class="fa fa-envelope btn_i" aria-hidden="true" style="top: 26px !important;"></i>
                        <asp:Button ID="btnEmail" CausesValidation="false" AccessKey="E" ToolTip="Email [Alt+E]" CssClass="save_btn fa fa-times" Text="Email" runat="server" />
                        <%--</div>--%>
                        <%-- <div style="width: fit-content; margin-top: 15px;">--%>
                        <i class="fa fa-file-pdf-o btn_i" aria-hidden="true" style="top: 26px !important;"></i>
                        <asp:Button ID="btnPrint" AccessKey="M" ToolTip="Alt+M" CausesValidation="false" CssClass="save_btn fa-file-pdf-o" OnClick="btnPrint_Click" Text="Print" runat="server"
                            Enabled="false" />

                        <%--</div>--%>
                           

                        
                        
                            
                       
                        &nbsp;<asp:Button ID="btnClosure" runat="server" Text="Closure Cancellation" AccessKey="N" CausesValidation="False"
                            ToolTip="Closure Cancellation" CssClass="styleSubmitButton" OnClick="btnClosure_Click"
                            Visible="false" />
                    </div>


                    <td align="center">
                        <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btnSave" />
                        <asp:CustomValidator ID="cvAccountClosure" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" Width="98%">
                        </asp:CustomValidator>
                    </td>
                    </tr>
                    </table>
            <asp:Button ID="Button1" runat="server" Text="Closure Cancellation" CausesValidation="false"
                OnClick="Button1_Click" Style="display: none;" />
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="Button1" />
            <asp:PostBackTrigger ControlID="btnSave" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
