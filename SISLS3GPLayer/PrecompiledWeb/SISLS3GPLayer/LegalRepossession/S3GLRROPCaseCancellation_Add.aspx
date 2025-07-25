<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LegalRepossession_S3GLRROPCaseCancellation, App_Web_prpaho0u" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="AutoSugg" TagPrefix="UC1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress" TagPrefix="uc5" %>
<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="IMC" TagPrefix="uc3" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function fnLoadCustomer() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCustomer').click();
        }
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }
        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_btnLoadCust').click();
        }
    </script>

    <asp:UpdatePanel ID="upCollection" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <asp:Panel runat="server" ID="pnlCancellation" Visible="true" CssClass="stylePanel" Width="99%" GroupingText="ROP Case Cancellation">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtCancelNo" ToolTip="ROP Cancellation No" Enabled="false" runat="server" autoComplete="off"
                                            class="md-form-control form-control login_form_content_input requires_true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblCancelNo" runat="server" CssClass="styleDisplayLabel" Text="ROP Cancellation No" ToolTip="ROP Cancellation No" />
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtCancellationDate" runat="server" ToolTip="ROP Cancellation Process" autoComplete="off"
                                            class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblCancellationDate" runat="server" CssClass="styleDisplayLabel" Text="Cancellation Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <asp:Panel runat="server" ID="pnlProposalhdrDisplayDetails" Visible="true" CssClass="stylePanel" Width="99%" GroupingText="ROP Case Filter Criteria">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <%--OnItem_Selected="ucAccountLov_Item_Selected"  OnClick="btnLoadAccount_Click"--%>
                                        <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" OnItem_Selected="ucAccountLov_Item_Selected" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both"
                                            strLOV_Code="ACC_ROPCNC" ServiceMethod="GetAccuntNoList" />
                                        <asp:Button ID="btnLoadAccount" runat="server" Text="Load Account No" OnClick="btnLoadAccount_Click" CausesValidation="false" UseSubmitBehavior="false"
                                            Style="display: none" />
                                        <asp:HiddenField ID="hdnPasa_Detail_ID" runat="server" />
                                        <asp:HiddenField ID="hdnCustomer_ID" runat="server" />
                                        <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblAccountNumber" CssClass="styleReqFieldLabel" runat="server" Text="Account Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div  class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div style="margin-top: 10px" class="md-input">
                                        <button class="css_btn_enabled" id="btnViewClient" causesvalidation="false" runat="server"
                                            type="button">
                                            <i class="fa fa-eye" aria-hidden="true"></i>&emsp;<u></u>View Customer
                                        </button>
                                    </div>
                                </div>
                                 <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" style="display:none">
                                    <div class="md-input">
                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                            strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" IsMandatory="true" ErrorMessage="Select Customer" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />

                                        <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="False" UseSubmitBehavior="False" OnClick="btnLoadCust_Click"
                                            Style="display: none" />
                                        <asp:Button ID="btncust" runat="server" CausesValidation="False" UseSubmitBehavior="False" OnClick="btncust_Click"
                                            Style="display: none" />
                                        <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code"></asp:TextBox>
                                        <asp:LinkButton ID="lnkViewCustomerDetails" runat="server" Text="View Customer" CssClass="styleDisplayLabel" Enabled="False" AccessKey="C"
                                            Visible="False" ToolTip="View the Customer Details, ALT+C" OnClick="lnkViewCustomerDetails_Click"></asp:LinkButton>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                             <asp:Label ID="lblCustomerID" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="lblCustomerName" CssClass="styleReqFieldLabel" runat="server" Text="Customer Name/Code"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLineofBusiness" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlLineofBusiness_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLineOfBusiness" runat="server" Text="Line Of Business" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" ToolTip="Branch" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblBranch" runat="server" CssClass="styleDisplayLabel" Text="Branch"></asp:Label>
                                        </label>
                                    </div>
                                </div>



                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtFIRRemarks" runat="server" ToolTip="ROP Withdrawal Remarks"
                                            autoComplete="off" class="md-form-control form-control login_form_content_input requires_true lowercase" onkeyup="maxlengthfortxt(200)"></asp:TextBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvRemarks" runat="server" ControlToValidate="txtFIRRemarks"
                                                SetFocusOnError="true" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Withdrawal remarks"
                                                ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblFIRRemarks" runat="server" CssClass="styleReqFieldLabel" Text="ROP Withdrawal Remarks"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <UC1:AutoSugg ID="ddlCaseNo" runat="server" class="md-form-control form-control" IsMandatory="true" ServiceMethod="GetCaseNumberList"
                                            ValidationGroup="Submit" ErrorMessage="Select  ROP Case No" OnItem_Selected="ddlCaseNo_Item_Selected" AutoPostBack="true" />
                                        <asp:Label runat="server" ID="lblFIRDate" Visible="false"></asp:Label>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblCaseNo" runat="server" Text="ROP Case No" ToolTip="ROP Case No" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInputBy" runat="server" ToolTip="Input By" onkeyup="maxlengthfortxt(200)" autoComplete="off" ReadOnly="true"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInputBy" runat="server" CssClass="styleDisplayLabel" Text="Input By"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtWithdrawDate" runat="server" ToolTip="Withdrawal Date" autoComplete="off"
                                            class="md-form-control form-control login_form_content_input requires_true" onkeyup="maxlengthfortxt(200)"></asp:TextBox>
                                        <cc1:CalendarExtender ID="calFIRDate" runat="server" Enabled="True" TargetControlID="txtWithdrawDate"
                                            PopupButtonID="imgFIRDate">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvtxtWithdrawDate" runat="server" ControlToValidate="txtWithdrawDate"
                                                SetFocusOnError="true" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Withdraw Date"
                                                ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblWithdrawDate" runat="server" CssClass="styleReqFieldLabel" Text="Withdrawal Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtComments" runat="server" ToolTip="Mng.Comments" autoComplete="off" TextMode="MultiLine"
                                            class="md-form-control form-control login_form_content_input requires_true lowercase" onkeyup="maxlengthfortxt(200)"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblComments" runat="server" CssClass="styleDisplayLabel" Text="Mng.Comments"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                            </div>

                            <div align="center">
                                <button class="css_btn_enabled" id="btnROPCase" onserverclick="btnROPCase_Click" runat="server"
                                    type="button" accesskey="V" causesvalidation="false" title="View ROP Case[Alt+V]">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>V</u>iew ROP Case
                                </button>
                            </div>

                            <%-- <td class="styleFieldLabel" width="20%">
                            <asp:Label ID="lblCustomerName" CssClass="styleDisplayLabel" runat="server" Text="Customer Name/Code"></asp:Label>
                        </td>
                        <td class="styleFieldAlign" width="30%">
                            <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go" Width="150px">  </asp:TextBox>
                            <uc3:IMC ID="ucCustomerCodeLov" HoverMenuExtenderLeft="true" TextWidth="122px" DispalyContent="Both" onblur="return fnLoadCustomer();" runat="server"
                                strLOV_Code="CMDFOUR" />
                            <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_OnClick"
                                Style="display: none" /><input id="hdnCustID" type="hidden" runat="server" />
                        </td>--%>
                            <%--  <td class="styleFieldAlign" style="width: 25%">
                                                    <asp:Label ID="lblPANum" runat="server" CssClass="styleDisplayLabel" Text="Account Number"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" style="width: 25%">
                                                    <uc2:Suggest ID="ddlPANum" runat="server" Width="150px" ServiceMethod="GetVendors"
                                                        ErrorMessage="Select an ROP Case No" />
                                                </td>--%>
                        </asp:Panel>
                    </div>
                </div>


                <div align="right">

                    <button class="css_btn_enabled" id="btnCaseCancel" onserverclick="btnCaseCancel_Click" runat="server" validationgroup="Submit" causesvalidation="false" title="ROP Case Cancel[Alt+R]"
                        onclick="if(fnCheckPageValidators('Submit'))"
                        type="button" accesskey="R">
                        <i class="fa fa-close" aria-hidden="true"></i>&emsp;<u>R</u>OP Case Cancel
                    </button>

                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_ServerClick" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnExit" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" onserverclick="btnExit_ServerClick"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
            </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
