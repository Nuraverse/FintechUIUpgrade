<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" maintainscrollpositiononpostback="true" inherits="Origination_S3G_ORG_ApplicationProcessing, App_Web_iftlmgmy" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="ICM" TagPrefix="uc3" %>



<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">





        var xPos, yPos;
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        function fnLoadCustomerMaster() {


            document.getElementById("<%= btnLoadCustomerMaster.ClientID %>").click();

        }


        function funControlStatus() {
            // debugger;
            var Vstatus = document.getElementById("<%= ddlStatus.ClientID %>").value;




            if (Vstatus != "1" && Vstatus != "3")//Hold or Pending
            {
                alert('Status not Allowed');
                document.getElementById("<%= ddlStatus.ClientID %>").value = "1";

            }

            if (Vstatus == "3") {

                ValidatorEnable(document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_rfvGenRemarks'), false);
            }
            else {
                ValidatorEnable(document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_rfvGenRemarks'), true);
            }
        }



        function fnLoadCustomerMasterGuar() {


            document.getElementById("<%= btnCustomerMasterGuarantorFocus.ClientID %>").click();

        }

        function BeginRequestHandler(sender, args) {

        }
        function initializeRequest(sender, e) {
        }

        function EndRequestHandler(sender, args) {
            //alert(sender._postBackSettings.sourceElement.id);
            //sender._postBackSettings.sourceElement.id.focus();
        }
        //prm.add_initializeRequest(initializeRequest);
        prm.add_beginRequest(BeginRequestHandler);
        prm.add_endRequest(EndRequestHandler);

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

        function fnTrashCommonSuggest(e) {


            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustomerCodeLease.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustomerCodeLease.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustomerCodeLease.ClientID %>').value = "";


                }
            }
        }

    </script>


    <style type="text/css">
        .fixed_btn_InLine {
            bottom: 0px;
            background-color: #fff;
            width: 100%;
            padding: 7px 25px;
        }

        .grid_btn_Disabled {
            font-size: 12px !important;
            font-weight: 400;
            padding: 3px 10px;
            text-align: center;
            background-color: #81868a;
            color: #fff;
            border-radius: 2px;
            text-decoration: none;
            border: none;
            box-shadow: none;
            cursor: pointer;
            /*font-size: 12px !important;
            font-weight: 400;
            padding: 3px 10px;
            text-align: center;
            background-color: #00529c !important;
            color: #fff;
            border-radius: 2px;
            text-decoration: none;
            border: none;
            box-shadow: none;
            cursor: pointer;*/
        }


        .grid_btn_delete_disabled {
            font-size: 12px !important;
            font-weight: 400;
            padding: 3px 10px;
            text-align: center;
            color: #bab0b0 !important;
            border: 1px #c6c2c2 solid;
            border-radius: 5px;
            text-decoration: none;
            box-shadow: none;
            cursor: pointer;
        }
    </style>


    <script type="text/javascript">

        function fnLoadCustomer() {
            ////debugger;
            document.getElementById("<%= btnLoadCustomer.ClientID %>").click();

        }

        function funSetFocus() {
            document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_ddlLifeInsurance').focus();


        }

        function fnLoadAsset() {
            ////debugger;
            document.getElementById("<%= btnAssetLoad.ClientID %>").click();

        }
        function fnConfirmDealCancel() {
            if (confirm('Are you sure you want to Cancel this Deal'))
                return true;
            else
                return false;
        }
        function fnLoadCustomer_Pro() {
            //debugger;





        }

        function funCheckOverDueLenth() {
            if (document.getElementById("<%= txtOverDueCharges.ClientID %>").value != "") {

                if (parseFloat(document.getElementById("<%= txtOverDueCharges.ClientID %>").Value) > 100) {
                    alert('Over Due Rate should not exeed 100');
                    document.getElementById("<%= txtOverDueCharges.ClientID %>").value = "";
                }
            }
        }


        function funCheckRange() {

            if (document.getElementById("<%= txtStartDatedelayrate.ClientID %>").value != "") {
                if (parseFloat(document.getElementById("<%= txtStartDatedelayrate.ClientID %>").value) > 100) {
                    alert('Start Delay Rate should not exeed 100');
                    document.getElementById("<%= txtStartDatedelayrate.ClientID %>").value = "";
                }
            }
        }
        function funCheckRangeLineofCredit() {

            if (document.getElementById("<%= txtDiscountRateforLineofCredit.ClientID %>").value != "") {

                if (document.getElementById("<%= txtRate.ClientID %>").value == "") {
                    document.getElementById("<%= txtRate.ClientID %>").value == "0";
                }



                if (parseFloat(document.getElementById("<%= txtDiscountRateforLineofCredit.ClientID %>").value) > parseFloat(document.getElementById("<%= txtRate.ClientID %>").value)) {
                    alert('Discount Rate for Line of Credit should be less than or Equal ROI Rate');
                    document.getElementById("<%= txtDiscountRateforLineofCredit.ClientID %>").value = "";
                }


                if (parseFloat(document.getElementById("<%= txtDiscountRateforLineofCredit.ClientID %>").value) > 100) {
                    alert('Discount Rate for Line of Credit should be less than or Equal to 100');
                    document.getElementById("<%= txtDiscountRateforLineofCredit.ClientID %>").value = "";
                }
            }
        }




        function funCheckRangePenal() {

            if (document.getElementById("<%= txtPenalRate.ClientID %>").value != "") {
                if (parseFloat(document.getElementById("<%= txtPenalRate.ClientID %>").value) > 100) {
                    alert('Penal Rate should be less than or Equal to  100');
                    document.getElementById("<%= txtPenalRate.ClientID %>").value = "";
                }
            }
        }

        function funCreditPeriodValidation() {

            if (document.getElementById("<%= txtCreditPeriodInDays.ClientID %>").value != "") {
                if (parseFloat(document.getElementById("<%= txtCreditPeriodInDays.ClientID %>").value) <= 0) {
                    alert('Credit Period should be greater than the zero');
                    document.getElementById("<%= txtCreditPeriodInDays.ClientID %>").value = "";
                }
            }
        }

        function funValidateCumilativeSubLimit() {
            var VdebptPurchaseLimit = document.getElementById("<%= txtDebtPurchaseLimitFWC.ClientID %>").value;
            var VTotalSubLimit = document.getElementById("<%= txtTotalSubLimit.ClientID %>").value;

            if (parseFloat(VdebptPurchaseLimit) > parseFloat(VTotalSubLimit)) {
                alert('Debt Purchase limit should be less than or Equal to Cumulative Sub limit');
                document.getElementById("<%= txtDebtPurchaseLimitFWC.ClientID %>").value = "";
                return;
            }
        }


        function funPrepaymentValidation() {
            var vPrePay = document.getElementById("<%= txtPrePaymentLimitFWC.ClientID %>").value;
            var VdebptPurchaseLimit = document.getElementById("<%= txtDebtPurchaseLimitFWC.ClientID %>").value;

            var VMarginFwcPer = document.getElementById("<%= txtMarginFWC.ClientID %>").value;
            var VRoiMarginPer = document.getElementById("<%= txt_Margin_Percentage.ClientID %>").value;



            if (vPrePay == null || vPrePay == "") {
                vPrePay = 0;
            }
            if (VdebptPurchaseLimit == null || VdebptPurchaseLimit == "") {
                VdebptPurchaseLimit = 0;
            }
            if (VMarginFwcPer == null || VMarginFwcPer == "") {
                VMarginFwcPer = 0;
            }

            if (parseFloat(vPrePay) < 0) {
                document.getElementById("<%= txtPrePaymentLimitFWC.ClientID %>").value = "";

            }

            document.getElementById("<%= txtMarginFWC.ClientID %>").value = parseFloat(((VdebptPurchaseLimit * VRoiMarginPer) / 100)).toFixed(3);
            funCalFundingLimit();




            var element = document.getElementById("<%= txtPrePaymentLimitFWC.ClientID %>");


        }

        function funCalFundingLimit() {
            var vMargin = document.getElementById("<%= txtMarginFWC.ClientID %>").value;
            var vDp = document.getElementById("<%= txtDebtPurchaseLimitFWC.ClientID %>").value;
            var vFundLimit = document.getElementById("<%= txtPrePaymentLimitFWC.ClientID %>").value;

            if (vMargin == null || vMargin == "") {
                vMargin = 0;
            }
            if (vDp == null || vDp == "") {
                vDp = 0;
            }

            if (parseFloat(vMargin) > parseFloat(vDp)) {
                alert('Margin Amount should be less than the Debt Purchase Limit');
                document.getElementById("<%= txtMarginFWC.ClientID %>").value = "";
                document.getElementById("<%= txtPrePaymentLimitFWC.ClientID %>").value = "";
                return;
            }
            document.getElementById("<%= txtInvoiceCapValue.ClientID %>").value = "";
            document.getElementById("<%= txtPrePaymentLimitFWC.ClientID %>").value = (parseFloat(vDp) - (parseFloat(vDp) * parseFloat(vMargin) * 100 / 100) / 100).toFixed(3);

            if (parseFloat(document.getElementById("<%= txtTotalSubLimit.ClientID %>").value) < parseFloat(document.getElementById("<%= txtPrePaymentLimitFWC.ClientID %>").value)) {
                alert('PrePayment Limit should be less than or equal to Cumulative  Sub limit');
                document.getElementById("<%= txtPrePaymentLimitFWC.ClientID %>").value = "";
                return;
            }



        }



        function funPrepaymentInvoice() {
            var vPrePay = document.getElementById("<%= txtPrePaymentLimitFWC.ClientID %>").value;
            var VInvoiceValue = document.getElementById("<%= txtInvoiceCapValue.ClientID %>").value;

            if (vPrePay == null || vPrePay == "") {
                vPrePay = 0;
            }
            if (VInvoiceValue == null || VInvoiceValue == "") {
                VInvoiceValue = 0;
            }


            if (parseFloat(VInvoiceValue) > parseFloat(vPrePay)) {
                document.getElementById("<%= txtInvoiceCapValue.ClientID %>").value = "";
                alert('Invoice Cap Value Should be less than or equal to Funding Limit');

            }

        }

        function fnLoadCustomer_FWC() {
            ////debugger;
            document.getElementById("<%= btnLoadCustomerFWC.ClientID %>").click();


        }

        function fnLoadCustomerSubLimitDLR() {

            document.getElementById("<%= btnLoadCustomerMapFWC.ClientID %>").click();

        }

        function fnLoadAccount() {

            //document.getElementById("").click();
            //btnDealTransferAccountLov.ClientID
        }

        function ddlDealTransfer_SelectedIndexChanged() {

            var s = document.getElementById("<%= ddlDealTransfer.ClientID %>").value;
            if (s == "0") {
                document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_ucDealTransferAccountLov_TxtName').disabled = true;
                document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_ucDealTransferAccountLov_btnGetLOV').disabled = true;
                document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_pnlDealTransfer').style.display = 'none';

            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_ucDealTransferAccountLov_TxtName').disabled = false;
                document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_ucDealTransferAccountLov_btnGetLOV').disabled = false;
                document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_ucDealTransferAccountLov_pnlDealTransfer').disabled = false;

                document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_pnlDealTransfer').style.display = 'block';
            }
            //document.getElementById("<%= ddlDealTransfer.ClientID %>").focus();
            document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_ddlDealTransfer').focus();
        }

        function funRepamentMode() {

            var v = document.getElementById("<%= ddlRepamentMode.ClientID %>").value;
            if (v == "6" || v == "7") {
                document.getElementById("<%= ddlPNTD.ClientID %>").value = "0";
                document.getElementById("<%= ddlPNTD.ClientID %>").disabled = true;

            }
            else {
                document.getElementById("<%= ddlPNTD.ClientID %>").value = "0";
                document.getElementById("<%= ddlPNTD.ClientID %>").disabled = false;
            }



            //$("#txtName").attr("disabled", "disabled");
        }




        function ddlLeadSource_SelectedIndexChanged() {
            //debugger;
            document.getElementById('<%= ((TextBox)ddlLeadSourceName.FindControl("txtItemName")).ClientID %>').value = '--Select--';
            document.getElementById('<%= ((TextBox)ddlLeadSourceName.FindControl("hdnSelectedValue")).ClientID %>').value = 0;
            PageMethods.ddlLeadSource_SelectedIndexChanged_Page(document.getElementById("<%=ddlLeadSource.ClientID%>").value);

        }
        function ddlLOB_SelectedIndexChanged(sender, args) {
            //debugger;
            //PageMethods.ddlLOB_SelectedIndexChanged_Page(document.getElementById("<%=ddlLOB.ClientID%>").value);
            //GetCountries();
        }

        //function OnSuccess(response, userContext, methodName) {
        //    alert(response);

        //Added By Shibu Resize Grid
        function GetChildGridResize(ImageType) {
            //debugger;
            if (ImageType == "Hide Menu") {
                document.getElementById('<%=DivFollow.ClientID %>').style.width = parseInt(screen.width) - 20;
                document.getElementById('<%=DivFollow.ClientID %>').style.overflow = "scroll";
            }
            else {
                document.getElementById('<%=DivFollow.ClientID %>').style.width = parseInt(screen.width) - 260;
                document.getElementById('<%=DivFollow.ClientID %>').style.overflow = "scroll";
            }
        }
        // Added by Vinodh.N for Call id = 4090 to allow backdate
        function checkDate_ApplicationDate(sender, args) {
            //debugger;
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 1;
            if (vartoday < selectedDate) {
                alert('Application Date should be less than or equal to Current Date');
                document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_txtApplicationDateDate').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_txtApplicationDateDate').value = vartoday.format(sender._format);
            }
            else {
                if (intValid == 1) {
                    document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_txtApplicationDateDate').value = selectedDate.format(sender._format);
                }
            }
        }


    </script>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>

            <%-- <tr>
                    <td class="stylePageHeading">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Application Processing">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>--%>
            <div class="row">
                <div class="col">
                    <div class="row title_header">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Account Information">
                            </asp:Label>
                            <asp:HiddenField runat="server" ID="hdnCustAge" />
                        </h6>
                    </div>
                </div>
            </div>



            <%-- <div class="row" style="padding: 0px !important; vertical-align: central;">--%>
            <%--<div class="col-md-4 col-sm-4 col-xs-12">
                    <br />--%>
            <%--  <div class="md-input">
                        <asp:UpdatePanel ID="upLineofBusiness" ChildrenAsTriggers="true" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlLOB" class="md-form-control form-control" AutoPostBack="true" ToolTip="Line of Business" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                <asp:HiddenField ID="hdnLobCode" runat="server" />
                                <asp:HiddenField ID="ddlLOB_SelectedItem_Text" runat="server" />
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvddlLob" runat="server"
                                        CssClass="validation_msg_box_sapn" ErrorMessage="Select the Line of Business"
                                        SetFocusOnError="true" ControlToValidate="ddlLob" InitialValue="--Select--" ValidationGroup="Main Page"
                                        Display="Dynamic"></asp:RequiredFieldValidator>

                                </div>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                        ErrorMessage="Select a Line of Business" ValidationGroup="tcAsset"></asp:RequiredFieldValidator>
                                </div>

                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" ID="lblLOB" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                </label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>--%>
            <%-- </div>--%>

            <asp:Panel runat="server" ID="pnlProposalhdrDisplayDetails" CssClass="stylePanel" HorizontalAlign="Center" Width="99%" GroupingText="Proposal Details">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                        <div class="md-input">
                            <%-- <asp:UpdatePanel ID="upLineofBusiness" ChildrenAsTriggers="true" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>--%>
                            <asp:DropDownList ID="ddlLOB" class="md-form-control form-control" AutoPostBack="true" ToolTip="Line of Business" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" runat="server"></asp:DropDownList>
                            <asp:HiddenField ID="hdnLobCode" runat="server" />
                            <asp:HiddenField ID="hdnQueryMode" runat="server" />
                            <asp:HiddenField ID="ddlLOB_SelectedItem_Text" runat="server" />
                            <div class="validation_msg_box">
                                <asp:RequiredFieldValidator ID="rfvddlLob" runat="server"
                                    CssClass="validation_msg_box_sapn" ErrorMessage="Select the Line of Business"
                                    SetFocusOnError="true" ControlToValidate="ddlLob" InitialValue="--Select--" ValidationGroup="Main Page"
                                    Display="Dynamic"></asp:RequiredFieldValidator>

                            </div>
                            <div class="validation_msg_box">
                                <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                    CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                    ErrorMessage="Select a Line of Business" ValidationGroup="tcAsset"></asp:RequiredFieldValidator>
                            </div>
                            <div class="validation_msg_box">
                                <asp:RequiredFieldValidator ID="rfvLOBMainPage" runat="server" ControlToValidate="ddlLOB"
                                    CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                    ErrorMessage="Select a Line of Business" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                            </div>

                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label class="tess">
                                <asp:Label runat="server" ID="lblLOB" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                            </label>
                            <%-- </ContentTemplate>
                            </asp:UpdatePanel>--%>
                        </div>
                    </div>
                    <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                        <div class="md-input">


                            <asp:TextBox ID="txtCustomerCode" runat="server" MaxLength="50" Style="display: none;"></asp:TextBox>


                            <%-- <UC4:ICM ID="ddlApplicationNo" onblur="fnLoadCustomer_Pro()" runat="server" ToolTip="Application No[Proposal From Checklist]." AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ddlApplicationNo_Item_Selected"
                                                                strLOV_Code="PRO_APP" ServiceMethod="GetProposalFromCheckList" />
                                                            <asp:Button ID="btnLoadCustomerPro" Style="display: none" runat="server" OnClick="btnLoadCheckList_OnClick" Text="Load Customer" />
                                                            <input id="Hidden3" type="hidden" runat="server" />--%>

                            <cc1:ComboBox ID="ddlBusinessOfferNoList" runat="server" AppendDataBoundItems="true" AutoCompleteMode="SuggestAppend" AutoPostBack="false" CaseSensitive="false" CssClass="WindowsStyle" DropDownStyle="DropDownList" ToolTip="Proposal No." Visible="false">
                            </cc1:ComboBox>

                            <uc:Suggest ID="ddlApplicationNo" AutoPostBack="true" class="md-form-control form-control" ToolTip="Application No[Proposal From Checklist]" runat="server" ErrorMessage="Select the Marketing Officer" IsMandatory="false" ServiceMethod="GetProposalFromCheckList" OnItem_Selected="ddlApplicationNo_Item_Selected" ValidationGroup="Main Page" />
                            <span class="highlight"></span>


                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label class="tess">
                                <asp:Label ID="lblBusinessOfferNo" runat="server" CssClass="styleDisplayLabel" Text="Application No[Proposal From Checklist]"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-12 col-xs-12">
                        <div class="md-input">
                            <asp:TextBox ID="txtAccountNumber" ToolTip="Account Number" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true" TabIndex="-1" runat="server" />
                            <%-- <div class="validation_msg_box">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="validation_msg_box_sapn" ValidationGroup="Main Page"
                                    ErrorMessage="Enter the Status" InitialValue="0" SetFocusOnError="true" ControlToValidate="ddlStatus"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>--%>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label ID="lblAccountNumber" CssClass="styleDisplayLabel" TabIndex="-1" runat="server" Text="Account Number"></asp:Label>
                                <input type="hidden" id="div_position" name="div_position" />
                                <asp:TextBox ID="txtCustomerFocus" runat="server"></asp:TextBox>
                                <asp:Button ID="btnLoadCustomerMaster" Style="display: none" runat="server" Text="Load Asset" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomerMaster_Click" />

                                <asp:TextBox ID="txtCustomerMasterGuarantorFocus" runat="server"></asp:TextBox>
                                <asp:Button ID="btnCustomerMasterGuarantorFocus" Style="display: none" runat="server" Text="Guarantor" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomerMasterGuarantor_Click" />

                            </label>
                        </div>


                        <div style="display: none" class="col">

                            <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                            <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />

                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-12 col-xs-12">
                        <div class="md-input">
                            <asp:TextBox ID="txtProposalNumber" Enabled="false" ToolTip="Proposal Number" TabIndex="-1" class="md-form-control form-control login_form_content_input requires_true" runat="server" />
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label ID="lblProposalNumber" CssClass="styleDisplayLabel" runat="server" Text="Proposal Number"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-12 col-xs-12">
                        <div class="md-input">
                            <asp:DropDownList ID="ddlStatus" Enabled="false" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" TabIndex="-1" class="md-form-control form-control" runat="server" ToolTip="Status"></asp:DropDownList>
                            <div class="validation_msg_box">
                                <asp:RequiredFieldValidator ID="rfvStatus" runat="server" CssClass="validation_msg_box_sapn" ValidationGroup="Main Page"
                                    ErrorMessage="Enter the Status" InitialValue="0" SetFocusOnError="true" ControlToValidate="ddlStatus"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label class="tess">
                                <asp:Label ID="lblStatus" runat="server" CssClass="styleDisplayLabel" Text="Proposal Status"
                                    ToolTip="Status"></asp:Label>
                            </label>
                        </div>
                    </div>



                </div>
            </asp:Panel>
            <%-- <div class="row" id="dvScroll">--%>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">


                <cc1:TabContainer ID="TabContainerAP" runat="server" CssClass="styleTabPanel" Width="100%"
                    ScrollBars="None" ActiveTabIndex="0">
                    <cc1:TabPanel runat="server" ID="TabMainPage" CssClass="tabpan" BackColor="Red" Width="100%">
                        <HeaderTemplate>
                            Main Page
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upInputCriteria" runat="server">
                                <ContentTemplate>
                                    <input id="hdnCustID" type="hidden" runat="server" />
                                    <input id="hdnConstitutionId" runat="server" type="hidden" />
                                    <asp:Panel ID="pnlMainTab" runat="server">
                                        <div class="row">

                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">



                                                <asp:Panel ID="pnlLeaseInputCriteria" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                                                    Width="99%">
                                                    <div class="row">





                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlBranchList" class="md-form-control form-control" ToolTip="Branch" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <%--<asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Select the Location"
                                                                    SetFocusOnError="true" ControlToValidate="ddlBranchList" InitialValue="0" ValidationGroup="Main Page"
                                                                    Display="None"></asp:RequiredFieldValidator>--%>

                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvLocation" runat="server" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Branch"
                                                                        SetFocusOnError="true" ControlToValidate="ddlBranchList" InitialValue="0" ValidationGroup="Main Page"
                                                                        Display="Dynamic"></asp:RequiredFieldValidator>

                                                                </div>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblLocation" runat="server" ToolTip="Branch" Text="Branch" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="cmbSubLocation" OnSelectedIndexChanged="cmbSubLocation_SelectedIndexChanged" class="md-form-control form-control" runat="server" ToolTip="Sub Branch" AutoPostBack="true">
                                                                </asp:DropDownList>
                                                                <%--<asp:RequiredFieldValidator ID="rfvSubLocation" runat="server" ErrorMessage="Select the Sub Location"
                                                                    SetFocusOnError="true" ControlToValidate="cmbSubLocation" InitialValue="0" ValidationGroup="Main Page"
                                                                    Display="None"></asp:RequiredFieldValidator>--%>

                                                                <%-- <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvSubLocation" runat="server" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Sub Location"
                                                                    SetFocusOnError="true" ControlToValidate="cmbSubLocation" InitialValue="0" ValidationGroup="Main Page"
                                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                            </div>--%>


                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblSubLocation" runat="server" ToolTip="Sub Branch" Text="Sub Branch" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">

                                                                <asp:DropDownList ID="ddlProductCodeList" ToolTip="Scheme" class="md-form-control form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProductCodeList_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <%-- <asp:RequiredFieldValidator ID="rfvProductCodeList" runat="server" ControlToValidate="ddlProductCodeList"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ErrorMessage="Select a Scheme"
                                                                    ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlProductCodeList"
                                                                    CssClass="styleMandatoryLabel" Display="None" InitialValue="0" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Scheme" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>



                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvProductCodeList" runat="server" ControlToValidate="ddlProductCodeList"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                                        ErrorMessage="Select a Scheme" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label runat="server" ID="lblProductCode" CssClass="styleReqFieldLabel" Text="Scheme"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlCreditPurpose" class="md-form-control form-control" runat="server" ToolTip="Credit Purpose">
                                                                </asp:DropDownList>
                                                                <%-- <asp:RequiredFieldValidator ID="rfvddlCreditPurpose" runat="server" ControlToValidate="ddlCreditPurpose"
                                                                    CssClass="styleMandatoryLabel" Display="None" InitialValue="0" SetFocusOnError="True"
                                                                    ErrorMessage="Select the Credit Purpose" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>

                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvddlCreditPurpose" runat="server" ControlToValidate="ddlCreditPurpose"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                                        ErrorMessage="Select the Credit Purpose" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>




                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label runat="server" ID="lblCreditPurpose" CssClass="styleReqFieldLabel" ToolTip="Credit Purpose" Text="Credit Purpose"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtApplicationDateDate" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Application Date" Enabled="false" AutoPostBack="true" OnTextChanged="txtApplicationDateDate_TextChanged" runat="server"></asp:TextBox>
                                                                <asp:TextBox ID="txtOfferDate" Visible="false" runat="server"></asp:TextBox>
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtApplicationDateDate" PopupButtonID="imgApplicationdate" ID="CalendarApplicationDate" Enabled="false" OnClientDateSelectionChanged="checkDate_ApplicationDate">
                                                                </cc1:CalendarExtender>
                                                                <%-- <asp:Image ID="imgApplicationdate" Visible="false" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvApplicationDate" runat="server" ControlToValidate="txtApplicationDateDate"
                                                                        Display="Dynamic" ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" SetFocusOnError="True"
                                                                        ErrorMessage="Enter an Application Date"></asp:RequiredFieldValidator>
                                                                </div>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblDate" CssClass="styleReqFieldLabel" Text="Application Date"></asp:Label>
                                                                </label>
                                                            </div>



                                                        </div>
                                                        <div id="divddlContType" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlContType" class="md-form-control form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlContType_SelectedIndexChanged" ToolTip="Contract Type">
                                                                </asp:DropDownList>
                                                                <%-- <asp:RequiredFieldValidator ID="rfvToolTip" runat="server" ControlToValidate="ddlContType" Display="None"
                                                                     ErrorMessage="Select the Contract Type" InitialValue="0" SetFocusOnError="true" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvToolTip" runat="server" CssClass="validation_msg_box_sapn" ControlToValidate="ddlContType" Display="Dynamic"
                                                                        ErrorMessage="Select the Contract Type" InitialValue="0" SetFocusOnError="true" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblContType" runat="server" CssClass="styleReqFieldLabel" Text="Contract Type" ToolTip="Contract Type"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <%--<asp:TextBox ID="txtCustomerCodeLease" runat="server" Style="display: none" class="md-form-control form-control login_form_content_input requires_true" MaxLength="50"></asp:TextBox>
                                                                <uc3:ICM ID="ucCustomerCodeLov" HoverMenuExtenderLeft="true" runat="server" DispalyContent="Both" onblur="return fnLoadCustomer();" strLOV_Code="CMDFOUR" />
                                                                <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" OnClick="btnLoadCustomer_Click"
                                                                    Style="display: none" /><input id="Hidden2" type="hidden" runat="server" />
                                                                <asp:Button ID="btnCreateCustomer" runat="server" OnClick="btnCreateApplicant_Click" CssClass="styleSubmitShortButton" Text="Create" /><input id="Hidden4" type="hidden" runat="server" />--%>


                                                                <%--<asp:RequiredFieldValidator ID="rfvcmbCustomer" runat="server" ControlToValidate="txtCustomerCodeLease"
                                                                    ErrorMessage="Select a Customer Code" ValidationGroup="Main Page" CssClass="styleMandatoryLabel"
                                                                    Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <asp:RequiredFieldValidator ID="rfvCustomer" runat="server" ControlToValidate="txtCustomerCodeLease"
                                                                    ErrorMessage="Select a Customer Code" ValidationGroup="tcAsset" CssClass="styleMandatoryLabel"
                                                                    Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                <table style="width: 100%">
                                                                    <tr>
                                                                        <td style="padding: 0px !important; padding-right: 5px !important">
                                                                            <asp:TextBox ID="txtCustomerCodeLease" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                                Style="display: none;" MaxLength="50"></asp:TextBox>
                                                                            <UC4:ICM ID="ucCustomerCodeLov" ToolTip="Customer Name" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" ShowHideAddressImageButton="true" AutoPostBack="true" DispalyContent="Both"
                                                                                strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                                                            <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_Click"
                                                                                Style="display: none" />
                                                                            <asp:Button ID="btnGuar" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnGuar_Click"
                                                                                Style="display: none" />
                                                                            <%--<asp:Button ID="btnCreateCustomer" runat="server" OnClick="btnCreateApplicant_Click" CssClass="styleSubmitShortButton" Text="Create" /><input id="Hidden4" type="hidden" runat="server" />--%>
                                                                        </td>
                                                                        <td style="padding: 0px !important; width: 24px;">
                                                                            <i style="font-size: 6px; color: aliceblue">
                                                                                <button id="btnCreateCustomer" runat="server" causesvalidation="false" onserverclick="btnCreateApplicant_Click" title="Create Customer" class="btn_control"><i class="fa fa-plus-square"></i></button>
                                                                                <asp:HiddenField runat="server" ID="hdnAge" />
                                                                            </i>
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
                                                                    <asp:Label runat="server" Text="Customer Name" ID="lblCustomerName" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div style="margin-top: 10px" class="md-input">
                                                                <button class="css_btn_enabled" id="btnViewCustomer" causesvalidation="false" runat="server"
                                                                    type="button">
                                                                    <i class="fa fa-eye" aria-hidden="true"></i>&emsp;<u></u>View Customer/Client
                                                                </button>

                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">


                                                                <asp:TextBox ID="txtCreditLimit" ToolTip="Credit Limit" class="md-form-control form-control login_form_content_input requires_true" runat="server" Enabled="false" AutoPostBack="false" TabIndex="-1">
                                                                </asp:TextBox>



                                                                <%--<asp:RequiredFieldValidator ID="rfvtxtCreditLimit" runat="server" ControlToValidate="txtCreditLimit" CssClass="styleMandatoryLabel" 
                                                                    Display="None" ErrorMessage="Select a the Credit Limit" SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>

                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvtxtCreditLimit" runat="server" ControlToValidate="txtCreditLimit" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" ErrorMessage="Select a the Credit Limit" SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCrditLimit" runat="server" CssClass="styleDisplayLabel" Text="Credit Limit" ToolTip="Credit Limit"></asp:Label>
                                                                </label>
                                                            </div>



                                                        </div>
                                                        <div id="divddlDealTransfer" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlDealTransfer" class="md-form-control form-control" ToolTip="Deal Transfer" AutoPostBack="true" OnSelectedIndexChanged="ddlDealTransfer_SelectedIndexChanged" runat="server">
                                                                    <asp:ListItem Value="0" Text="No" Selected="True"></asp:ListItem>
                                                                    <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblDealTransfer" ToolTip="Deal Transfer" runat="server" CssClass="styleDisplayLabel" Text="Deal Transfer"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:Panel ID="pnlCopyProfile" runat="server">
                                                                    <asp:TextBox ID="TextBox1" runat="server" Style="display: none;" MaxLength="50"></asp:TextBox>
                                                                    <uc3:ICM ID="ICM2" Visible="false" runat="server" ShowHideAddressImageButton="false" DispalyContent="Both" onblur="return fnLoadCustomer();" strLOV_Code="ICMD" />
                                                                    <asp:Button ID="btnLoadCustomerCopy" runat="server" Text="Load Customer" OnClick="btnLoadCustomer_OnClick"
                                                                        Style="display: none" /><input id="Hidden1" type="hidden" runat="server" />
                                                                </asp:Panel>
                                                                <asp:Button ID="btnGetdummy" runat="server" Text="..." CausesValidation="false" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCopyProfile" ToolTip="Copy Profile" runat="server" Text="Copy Profile"></asp:Label>
                                                                </label>
                                                            </div>





                                                            <div>

                                                                <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:Label ID="lblRoundNo" runat="server" Style="text-align: right" Visible="false"></asp:Label>
                                                                        <asp:Label ID="lblRoundNumber" runat="server" Text="Round No :" Visible="false"></asp:Label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">

                                                                <asp:TextBox ID="txtGeneralRemarks" TextMode="MultiLine" ToolTip="Remarks" onkeyup="maxlengthfortxt(200);" runat="server"
                                                                    AutoPostBack="false" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvGenRemarks" Enabled="false" runat="server" ControlToValidate="txtGeneralRemarks"
                                                                        ErrorMessage="Enter the Remarks" ValidationGroup="Main Page" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <label>
                                                                    <asp:Label ID="lblGeneralRemarks" runat="server" Text="Remarks" ToolTip="Remarks" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </asp:Panel>
                                                <asp:Panel ID="pnlDealTransfer" Style="display: none" runat="server" GroupingText="Deal Transfer"
                                                    CssClass="stylePanel" Width="99%">
                                                    <div class="row">

                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <%-- <UC4:ICM ID="ucDealTransferAccountLov" onblur="fnLoadAccount()" ToolTip="Transfer Deal" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Name" OnItem_Selected="ucDealTransferAccount_Item_Selected"
                                                                strLOV_Code="ACC_DEALTRNS" ServiceMethod="GetDealTransAccountNo" />--%>
                                                                <%--  <asp:Button ID="btnDealTransferAccountLov" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnDealTransferAccountLov_Click"
                                                                Style="display: none" />--%>
                                                                <uc:Suggest ID="ddldealTrasPanum" runat="server" class="md-form-control form-control" AutoPostBack="true" ToolTip="Account No" OnItem_Selected="ucDealTransferAccount_Item_Selected" ServiceMethod="GetDealTransAccountNo"
                                                                    ErrorMessage="Select the Account No"
                                                                    ValidationGroup="Main Page" IsMandatory="false" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblTransferDeal" ToolTip="Transfer Deal" runat="server" Text="Transfer Deal"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <%-- <i class="fa fa-arrow-circle-right btn_i" aria-hidden="true" style="top: 10px !important; left: 25px"></i>--%>
                                                                <%-- <asp:Button ID="btnAddDealTransfer" runat="server" Text="Add Deal" AccessKey="Q" ToolTip="Add Deal [Alt+A]" class="css_btn_enabled" OnClick="btnAddDealTransfer_Click" CausesValidation="false" UseSubmitBehavior="false" />--%>
                                                                <div class="md-input">
                                                                    <button class="css_btn_enabled" id="btnAddDeal" title="Add Deal[Alt+Q]" causesvalidation="false" onserverclick="btnAddDealTransfer_Click" runat="server"
                                                                        type="button" accesskey="Q">
                                                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u></u>Add Deal
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div class="row">

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView runat="server" ID="grvTransferDeal" AutoGenerateColumns="False" ShowFooter="false"
                                                                    OnRowDataBound="grvTransferDeal_RowDataBound" class="gird_details" OnRowDeleting="grvTransferDeal_RowDeleting" OnRowCommand="grvTransferDeal_RowCommand" ToolTip="Transfer Deal">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="S.NO" HeaderStyle-Width="2%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSno" runat="server" Text='<%#Eval("sno")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Account No" HeaderStyle-Width="16%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblContractNo" runat="server" Text='<%#Eval("Contract_No")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="16%" HorizontalAlign="Left"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Finance Amount" HeaderStyle-Width="16%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblFinanceAmount" runat="server" Text='<%#Eval("finance_amount")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="16%" HorizontalAlign="Right"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Tenor" HeaderStyle-Width="16%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblTenure" runat="server" Text='<%#Eval("tenure")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="16%" HorizontalAlign="Center"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Schedule B" HeaderStyle-Width="16%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblScheduleB" runat="server" Text='<%#Eval("SCHB")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="16%" HorizontalAlign="Right" />
                                                                            <FooterStyle Width="16%" HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Os" HeaderStyle-Width="16%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblOs" runat="server" Text='<%#Eval("OS_DEC")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="16%" HorizontalAlign="Right" />
                                                                            <FooterStyle Width="16%" HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderStyle-Width="16%">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="btnRemoveDays" Text="Delete" CssClass="grid_btn_delete" AccessKey="R" ToolTip="Alt+R" OnClick="btnRemoveDealTransfer_Click" runat="server"
                                                                                    CausesValidation="false" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:Button ID="btnAddrowDays" runat="server" Text="Add" CssClass="grid_btn" AccessKey="T" ToolTip="Alt+T" CommandName="Addnew"></asp:Button>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="16%" HorizontalAlign="Center" />
                                                                            <FooterStyle Width="16%" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>

                                                                    </Columns>
                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="pnlCovenants" Style="display: none" runat="server" GroupingText="Covenants" CssClass="stylePanel"
                                                    Width="99%">
                                                    <div>
                                                        <div class="row">
                                                            <%--<div class="gird">
                                                            <asp:GridView runat="server" ID="grvCovenants" AutoGenerateColumns="False" ShowFooter="true" class="gird_details"
                                                                OnRowDataBound="grvCovenants_RowDataBound" OnRowDeleting="grvCovenants_RowDeleting" OnRowCommand="grvCovenants_RowCommand" ToolTip="PDC Entry Details">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="S.NO" HeaderStyle-Width="8%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSno" runat="server" Text='<%#Eval("Sno")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Covenant Clause" HeaderStyle-Width="44%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCovenantsClauseDescription" runat="server" Text='<%#Eval("Covenants_Clause_Description")%>'></asp:Label>
                                                                            <asp:Label ID="lblCovenantsClauseID" Style="display: none" runat="server" Text='<%#Eval("Covenants_Clause_ID")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlCovenantsClause" AutoPostBack="true" OnSelectedIndexChanged="ddlCovenantsClause_SelectedIndexChanged"
                                                                                    CssClass="md-form-control form-control login_form_content_input" ToolTip="Covenants Clause" runat="server">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvddlCovenantsClause" runat="server" ValidationGroup="btnCovenant"
                                                                                        ErrorMessage="Select the PDC Type" Display="Dynamic" CssClass="validation_msg_box_sapn" InitialValue="0" SetFocusOnError="true" ControlToValidate="ddlCovenantsClause"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Other Covenant Clause" HeaderStyle-Width="44%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblothCovenantsClauseDescription" runat="server" Text='<%#Eval("Oth_Covenants_Clause_Description")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtothCovenantsClauseDescription" runat="server" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtothCovenantsClauseDescription" runat="server" ValidationGroup="btnAddPdc"
                                                                                        ErrorMessage="Enter the Covenant Othe Clause" Display="Dynamic" CssClass="validation_msg_box_sapn" InitialValue="0" SetFocusOnError="true" ControlToValidate="txtothCovenantsClauseDescription"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="btnRemovedp" Text="Delete" CssClass="grid_btn_delete" AccessKey="D" ToolTip="Alt+D"
                                                                                CommandName="Delete" runat="server"
                                                                                CausesValidation="false" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <i class="fa fa-arrow-circle-right btn_i" aria-hidden="true" style="top: 10px !important; left: 25px"></i>
                                                                                <asp:Button ID="btnAddCovenantsRow" runat="server" Text="Add" OnClick="btnAddCovenantsRow_Click" class="save_btn fa-arrow-circle-right" AccessKey="B" ToolTip="Alt+B"
                                                                                    ValidationGroup="btnCovenant"></asp:Button>

                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <ItemStyle Width="20%" HorizontalAlign="Center" />
                                                                        <FooterStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>

                                                                </Columns>
                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                            </asp:GridView>
                                                        </div>--%>

                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlCovenantsClause" AutoPostBack="false"
                                                                        CssClass="md-form-control form-control login_form_content_input" ToolTip="Covenants Clause" runat="server">
                                                                    </asp:DropDownList>

                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvCoventsCondition" runat="server" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Covenants Clause"
                                                                            SetFocusOnError="true" ControlToValidate="ddlCovenantsClause" InitialValue="0" ValidationGroup="Main Page"
                                                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblCoventsCondition" CssClass="styleReqFieldLabel" runat="server" ToolTip="Covenants Clause" Text="Covenants Clause"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtCovenantTerms" ToolTip="Covenant Terms" TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true" onkeyup="maxlengthfortxt(500);" runat="server"
                                                                        AutoPostBack="false"></asp:TextBox>

                                                                    <%--<div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvtxtCovenantTerms" runat="server" CssClass="validation_msg_box_sapn" ErrorMessage="Enter the Covenants Terms"
                                                                        SetFocusOnError="true" ControlToValidate="txtCovenantTerms" ValidationGroup="Main Page"
                                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>--%>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblCovenantsTerms" CssClass="styleReqFieldLabel" runat="server" ToolTip="Covenants Terms" Text="Covenant Terms"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>



                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="Server" TargetControlID="pnlCustomerCreditDetails"
                                                    ExpandControlID="pnlCustomerCreditDetailsHdr" CollapseControlID="pnlCustomerCreditDetailsHdr" Collapsed="true"
                                                    TextLabelID="lblimgCustomerCredit" ExpandDirection="Vertical" ImageControlID="imgCustomerCredit" ExpandedText="(Hide Details...)"
                                                    CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                                                    CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />
                                                <div style="background-color: rgba(247, 247, 247, 0.63);">
                                                    <asp:Panel ID="pnlCustomerCreditDetailsHdr" runat="server" CssClass="accordionHeader" Width="98.5%">
                                                        <div style="float: left;">
                                                            Customer Credit Details 
                                                        </div>
                                                        <div style="float: left; margin-left: 20px;">
                                                            <asp:Label ID="lblimgCustomerCredit" runat="server">(Show Details...)</asp:Label>
                                                        </div>
                                                        <div style="float: right; vertical-align: middle;">
                                                            <asp:ImageButton ID="imgCustomerCredit" runat="server" ImageUrl="~/Images/expand_blue.jpg"
                                                                AlternateText="(Show Details...)" />
                                                        </div>
                                                    </asp:Panel>
                                                    <asp:Panel ID="pnlCustomerCreditDetails" runat="server" GroupingText="Customer Credit Details"
                                                        CssClass="stylePanel" Width="99%">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtMaximumLendingLimit" Style="text-align: right" Enabled="false" ToolTip="Maximum Lending Amount" class="md-form-control form-control login_form_content_input requires_true" runat="server"
                                                                        AutoPostBack="false"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label ID="lblMaximumLendingAmount" CssClass="styleReqDisplayLabel" runat="server" ToolTip="Maximum Lending Amount" Text="Maximum Lending Amount"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtTotalCreditFinanceAmount" Style="text-align: right" Enabled="false" ToolTip="Total Finance Amount" class="md-form-control form-control login_form_content_input requires_true" runat="server"
                                                                        AutoPostBack="false"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label ID="lblTotalApplicationFinanceAmount" CssClass="styleReqDisplayLabel" runat="server" ToolTip="Total Application Finance Amount" Text="Total Application Finance Amount"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtTotalBilledPrinceipal" Style="text-align: right" Enabled="false" ToolTip="Total Billed Principal" class="md-form-control form-control login_form_content_input requires_true" runat="server"
                                                                        AutoPostBack="false"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label ID="lblTotalBilledPrincipal" CssClass="styleReqDisplayLabel" runat="server" ToolTip="Total Billed Principal" Text="Total Billed Principal"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtAvailableCreditLimit" Style="text-align: right" Enabled="false" ToolTip="Available Credit Limit" class="md-form-control form-control login_form_content_input requires_true" runat="server"
                                                                        AutoPostBack="false"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label ID="lblAvailableCreditLimit" CssClass="styleReqDisplayLabel" runat="server" ToolTip="Available Credit Limit" Text="Available Credit Limit"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>

                                                <asp:Panel ID="pnlLeaseMarkettingDetails" runat="server" GroupingText="Marketing Details"
                                                    CssClass="stylePanel" Width="99%">
                                                    <div class="row">

                                                        <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <uc:Suggest ID="ddldc" runat="server" class="md-form-control form-control" AutoPostBack="false" ToolTip="Debt Collector Name" OnItem_Selected="ddldc_Item_Selected" ServiceMethod="GetDC"
                                                                    ErrorMessage="Select the Debt Collector Name"
                                                                    ValidationGroup="Main Page" IsMandatory="false" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblDebtCollectorName" CssClass="styleReqDisplayLabel" runat="server" ToolTip="Debt Collector Name" Text="Debt Collector Name "></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlLeadSource" OnSelectedIndexChanged="ddlLeadSource_SelectedIndexChanged" OnTextChanged="ddlLeadSource_TextChanged" runat="server" ToolTip="Lead Source Type" AutoPostBack="true">
                                                                </asp:DropDownList>

                                                                <%--<asp:RequiredFieldValidator ID="rfvLeadSource" runat="server" ControlToValidate="ddlLeadSource"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ErrorMessage="Select a Lead Source"
                                                                    ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvLeadSource" runat="server" ControlToValidate="ddlLeadSource"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True" ErrorMessage="Select a Lead Source Type"
                                                                        ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label runat="server" ID="lblLeadSource" ToolTip="Lead Source Type" CssClass="styleReqFieldLabel" Text="Lead Source Type"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <uc:Suggest ID="ddlLeadSourceName" runat="server" EnableCaching="false" AutoPostBack="false" OnItem_Selected="ddlDealerName_Item_Selected" ServiceMethod="GetLeadSourceName"
                                                                    ErrorMessage="Select an Lead Source Name"
                                                                    ValidationGroup="Main Page" IsMandatory="true" />
                                                                <asp:TextBox ID="txtLeadOtherSource" Visible="false" ToolTip="Other Lead Source" class="md-form-control form-control login_form_content_input requires_true" onkeyup="maxlengthfortxt(50);" runat="server"
                                                                    AutoPostBack="false"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblSourceName" CssClass="styleReqFieldLabel" runat="server" ToolTip="Lead Source Name" Text="Lead Source Name"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlBusinessSource" class="md-form-control form-control" OnSelectedIndexChanged="ddlBusinessSource_SelectedIndexChanged" runat="server" ToolTip="Business Source" AutoPostBack="true">
                                                                </asp:DropDownList>
                                                                <%--<asp:RequiredFieldValidator ID="rfvBusinessSource" runat="server" ControlToValidate="ddlBusinessSource"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ErrorMessage="Select a Business Source"
                                                                    ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvBusinessSource" runat="server" ControlToValidate="ddlBusinessSource"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True" ErrorMessage="Select a Business Source"
                                                                        ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label runat="server" ID="lblBusinessSource" ToolTip="Business Source" CssClass="styleReqFieldLabel" Text="Business Source"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlDealerschemename" class="md-form-control form-control" ToolTip="Dealer Scheme Name" runat="server"></asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label runat="server" ID="lblDealerschemename" ToolTip="Dealer Scheme Name" CssClass="styleDisplayLabel" Text="Dealer Scheme Name"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtSellerName" ToolTip="Seller Name" class="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtSellerName_TextChanged" onkeyup="maxlengthfortxt(100);" runat="server"
                                                                    AutoPostBack="true"></asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvSellerName" runat="server" ValidationGroup="Main Page"
                                                                    ErrorMessage="Enter the Seller Name" SetFocusOnError="False" ControlToValidate="txtSellerName"
                                                                    Display="None"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvSellerName" runat="server" ValidationGroup="Main Page"
                                                                        ErrorMessage="Enter the Seller Name" SetFocusOnError="False" ControlToValidate="txtSellerName"
                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblSellerName" runat="server" Text="Seller Name" ToolTip="Seller Name" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtSellerCode" ToolTip="Seller Code" OnTextChanged="txtSellerCode_TextChanged" class="md-form-control form-control login_form_content_input requires_true" runat="server" onkeyup="maxlengthfortxt(30);"
                                                                    AutoPostBack="true"></asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvSellerCode" runat="server" ValidationGroup="Main Page"
                                                                    ErrorMessage="Enter the Seller Code" SetFocusOnError="False" ControlToValidate="txtSellerCode"
                                                                    Display="None"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvSellerCode" runat="server" ValidationGroup="Main Page"
                                                                        ErrorMessage="Enter the Seller Code" SetFocusOnError="False" ControlToValidate="txtSellerCode"
                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblSellerCode" runat="server" Text="Seller Code" ToolTip="Seller Code" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlDealerCommissionApplicable" AutoPostBack="true" OnSelectedIndexChanged="ddlDealerCommissionApplicable_SelectedIndexChanged" class="md-form-control form-control" ToolTip="Dealer Commission Applicable" runat="server">
                                                                    <asp:ListItem Value="0" Text="No" Selected="True"></asp:ListItem>
                                                                    <asp:ListItem Value="1" Text="Yes"></asp:ListItem>

                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label runat="server" ID="lblDealerCommissionApplicable" ToolTip="Dealer Commission Applicable" CssClass="styleDisplayLabel" Text="Dealer Commission Applicable"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtDealerComissionAmount" ToolTip="Dealer Comission" class="md-form-control form-control login_form_content_input requires_true" Enabled="false" runat="server">
                                                                </asp:TextBox>
                                                                <%-- <asp:RequiredFieldValidator ID="rfvDealerCreditPeriod" runat="server" ErrorMessage="Select the Dealer_Credit_Period"
                                                                    SetFocusOnError="true" ControlToValidate="txtDealerCreditPeriod" InitialValue="0" ValidationGroup="Main Page"
                                                                    Display="None"></asp:RequiredFieldValidator>--%>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblDealerComission" CssClass="styleDisplayLabel" runat="server" ToolTip="Dealer Comission" Text="Dealer Comission"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtDealerCreditPeriod" ToolTip="Dealer Credit Period" class="md-form-control form-control login_form_content_input requires_true" Visible="false" runat="server" AutoPostBack="true">
                                                                </asp:TextBox>
                                                                <%-- <asp:RequiredFieldValidator ID="rfvDealerCreditPeriod" runat="server" ErrorMessage="Select the Dealer_Credit_Period"
                                                                    SetFocusOnError="true" ControlToValidate="txtDealerCreditPeriod" InitialValue="0" ValidationGroup="Main Page"
                                                                    Display="None"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvDealerCreditPeriod" runat="server" ErrorMessage="Select the Dealer_Credit_Period"
                                                                        SetFocusOnError="true" ControlToValidate="txtDealerCreditPeriod" InitialValue="0" ValidationGroup="Main Page"
                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblDealerCreditPeriod" CssClass="styleReqFieldLabel" runat="server" Visible="false" ToolTip="Dealer Credit Period" Text="Dealer Credit Period"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </asp:Panel>
                                                <asp:Panel ID="PnlLeaseFinanceHP" runat="server" GroupingText="Finance details" CssClass="stylePanel"
                                                    Width="99%">
                                                    <div class="row">
                                                        <div id="divddlDealType" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12" visible="false">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlDealType" AutoPostBack="true" OnTextChanged="ddlDealType_TextChanged" class="md-form-control form-control" runat="server" ToolTip="Deal Type">
                                                                </asp:DropDownList>
                                                                <%--<asp:RequiredFieldValidator ID="rfvDealType" runat="server" ErrorMessage="Select the Deal Type"
                                                                    SetFocusOnError="true" ControlToValidate="ddlDealType" InitialValue="0" ValidationGroup="Main Page"
                                                                    Display="None"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvDealType" runat="server" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Deal Type"
                                                                        SetFocusOnError="true" Enabled="false" ControlToValidate="ddlDealType" InitialValue="0" ValidationGroup="Main Page"
                                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblDelaType" CssClass="styleReqFieldLabel" runat="server" ToolTip="Deal Type" Text="Deal Type"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div id="divddlDealerName" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <uc:Suggest ID="ddlDealerName" runat="server" class="md-form-control form-control" ToolTip="Dealer Name" AutoPostBack="true" OnItem_Selected="ddlDealerName_Item_Selected" ServiceMethod="GetVendors"
                                                                    ErrorMessage="Select an Dealer Name"
                                                                    ValidationGroup="Main Page" IsMandatory="true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblDealerName" runat="server" Text="Dealer Name" ToolTip="Dealer Name" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div id="divddlSalePersonCodeList" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">

                                                                <uc:Suggest ID="ddlSalePersonCodeList" class="md-form-control form-control" AutoPostBack="true" OnItem_Selected="ddlSalePersonCodeList_Item_Selected" ToolTip="Marketing Officer" runat="server" ErrorMessage="Select the Marketing Officer" IsMandatory="true" ServiceMethod="GetSalePersonList" ValidationGroup="Main Page" />

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblSalePersonCode" runat="server" CssClass="styleReqFieldLabel" Text="Marketing Officer"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div id="divSBG" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtSBG" Enabled="false" ToolTip="SBG/Non SBG" AutoPostBack="false" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblSBG" runat="server" Text="SBG/Non SBG" ToolTip="SBG/Non SBG" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div id="divddldealerSalesPerson" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <uc:Suggest ID="ddldealerSalesPerson" class="md-form-control form-control" runat="server" ToolTip="Dealer Sales Person" ServiceMethod="GetVendorsSalesPerson"
                                                                    ErrorMessage="Select the Dealer Sales Person" IsMandatory="false" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblDealerSalesPerson" runat="server" Text="Dealer Sales Person" ToolTip="Dealer Sales Person" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFinanceAmount" OnTextChanged="txtFinanceAmount_TextChanged" ToolTip="Finance Amount" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" runat="server" Style="text-align: right"
                                                                    onchange="FunRestIrr();"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtFinanceAmount" runat="server" TargetControlID="txtFinanceAmount"
                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <%--  <asp:RequiredFieldValidator ID="rfvFinanceAmount" runat="server" ControlToValidate="txtFinanceAmount"
                                                                    ValidationGroup="Main Page" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                    ErrorMessage="Enter the Finance Amount">
                                                                </asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvFinanceAmount" runat="server" ControlToValidate="txtFinanceAmount"
                                                                        ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                        ErrorMessage="Enter the Finance Amount"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblFinanceAmount2" CssClass="styleDisplayLabel" Text="Finance Amount"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtTenure" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Tenure" runat="server" MaxLength="3" Style="text-align: right"
                                                                    onchange="FunRestIrr();"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtTenure" runat="server" TargetControlID="txtTenure"
                                                                    FilterType="Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <%--<asp:RequiredFieldValidator ID="rfvTenure" runat="server" ControlToValidate="txtTenure"
                                                                    ValidationGroup="Main Page" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                    ErrorMessage="Enter the Tenure"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvTenure" runat="server" ControlToValidate="txtTenure"
                                                                        ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                        ErrorMessage="Enter the Tenure"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblTenure" CssClass="styleReqFieldLabel" Text="Tenure"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlTenureType" runat="server" class="md-form-control form-control" ToolTip="Tenure Type" onchange="FunRestIrr();">
                                                                </asp:DropDownList>
                                                                <%--<asp:RequiredFieldValidator ID="rfvTenureType" runat="server" ControlToValidate="ddlTenureType"
                                                                    ValidationGroup="Main Page" CssClass="styleMandatoryLabel" Display="None" InitialValue="-1"
                                                                    SetFocusOnError="True" ErrorMessage="Select a Tenure Type"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvTenureType" runat="server" ControlToValidate="ddlTenureType"
                                                                        ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="-1"
                                                                        SetFocusOnError="True" ErrorMessage="Select a Tenure Type"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblTenureType" CssClass="styleReqFieldLabel" Text="Tenure Type"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtNumberofInstallments" Style="text-align: right" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Number of Installments" runat="server"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblNumberofInstallments" CssClass="styleDisplayLabel" Text="Number of Installments"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:CheckBox ID="ChkRefinanceContract" class="md-form-control form-control" runat="server" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblRefinanceContract" runat="server" CssClass="styleDisplayLabel"
                                                                        Text="Refinance Contract"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMarginAmount" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Down Payment Amount" runat="server" Style="text-align: right;"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtMarginAmount" ValidChars="." runat="server"
                                                                    TargetControlID="txtMarginAmount" FilterType="Custom,Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblMarginAmount" CssClass="styleDisplayLabel" Text="Down Payment Amount"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtResidualValue" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="7" Style="text-align: right"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtResidualAmount" ValidChars="." runat="server"
                                                                    TargetControlID="txtResidualValue" FilterType="Custom,Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblResidualValue" CssClass="styleDisplayLabel" Text="Residual Value"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlArearAdvance" class="md-form-control form-control" runat="server" MaxLength="7">
                                                                    <asp:ListItem Text="--Select--" Value="0" Enabled="true"></asp:ListItem>
                                                                    <asp:ListItem Text="Arear" Value="1" Enabled="true"></asp:ListItem>
                                                                    <asp:ListItem Text="Advance" Value="2" Enabled="true"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <%--<asp:RequiredFieldValidator ID="rfvddlArearAdvance" runat="server" ControlToValidate="ddlArearAdvance"
                                                                    ValidationGroup="Main Page" CssClass="styleMandatoryLabel" Display="None" InitialValue="0" SetFocusOnError="True"
                                                                    ErrorMessage="Select the Arear/Advance"></asp:RequiredFieldValidator>--%>
                                                                <%--  <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvddlArearAdvance" runat="server" ControlToValidate="ddlArearAdvance"
                                                                    ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                                    ErrorMessage="Select the Arear/Advance"></asp:RequiredFieldValidator>
                                                            </div>--%>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label runat="server" ID="lblArearAdvance" CssClass="styleReqFieldLabel" Text="Arear/Advance"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div id="divtxtdiscount" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtdiscount" Enabled="false" runat="server" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Trade In" MaxLength="7"></asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvtxtdiscount" runat="server" ControlToValidate="txtdiscount"
                                                                    ValidationGroup="Main Page" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                    ErrorMessage="Enter the Discount"></asp:RequiredFieldValidator>--%>
                                                                <%--<div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtdiscount" runat="server" ControlToValidate="txtdiscount"
                                                                    ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                    ErrorMessage="Enter the Discount"></asp:RequiredFieldValidator>
                                                            </div>--%>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblDiscount" CssClass="styleDisplayLabel" Text="Trade In"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFirstInstallDate" Enabled="false" onchange="FunRestIrr();" class="md-form-control form-control login_form_content_input requires_true" ToolTip="First Installment Date" runat="server"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="CEFirstInstallDate" runat="server" TargetControlID="txtFirstInstallDate"
                                                                    PopupButtonID="imgtxtFirstInstallDate">
                                                                </cc1:CalendarExtender>
                                                                <%-- <asp:Image ID="imgtxtFirstInstallDate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                <%--<asp:RequiredFieldValidator ID="RFtxtFirstInstallDate" runat="server" ControlToValidate="txtFirstInstallDate"
                                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the First Installment Date"
                                                                    SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFtxtFirstInstallDate" Enabled="false" runat="server" ControlToValidate="txtFirstInstallDate"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the First Installment Date"
                                                                        SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFirstInstallDate" runat="server" CssClass="styleDisplayLabel" Text="First Installment Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtIncomeBookStartDate" ToolTip="Income Book Start Date" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                <%-- <asp:Image ID="imgtxtIncomeBookStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                <cc1:CalendarExtender ID="CEtxtIncomeBookStartDate" runat="server" TargetControlID="txtIncomeBookStartDate"
                                                                    PopupButtonID="imgtxtIncomeBookStartDate">
                                                                </cc1:CalendarExtender>
                                                                <%-- <asp:RequiredFieldValidator ID="rfvIncomeBookStartDate" runat="server" ControlToValidate="txtIncomeBookStartDate"
                                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Income Book Start Date"
                                                                    SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvIncomeBookStartDate" runat="server" ControlToValidate="txtIncomeBookStartDate"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Income Book Start Date"
                                                                        SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblIncomeBookStartDate" runat="server" CssClass="styleReqFieldLabel" Text="Income Book Start Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlRepamentMode" class="md-form-control form-control" ToolTip="Repayment Mode" AutoPostBack="true" OnSelectedIndexChanged="ddlRepamentMode_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlRepamentMode"
                                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the No of Days to be considered"
                                                                    SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvddlRepamentMode" runat="server" ControlToValidate="ddlRepamentMode"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select the Repayment Mode"
                                                                        SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblRepaymentMode" runat="server" CssClass="styleReqFieldLabel" Text="Repayment Mode"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlPNTD" class="md-form-control form-control" runat="server">
                                                                    <asp:ListItem Value="0" Selected="True" Text="--Select--"> </asp:ListItem>
                                                                    <asp:ListItem Value="1" Text="Yes"> </asp:ListItem>
                                                                    <asp:ListItem Value="2" Text="No"> </asp:ListItem>
                                                                </asp:DropDownList>
                                                                <%--<asp:RequiredFieldValidator ID="RFVddlPNTD" runat="server" ControlToValidate="ddlPNTD"
                                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the PNTD"
                                                                    SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>
                                                                <%-- <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="RFVddlPNTD" runat="server" ControlToValidate="ddlPNTD"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select the PNTD"
                                                                    SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                            </div>--%>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblPNTD" runat="server" CssClass="styleDisplayLabel" Text="PNTD"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlInstallmentRoundOff" OnSelectedIndexChanged="ddlInstallmentRoundOff_SelectedIndexChanged" AutoPostBack="true" class="md-form-control form-control" runat="server">
                                                                    <asp:ListItem Value="0" Selected="True" Text="--Select--"> </asp:ListItem>
                                                                    <asp:ListItem Value="1" Text="First Installment"> </asp:ListItem>
                                                                    <asp:ListItem Value="2" Text="Last Installment"> </asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvInstallmentRoundoffPosition" runat="server" ControlToValidate="ddlInstallmentRoundOff"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select the Installment Round of Position"
                                                                        SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <label>
                                                                    <asp:Label ID="lblInstallmentRoundoff" runat="server" CssClass="styleReqFieldLabel" Text="Installment Round of Position"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">


                                                                <%-- <uc:Suggest ID="ddlEmployerBankName" class="md-form-control form-control" runat="server" ServiceMethod="GetEmployerBankName"
                                                                ErrorMessage="Select the Employer Bank Name" IsMandatory="false" ValidationGroup="Main Page" />--%>

                                                                <asp:TextBox ID="txtEmployerBankName" Enabled="false" ToolTip="Employer Name/Bank Name" class="md-form-control form-control login_form_content_input requires_true" runat="server" TabIndex="-1"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblEmployeName" runat="server" CssClass="styleDisplayLabel" Text="Employer Name/Bank Name" ToolTip="Employer Name/Bank Name"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtAccountingIRR" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Accounting IRR" runat="server" TabIndex="-1"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblAccountingIRR" CssClass="styleDisplayLabel" Text="Accounting IRR"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtBusinessIRR" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Business IRR" runat="server" TabIndex="-1"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblBusinessIRR" CssClass="styleDisplayLabel" Text="Business IRR"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCompanyIRR" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Company IRR" runat="server" TabIndex="-1"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblCompanyIRR" CssClass="styleDisplayLabel" Text="Company IRR"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtPdcStartDate" AutoPostBack="true" OnTextChanged="txtPdcStartDate_TextChanged" onchange="FunRestIrr();" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" ToolTip="PDC Start Date" runat="server" TabIndex="-1"></asp:TextBox>
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtPdcStartDate" PopupButtonID="imgPdcStartDate" ID="CaltxtPdcStartDate">
                                                                </cc1:CalendarExtender>
                                                                <asp:Image ID="imgPdcStartDate" Visible="false" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvPdcStartDate" runat="server" ControlToValidate="txtPdcStartDate"
                                                                        ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                        SetFocusOnError="True" ErrorMessage="Enter the PDC Start Date"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblPDCStartDate" CssClass="styleReqFieldLabel" Text="PDC Start Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtPDCEndDate" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" ToolTip="PDC End Date" runat="server" TabIndex="-1"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblPDCEndDate" CssClass="styleDisplayLabel" Text="PDC End Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFirstInstallmentDueDate" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" ToolTip="First Installment Due Date" runat="server" TabIndex="-1"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblFirstInstallmentDate" CssClass="styleDisplayLabel" Text="First Installment Due Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLastInstallmentDueDate" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Last Installment Due Date" runat="server" TabIndex="-1"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblLastInstallmentDueDate" CssClass="styleDisplayLabel" Text="Last Installment Due Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>




                                                </asp:Panel>
                                                <asp:Panel runat="server" ID="pnlExistanceCharges" ScrollBars="Auto" CssClass="stylePanel" GroupingText="Charges"
                                                    Width="99%">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlExistenceofFirstCharge" class="md-form-control form-control" ToolTip="Existence of First Charge" runat="server">
                                                                    <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                    <asp:ListItem Value="0" Text="No" Selected="True"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label runat="server" ID="lblExistenceofFirstCharge" ToolTip="Existence of First Charge" CssClass="styleDisplayLabel" Text="Existence of First Charge"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlExistenceofsecondcharge" class="md-form-control form-control" ToolTip="Existence of Second Charge" runat="server">
                                                                    <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                    <asp:ListItem Value="0" Text="No" Selected="True"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label runat="server" ID="lblExistenceofsecondcharge" ToolTip="Existence of Second Charge" CssClass="styleDisplayLabel" Text="Existence of Second Charge"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlStartDelayChargesApplicable" AutoPostBack="true" OnSelectedIndexChanged="ddlStartDelayChargesApplicable_SelectedIndexChanged" ToolTip="Start Delay Charges Applicable" class="md-form-control form-control" runat="server">
                                                                    <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                    <asp:ListItem Value="0" Text="No" Selected="True"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <%--<asp:RequiredFieldValidator ID="rfvStartdelaycharges" Enabled="false" runat="server" ControlToValidate="txtStartdelaycharges"
                                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Start Delay Charges Applicable"
                                                                    SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvStartdelaycharges" Enabled="false" runat="server" ControlToValidate="txtStartdelaycharges"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Start Delay Charges Applicable"
                                                                        SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblStartdelaycharges" runat="server" ToolTip="Start Delay Charges Applicable" CssClass="styleDisplayLabel" Text="Start Delay Charges Applicable"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtNoofDaystobeconsidered" Style="text-align: right" MaxLength="3" ToolTip="Grace Days" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvNoofDaystobeconsidered" runat="server" ControlToValidate="txtNoofDaystobeconsidered"
                                                                    CssClass="styleMandatoryLabel" Enabled="false" Display="None" ErrorMessage="Enter the No of Days to be Considered"
                                                                    SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>


                                                                <cc1:FilteredTextBoxExtender ID="fltGraceDays" runat="server"
                                                                    FilterType="Numbers" Enabled="True"
                                                                    TargetControlID="txtNoofDaystobeconsidered">
                                                                </cc1:FilteredTextBoxExtender>

                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvNoofDaystobeconsidered" runat="server" ControlToValidate="txtNoofDaystobeconsidered"
                                                                        CssClass="validation_msg_box_sapn" Enabled="false" Display="Dynamic" ErrorMessage="Enter the No of Days to be Considered"
                                                                        SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblNoDaystobeconsidered" ToolTip="Grace Days" runat="server" CssClass="styleDisplayLabel" Text="Grace Days"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtDelayDays" Enabled="false" Style="text-align: right" MaxLength="3" ToolTip="Delay Days" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvDelayDays" runat="server" ControlToValidate="txtDelayDays"
                                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Delay Days"
                                                                    SetFocusOnError="True" Enabled="false" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>
                                                                <cc1:FilteredTextBoxExtender ID="fltDelydays" runat="server"
                                                                    FilterType="Numbers" Enabled="True"
                                                                    TargetControlID="txtDelayDays">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvDelayDays" runat="server" ControlToValidate="txtDelayDays"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Delay Days"
                                                                        SetFocusOnError="True" Enabled="false" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblDelayDays" runat="server" ToolTip="Delay Days" CssClass="styleDisplayLabel" Text="Delay Days"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtStartDatedelayrate" Enabled="false" onchange="funCheckRange();" ToolTip="Start Delay Rate" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvStartDatedelayrate" runat="server" ControlToValidate="txtStartDatedelayrate"
                                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Start Date Delay Rate"
                                                                    SetFocusOnError="True" Enabled="false" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>


                                                                <cc1:FilteredTextBoxExtender ID="flttxtStartDatedelayrate" ValidChars="." runat="server"
                                                                    FilterType="Numbers,Custom" Enabled="True"
                                                                    TargetControlID="txtStartDatedelayrate">
                                                                </cc1:FilteredTextBoxExtender>

                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvStartDatedelayrate" runat="server" ControlToValidate="txtStartDatedelayrate"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Start Delay Rate"
                                                                        SetFocusOnError="True" Enabled="false" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblStartDatedelayrate" runat="server" CssClass="styleDisplayLabel" ToolTip="Start Delay Rate" Text="Start Delay Rate"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtStartdelaycharges" Enabled="false" ToolTip="Start Delay Charges" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvStartdelaychargesE" runat="server" ControlToValidate="txtStartdelaycharges"
                                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Start Delay Charges"
                                                                    SetFocusOnError="True" Enabled="false" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>


                                                                <cc1:FilteredTextBoxExtender ID="flttxtStartdelaycharges" ValidChars="." runat="server"
                                                                    FilterType="Numbers,Custom" Enabled="True"
                                                                    TargetControlID="txtStartdelaycharges">
                                                                </cc1:FilteredTextBoxExtender>

                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvStartdelaychargesE" runat="server" ControlToValidate="txtStartdelaycharges"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Start Delay Charges"
                                                                        SetFocusOnError="True" Enabled="false" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblStartdelaychargesE" runat="server" CssClass="styleDisplayLabel" ToolTip="Start Delay Charges" Text="Start Delay Charges"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtOverDueCharges" ToolTip="Over Due Charges" onchange="funCheckOverDueLenth(this);" AutoPostBack="true" OnTextChanged="txtOverDueCharges_TextChanged" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvOverDueCharges" runat="server" ControlToValidate="txtOverDueCharges"
                                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Over Due Charges"
                                                                    SetFocusOnError="True" Enabled="false" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>

                                                                <cc1:FilteredTextBoxExtender ID="flttxtOverDueCharges" ValidChars="." runat="server"
                                                                    FilterType="Numbers,Custom" Enabled="True"
                                                                    TargetControlID="txtOverDueCharges">
                                                                </cc1:FilteredTextBoxExtender>

                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvOverDueCharges" runat="server" ControlToValidate="txtOverDueCharges"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Over Due Rate"
                                                                        SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblOverDueCharges" runat="server" ToolTip="Over Due Rate" CssClass="styleReqFieldLabel" Text="Over Due Rate"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFloorRate" Enabled="false" ToolTip="Floor Rate" AutoPostBack="true" OnTextChanged="txtFloorRate_TextChanged" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFloorRate" runat="server" ToolTip="Floor Rate" CssClass="styleDisplayLabel" Text="Floor Rate"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>


                                                    </div>



                                                </asp:Panel>

                                                <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server" TargetControlID="pnlLifeInsurance"
                                                    ExpandControlID="pnlLifeInsuranceHdr" CollapseControlID="pnlLifeInsuranceHdr" Collapsed="false"
                                                    TextLabelID="lblpnlLifeInsuranceHdr" ExpandDirection="Vertical" ImageControlID="imglblpnlLifeInsuranceHdr" ExpandedText="(Hide Details...)"
                                                    CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                                                    CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />
                                                <div id="divLife" runat="server" style="background-color: rgba(247, 247, 247, 0.63);">
                                                    <asp:Panel ID="pnlLifeInsuranceHdr" runat="server" CssClass="accordionHeader" Width="98.5%">
                                                        <div style="float: left;">
                                                            Life Insurance Details
                                                        </div>
                                                        <div style="float: left; margin-left: 20px;">
                                                            <asp:Label ID="lblpnlLifeInsuranceHdr" runat="server">(Show Details...)</asp:Label>
                                                        </div>
                                                        <div style="float: right; vertical-align: middle;">
                                                            <asp:ImageButton ID="imglblpnlLifeInsuranceHdr" runat="server" ImageUrl="~/Images/expand_blue.jpg"
                                                                AlternateText="(Show Details...)" />
                                                        </div>
                                                    </asp:Panel>


                                                    <asp:Panel runat="server" ID="pnlLifeInsurance" ScrollBars="Auto" CssClass="stylePanel" GroupingText="Life Insurance"
                                                        Width="99%">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlLifeInsurance" OnSelectedIndexChanged="ddlLifeInsurance_SelectedIndexChanged" AutoPostBack="true" class="md-form-control form-control" ToolTip="Life Insurance Applicable" runat="server">
                                                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                        <asp:ListItem Value="1" Selected="True" Text="No"></asp:ListItem>
                                                                        <asp:ListItem Value="2" Text="Yes"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label runat="server" ID="lblLifeInsurance" ToolTip="Life Insurance Applicable" CssClass="styleDisplayLabel" Text="Life Insurance Applicable"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <uc:Suggest ID="ddlLifeInsuranceEntity" class="md-form-control form-control" AutoPostBack="true" ToolTip="Life Insurer" runat="server" OnItem_Selected="ddlLifeInsuranceEntity_Item_Selected" ServiceMethod="GetVendorsInsurar"
                                                                        ErrorMessage="Select the Life Insurer" IsMandatory="true" ValidationGroup="Main Page" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>

                                                                    <label class="tess">
                                                                        <asp:Label runat="server" ID="lblLifeInsuranceEntity" ToolTip="Life Insurer" CssClass="styleDisplayLabel" Text="Life Insurer"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtLifeInsuranceCustRate" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Life Insurance Customer Rate" Style="text-align: right" onkeyup="maxlengthfortxt(15);" runat="server"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblLifeInsuranceCustRate" ToolTip="Life Insurance Customer Rate" CssClass="styleDisplayLabel" Text="Life Insurance Customer Rate"></asp:Label>
                                                                    </label>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtLifeInsuranceCustRate" runat="server" ControlToValidate="txtLifeInsuranceCustRate"
                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Life Insurance Customer Rate"
                                                                            SetFocusOnError="True" Enabled="false" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtLifeInsuranceCompanyRate" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right" ToolTip="Life Insurance Company Rate" onkeyup="maxlengthfortxt(15);" runat="server"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtLifeInsuranceCompanyRate" runat="server" ControlToValidate="txtLifeInsuranceCompanyRate"
                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Life Insurance Company Rate"
                                                                            SetFocusOnError="True" Enabled="false" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblLifeInsurancePremiumAmount" ToolTip="Life Insurance Company Rate" CssClass="styleDisplayLabel" Text="Life Insurance Company Rate"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>



                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtLifeInsuranceCompanyAmount" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right" ToolTip="Life Insurance Company Amount" onkeyup="maxlengthfortxt(15);" runat="server"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtLifeInsuranceCompanyAmount" runat="server" ControlToValidate="txtLifeInsuranceCompanyAmount"
                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Life Insurance Company Amount"
                                                                            SetFocusOnError="True" Enabled="false" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblLifeInsuranceCompanyAmount" ToolTip="Life Insurance Company Amount" CssClass="styleDisplayLabel" Text="Life Insurance Company Amount"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtLifeInsuranceCustomerPremiumAmount" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right" ToolTip="Life Insurance Customer Amount" onkeyup="maxlengthfortxt(15);" runat="server"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtLifeInsuranceCustomerPremiumAmount" runat="server" ControlToValidate="txtLifeInsuranceCustomerPremiumAmount"
                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Life Insurance Customer Amount"
                                                                            SetFocusOnError="True" Enabled="false" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblLifeInsuranceCustomerAmount" ToolTip="Life Insurance Customer Amount" CssClass="styleDisplayLabel" Text="Life Insurance Customer Amount"></asp:Label>
                                                                    </label>
                                                                </div>

                                                            </div>
                                                        </div>

                                                    </asp:Panel>
                                                </div>
                                                <asp:Panel ID="pnlApplicationDetailsFWC" runat="server" GroupingText="Application Details"
                                                    CssClass="stylePanel" Width="99%">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <%--<div class="md-input">
                                                            <asp:TextBox ID="txtCusomerCodeFWChidden" class="md-form-control form-control login_form_content_input requires_true" runat="server" Style="display: none;" MaxLength="50"></asp:TextBox>
                                                            <uc3:ICM ID="ucCustomerLovFWC" HoverMenuExtenderBottom="true" runat="server" strLOV_Code="CMDFOUR" onblur="fnLoadCustomer_FWC()" />
                                                            <asp:Button ID="btnLoadCustomerFWC" runat="server" Text="Load Customer" OnClick="btnLoadCustomerFWC_Click"
                                                                Style="display: none" /><input id="Hidden6" type="hidden" runat="server" />
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtCusomerCodeFWChidden" runat="server" ControlToValidate="txtCusomerCodeFWChidden"
                                                                    ErrorMessage="Select the Client Code" ValidationGroup="Main Page" CssClass="validation_msg_box_sapn"
                                                                    Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblFWCCustomerCode" CssClass="styleDisplayLabel" Text="Client Code"></asp:Label>
                                                            </label>
                                                        </div>--%>
                                                            <div class="md-input">
                                                                <table style="width: 100%">
                                                                    <tr>
                                                                        <td style="padding: 0px !important; padding-right: 5px !important">
                                                                            <asp:TextBox ID="txtCusomerCodeFWChidden" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                                Style="display: none;" MaxLength="50"></asp:TextBox>
                                                                            <UC4:ICM ID="ucCustomerLovFWC" onblur="fnLoadCustomer_FWC()" ToolTip="Client Code" HoverMenuExtenderLeft="true" runat="server" ShowHideAddressImageButton="false" AutoPostBack="true" DispalyContent="Both"
                                                                                strLOV_Code="CUS_CLIENTFACAPR" ServiceMethod="GetClientList" OnItem_Selected="ucCustomerCodeLovFWC_Item_Selected" />
                                                                            <asp:Button ID="btnLoadCustomerFWC" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomerFWC_Click"
                                                                                Style="display: none" />
                                                                        </td>

                                                                    </tr>
                                                                </table>

                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvtxtCusomerCodeFWChidden" runat="server" ControlToValidate="txtCusomerCodeFWChidden"
                                                                        ErrorMessage="Select the Client" ValidationGroup="Main Page" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblFWCCustomerCode" CssClass="styleDisplayLabel" Text="Client Code"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div style="margin-top: 10px" class="md-input">
                                                                <button class="css_btn_enabled" id="btnViewClient" causesvalidation="false" runat="server"
                                                                    type="button">
                                                                    <i class="fa fa-eye" aria-hidden="true"></i>&emsp;<u></u>View Client
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlBranchListFWC" ToolTip="Branch" class="md-form-control form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChangedFWC">
                                                                </asp:DropDownList>
                                                                <%--<asp:RequiredFieldValidator ID="rfvBranchListFWC" runat="server" ErrorMessage="Select the Branch"
                                                                    SetFocusOnError="true" ControlToValidate="ddlBranchListFWC" InitialValue="--Select--" ValidationGroup="Main Page"
                                                                    Display="None"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvBranchListFWC" runat="server" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Branch"
                                                                        SetFocusOnError="true" ControlToValidate="ddlBranchListFWC" InitialValue="0" ValidationGroup="Main Page"
                                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblBranchListFWC" runat="server" ToolTip="Branch" Text="Branch" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="cmbSubLocationFWC" ToolTip="Sub Branch" runat="server" class="md-form-control form-control" AutoPostBack="false">
                                                                </asp:DropDownList>
                                                                <%--<asp:RequiredFieldValidator ID="rfvcmbSubLocationFWC" runat="server" ErrorMessage="Select the Sub Branch"
                                                                    SetFocusOnError="true" ControlToValidate="cmbSubLocationFWC" InitialValue="--Select--" ValidationGroup="Main Page"
                                                                    Display="None"></asp:RequiredFieldValidator>--%>
                                                                <%--<div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvcmbSubLocationFWC" runat="server" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Sub Branch"
                                                                    SetFocusOnError="true" ControlToValidate="cmbSubLocationFWC" InitialValue="0" ValidationGroup="Main Page"
                                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                            </div>--%>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblSubBranchFWC" runat="server" ToolTip="Sub Branch" Text="Sub Branch" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtApplicationDateFWC" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Application Date" runat="server"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" ValidChars="/-"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"
                                                                    TargetControlID="txtApplicationDateFWC">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <%--<asp:Image ID="imgApplicationNumberDateFWC" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtApplicationDateFWC" PopupButtonID="imgApplicationNumberDateFWC" ID="CEtxtApplicationDateFWC" Enabled="True" OnClientDateSelectionChanged="checkDate_ApplicationDate">
                                                                </cc1:CalendarExtender>
                                                                <%--<asp:RequiredFieldValidator ID="rfvimgApplicationNumberDateFWC" runat="server" ControlToValidate="txtApplicationDateFWC"
                                                                    Display="None" ValidationGroup="Main Page" CssClass="styleMandatoryLabel" SetFocusOnError="True"
                                                                    ErrorMessage="Enter the Application Date"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvimgApplicationNumberDateFWC" runat="server" ControlToValidate="txtApplicationDateFWC"
                                                                        Display="Dynamic" ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" SetFocusOnError="True"
                                                                        ErrorMessage="Enter the Application Date"></asp:RequiredFieldValidator>
                                                                </div>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblApplicationdate" CssClass="styleReqFieldLabel" ToolTip="Application date" Text="Application Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">

                                                                <asp:TextBox ID="txtCreditLimitFWC" ToolTip="Credit Limit" class="md-form-control form-control login_form_content_input requires_true" runat="server" Enabled="false" AutoPostBack="false" TabIndex="-1">
                                                                </asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvtxtCreditLimit" runat="server" ControlToValidate="txtCreditLimit" CssClass="styleMandatoryLabel" 
                                                                    Display="None" ErrorMessage="Select a the Credit Limit" SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>

                                                                <%--<div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtCreditLimitFWC" runat="server" ControlToValidate="txtCreditLimit" CssClass="validation_msg_box_sapn"
                                                                    Display="Dynamic" ErrorMessage="Select a the Credit Limit" SetFocusOnError="True" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                            </div>--%>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lbltxtCreditLimitFWC" runat="server" CssClass="styleDisplayLabel" Text="Total Approved Credit Limit" ToolTip="Total Approved Credit Limit"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlProductCodeListFWC" ToolTip="Scheme" class="md-form-control form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProductCodeList_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <%-- <asp:RequiredFieldValidator ID="rfvSchemeTypeFWC" runat="server" ControlToValidate="ddlProductCodeListFWC"
                                                                    CssClass="styleMandatoryLabel" Display="None" InitialValue="0" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Scheme Type" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvSchemeTypeFWC" runat="server" ControlToValidate="ddlProductCodeListFWC"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                                        ErrorMessage="Select a Scheme Type" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label runat="server" ID="Label10" CssClass="styleReqFieldLabel" Text="Scheme"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtAccountNoFWC" class="md-form-control form-control login_form_content_input requires_true" TabIndex="-1" runat="server" AutoPostBack="True">
                                                                </asp:TextBox>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblAccountNo" CssClass="styleDisplayLabel" Text="Account No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFacilityStartDate" OnTextChanged="txtFacilityStartDate_TextChanged" AutoPostBack="true" ToolTip="Facility Start Date" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="fltFacilityStartDate" runat="server" ValidChars="/-"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"
                                                                    TargetControlID="txtApplicationDateFWC">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <%--<asp:Image ID="imgFacilityStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtFacilityStartDate" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="imgFacilityStartDate" ID="CEtxtFacilityStartDate" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                                <%--<asp:RequiredFieldValidator ID="rfvtxtFacilityStartDate" runat="server" ControlToValidate="txtFacilityStartDate"
                                                                    Display="None" ValidationGroup="Main Page" CssClass="styleMandatoryLabel" SetFocusOnError="True"
                                                                    ErrorMessage="Enter the Facility Start Date"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvtxtFacilityStartDate" runat="server" ControlToValidate="txtFacilityStartDate"
                                                                        Display="Dynamic" ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" SetFocusOnError="True"
                                                                        ErrorMessage="Enter the Facility Start Date"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblFacilityStartDate" CssClass="styleReqFieldLabel" ToolTip="Facility Start Date" Text="Facility Start Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFacilityEndDate" OnTextChanged="txtFacilityEndDate_TextChanged" AutoPostBack="true" ToolTip="Facility End Date" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="fltFacilityEndDate" runat="server" ValidChars="/-"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"
                                                                    TargetControlID="txtApplicationDateFWC">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <%--<asp:Image ID="imgFacilityEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtFacilityEndDate" PopupButtonID="imgFacilityEndDate" ID="CEtxtFacilityEndDate" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                                <%-- <asp:RequiredFieldValidator ID="rfvtxtFacilityEndDate" runat="server" ControlToValidate="txtFacilityEndDate"
                                                                    Display="None" ValidationGroup="Main Page" CssClass="styleMandatoryLabel" SetFocusOnError="True"
                                                                    ErrorMessage="Enter the Facility End Date"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvtxtFacilityEndDate" runat="server" ControlToValidate="txtFacilityEndDate"
                                                                        Display="Dynamic" ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" SetFocusOnError="True"
                                                                        ErrorMessage="Enter the Facility End Date"></asp:RequiredFieldValidator>
                                                                </div>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblFacilityStartEnd" CssClass="styleReqFieldLabel" ToolTip="Facility Start End" Text="Facility End Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtAccountStatus" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true" TabIndex="-1" ToolTip="Account Status" runat="server"></asp:TextBox>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblAccountStatus" CssClass="styleDisplayLabel" ToolTip="Account Status" Text="Account Status"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtAuditor" onkeyup="maxlengthfortxt(100);" ToolTip="Auditor Name" class="md-form-control form-control login_form_content_input requires_true" runat="server" AutoPostBack="false" OnSelectedIndexChanged="ddlProductCodeList_SelectedIndexChanged">
                                                                </asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvtxtAuditor" runat="server" ControlToValidate="txtAuditor"
                                                                    CssClass="styleMandatoryLabel" Display="None" InitialValue="0" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Auditor" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvtxtAuditor" runat="server" ControlToValidate="txtAuditor"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                                        ErrorMessage="Select a Auditor" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblAuditor" CssClass="styleDisplayLabel" Text="Auditor Name"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtEvaluator" onkeyup="maxlengthfortxt(100);" ToolTip="Evaluator" class="md-form-control form-control login_form_content_input requires_true" runat="server" OnSelectedIndexChanged="ddlProductCodeList_SelectedIndexChanged">
                                                                </asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvtxtEvaluator" runat="server" ControlToValidate="txtEvaluator"
                                                                    CssClass="styleMandatoryLabel" Display="None" InitialValue="0" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Evaluator" ValidationGroup="Main Page"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvtxtEvaluator" runat="server" ControlToValidate="txtEvaluator"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                                        ErrorMessage="Select a Evaluator" ValidationGroup="Main Page"></asp:RequiredFieldValidator>
                                                                </div>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblEvaluator" CssClass="styleDisplayLabel" Text="Evaluator"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <uc:Suggest ID="ddlRelationshipManager" runat="server" AutoPostBack="true" ToolTip="Relationship Manager" class="md-form-control form-control" ServiceMethod="GetRelationShipManager"
                                                                    ErrorMessage="Select the Relationship Manager" IsMandatory="true" ValidationGroup="Main Page" />

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblRelationshipManager" runat="server" ToolTip="Relationship Manager" CssClass="styleReqFieldLabel" Text="Relationship Manager"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtTenureFWC" class="md-form-control form-control login_form_content_input requires_true" runat="server" MaxLength="3" Style="text-align: right"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtTenureFWC"
                                                                    FilterType="Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <%--<asp:RequiredFieldValidator ID="rfvtxtTenureFWC" runat="server" ControlToValidate="txtTenureFWC"
                                                                    ValidationGroup="Main Page" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                    ErrorMessage="Enter the Tenure"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvtxtTenureFWC" runat="server" ControlToValidate="txtTenureFWC"
                                                                        ValidationGroup="Main Page" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                        ErrorMessage="Enter the Tenure"></asp:RequiredFieldValidator>
                                                                </div>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblTenureFWC" CssClass="styleReqFieldLabel" Text="Tenure"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlArearAdvanceFWC" class="md-form-control form-control" runat="server" MaxLength="7">
                                                                    <asp:ListItem Text="--Select--" Value="0" Enabled="true"></asp:ListItem>
                                                                    <asp:ListItem Text="Arear" Value="1" Enabled="true"></asp:ListItem>
                                                                    <asp:ListItem Text="Advance" Value="2" Enabled="true"></asp:ListItem>
                                                                </asp:DropDownList>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label runat="server" ID="lblArearAdvanceFWC" CssClass="styleDisplayLabel" Text="Arear/Advance"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>


                                                    </div>
                                                    <div style="display: none" class="row">
                                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="TextBox3" runat="server" Style="display: none;" MaxLength="50"></asp:TextBox>
                                                                <uc3:ICM ID="ICM1" runat="server" DispalyContent="Both" class="md-form-control form-control login_form_content_input requires_true" ShowHideAddressImageButton="false" onblur="return fnLoadCustomer();" strLOV_Code="IPRO" />
                                                                <asp:Button ID="Button3" runat="server" Text="Load Customer" OnClick="btnLoadCheckList_OnClick"
                                                                    Style="display: none" /><input id="Hidden5" type="hidden" runat="server" />

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblProposalFromCheckList" CssClass="styleDisplayLabel" Text="Proposal From [CheckList]."></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </asp:Panel>

                                                <asp:Panel ID="pnlCustomerMappingfortheAccount" runat="server" GroupingText="Client Customer Mapping for the Account" HorizontalAlign="Left" CssClass="stylePanel"
                                                    Width="99%">

                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:Button ID="btnLoadCustomerMapFWC" Style="display: none" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomerMapFWC_Click" />
                                                                <div>
                                                                    <asp:TextBox ID="txtCusomerCodeMapFWChidden" runat="server" ToolTip="Clients Customer" class="md-form-control form-control login_form_content_input requires_true"
                                                                        Style="display: none;" MaxLength="50"></asp:TextBox>
                                                                    <UC4:ICM ID="ucCustomerLovCustomerMapFWC" WatermarkTextEnable="false" ToolTip="Client Customer Code" ShowHideAddressImageButton="false" onblur="fnLoadCustomerSubLimitDLR()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                        strLOV_Code="CUS_CLIENTCUST" ServiceMethod="GetClientsCustomerList" OnItem_Selected="ucCustomerLovCustomerMapFWC_Item_Selected" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label runat="server" ID="lblCustomerCode" CssClass="styleDisplayLabel" Text="Clients Customer"></asp:Label>
                                                                    </label>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtCusomerCodeMapFWChidden" runat="server" ControlToValidate="txtCusomerCodeMapFWChidden"
                                                                            ErrorMessage="Select the Clients Customer" ValidationGroup="vgAdd" CssClass="validation_msg_box_sapn"
                                                                            Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLimitF" AutoPostBack="false" OnTextChanged="txtLimitAmnt_OntextChanged" runat="server" Style="text-align: right;"
                                                                    ToolTip="Limit" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftbeFPostPercent" runat="server" FilterMode="ValidChars"
                                                                    FilterType="Custom,Numbers" ValidChars="." TargetControlID="txtLimitF">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblLimit" CssClass="styleReqFieldLabel" ToolTip="Limit" Text="Limit"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvFCuttOffDate" runat="server" Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Enter the Limit Value."
                                                                        ControlToValidate="txtLimitF" SetFocusOnError="true" ValidationGroup="vgAdd"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtTotalSubLimit" Enabled="false" runat="server" Style="text-align: right;"
                                                                    ToolTip="Total Limit" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblTotalSublimit" CssClass="styleDisplayLabel" ToolTip="Total Sub Limit" Text="Total Sub Limit"></asp:Label>
                                                                </label>

                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">


                                                                <button class="css_btn_enabled" id="lnkAdd" title="Add [Alt+V]" causesvalidation="false" validationgroup="vgAdd" onserverclick="lnkAddCustomerMapFWC_Click" runat="server"
                                                                    type="submit" accesskey="V">
                                                                    <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u></u>Add
                                                                </button>


                                                                <%-- <asp:Button ValidationGroup="vgAdd" OnClick="lnkAddCustomerMapFWC_Click" CssClass="save_btn" Text="Add Limit" ToolTip="Add[Alt+D]" runat="server" AccessKey="S" ID="lnkAdd" />--%>
                                                            </div>
                                                        </div>


                                                    </div>

                                                    <div align="center" style="overflow-y: scroll" class="grid">
                                                        <div style="height: 200px">
                                                            <asp:GridView ID="grvCustSubLimit" HorizontalAlign="Center" runat="server" Width="50%" DataKeyNames="Serial_Number" class="gird_details" AutoGenerateColumns="false"
                                                                ShowFooter="false" OnRowDataBound="grvCustSubLimit_RowDataBound"
                                                                OnRowCommand="grvCustSubLimit_RowCommand" OnRowEditing="grvCustSubLimit_RowEditing"
                                                                OnRowUpdating="grvCustSubLimit_RowUpdating" OnRowCancelingEdit="grvCustSubLimit_RowCancelingEdit"
                                                                OnRowDeleting="grvCustSubLimit_RowDeleting">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="S.No">

                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                            <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />
                                                                            <asp:Label ID="lbldelst" Visible="false" runat="server" Text='<%#Eval("DEL_STAT") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:Label ID="lblSerialNo" Value='<%#Eval("Serial_Number") %>' ToolTip="S.No" runat="server"></asp:Label>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle Width="2%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                        <ItemStyle Width="2%" HorizontalAlign="Center" />
                                                                        <FooterStyle Width="2%" HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Customer Code/Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblEntityId" Text='<%#Eval("Entity_Id") %>' Visible="false" runat="server" />
                                                                            <asp:Label ID="lblEntityName" Text='<%#Eval("ENTITY_NAME") %>' ToolTip="Customer Code/Name" runat="server"
                                                                                Width="90%"></asp:Label>
                                                                        </ItemTemplate>

                                                                        <HeaderStyle Width="70%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                        <ItemStyle Width="70%" HorizontalAlign="Left" />

                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Limit">
                                                                        <ItemTemplate>
                                                                            <div style="display: block; text-align: right;">
                                                                                <asp:Label ID="lblLimitAmnt" runat="server"
                                                                                    ToolTip="Limit" Text='<%#Eval("Limit") %>' Style="width: 90%; text-align: right; border-color: White;"></asp:Label>
                                                                            </div>


                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="23%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                        <ItemStyle Width="23%" HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField Visible="false" HeaderText="Cut Off Date">
                                                                        <ItemTemplate>

                                                                            <asp:TextBox ID="txtCutOffDate" runat="server"
                                                                                ToolTip="Cut off Date" ContentEditable="false" Text='<%#Eval("CuttOffDate") %>' Style="width: 90%; text-align: right; border-color: White;" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>


                                                                        </ItemTemplate>
                                                                        <HeaderStyle Width="20%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                        <ItemStyle Width="20%" HorizontalAlign="Center" />
                                                                        <FooterStyle Width="20%" HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <table width="50%">
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex%>'
                                                                                            CommandName="Edit" CausesValidation="false" CssClass="grid_btn"></asp:LinkButton>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:LinkButton ID="lnkRemove" runat="server" ToolTip="Delete [Alt+2]" Text="Delete" CommandName="Delete"
                                                                                            OnClientClick="return confirm('Are you sure want to delete?');" AccessKey="2" CausesValidation="false" CssClass="grid_btn_delete"></asp:LinkButton>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <table>
                                                                                <tr>
                                                                                    <td>

                                                                                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CssClass="grid_btn" CommandName="Update"
                                                                                            ValidationGroup="Footer" ToolTip="Update"></asp:LinkButton>&nbsp;|
                                                   
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CssClass="grid_btn" CommandName="Cancel"
                                                                                            CausesValidation="false" ToolTip="Cancel"></asp:LinkButton>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>

                                                                        </EditItemTemplate>


                                                                        <ItemStyle Width="5%" Font-Bold="true" HorizontalAlign="Center" />
                                                                        <HeaderStyle Width="5%" Font-Bold="true" HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                                <cc1:CollapsiblePanelExtender ID="clpSublimitHistory" runat="Server" TargetControlID="pnlSublimitHistory"
                                                    ExpandControlID="pnlSublimitHistoryHdr" CollapseControlID="pnlSublimitHistoryHdr" Collapsed="true"
                                                    TextLabelID="lblSubLimithistory" ExpandDirection="Vertical" ImageControlID="imgSubLimit" ExpandedText="(Hide Details...)"
                                                    CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                                                    CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />
                                                <div id="divSubLimitHistory" runat="server" visible="false" style="background-color: rgba(247, 247, 247, 0.63);">
                                                    <asp:Panel ID="pnlSublimitHistoryHdr" runat="server" CssClass="accordionHeader" Width="98.5%">
                                                        <div style="float: left;">
                                                            Sub Limit history
                                                        </div>
                                                        <div style="float: left; margin-left: 20px;">
                                                            <asp:Label ID="lblSubLimithistory" runat="server">(Show Details...)</asp:Label>
                                                        </div>
                                                        <div style="float: right; vertical-align: middle;">
                                                            <asp:ImageButton ID="imgSubLimit" runat="server" ImageUrl="~/Images/expand_blue.jpg"
                                                                AlternateText="(Show Details...)" />
                                                        </div>
                                                    </asp:Panel>
                                                    <asp:Panel ID="pnlSublimitHistory" runat="server" GroupingText="SubLimit History" HorizontalAlign="Left" CssClass="stylePanel"
                                                        Width="99%">
                                                        <div align="center" style="overflow-y: scroll" class="grid">
                                                            <div style="height: 200px">
                                                                <asp:GridView ID="grvSubLimitHistory" HorizontalAlign="Center" runat="server" Width="60%" DataKeyNames="Serial_Number" class="gird_details" AutoGenerateColumns="false"
                                                                    ShowFooter="false" OnRowDataBound="grvCustSubLimit_RowDataBound"
                                                                    OnRowCommand="grvCustSubLimit_RowCommand" OnRowEditing="grvCustSubLimit_RowEditing"
                                                                    OnRowUpdating="grvCustSubLimit_RowUpdating" OnRowCancelingEdit="grvCustSubLimit_RowCancelingEdit"
                                                                    OnRowDeleting="grvCustSubLimit_RowDeleting">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="S.No">

                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                                <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />
                                                                                <asp:Label ID="lbldelst" Visible="false" runat="server" Text='<%#Eval("DEL_STAT") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:Label ID="lblSerialNo" Value='<%#Eval("Serial_Number") %>' ToolTip="S.No" runat="server"></asp:Label>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle Width="2%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                            <ItemStyle Width="2%" HorizontalAlign="Center" />
                                                                            <FooterStyle Width="2%" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Customer Code/Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblEntityId" Text='<%#Eval("Entity_Id") %>' Visible="false" runat="server" />
                                                                                <asp:Label ID="lblEntityName" Text='<%#Eval("ENTITY_NAME") %>' ToolTip="Customer Code/Name" runat="server"
                                                                                    Width="90%"></asp:Label>
                                                                            </ItemTemplate>

                                                                            <HeaderStyle Width="20%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                            <ItemStyle Width="20%" HorizontalAlign="Left" />

                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Limit">
                                                                            <ItemTemplate>
                                                                                <div style="display: block; text-align: right;">
                                                                                    <asp:Label ID="lblLimitAmnt" runat="server"
                                                                                        ToolTip="Limit" Text='<%#Eval("Limit") %>' Style="width: 90%; text-align: right; border-color: White;"></asp:Label>
                                                                                </div>


                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="23%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                            <ItemStyle Width="23%" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Modified Date">
                                                                            <ItemTemplate>

                                                                                <%--    <asp:TextBox ID="txtCutOffDate" runat="server"
                                                                                    ToolTip="Cut off Date" ReadOnly="true" Text='<%#Eval("CuttOffDate") %>' class="md-form-control form-control login_form_content_input"></asp:TextBox>--%>

                                                                                <asp:TextBox ID="txtCutOffDate" Text='<%#Eval("CuttOffDate") %>' runat="server" Style="text-align: right;"
                                                                                    ToolTip="Limit" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="25%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                            <ItemStyle Width="25%" HorizontalAlign="Center" />
                                                                            <FooterStyle Width="25%" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Modified User">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtModifiedUser" ReadOnly="true" Text='<%#Eval("Modified_By") %>' runat="server" Style="text-align: right;"
                                                                                    ToolTip="Modified By" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="25%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                            <ItemStyle Width="25%" HorizontalAlign="Center" />
                                                                            <FooterStyle Width="25%" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <%-- <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <table width="50%">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex%>'
                                                                                                CommandName="Edit" CausesValidation="false" CssClass="grid_btn"></asp:LinkButton>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:LinkButton ID="lnkRemove" runat="server" ToolTip="Delete [Alt+2]" Text="Delete" CommandName="Delete"
                                                                                                OnClientClick="return confirm('Are you sure want to delete?');" AccessKey="2" CausesValidation="false" CssClass="grid_btn_delete"></asp:LinkButton>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <table>
                                                                                    <tr>
                                                                                        <td>

                                                                                            <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CssClass="grid_btn" CommandName="Update"
                                                                                                ValidationGroup="Footer" ToolTip="Update"></asp:LinkButton>&nbsp;|
                                                   
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CssClass="grid_btn" CommandName="Cancel"
                                                                                                CausesValidation="false" ToolTip="Cancel"></asp:LinkButton>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>

                                                                            </EditItemTemplate>


                                                                            <ItemStyle Width="5%" Font-Bold="true" HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="5%" Font-Bold="true" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>--%>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>

                                                <div id="TbLeaseTabContainerMainTab" runat="server" class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <cc1:TabContainer ID="TabContainerMainTab" runat="server" CssClass="styleTabPanel"
                                                            Width="100%" ActiveTabIndex="1">
                                                            <cc1:TabPanel ID="TabDocumentDetails" runat="server" BackColor="Red" CssClass="tabpan"
                                                                Width="100%">
                                                                <HeaderTemplate>
                                                                    Document Details
                                                                </HeaderTemplate>
                                                                <ContentTemplate>



                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtConstitution" Enabled="false" ToolTip="Constitution Code" class="md-form-control form-control login_form_content_input requires_true" runat="server" TabIndex="-1">
                                                                                </asp:TextBox>
                                                                                <asp:DropDownList ID="ddlConstitutionCodeList" class="md-form-control form-control" runat="server" Visible="false">
                                                                                </asp:DropDownList>

                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="lblConstitutionCodeList" runat="server" CssClass="styleReqFieldLabel"
                                                                                        Text="Constitution Code"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <cc1:CollapsiblePanelExtender ID="collapseAccountDues" runat="Server" TargetControlID="pnlConstitutionDocumentDetails"
                                                                        ExpandControlID="pnlConstitutionDocumentDetailsHdr" CollapseControlID="pnlConstitutionDocumentDetailsHdr" Collapsed="true"
                                                                        TextLabelID="lblimgConstitutionDocumentDetails" ImageControlID="imgConstitutionDocumentDetails" ExpandedText="(Hide Details...)"
                                                                        CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                                                                        CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />
                                                                    <div style="background-color: rgba(247, 247, 247, 0.63);">
                                                                        <asp:Panel ID="pnlConstitutionDocumentDetailsHdr" runat="server" CssClass="accordionHeader" Width="98.5%">
                                                                            <div style="float: left;">
                                                                                Constitution Document Details
                                                                            </div>
                                                                            <div style="float: left; margin-left: 20px;">
                                                                                <asp:Label ID="lblimgConstitutionDocumentDetails" runat="server">(Show Details...)</asp:Label>
                                                                            </div>
                                                                            <div style="float: right; vertical-align: middle;">
                                                                                <asp:ImageButton ID="imgConstitutionDocumentDetails" runat="server" ImageUrl="~/Images/expand_blue.jpg"
                                                                                    AlternateText="(Show Details...)" />
                                                                            </div>
                                                                        </asp:Panel>

                                                                        <asp:Panel runat="server" ID="pnlConstitutionDocumentDetails" CssClass="stylePanel" GroupingText="Constitution Document Details"
                                                                            Width="99%">
                                                                            <%--<div id="div14" style="overflow: auto; width: 98%; padding-left: 1%;" runat="server">--%>
                                                                            <div class="gird">
                                                                                <div>
                                                                                    <br />
                                                                                    <asp:GridView runat="server" ID="grvConsDocuments" Width="100%" OnRowDataBound="grvConsDocs_RowDataBound" class="gird_details"
                                                                                        AutoGenerateColumns="False">
                                                                                        <Columns>
                                                                                            <asp:BoundField DataField="ID" HeaderText="ID" />
                                                                                            <asp:BoundField DataField="DocumentFlag" HeaderText="Document Flag" ItemStyle-Width="10%" />
                                                                                            <asp:BoundField DataField="DocumentDescription" HeaderText="Document Description"
                                                                                                ItemStyle-Width="15%" />
                                                                                            <asp:TemplateField HeaderText="Is_Mandatory" ItemStyle-Width="10%">
                                                                                                <HeaderTemplate>
                                                                                                    <asp:Label ID="lblOptman" runat="server" Text="Mandatory"></asp:Label>
                                                                                                </HeaderTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <%-- '<%# Bind("IsMandatory") %>'--%>
                                                                                                    <asp:CheckBox ID="chkIsMandatory" runat="server" Enabled="true" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "IsMandatory")))%>'></asp:CheckBox>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Image Copy" ItemStyle-Width="10%">
                                                                                                <ItemTemplate>
                                                                                                    <%--'<%# Bind("IsNeedImageCopy") %>'--%>
                                                                                                    <asp:CheckBox ID="chkIsNeedImageCopy" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "IsNeedImageCopy")))%>'></asp:CheckBox>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Collected" ItemStyle-Width="10%">
                                                                                                <ItemTemplate>
                                                                                                    <%--'<%# Bind("Collected") %>'--%>
                                                                                                    <asp:CheckBox ID="chkCollected" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Collected")))%>'></asp:CheckBox>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Scanned" ItemStyle-Width="10%">
                                                                                                <ItemTemplate>
                                                                                                    <%--'<%# Bind("Scanned") %>'--%>
                                                                                                    <asp:CheckBox ID="chkScanned" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Scanned")))%>'></asp:CheckBox>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Remark" ItemStyle-Width="7%">
                                                                                                <ItemTemplate>
                                                                                                    <asp:TextBox ID="txtRemark" runat="server" class="md-form-control form-control login_form_content_input requires_true" onkeypress="fnCheckSpecialChars(true)"
                                                                                                        Width="130px" onkeyup="maxlengthfortxt(60)" Text='<%# Bind("Remark") %>' MaxLength="60"
                                                                                                        TextMode="MultiLine"></asp:TextBox>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Value" ItemStyle-Width="15%">
                                                                                                <ItemTemplate>
                                                                                                    <asp:TextBox ID="txtValues" class="md-form-control form-control login_form_content_input" runat="server" onkeypress="fnCheckSpecialChars(false)"
                                                                                                        Width="130px" onkeyup="fnNotAllowPasteSpecialChar(this,'special')" Text='<%# Bind("Values") %>'
                                                                                                        MaxLength="40"></asp:TextBox>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="FollowUp" ItemStyle-Width="10%">
                                                                                                <ItemTemplate>
                                                                                                    <asp:CheckBox Enabled="false" runat="server" ID="chkIs_FollowUp" />
                                                                                                    <asp:Label ID="lblchkIs_FollowUp" Visible="false" runat="server" Text='<%#Eval("Is_FollowUp")%>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Scanned Reference">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="lnkScannedReference" runat="server" Text="View" OnClick="lnkScannedReference_Click">
                                                                                                    </asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:TemplateField HeaderText="Document ID" ItemStyle-Width="10%" Visible="false">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="lblDocumentId" runat="server" Text='<%#Eval("DocumentId")%>'></asp:Label>
                                                                                                    <asp:Label ID="lblDocumentPath" runat="server" Text='<%#Eval("Document_Path")%>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                            <asp:BoundField DataField="Document_Path" HeaderText="Document Path" ItemStyle-Width="10%"
                                                                                                Visible="false" />
                                                                                        </Columns>
                                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                                        <RowStyle HorizontalAlign="Center" />
                                                                                    </asp:GridView>
                                                                                </div>
                                                                            </div>
                                                                        </asp:Panel>
                                                                    </div>


                                                                    <cc1:CollapsiblePanelExtender ID="collapseCad" runat="Server" TargetControlID="pnlPreDisbursementDocumentDetails"
                                                                        ExpandControlID="collapseCadHdr" CollapseControlID="collapseCadHdr" Collapsed="true"
                                                                        TextLabelID="lblPreDisbursementDocumentDetails" ImageControlID="imgPreDisbursementDocumentDetails" ExpandedText="(Hide Details...)"
                                                                        CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                                                                        CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />
                                                                    <div style="background-color: rgba(247, 247, 247, 0.63);">
                                                                        <asp:Panel ID="collapseCadHdr" runat="server" CssClass="accordionHeader" Width="98.5%">
                                                                            <div style="float: left;">
                                                                                Documents of Proposal(CAD)
                                                                            </div>
                                                                            <div style="float: left; margin-left: 20px;">
                                                                                <asp:Label ID="lblPreDisbursementDocumentDetails" runat="server">(Show Details...)</asp:Label>
                                                                            </div>
                                                                            <div style="float: right; vertical-align: middle;">
                                                                                <asp:ImageButton ID="imgPreDisbursementDocumentDetails" runat="server" ImageUrl="~/Images/expand_blue.jpg"
                                                                                    AlternateText="(Show Details...)" />
                                                                            </div>
                                                                        </asp:Panel>
                                                                        <asp:Panel runat="server" ID="pnlPreDisbursementDocumentDetails" Visible="false" CssClass="stylePanel" GroupingText="Documents of Proposal(CAD)"
                                                                            Width="99%">
                                                                            <%--<div id="div11" style="overflow: auto; width: 98%; padding-left: 1%;" runat="server">--%>
                                                                            <div class="gird">
                                                                                <br />
                                                                                <asp:GridView ID="gvPRDDT" runat="server" Width="99%" AutoGenerateColumns="False"
                                                                                    DataKeyNames="PRDDC_Doc_Cat_ID" class="gird_details" ShowFooter="false" OnRowDataBound="gvPRDDT_RowDataBound">
                                                                                    <Columns>

                                                                                        <asp:TemplateField HeaderText="S.No">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSno" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                        </asp:TemplateField>

                                                                                        <asp:TemplateField HeaderText="PRDDC TypeId" Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblPRTID" runat="server" Text='<%# Bind("PRDDC_Doc_Cat_ID") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Priority">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblPRIORITYTYPE" runat="server" Text='<%# Bind("PRIORITY_TYPE") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Doc Type">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblTDocType" ToolTip="Doc Type" runat="server" Text='<%# Bind("PRDDC_Doc_Cat_ID") %>'></asp:Label>
                                                                                                <asp:Label ID="lblPRICINGDOCID" Visible="false" runat="server" Text='<%# Bind("PRICING_DOC_ID") %>'></asp:Label>

                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false" HeaderText="PRDDC Type">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblType" runat="server" Text='<%# Bind("PRDDC_Doc_Type") %>'></asp:Label>

                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>

                                                                                        <asp:TemplateField HeaderText="Particulars">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input">
                                                                                                    <asp:Label ID="lblDesc" Width="400px" ToolTip="Particulars" runat="server" Text='<%# Bind("PRDDC_Doc_Description") %>'></asp:Label>
                                                                                                </div>
                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Doc Required">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input">
                                                                                                    <asp:Label ID="lblDocRequired" runat="server" Visible="false" Text='<%#Bind("Doc_Required") %>' />
                                                                                                    <asp:DropDownList ID="ddlRequired" CssClass="md-form-control form-control login_form_content_input" AutoPostBack="false" Width="120px" ToolTip="Document Required" runat="server">
                                                                                                        <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                                                                        <asp:ListItem Text="Required" Value="1"></asp:ListItem>
                                                                                                        <asp:ListItem Text="Not Required" Value="2"></asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Doc Received">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input">
                                                                                                    <asp:Label ID="lblDocReceived" Visible="false" runat="server" Text='<%#Bind("Doc_Received") %>' />
                                                                                                    <asp:DropDownList ID="ddlReceived" CssClass="md-form-control form-control login_form_content_input" Width="120px" AutoPostBack="false" ToolTip="Document Received" runat="server">
                                                                                                        <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                                                                        <asp:ListItem Text="Received" Value="1"></asp:ListItem>
                                                                                                        <asp:ListItem Text="Not Received" Value="2"></asp:ListItem>
                                                                                                        <asp:ListItem Text="Waived" Value="3"></asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>

                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>

                                                                                        <asp:TemplateField HeaderText="CollectedById" Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblCollectedBy" runat="server" Text='<%# Bind("Collected_By_Id") %>'></asp:Label>
                                                                                                <asp:Label ID="lblCollectedByName" runat="server" Text='<%# Bind("CollectedBy") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Collected/Waived By">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input">
                                                                                                    <uc:Suggest ID="ddlCollectedBy" ToolTip="Collected/Waived By" cssclass="md-form-control form-control login_form_content_input" runat="server" Width="200px" SelectedText='<%# Bind("CollectedBy") %>' ServiceMethod="GetUserList" AutoPostBack="false"
                                                                                                        IsMandatory="false" />
                                                                                                </div>
                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                            <FooterStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>

                                                                                        <asp:TemplateField HeaderText="Collected Date">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input">
                                                                                                    <asp:TextBox ID="txtCollectedDate" ToolTip="Collected Date" Width="100px" CssClass="md-form-control form-control login_form_content_input" runat="server" Text='<%#Bind("Col_Date") %>'>
                                                                                                    </asp:TextBox>
                                                                                                    <cc1:CalendarExtender ID="calCollectedDate" runat="server" Enabled="True" TargetControlID="txtCollectedDate">
                                                                                                    </cc1:CalendarExtender>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                            <ItemStyle />
                                                                                        </asp:TemplateField>

                                                                                        <asp:TemplateField HeaderText="CADVerifiedById" Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblCADVerifiedById" runat="server" Text='<%# Bind("CADVerifiedById") %>'></asp:Label>
                                                                                                <asp:Label ID="lblCADVerifiedByIdName" runat="server" Text='<%# Bind("CADVerifiedBy") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="CAD Verified By">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input">
                                                                                                    <uc:Suggest ID="ddlCADVerifiedBy" ToolTip="CAD Verified By" cssclass="md-form-control form-control login_form_content_input" Width="200px" runat="server" SelectedText='<%# Bind("CADVerifiedBy") %>' ServiceMethod="GetUserList" AutoPostBack="false"
                                                                                                        IsMandatory="false" />
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="CAD Verified Date">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input">
                                                                                                    <asp:TextBox ID="txtCADVerifiedDate" ToolTip="CAD Verified Date" CssClass="md-form-control form-control login_form_content_input" Width="100px" runat="server" Text='<%#Bind("Ver_Date") %>'>
                                                                                                    </asp:TextBox>
                                                                                                    <cc1:CalendarExtender ID="calCADVerified" runat="server" Enabled="True" TargetControlID="txtCADVerifiedDate">
                                                                                                    </cc1:CalendarExtender>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                            <ItemStyle />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="CAD Verifier Remarks">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input">
                                                                                                    <asp:TextBox ID="txtCADVerifierRemarks" ToolTip="CAD Verifier Remarks" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="200px" Text='<%# Eval("CADVerifierRemarks")%>'
                                                                                                        TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="CADReceivedById" Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblCADReceivedById" runat="server" Text='<%# Bind("CADReceivedById") %>'></asp:Label>
                                                                                                <asp:Label ID="lblCADReceivedByIdName" runat="server" Text='<%# Bind("CADReceivedBy") %>'></asp:Label>
                                                                                            </ItemTemplate>

                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="CAD Received By">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input">
                                                                                                    <uc:Suggest ID="ddlCADReceivedBy" ToolTip="CAD Received By" cssclass="md-form-control form-control login_form_content_input" runat="server" Width="200px" SelectedText='<%# Bind("CADReceivedBy") %>' ServiceMethod="GetUserList" AutoPostBack="false"
                                                                                                        IsMandatory="true" />
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="CAD Received Date">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input">
                                                                                                    <asp:TextBox ID="txtCADReceived" ToolTip="CAD Received Date" CssClass="md-form-control form-control login_form_content_input" Width="100px" runat="server" Text='<%#Bind("Rec_Date") %>'>
                                                                                                    </asp:TextBox>
                                                                                                    <cc1:CalendarExtender ID="calCADReceived" runat="server" Enabled="True" TargetControlID="txtCADReceived">
                                                                                                    </cc1:CalendarExtender>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                            <ItemStyle />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="CAD Receiver Remarks">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input">
                                                                                                    <asp:TextBox ID="txtCADReceiverRemarks" ToolTip="CAD Receiver Remarks" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="200px" Text='<%# Eval("CADReceiverRemarks")%>'
                                                                                                        TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>

                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>




                                                                                        <asp:TemplateField HeaderText="Document">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input">
                                                                                                    <asp:Label runat="server" ID="lblPath" Visible="false" Text='<%# Eval("Scanned_Ref_No")%>'></asp:Label>
                                                                                                    <asp:LinkButton runat="server" ToolTip="View Document" CausesValidation="false" CssClass="grid_btn" ID="hyplnkView" OnClick="hyplnkView_Click" Text="View"></asp:LinkButton>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>

                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Marketing Officer Remarks">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input">
                                                                                                    <asp:TextBox ID="txtRemarks" ToolTip="Marketing Officer Remarks" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="200px" Text='<%# Eval("Remarks")%>'
                                                                                                        TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" MaxLength="100"></asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>

                                                                                                    </textarea>
                                                                                                </div>
                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>

                                                                                        <asp:TemplateField HeaderText="Value">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input">
                                                                                                    <asp:TextBox ID="txtCADValue" ToolTip="Value" Width="100px" runat="server" CssClass="md-form-control form-control login_form_content_input" Text='<%# Eval("txtCADValue")%>'
                                                                                                        onkeyup="maxlengthfortxt(40)" MaxLength="100"></asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                            </ItemTemplate>

                                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>



                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                                <br />
                                                                            </div>
                                                                        </asp:Panel>
                                                                    </div>
                                                                </ContentTemplate>
                                                            </cc1:TabPanel>
                                                            <cc1:TabPanel ID="TabAssetDetails" runat="server" BackColor="Red" CssClass="tabpan"
                                                                Width="100%">
                                                                <HeaderTemplate>
                                                                    Asset Details
                                                                </HeaderTemplate>
                                                                <ContentTemplate>
                                                                    <asp:Panel runat="server" ID="pnlAssetDetails" CssClass="stylePanel" GroupingText="Asset Details"
                                                                        Width="99%">
                                                                        <div id="Div1" style="height: 300px; overflow: auto;" runat="server">
                                                                            <div class="row">
                                                                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="float: right;">

                                                                                    <%-- <asp:Button ID="btnAddAsset" ToolTip="Add Asset [Alt+T]" AccessKey="T" runat="server" Text="Add Asset"
                                                                                        UseSubmitBehavior="False" CssClass="save_btn" ValidationGroup="tcAsset" />--%>

                                                                                    <div class="md-input">
                                                                                        <button class="css_btn_enabled" id="btnAddAsset" title="Add Asset [Alt+T]" causesvalidation="false" runat="server"
                                                                                            type="button" accesskey="T">
                                                                                            <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u></u>Add Asset
                                                                                        </button>
                                                                                    </div>


                                                                                    <asp:TextBox ID="txtAssetFocus" runat="server"></asp:TextBox>
                                                                                    <asp:Button ID="btnAssetLoad" runat="server" Text="Load Asset" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnAssetLoad_Click"
                                                                                        Style="display: none" />
                                                                                </div>
                                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtTotalAssetCount" Enabled="false" runat="server" Style="text-align: right;"
                                                                                            ToolTip="Total Asset Count" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label class="tess">
                                                                                            <asp:Label runat="server" ID="TotalAssetCount" CssClass="styleDisplayLabel" ToolTip="Total Asset Count" Text="Total Asset Count"></asp:Label>
                                                                                        </label>

                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtTotalAssetCost" Enabled="false" runat="server" Style="text-align: right;"
                                                                                            ToolTip="Total Asset Cost" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label class="tess">
                                                                                            <asp:Label runat="server" ID="lblTotalAssetCost" CssClass="styleDisplayLabel" ToolTip="Total Asset Cost" Text="Total Asset Cost"></asp:Label>
                                                                                        </label>

                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtTotalFinanceAmount" Enabled="false" runat="server" Style="text-align: right;"
                                                                                            ToolTip="Total Asset Count" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label class="tess">
                                                                                            <asp:Label runat="server" ID="lblTotalFinanceAmount" CssClass="styleDisplayLabel" ToolTip="Total Finance Amount" Text="Total Finance Amount"></asp:Label>
                                                                                        </label>

                                                                                    </div>
                                                                                </div>



                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="gird">
                                                                                        <br />
                                                                                        <asp:GridView ID="gvAssetDetails" class="gird_details" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvAssetDetails_RowDeleting"
                                                                                            OnRowDataBound="gvAssetDetails_RowDataBound" Width="100%">
                                                                                            <Columns>
                                                                                                <asp:TemplateField HeaderText="Sl.No" ItemStyle-HorizontalAlign="Right">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:LinkButton ID="lnkAssetSerialNo" CssClass="grid_btn" ToolTip="Edit Asset" runat="server" Text='<%#Bind("SlNo") %>' Style="text-align: right"></asp:LinkButton>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:BoundField DataField="Asset_Code" HeaderText="Asset" />
                                                                                                <asp:BoundField DataField="Noof_Units" HeaderText="Unit Count" ItemStyle-HorizontalAlign="Right" />
                                                                                                <asp:BoundField DataField="TOTALASSETVALUE" HeaderText="Asset Cost" ItemStyle-HorizontalAlign="Right" />
                                                                                                <asp:BoundField DataField="Finance_Amount" HeaderText="Finance Amount" ItemStyle-HorizontalAlign="Right" />

                                                                                                <%-- <asp:BoundField DataField="Engine_No" HeaderText="Engine No" ItemStyle-HorizontalAlign="Right" />
                                                                                            <asp:BoundField DataField="Chasis_No" HeaderText="Chasis No" ItemStyle-HorizontalAlign="Right" />--%>

                                                                                                <asp:TemplateField HeaderText="Engine No">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:TextBox ID="txtEngine_No" Width="100px" Enabled="false" CssClass="md-form-control form-control login_form_content_input requires_true" Text='<%#Bind("Engine_No") %>' runat="server"></asp:TextBox>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Chasis No">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:TextBox ID="txtChasis_No" Width="100px" Enabled="false" CssClass="md-form-control form-control login_form_content_input requires_true" Text='<%#Bind("Chasis_No") %>' runat="server"></asp:TextBox>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>

                                                                                                <asp:TemplateField HeaderText="Registration No">
                                                                                                    <ItemTemplate>
                                                                                                        <table>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="txtRegNo" Width="100px" Enabled="false" CssClass="md-form-control form-control login_form_content_input requires_true" Text='<%#Bind("Reg_No") %>' runat="server"></asp:TextBox>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:TextBox ID="txtRegNo2" Width="100px" Enabled="false" CssClass="md-form-control form-control login_form_content_input requires_true" Text='<%#Bind("Reg_No2") %>' runat="server"></asp:TextBox>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>


                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:BoundField DataField="Date_of_Reg" HeaderText="Date of Registration" ItemStyle-HorizontalAlign="Right" />
                                                                                                <asp:BoundField DataField="Reg_Expiry_Date" HeaderText="Registration Expiry Date" ItemStyle-HorizontalAlign="Right" />
                                                                                                <%--   <asp:BoundField DataField="ManuFactoring_Year" HeaderText="Manufactoring Year" ItemStyle-HorizontalAlign="Right" />--%>

                                                                                                <asp:TemplateField Visible="false" HeaderText="Proforma">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:LinkButton ID="lnkView" CausesValidation="false" runat="server" Text="View"></asp:LinkButton>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:LinkButton ID="lnRemove" CssClass="grid_btn_delete" AccessKey="3" OnClientClick="return confirm('Are you sure want to delete this record?');" ToolTip="Remove [Alt+3]" CausesValidation="false" runat="server" CommandName="Delete"
                                                                                                            Text="Remove"></asp:LinkButton>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="ProformaId" Visible="false">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblProformaId" runat="server" Text='<%#Bind("Proforma_Id") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:BoundField Visible="false" DataField="Lease_Asset_No" HeaderText="Lease Asset No" ItemStyle-HorizontalAlign="Right" />
                                                                                            </Columns>
                                                                                        </asp:GridView>
                                                                                        <br />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </asp:Panel>
                                                                    <asp:Panel ID="pnlAssetAdd" runat="server">




                                                                        <div style="display: none" class="row">
                                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                                                <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                                                                <asp:Button ID="btnConfigure" runat="server" CausesValidation="False"
                                                                                    OnClick="btnConfigure_Click" CssClass="save_btn fa fa-floppy-o" UseSubmitBehavior="False" Text="Configure" />
                                                                                <asp:Button ID="btnPrint" runat="server" CausesValidation="False" CssClass="save_btn fa fa-floppy-o"
                                                                                    UseSubmitBehavior="False" Text="Print" Enabled="false" />
                                                                            </div>
                                                                        </div>
                                                                    </asp:Panel>


                                                                </ContentTemplate>
                                                            </cc1:TabPanel>
                                                        </cc1:TabContainer>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </asp:Panel>
                                </ContentTemplate>

                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>


                    <cc1:TabPanel runat="server" ID="TabOfferTerms" CssClass="tabpan" BackColor="Red"
                        Width="100%">
                        <HeaderTemplate>
                            Offer Terms
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upOfferTerms" runat="server">
                                <ContentTemplate>

                                    <asp:Panel ID="pnlOfferTerms" runat="server">


                                        <div style="background-color: rgba(247, 247, 247, 0.63);">
                                            <asp:Panel ID="divRoiRules" runat="server" CssClass="accordionHeader" Width="98.5%">
                                                <div style="float: left;">
                                                    ROI/Payment Rule Card details
                                                </div>
                                                <div style="float: left; margin-left: 20px;">
                                                    <asp:Label ID="lblDetails" runat="server">(Show Details...)</asp:Label>
                                                </div>
                                                <div style="float: right; vertical-align: middle;">
                                                    <asp:ImageButton ID="imgDetails" runat="server" ImageUrl="~/Images/expand_blue.jpg"
                                                        AlternateText="(Show Details...)" />
                                                </div>
                                            </asp:Panel>

                                            <asp:Panel ID="divROIRuleInfo" Style="overflow: auto; height: 150px; width: 100%"
                                                runat="server">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <br />
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlROIRuleList" ToolTip="ROI Rule" runat="server" class="md-form-control form-control" onchange="FunRestIrr();">
                                                            </asp:DropDownList>
                                                            <%-- <asp:RequiredFieldValidator ID="rfvddlROIRuleList" runat="server" ControlToValidate="ddlROIRuleList"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" InitialValue="0"
                                                                ErrorMessage="Select a ROI rule from the list" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>--%>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvddlROIRuleList" runat="server" ControlToValidate="ddlROIRuleList"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" InitialValue="0"
                                                                    ErrorMessage="Select a ROI rule from the list" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label class="tess">
                                                                <asp:Label ID="lblROIRuleList" runat="server" CssClass="styleReqFieldLabel" Text="ROI Rule"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <br />
                                                        <div class="md-input">

                                                            <%-- <asp:Button ID="btnFetchROI" Text="Go" runat="server" AccessKey="G" ToolTip="Fetch ROI Details[Alt+G]" class="css_btn_enabled"
                                                                OnClientClick="return FunddlRoiOnChange('ROI')" OnClick="btnFetchROI_Click" Style="display: block" />--%>

                                                            <div class="md-input">
                                                                <button class="css_btn_enabled" id="btnFetchROI" title="Go [Alt+G]" onclick="if(FunddlRoiOnChange('ROI'))" onserverclick="btnFetchROI_Click" causesvalidation="false" runat="server"
                                                                    type="button" accesskey="G">
                                                                    <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u></u>Go
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <br />
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlPaymentRuleList" ToolTip="Payment Rule" class="md-form-control form-control" runat="server">
                                                            </asp:DropDownList>
                                                            <%-- <asp:RequiredFieldValidator ID="rfvddlPaymentRuleList" runat="server" ControlToValidate="ddlPaymentRuleList"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" InitialValue="0"
                                                                ErrorMessage="Select a Payment rule from the list" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>--%>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvddlPaymentRuleList" runat="server" ControlToValidate="ddlPaymentRuleList"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" InitialValue="0"
                                                                    ErrorMessage="Select a Payment rule from the list" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label class="tess">
                                                                <asp:Label ID="lblPaymentRuleList" runat="server" CssClass="styleReqFieldLabel" Text="Payment Rule"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <br />
                                                        <div class="md-input">

                                                            <%--<asp:Button ID="btnFetchPayment" runat="server" AccessKey="H" ToolTip="Fetch Payment Rule Details[Alt+H]" class="css_btn_enabled"
                                                                OnClick="btnFetchPayment_Click" Text="Go" Style="display: block" OnClientClick="return FunddlRoiOnChange('Payment')" />--%>

                                                            <div class="md-input">
                                                                <button class="css_btn_enabled" id="btnFetchPayment" title="Go [Alt+H]" onclick="if(FunddlRoiOnChange('Payment'))" onserverclick="btnFetchPayment_Click" causesvalidation="false" runat="server"
                                                                    type="button" accesskey="H">
                                                                    <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u></u>Go
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>




                                                <div id="div7" style="overflow: visible; width: 100%" runat="server">
                                                    <asp:Panel runat="server" ID="pnlROIRule" ScrollBars="Auto" CssClass="stylePanel" GroupingText="ROI Rule"
                                                        Width="99%">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txt_ROI_Rule_Number" ToolTip="ROI Rule Number" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="True"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblROI_Rule_Number" runat="server" CssClass="styleDisplayLabel" Text="ROI Rule Number"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddl_Rate_Type" ToolTip="Rate Type" class="md-form-control form-control login_form_content_input requires_true" runat="server">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblRate_Type" runat="server" CssClass="styleDisplayLabel" Text="Rate Type"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txt_Model_Description" Enabled="false" ToolTip="Model Description" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblModel_Description" runat="server" CssClass="styleDisplayLabel"
                                                                            Text="Model Description"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddl_Return_Pattern" ToolTip="Return Pattern" class="md-form-control form-control" runat="server">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblReturn_Pattern" runat="server" CssClass="styleDisplayLabel" Text="Return Pattern"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div id="divddl_Time_Value" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddl_Time_Value" class="md-form-control form-control" ToolTip="Time" runat="server" onchange="FunRestIrr();"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddl_Time_Value_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <%-- <asp:RequiredFieldValidator ID="rfvTimeValue" runat="server" ControlToValidate="ddl_Time_Value"
                                                                        CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a time Value from the list"
                                                                        InitialValue="0" SetFocusOnError="True" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>--%>

                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvTimeValue" runat="server" ControlToValidate="ddl_Time_Value"
                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select a time Value from the list"
                                                                            InitialValue="0" SetFocusOnError="True" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>
                                                                    </div>

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>

                                                                    <label>
                                                                        <asp:Label ID="lblTime_Value" runat="server" CssClass="styleDisplayLabel" Text="Time"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div id="divddl_Frequency" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddl_Frequency" class="md-form-control form-control" ToolTip="Frequency" runat="server" onchange="FunRestIrr();">
                                                                    </asp:DropDownList>
                                                                    <%--<asp:RequiredFieldValidator ID="rfvFrequency" runat="server" ControlToValidate="ddl_Frequency"
                                                                        CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a frequency from the list"
                                                                        InitialValue="0" SetFocusOnError="True" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>--%>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvFrequency" runat="server" ControlToValidate="ddl_Frequency"
                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select a frequency from the list"
                                                                            InitialValue="0" SetFocusOnError="True" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>

                                                                    <label>
                                                                        <asp:Label ID="Label2" runat="server" CssClass="styleDisplayLabel" Text="Frequency"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div id="divddl_Repayment_Mode" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddl_Repayment_Mode" ToolTip="Repayment Mode" class="md-form-control form-control" runat="server">
                                                                    </asp:DropDownList>
                                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddl_Frequency"
                                                                        CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select a frequency from the list"
                                                                        InitialValue="0" SetFocusOnError="True" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>--%>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddl_Frequency"
                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select a frequency from the list"
                                                                            InitialValue="0" SetFocusOnError="True" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>

                                                                        <asp:Label ID="lblRepayment_Mode" runat="server" CssClass="styleDisplayLabel" Text="Repayment Mode"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">

                                                                    <asp:TextBox ID="txtRate" runat="server" ToolTip="Rate" class="md-form-control form-control login_form_content_input requires_true" onchange="funRateZeroCheck();"></asp:TextBox>
                                                                    <asp:HiddenField ID="hdnRate" runat="server" />
                                                                    <%-- <asp:RequiredFieldValidator ID="rfvRate" runat="server" ControlToValidate="txtRate"
                                                                        CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Rate" SetFocusOnError="True"
                                                                        ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>--%>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvRate" runat="server" ControlToValidate="txtRate"
                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Rate" SetFocusOnError="True"
                                                                            ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>

                                                                    <label>
                                                                        <asp:Label ID="lblRate" runat="server" CssClass="styleDisplayLabel" Text="Rate"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div id="divddl_IRR_Rest" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddl_IRR_Rest" runat="server" ToolTip="IRR Rest" class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtRate"
                                                                        CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Rate" SetFocusOnError="True"
                                                                        ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>--%>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" InitialValue="0" ControlToValidate="ddl_IRR_Rest"
                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter IRR Rest" SetFocusOnError="True"
                                                                            ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>

                                                                        <asp:Label ID="lblIRR_Rest" runat="server" CssClass="styleDisplayLabel" Text="IRR Rest"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div id="divtxt_Recovery_Pattern_Year1" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txt_Recovery_Pattern_Year1" Enabled="false" Style="text-align: right" ToolTip="Recovery Pattern Year1" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="flttxt_Recovery_Pattern_Year1" runat="server" TargetControlID="txt_Recovery_Pattern_Year1"
                                                                        FilterType="Numbers,Custom" ValidChars=".">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>

                                                                        <asp:Label ID="lblRecovery_Pattern_Year1" runat="server" CssClass="styleDisplayLabel"
                                                                            Text="Recovery Pattern Year1"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div id="divtxt_Recovery_Pattern_Year2" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txt_Recovery_Pattern_Year2" Style="text-align: right" ToolTip="Recovery Pattern Year2" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>

                                                                        <asp:Label ID="lblRecovery_Pattern_Year2" runat="server" CssClass="styleDisplayLabel"
                                                                            Text="Recovery Pattern Year2"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div id="divtxt_Recovery_Pattern_Year3" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txt_Recovery_Pattern_Year3" Style="text-align: right" ToolTip="Recovery Pattern Year3" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>

                                                                        <asp:Label ID="lblRecovery_Pattern_Year3" runat="server" CssClass="styleDisplayLabel"
                                                                            Text="Recovery Pattern Year3"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div id="divtxt_Recovery_Pattern_Rest" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txt_Recovery_Pattern_Rest" Style="text-align: right" ToolTip="Recovery Pattern Year Rest" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>

                                                                        <asp:Label ID="lblRecovery_Pattern_Rest" runat="server" CssClass="styleDisplayLabel"
                                                                            Text="Recovery Pattern Year Rest"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div id="divddl_Insurance" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddl_Insurance" class="md-form-control form-control" runat="server" ToolTip="Insurance" onchange="FunRestIrr();">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>

                                                                        <asp:Label ID="lblInsurance" runat="server" CssClass="styleDisplayLabel" Text="Insurance"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div id="divddl_Interest_Calculation" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddl_Interest_Calculation" ToolTip="Interest Calculation" class="md-form-control form-control" runat="server">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblInterest_Calculation" runat="server" CssClass="styleDisplayLabel"
                                                                            Text="Interest Calculation"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div id="divddl_Interest_Levy" runat="server" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddl_Interest_Levy" ToolTip="Interest Levy" class="md-form-control form-control" runat="server">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>

                                                                        <asp:Label ID="lblInterest_Levy" runat="server" CssClass="styleDisplayLabel" Text="Interest Levy"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:CheckBox ID="chk_lblResidual_Value" ToolTip="Residual Value" runat="server" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>

                                                                        <asp:Label ID="lblResidual_Value" runat="server" CssClass="styleDisplayLabel" Text="Residual Value"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:CheckBox ID="chk_lblMargin" AutoPostBack="true" OnCheckedChanged="chk_lblMargin_CheckedChanged" ToolTip="Margin" runat="server" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>

                                                                        <asp:Label ID="lblMargin" runat="server" CssClass="styleDisplayLabel" Text="Margin"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txt_Margin_Percentage" Style="text-align: right" runat="server" ToolTip="Margin Percentage" class="md-form-control form-control login_form_content_input requires_true" AutoPostBack="True" onchange="FunRestIrr();"
                                                                        onkeypress="fnAllowNumbersOnly(true,false,this)" OnTextChanged="txt_Margin_Percentage_TextChanged"></asp:TextBox>
                                                                    <%--<asp:RequiredFieldValidator ID="rfvMarginPercent" runat="server" ControlToValidate="txt_Margin_Percentage"
                                                                        CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Margin Percentage"
                                                                        SetFocusOnError="True" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>--%>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvMarginPercent" runat="server" ControlToValidate="txt_Margin_Percentage"
                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Margin Percentage"
                                                                            SetFocusOnError="True" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="Label3" runat="server" CssClass="styleDisplayLabel" Text="Margin Percentage"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>


                                                        </div>

                                                    </asp:Panel>
                                                    <asp:Panel runat="server" ID="pnlPaymentRulehd" ScrollBars="Auto" CssClass="stylePanel" GroupingText="Payment Rule"
                                                        Width="99%">
                                                        <div class="row">

                                                            <asp:Panel runat="server" ID="pnlPaymentRule" ScrollBars="Auto" CssClass="stylePanel" GroupingText=""
                                                                Width="99%" Style="background-color: none !important;">
                                                                <div class="gird">
                                                                    <asp:GridView ID="gvPaymentRuleDetails" class="gird_details" runat="server" Width="100%">
                                                                    </asp:GridView>
                                                                </div>
                                                            </asp:Panel>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                        <cc1:CollapsiblePanelExtender ID="cpeDemo" runat="Server" TargetControlID="divROIRuleInfo"
                                            ExpandControlID="divRoiRules" CollapseControlID="divRoiRules" Collapsed="false"
                                            TextLabelID="lblDetails" ImageControlID="imgDetails" ExpandedText="(Hide Details...)"
                                            CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                                            CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />


                                        <asp:Panel ID="pnlFinanceDetailsFWC" runat="server" GroupingText="Finance Details" CssClass="stylePanel"
                                            Width="99%">
                                            <div class="row" style="padding: 0px !important; vertical-align: central">
                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtDebtPurchaseLimitFWC" onchange="funValidateCumilativeSubLimit();" OnTextChanged="txtDebtPurchaseLimitFWC_TextChanged" ToolTip="Debt Purchase Limit" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" runat="server">
                                                        </asp:TextBox>
                                                        <%-- <asp:RequiredFieldValidator ID="rfvDebtPurchaseLimit" runat="server" ErrorMessage="Select the Debt Purchase Limit"
                                                            SetFocusOnError="true" ControlToValidate="txtDebtPurchaseLimitFWC" InitialValue="0" ValidationGroup="Main Page"
                                                            Display="None"></asp:RequiredFieldValidator>--%>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvDebtPurchaseLimit" runat="server" ErrorMessage="Enter the Debt Purchase Limit"
                                                                SetFocusOnError="true" ControlToValidate="txtDebtPurchaseLimitFWC" ValidationGroup="Offer Terms"
                                                                Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <cc1:FilteredTextBoxExtender ID="flttxtDebtPurchaseLimitFWC" runat="server" TargetControlID="txtDebtPurchaseLimitFWC"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>


                                                        <label>
                                                            <asp:Label ID="lblDebtPurchaseLimit" CssClass="styleReqFieldLabel" runat="server" ToolTip="Debt Purchase Limit" Text="Debt Purchase Limit"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtMarginFWC" onchange="funCalFundingLimit();" ToolTip="Margin" runat="server" class="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtMarginFWC_TextChanged" AutoPostBack="true">
                                                        </asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="rfvMargint" runat="server" ErrorMessage="Enter the Margin"
                                                            SetFocusOnError="true" ControlToValidate="txtMarginFWC" InitialValue="0" ValidationGroup="Main Page"
                                                            Display="None"></asp:RequiredFieldValidator>--%>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvMargint" runat="server" ErrorMessage="Enter the Margin" CssClass="validation_msg_box_sapn"
                                                                SetFocusOnError="true" ControlToValidate="txtMarginFWC" ValidationGroup="Offer Terms"
                                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <cc1:FilteredTextBoxExtender ID="flttxtMarginFWC" runat="server" TargetControlID="txtMarginFWC"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblMarginFWC" CssClass="styleReqFieldLabel" runat="server" ToolTip="Margin" Text="Margin"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtPrePaymentLimitFWC" class="md-form-control form-control login_form_content_input requires_true" onchange="funPrepaymentValidation();" ToolTip="Funding Limit" runat="server" AutoPostBack="false">
                                                        </asp:TextBox>
                                                        <%-- <asp:RequiredFieldValidator ID="rfvtxtPrePaymentLimitFWC" runat="server" ErrorMessage="Enter the Margin"
                                                            SetFocusOnError="true" ControlToValidate="txtPrePaymentLimitFWC" InitialValue="0" ValidationGroup="Main Page"
                                                            Display="None"></asp:RequiredFieldValidator>--%>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtPrePaymentLimitFWC" runat="server" ErrorMessage="Enter the Funding Limit"
                                                                SetFocusOnError="true" ControlToValidate="txtPrePaymentLimitFWC" ValidationGroup="Offer Terms"
                                                                Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <cc1:FilteredTextBoxExtender ID="flttxtPrePaymentLimitFWC" runat="server" TargetControlID="txtPrePaymentLimitFWC"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblPrePaymentLimit" CssClass="styleReqFieldLabel" runat="server" ToolTip="Funding Limit" Text="Funding Limit"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtInvoiceCapValue" ToolTip="Invoice Cap Value" OnTextChanged="txtInvoiceCapValue_TextChanged" onchange="funPrepaymentInvoice();" class="md-form-control form-control login_form_content_input requires_true" runat="server" AutoPostBack="true">
                                                        </asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Select the Debt Purchase Limit"
                                                            SetFocusOnError="true" ControlToValidate="txtDebtPurchaseLimitFWC" InitialValue="0" ValidationGroup="Main Page"
                                                            Display="None"></asp:RequiredFieldValidator>--%>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter the Invoice Cap Value"
                                                                SetFocusOnError="true" ControlToValidate="txtInvoiceCapValue" ValidationGroup="Offer Terms"
                                                                Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <cc1:FilteredTextBoxExtender ID="flttxtInvoiceCapValue" runat="server" TargetControlID="txtInvoiceCapValue"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblInvoiceCapValue" CssClass="styleReqFieldLabel" runat="server" ToolTip="Invoice Cap Value" Text="Invoice Cap Value"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtDiscountRateforLineofCredit" onchange="funCheckRangeLineofCredit();" OnTextChanged="txtDiscountRateforLineofCredit_TextChanged" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Discount Rate for Line of Credit" runat="server" AutoPostBack="true">
                                                        </asp:TextBox>
                                                        <%-- <asp:RequiredFieldValidator ID="rfvDiscountRateforLineofCredit" runat="server" ErrorMessage="Select the Discount Rate for Line of Credit"
                                                            SetFocusOnError="true" ControlToValidate="txtDebtPurchaseLimitFWC" InitialValue="0" ValidationGroup="Main Page"
                                                            Display="None"></asp:RequiredFieldValidator>--%>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvDiscountRateforLineofCredit" runat="server" ErrorMessage="Enter the Discount Rate for Line of Credit"
                                                                SetFocusOnError="true" ControlToValidate="txtDiscountRateforLineofCredit" ValidationGroup="Offer Terms"
                                                                Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <cc1:FilteredTextBoxExtender ID="flttxtDiscountRateforLineofCredit" runat="server" TargetControlID="txtDiscountRateforLineofCredit"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblDiscountRateforLineofCredit" CssClass="styleReqFieldLabel" runat="server" ToolTip="Discount Rate for Line of Credit" Text="Discount Rate for Line of Credit"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtPenalRate" onchange="funCheckRangePenal();" ToolTip="Penal Rate" runat="server" class="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtPenalRate_TextChanged" AutoPostBack="true">
                                                        </asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="rfvPenalRate" runat="server" ErrorMessage="Select the Penal Rate"
                                                            SetFocusOnError="true" ControlToValidate="txtDebtPurchaseLimitFWC" InitialValue="0" ValidationGroup="Main Page"
                                                            Display="None"></asp:RequiredFieldValidator>--%>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvPenalRate" runat="server" ErrorMessage="Enter the Penal Rate"
                                                                SetFocusOnError="true" ControlToValidate="txtPenalRate" ValidationGroup="Offer Terms"
                                                                Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <cc1:FilteredTextBoxExtender ID="flttxtPenalRate" runat="server" TargetControlID="txtPenalRate"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblPenalRate" CssClass="styleReqFieldLabel" runat="server" ToolTip="Penal Rate" Text="Penal Rate"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtCreditPeriodInDays" OnTextChanged="txtCreditPeriodInDays_TextChanged" MaxLength="3" Style="text-align: right" ToolTip="Credit Period In Days" onchange="funCreditPeriodValidation();" runat="server" class="md-form-control form-control login_form_content_input requires_true" AutoPostBack="true">
                                                        </asp:TextBox>


                                                        <cc1:FilteredTextBoxExtender ID="fltCreditPeriodInDays" runat="server" FilterType="Numbers"
                                                            TargetControlID="txtCreditPeriodInDays">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvCreditPeriodInDays" runat="server" ErrorMessage="Enter the Credit Period In Days"
                                                                SetFocusOnError="true" ControlToValidate="txtCreditPeriodInDays" ValidationGroup="Offer Terms"
                                                                Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblCreditPeriodInDays" CssClass="styleReqFieldLabel" runat="server" ToolTip="Credit Period In Days" Text="Credit Period In Days"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtGracePeriodInDays" Style="text-align: right" MaxLength="2" ToolTip="Grace Period In Days" OnTextChanged="txtGracePeriodInDays_TextChanged" runat="server" class="md-form-control form-control login_form_content_input requires_true" AutoPostBack="true">
                                                        </asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="flttxtGracePeriodInDays" runat="server" FilterType="Numbers"
                                                            TargetControlID="txtGracePeriodInDays">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <%--<asp:RequiredFieldValidator ID="rfvGracePeriodInDays" runat="server" ErrorMessage="Select the Grace Period In Days"
                                                            SetFocusOnError="true" ControlToValidate="txtCreditPeriodInDays" InitialValue="0" ValidationGroup="Main Page"
                                                            Display="None"></asp:RequiredFieldValidator>--%>

                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvGracePeriodInDays" runat="server" ErrorMessage="Enter the Grace Period In Days"
                                                                SetFocusOnError="true" ControlToValidate="txtGracePeriodInDays" ValidationGroup="Offer Terms"
                                                                Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblGracePeriodInDays" CssClass="styleReqFieldLabel" runat="server" ToolTip="Grace Period In Days" Text="Grace Period In Days"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtDisbuteGracePeriodInDays" Style="text-align: right" MaxLength="3" ToolTip="Disbute Grace Period In Days" runat="server" class="md-form-control form-control login_form_content_input requires_true" AutoPostBack="true" OnTextChanged="txtDisbuteGracePeriodInDays_TextChanged">
                                                        </asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="fltDisbuteGracePeriodInDays" runat="server" FilterType="Numbers"
                                                            TargetControlID="txtDisbuteGracePeriodInDays">
                                                        </cc1:FilteredTextBoxExtender>

                                                        <%--<asp:RequiredFieldValidator ID="rfvDisbuteGracePeriodInDays" runat="server" ErrorMessage="Select the Disbute Grace Period In Days"
                                                            SetFocusOnError="true" ControlToValidate="txtDisbuteGracePeriodInDays" InitialValue="0" ValidationGroup="Main Page"
                                                            Display="None"></asp:RequiredFieldValidator>--%>
                                                        <%--  <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvDisbuteGracePeriodInDays" runat="server" ErrorMessage="Enter the Disbute Grace Period In Days"
                                                                SetFocusOnError="true" ControlToValidate="txtDisbuteGracePeriodInDays" ValidationGroup="Offer Terms"
                                                                Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>--%>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblDisbuteGracePeriodInDays" CssClass="styleReqFieldLabel" runat="server" ToolTip="Disbute Grace Period In Days" Text="Disbute Grace Period In Days"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtResolutionPeriodinDays" Style="text-align: right" MaxLength="3" ToolTip="Resolution Period in Days" runat="server" class="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtResolutionPeriodinDays_TextChanged" AutoPostBack="true">
                                                        </asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="fltResolutionPeriodinDays" runat="server" FilterType="Numbers"
                                                            TargetControlID="txtResolutionPeriodinDays">
                                                        </cc1:FilteredTextBoxExtender>

                                                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Select the Disbute Grace Period In Days"
                                                            SetFocusOnError="true" ControlToValidate="txtDisbuteGracePeriodInDays" InitialValue="0" ValidationGroup="Main Page"
                                                            Display="None"></asp:RequiredFieldValidator>--%>
                                                        <%--<div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvResolutionPeriodinDays" runat="server" ErrorMessage="Enter the Resolution Period in Days"
                                                                SetFocusOnError="true" ControlToValidate="txtResolutionPeriodinDays" ValidationGroup="Offer Terms"
                                                                Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>--%>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblResolutionPeriodinDays" CssClass="styleReqFieldLabel" runat="server" ToolTip="Resolution Period in Days" Text="Resolution Period in Days"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtRemarksFWC" onkeyup="maxlengthfortxt(500);" OnTextChanged="txtRemarksFWC_TextChanged" ToolTip="Remarks" TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true" runat="server">
                                                        </asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtRemarksFWC" runat="server" ErrorMessage="Enter the Remarks"
                                                                SetFocusOnError="true" ControlToValidate="txtRemarksFWC" ValidationGroup="Offer Terms"
                                                                Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <label>
                                                            <asp:Label ID="lblRemarks" CssClass="styleReqFieldLabel" runat="server" ToolTip="Remarks" Text="Remarks"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>



                                        <asp:Panel ID="pnlChargesFWC" runat="server" HorizontalAlign="Center" ItemStyle-Width="2%" GroupingText="Other Charges" CssClass="stylePanel"
                                            Width="99%">

                                            <div align="right" style="margin-right: 210px" class="row">
                                                <div style="display: none" class="col">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <label>
                                                                    <asp:Label ID="lblTotalChargeAmount" CssClass="styleDisplayLabel" runat="server" ToolTip="Total Charge Amount" Text="Total Charge Amount"></asp:Label>
                                                                </label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtTotalChargeAmount" Style="text-align: right" Enabled="false" ToolTip="Total Charge Amount" class="md-form-control form-control login_form_content_input requires_true" runat="server">
                                                                </asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>


                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:UpdatePanel ID="grid" runat="server">
                                                        <ContentTemplate>
                                                            <div align="center">
                                                                <div class="gird">
                                                                    <asp:GridView ID="gvFACCharges" runat="server" class="gird_details" OnRowEditing="gvFACCharges_RowEditing" OnRowUpdating="gvFACCharges_RowUpdating" OnRowCancelingEdit="gvFACCharges_RowCancelingEdit" AutoGenerateColumns="False" EditRowStyle-CssClass="styleFooterInfo"
                                                                        ShowFooter="True" OnRowDataBound="gvFACCharges_RowDataBound" Width="70%" OnRowDeleting="gvFACCharges_Deleting"
                                                                        DataKeyNames="Sno">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Sl.No." ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Right">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="SerialNoHidden" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                                    <asp:Label ID="lblSerialNo" runat="server" Visible="false" Text='<%# Bind("Sno") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Cash Inflow">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCashInflow" ToolTip="Cash Inflow" runat="server" Text='<%# Bind("Cashinflow") %>'></asp:Label>
                                                                                    <asp:Label ID="lblCashInflow_ID" runat="server" Text='<%# Bind("Cashflow_ID") %>'
                                                                                        Visible="false"></asp:Label>
                                                                                    <asp:Label ID="lblchargetypee" runat="server" Text='<%# Bind("chargetype") %>' Visible="false"></asp:Label>
                                                                                    <asp:Label ID="lblCASHFLOWFLAGID" runat="server" Text='<%# Bind("CASHFLOW_FLAG_ID") %>' Visible="false"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:DropDownList ID="ddlCashInflow" AutoPostBack="true" Width="100%" OnSelectedIndexChanged="ddlCashInflow_SelectedIndexChanged"
                                                                                            runat="server" ToolTip="Cash Inflow" CssClass="md-form-control form-control login_form_content_input">
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="grid_validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvddlCashInflow" runat="server" ControlToValidate="ddlCashInflow"
                                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select Cash in Flow" ValidationGroup="GridFacChargAdd"
                                                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                                                        </div>

                                                                                    </div>
                                                                                </FooterTemplate>

                                                                                <EditItemTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:DropDownList ID="ddlCashInflowE" AutoPostBack="false" Width="100%"
                                                                                            runat="server" ToolTip="Cash Inflow" CssClass="md-form-control form-control login_form_content_input">
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="grid_validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvddlCashInflowE" runat="server" ControlToValidate="ddlCashInflowE"
                                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select Cash in Flow" ValidationGroup="GridFacChargAdd"
                                                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                </EditItemTemplate>

                                                                                <FooterStyle HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Charge Sequence">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblchargetypevalue" ToolTip="Charge Sequence" Text='<%# Bind("ChargeSequence") %>'
                                                                                        runat="server">
                                                                                    </asp:Label>
                                                                                    <asp:Label ID="lblchargeSequenceId" Visible="false" Text='<%# Bind("ChargeSequence_id") %>'
                                                                                        runat="server">
                                                                                    </asp:Label>
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:DropDownList ID="ddlChargeSequence" Width="100%" ToolTip="Charge Sequence" AutoPostBack="true" OnSelectedIndexChanged="ddlChargeType_SelectedIndexChanged"
                                                                                            runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                                            <asp:ListItem Value="0" Text="--Select--" Selected="True"></asp:ListItem>
                                                                                            <asp:ListItem Value="1" Text="Monthly"></asp:ListItem>
                                                                                            <asp:ListItem Value="2" Text="Daily"></asp:ListItem>
                                                                                            <asp:ListItem Value="3" Text="Per Invoice"></asp:ListItem>
                                                                                            <asp:ListItem Value="4" Text="Per Transaction"></asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="grid_validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvddlChargeSequence" runat="server" ControlToValidate="ddlChargeSequence"
                                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Charge Sequence" ValidationGroup="GridFacChargAdd"
                                                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>
                                                                                </FooterTemplate>
                                                                                <EditItemTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:DropDownList ID="ddlChargeSequenceE" Width="100%" ToolTip="Charge Sequence" AutoPostBack="true"
                                                                                            runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                                            <asp:ListItem Value="0" Text="--Select--" Selected="True"></asp:ListItem>
                                                                                            <asp:ListItem Value="1" Text="Monthly"></asp:ListItem>
                                                                                            <asp:ListItem Value="2" Text="Daily"></asp:ListItem>
                                                                                            <asp:ListItem Value="3" Text="Per Invoice"></asp:ListItem>
                                                                                            <asp:ListItem Value="4" Text="Per Transaction"></asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="grid_validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvddlChargeSequenceE" runat="server" ControlToValidate="ddlChargeSequenceE"
                                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Charge Sequence" ValidationGroup="GridFacChargAdd"
                                                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>
                                                                                </EditItemTemplate>

                                                                                <FooterStyle HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Charge Type">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblchargetype" ToolTip="Charge Type" Text='<%# Bind("ChargeType") %> ' runat="server"></asp:Label>
                                                                                    <asp:Label ID="lblchargetypeId" Text='<%# Bind("ChargeType_Id") %> ' Visible="false" runat="server"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:DropDownList ID="ddlChargeType" ToolTip="Charge Type" Width="100%" AutoPostBack="true" OnSelectedIndexChanged="ddlChargeType_SelectedIndexChanged"
                                                                                            runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="grid_validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvddlddlChargeType" runat="server" ControlToValidate="ddlChargeType"
                                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Charge Type" ValidationGroup="GridFacChargAdd"
                                                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>
                                                                                </FooterTemplate>
                                                                                <EditItemTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:DropDownList ID="ddlChargeTypeE" ToolTip="Charge Type" Width="100%" AutoPostBack="true"
                                                                                            runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="grid_validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvddlddlChargeTypeE" runat="server" ControlToValidate="ddlChargeTypeE"
                                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Charge Type" ValidationGroup="GridFacChargAdd"
                                                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>
                                                                                </EditItemTemplate>


                                                                                <FooterStyle HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Charge Amount">
                                                                                <ItemTemplate>
                                                                                    <div style="display: block; text-align: right;">
                                                                                        <asp:Label ID="lblChargeAmount" ToolTip="Charge Amount" Text='<%# Bind("Chargeamount") %> '
                                                                                            runat="server">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtChargeAmount" ToolTip="Charge Amount" Width="100%"
                                                                                            runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                                        </asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="flttxtChargeAmount" runat="server" TargetControlID="txtChargeAmount"
                                                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="grid_validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvtxtChargeAmount" runat="server" ControlToValidate="txtChargeAmount"
                                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Enter the Charge Amount" ValidationGroup="GridFacChargAdd"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>
                                                                                </FooterTemplate>
                                                                                <EditItemTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtChargeAmountE" ToolTip="Charge Amount" Width="100%"
                                                                                            runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                                        </asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="flttxtChargeAmount" runat="server" TargetControlID="txtChargeAmountE"
                                                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="grid_validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvtxtChargeAmountE" runat="server" ControlToValidate="txtChargeAmountE"
                                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Enter the Charge Amount" ValidationGroup="GridFacChargAdd"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>
                                                                                </EditItemTemplate>


                                                                                <FooterStyle HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                                                <ItemTemplate>
                                                                                    <table width="50%">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CssClass="grid_btn" CommandName="Edit" CausesValidation="false"
                                                                                                    ToolTip="Edit">
                                                                                                </asp:LinkButton>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete" AccessKey="4" CssClass="grid_btn_delete"
                                                                                                    OnClientClick="return confirm('Are you sure want to Delete this record?');" ToolTip="Delete [Alt+4]">
                                                                                                </asp:LinkButton>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>



                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:Button ID="btnAdd" runat="server" AccessKey="1" CssClass="grid_btn"
                                                                                            OnClick="btnAddfacChargeGrid_Click" Text="Add" ValidationGroup="GridFacChargAdd" ToolTip="Add[Alt+1]" />
                                                                                    </div>
                                                                                </FooterTemplate>
                                                                                <EditItemTemplate>
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>

                                                                                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CssClass="grid_btn" CommandName="Update"
                                                                                                    ValidationGroup="Footer" ToolTip="Update"></asp:LinkButton>&nbsp;|
                                                   
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CssClass="grid_btn" CommandName="Cancel"
                                                                                                    CausesValidation="false" ToolTip="Cancel"></asp:LinkButton>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>

                                                                                </EditItemTemplate>

                                                                                <FooterStyle HorizontalAlign="Center" Width="10%" />
                                                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <EditRowStyle CssClass="styleFooterInfo" />
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>


                                        </asp:Panel>
                                        <asp:Panel ID="pnlDiscountRateforUtilizationFWC" runat="server" HorizontalAlign="Center" GroupingText="Discount Rate for Utilization" CssClass="stylePanel"
                                            Width="99%">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div align="center">
                                                        <div class="gird">
                                                            <asp:GridView ID="grvDiscountRateforUtilization" runat="server" class="gird_details" AutoGenerateColumns="False"
                                                                ShowFooter="True" OnRowDataBound="grvDiscountRateforUtilization_RowDataBound" OnRowEditing="grvDiscountRateforUtilization_RowEditing" OnRowUpdating="grvDiscountRateforUtilization_RowUpdating"
                                                                OnRowCancelingEdit="grvDiscountRateforUtilization_RowCancelingEdit"
                                                                Width="50%" OnRowDeleting="grvDiscountRateforUtilization_RowDeleting"
                                                                DataKeyNames="Sno">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Sl.No." ItemStyle-Width="1%" ItemStyle-HorizontalAlign="Right">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="SerialNoHidden" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                            <asp:Label ID="lblSerialNo" runat="server" Visible="false" Text='<%# Bind("Sno") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Start Slab">
                                                                        <ItemTemplate>
                                                                            <div style="text-align: right;">
                                                                                <asp:Label ID="lblStartSlab" runat="server" ToolTip="Start Slab" Text='<%# Bind("Start_Slab") %>'></asp:Label>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtStartSlabF" Width="100%"
                                                                                    runat="server" ToolTip="Start Slab" class="md-form-control form-control login_form_content_input">
                                                                                </asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtStartSlabF" runat="server" ControlToValidate="txtStartSlabF"
                                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Start Slab" ValidationGroup="vgDiscountRate"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtStartSlabE" Width="100%"
                                                                                    runat="server" ToolTip="Start Slab" class="md-form-control form-control login_form_content_input">
                                                                                </asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtStartSlabE" runat="server" ControlToValidate="txtStartSlabE"
                                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Start Slab" ValidationGroup="vgDiscountRateE"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </EditItemTemplate>
                                                                        <FooterStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="End Slab">
                                                                        <ItemTemplate>
                                                                            <div style="text-align: right;">
                                                                                <asp:Label ID="lblEndSlab" ToolTip="End Slab" Text='<%# Bind("End_Slab") %>'
                                                                                    runat="server">
                                                                                </asp:Label>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtEndSlabF" Width="100%" ToolTip="End Slab"
                                                                                    runat="server" class="md-form-control form-control login_form_content_input">
                                                                                </asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtEndSlabF" runat="server" ControlToValidate="txtEndSlabF"
                                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Enter the End Slab" ValidationGroup="vgDiscountRate"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <cc1:FilteredTextBoxExtender ID="flttxtEndSlabF" runat="server" TargetControlID="txtEndSlabF"
                                                                                    FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>

                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtEndSlabE" Width="100%" ToolTip="End Slab"
                                                                                    runat="server" class="md-form-control form-control login_form_content_input">
                                                                                </asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtEndSlabE" runat="server" ControlToValidate="txtEndSlabE"
                                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Enter the End Slab" ValidationGroup="vgDiscountRateE"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <cc1:FilteredTextBoxExtender ID="flttxtEndSlabE" runat="server" TargetControlID="txtEndSlabE"
                                                                                    FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </div>
                                                                        </EditItemTemplate>
                                                                        <FooterStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Disc.Rate">
                                                                        <ItemTemplate>
                                                                            <div style="display: block; text-align: right;">
                                                                                <asp:Label ID="lblDiscRate" ToolTip="Disc.Rate" Text='<%# Bind("Discount_Rate") %>' runat="server"></asp:Label>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtDiscRateF" MaxLength="3" ToolTip="Disc.Rate" Width="100%"
                                                                                    runat="server" class="md-form-control form-control login_form_content_input">
                                                                                </asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="flttxtDiscRateF" runat="server" TargetControlID="txtDiscRateF"
                                                                                    FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtDiscRateF" runat="server" ControlToValidate="txtDiscRateF"
                                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Enter the Disc.Rate" ValidationGroup="vgDiscountRate"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtDiscRateE" MaxLength="3" ToolTip="Disc.Rate" Width="100%"
                                                                                    runat="server" class="md-form-control form-control login_form_content_input">
                                                                                </asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="flttxtDiscRateE" runat="server" TargetControlID="txtDiscRateE"
                                                                                    FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtDiscRateE" runat="server" ControlToValidate="txtDiscRateE"
                                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Enter the Disc.Rate" ValidationGroup="vgDiscountRateE"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </EditItemTemplate>

                                                                        <FooterStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <table width="50%">
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CssClass="grid_btn" CommandName="Edit" CausesValidation="false"
                                                                                            ToolTip="Edit">
                                                                                        </asp:LinkButton>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:LinkButton ID="lnkDelete" runat="server" OnClick="lnkDelete_Click" Text="Delete" AccessKey="D" CssClass="grid_btn_delete"
                                                                                            OnClientClick="return confirm('Are you sure want to Delete this record?');" ToolTip="Delete [Alt+D] or [Alt+Shift+D]">
                                                                                        </asp:LinkButton>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:Button ID="btnAdd" runat="server" AccessKey="B" CssClass="grid_btn"
                                                                                    OnClick="btnAddDiscountRate_Click" Text="Add" ValidationGroup="vgDiscountRate" ToolTip="Add[Alt+B]" />
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <table>
                                                                                <tr>
                                                                                    <td>

                                                                                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CssClass="grid_btn" CommandName="Update"
                                                                                            ValidationGroup="vgDiscountRateE" ToolTip="Update"></asp:LinkButton>&nbsp;|
                                                   
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CssClass="grid_btn" CommandName="Cancel"
                                                                                            CausesValidation="false" ToolTip="Cancel"></asp:LinkButton>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>

                                                                        </EditItemTemplate>

                                                                        <FooterStyle HorizontalAlign="Center" Width="10%" />
                                                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <EditRowStyle CssClass="styleFooterInfo" />
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>



                                        <asp:Panel ID="pnlLeaseRepayConfiguration" runat="server" CssClass="stylePanel" GroupingText="Minimum Margin"
                                            Width="99%">
                                            <div class="row">
                                                <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtResidualValue_Cashflow" class="md-form-control form-control login_form_content_input requires_true" runat="server" Style="text-align: right;"
                                                            OnTextChanged="txtResidualValue_Cashflow_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftxtResidualPercentage" runat="server" TargetControlID="txtResidualValue_Cashflow"
                                                            FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <%--<asp:RequiredFieldValidator ID="rfvResidualValue" runat="server" ControlToValidate="txtResidualValue_Cashflow"
                                                            CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Offer Terms" SetFocusOnError="True"
                                                            ErrorMessage="Enter the Residual % or Amount"></asp:RequiredFieldValidator>--%>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvResidualValue" runat="server" ControlToValidate="txtResidualValue_Cashflow"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Offer Terms" SetFocusOnError="True"
                                                                ErrorMessage="Enter the Residual % or Amount"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>

                                                            <asp:Label ID="lblResidualValue_Cashflow" runat="server" CssClass="styleDisplayLabel"
                                                                Text="Residual%"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtResidualAmt_Cashflow" Visible="false" class="md-form-control form-control login_form_content_input requires_true" runat="server" MaxLength="7" Style="text-align: right;"
                                                            OnTextChanged="txtResidualAmt_Cashflow_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FtexResidualAmt_Cashflow" runat="server" TargetControlID="txtResidualAmt_Cashflow"
                                                            FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>

                                                            <asp:Label ID="lblResidualAmt_Cashflow" runat="server" CssClass="styleDisplayLabel"
                                                                Text="Residual Amount"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtMarginMoneyPer_Cashflow" ReadOnly="true" ToolTip="Margin%" class="md-form-control form-control login_form_content_input requires_true" runat="server" Style="text-align: right;"
                                                            OnTextChanged="txt_Margin_Percentage_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftxtMarginPercentage" runat="server" TargetControlID="txtMarginMoneyPer_Cashflow"
                                                            FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>

                                                            <asp:Label ID="lblMarginMoneyPer_Cashflow" runat="server" CssClass="styleDisplayLabel"
                                                                Text="Margin%"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtMarginMoneyAmount_Cashflow" ReadOnly="true" ToolTip="Margin Amount" class="md-form-control form-control login_form_content_input requires_true" runat="server" MaxLength="7" Style="text-align: right;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FtexMarginMoneyAmount_Cashflow" runat="server" TargetControlID="txtMarginMoneyAmount_Cashflow"
                                                            FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>

                                                            <asp:Label ID="lblMarginMoneyAmount_Cashflow" runat="server" CssClass="styleDisplayLabel"
                                                                Text="Margin Amount"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">

                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtFBDate" Visible="false" runat="server" class="md-form-control form-control login_form_content_input requires_true" onchange="FunRestIrr();" MaxLength="2"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftxtFBDate" runat="server" TargetControlID="txtFBDate"
                                                            FilterType="Numbers" Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>

                                                        <%--<asp:RequiredFieldValidator ID="rfvFBDate" runat="server" ControlToValidate="txtFBDate"
                                                            CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Offer Terms" SetFocusOnError="True"
                                                            ErrorMessage="Enter the FB Date"></asp:RequiredFieldValidator>--%>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                        <label>
                                                            <asp:Label ID="lblFBDate" runat="server" CssClass="styleDisplayLabel" Text="FB Day"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <br />
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtTentativeAccDate" Visible="false" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                            AutoPostBack="false"></asp:TextBox>
                                                        <%-- <cc1:CalendarExtender ID="ccTentativeAccDate" runat="server" TargetControlID="txtTentativeAccDate"
                                                        PopupButtonID="txtTentativeAccDate">
                                                    </cc1:CalendarExtender>--%>
                                                        <%--<asp:RequiredFieldValidator ID="rfvTentativeAccDate" runat="server" ControlToValidate="txtTentativeAccDate"
                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Tentative Account Date"
                                                            SetFocusOnError="True" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>--%>
                                                        <%--<div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvTentativeAccDate" runat="server" ControlToValidate="txtTentativeAccDate"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Tentative Account Date"
                                                            SetFocusOnError="True" ValidationGroup="Offer Terms"></asp:RequiredFieldValidator>
                                                    </div>--%>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                        <label class="tess">
                                                            <asp:Label ID="lblTentativeaccDate" runat="server" CssClass="styleDisplayLabel" Text="Tentative Account Date"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                            </div>
                                        </asp:Panel>


                                        <asp:Panel ID="pnlInflow" runat="server" CssClass="stylePanel" GroupingText="Cash Inflow details"
                                            Width="100%">
                                            <div style="overflow: auto; width: 100%;">
                                                <%-- <asp:UpdatePanel ID="upInflow" runat="server">
                                                                        <ContentTemplate>--%>
                                                <div class="gird">
                                                    <asp:GridView ID="gvInflow" runat="server" AutoGenerateColumns="False" class="gird_details" OnRowDeleting="gvInflow_RowDeleting"
                                                        ShowFooter="True" OnRowCreated="gvInflow_RowCreated" OnRowDataBound="gvInflow_RowDataBound1" Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Date" ItemStyle-Width="12%" FooterStyle-Width="12%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDate_GridInflow" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"Date")).ToString(strDateFormat) %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtDate_GridInflow" ToolTip="Date" class="md-form-control form-control login_form_content_input requires_true" runat="server" Width="95%">
                                                                        </asp:TextBox>
                                                                        <cc1:CalendarExtender ID="CalendarExtenderSD_InflowDate" runat="server" Enabled="True"
                                                                            TargetControlID="txtDate_GridInflow" OnClientDateSelectionChanged="checkApplicationDate">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%--<asp:RequiredFieldValidator ID="rfvtxtDate_GridInflow" runat="server" ControlToValidate="txtDate_GridInflow"
                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                    ErrorMessage="Enter the Date in Inflow"></asp:RequiredFieldValidator>--%>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtDate_GridInflow" runat="server" ControlToValidate="txtDate_GridInflow"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                                ErrorMessage="Enter the Date in Inflow"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Cash flow Id" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInflowid" runat="server" Text='<%# Bind("CashInFlowID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Cash flow Description" ItemStyle-Width="25%" FooterStyle-Width="25%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInflowDesc" ToolTip="Cash flow Description" runat="server" Text='<%# Bind("CashInFlow") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:DropDownList ID="ddlInflowDesc" ToolTip="Cash flow Description" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="99%">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%--<asp:RequiredFieldValidator ID="rfvddlInflowDesc" runat="server" ControlToValidate="ddlInflowDesc"
                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                    InitialValue="-1" ErrorMessage="Select a Cash flow Description in Inflow"></asp:RequiredFieldValidator>--%>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvddlInflowDesc" runat="server" ControlToValidate="ddlInflowDesc"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                                InitialValue="-1" ErrorMessage="Select a Cash flow Description in Inflow"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Inflow from" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInflowFrom" ToolTip="Inflow from" runat="server" Text='<%# Bind("InflowFrom") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:DropDownList ID="ddlEntityName_InFlowFrom" ToolTip="Inflow from" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="99%" AutoPostBack="True"
                                                                            OnSelectedIndexChanged="ddlEntityName_InFlowFrom_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%--<asp:RequiredFieldValidator ID="rfvddlEntityName_InFlowFrom" runat="server" ControlToValidate="ddlEntityName_InFlowFrom"
                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                    InitialValue="-1" ErrorMessage="Select a Inflow from"></asp:RequiredFieldValidator>--%>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvddlEntityName_InFlowFrom" runat="server" ControlToValidate="ddlEntityName_InFlowFrom"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                                InitialValue="-1" ErrorMessage="Select a Inflow from Customer/Entity "></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlEntityName_InFlowFrom"
                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                    InitialValue="0" ErrorMessage="Select a Inflow from in Inflow"></asp:RequiredFieldValidator>--%>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlEntityName_InFlowFrom"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                                InitialValue="0" ErrorMessage="Select a Inflow from Customer/Entity"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="In flow from ID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInflowFromId" runat="server" Text='<%# Bind("InflowFromID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Entity ID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEntityID_InFlow" runat="server" Text='<%# Bind("EntityID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Customer Name" ItemStyle-Width="25%" FooterStyle-Width="25%">
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="lblHeading" ToolTip="Customer Name" runat="server" Text="Customer/Entity Name"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEntityName_InFlow" runat="server" Text='<%# Bind("Entity") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <uc:Suggest ID="ddlEntityName_InFlow" runat="server" ToolTip="Customer/Entity Name" ServiceMethod="GetVendors"
                                                                            ErrorMessage="Select a Customer/Entity Name in Inflow" ReadOnly="true"
                                                                            ValidationGroup="Inflow" IsMandatory="true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%--<asp:DropDownList ID="ddlEntityName_InFlow" runat="server" Width="99%">
                                                                                                    </asp:DropDownList>
                                                                                                    <asp:RequiredFieldValidator ID="rfvddlEntityName_InFlow" runat="server" ControlToValidate="ddlEntityName_InFlow"
                                                                                                        CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                                                        InitialValue="0" ErrorMessage="Select a Customer/Entity name in Inflow"></asp:RequiredFieldValidator>--%>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Amount" ItemStyle-Width="11%" FooterStyle-Width="11%"
                                                                ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAmount_Inflow" ToolTip="Amount" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtAmount_Inflow" ToolTip="Amount" class="md-form-control form-control login_form_content_input requires_true" runat="server" MaxLength="10" Style="text-align: right">
                                                                        </asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftextExtxtAmount_Inflow" runat="server" FilterType="Numbers"
                                                                            TargetControlID="txtAmount_Inflow">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%-- <asp:RequiredFieldValidator ID="rfvtxtAmount_Inflow" runat="server" ControlToValidate="txtAmount_Inflow"
                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                    ErrorMessage="Enter the Amount in Inflow"></asp:RequiredFieldValidator>--%>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtAmount_Inflow" runat="server" ControlToValidate="txtAmount_Inflow"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Inflow" SetFocusOnError="True"
                                                                                ErrorMessage="Enter the Amount in Inflow"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <ItemStyle HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                                                ItemStyle-Width="7%" FooterStyle-Width="7%">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnRemove" runat="server" AccessKey="5" ToolTip="Remove[Alt+5]" OnClientClick="return confirm('Are you sure want to delete this record?');" CssClass="grid_btn_delete" CausesValidation="false" CommandName="Delete"
                                                                        Text="Remove"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">

                                                                        <asp:Button ID="btnAdd" runat="server" Text="Add" ToolTip="Add Inflow[Alt+J]" AccessKey="J" CausesValidation="true" ValidationGroup="Inflow"
                                                                            OnClick="btnAddInflow_OnClick" CssClass="grid_btn" />



                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>

                                                                    </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <%-- Columns to be added for IRR Calculation--%>
                                                            <asp:TemplateField Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAccountingIRR" runat="server" Text='<%# Bind("Accounting_IRR") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBusinessIRR" runat="server" Text='<%# Bind("Business_IRR") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblComapnyIRR" runat="server" Text='<%# Bind("Company_IRR") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCashFlow_Flag_ID" runat="server" Text='<%# Bind("CashFlow_Flag_ID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%-- Columns to be added for IRR Calculation Ends--%>
                                                        </Columns>
                                                    </asp:GridView>

                                                    <%--  </ContentTemplate>
                                          </asp:UpdatePanel>--%>
                                                </div>
                                            </div>
                                        </asp:Panel>

                                        <asp:Panel runat="server" ID="pnlOutflow" ScrollBars="Auto" CssClass="stylePanel" GroupingText="Payment Details"
                                            Width="100%">
                                            <div style="overflow: auto; width: 100%;">
                                                <div class="gird">
                                                    <asp:GridView ID="gvOutFlow" runat="server" AutoGenerateColumns="False" class="gird_details" OnRowDeleting="gvOutFlow_RowDeleting"
                                                        ShowFooter="True" OnRowCreated="gvOutFlow_RowCreated" OnRowDataBound="gvOutFlow_RowDataBound" Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Date" ItemStyle-Width="12%" FooterStyle-Width="12%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDate_GridOutflow" ToolTip="Date" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"Date")).ToString(strDateFormat) %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtDate_GridOutflow" ToolTip="Date" class="md-form-control form-control login_form_content_input requires_true" runat="server">
                                                                        </asp:TextBox>
                                                                        <cc1:CalendarExtender ID="CalendarExtenderSD_OutflowDate" runat="server" Enabled="True"
                                                                            TargetControlID="txtDate_GridOutflow" OnClientDateSelectionChanged="checkApplicationDate_outflow">
                                                                        </cc1:CalendarExtender>
                                                                        <%--<asp:RequiredFieldValidator ID="rfvtxtDate_GridOutflow" runat="server" ControlToValidate="txtDate_GridOutflow"
                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Outflow" SetFocusOnError="True"
                                                                    ErrorMessage="Enter the Date in Outflow"></asp:RequiredFieldValidator>--%>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtDate_GridOutflow" runat="server" ControlToValidate="txtDate_GridOutflow"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Outflow" SetFocusOnError="True"
                                                                                ErrorMessage="Enter the Date in Outflow"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Cash flow Id" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblOutflowid" runat="server" Text='<%# Bind("CashOutFlowID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Cash flow Description" ItemStyle-Width="25%" FooterStyle-Width="25%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblOutflowDesc" ToolTip="Cash flow Description" runat="server" Text='<%# Bind("CashOutFlow") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:DropDownList ID="ddlOutflowDesc" ToolTip="Cash flow Description" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="99%">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%--<asp:RequiredFieldValidator ID="rfvddlOutflowDesc" runat="server" ControlToValidate="ddlOutflowDesc"
                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Outflow" SetFocusOnError="True"
                                                                    InitialValue="-1" ErrorMessage="Select a Cash flow Description in Outflow"></asp:RequiredFieldValidator>--%>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvddlOutflowDesc" runat="server" ControlToValidate="ddlOutflowDesc"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Outflow" SetFocusOnError="True"
                                                                                InitialValue="-1" ErrorMessage="Select a Cash flow Description in Outflow"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Payement to ID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPayementToId" runat="server" Text='<%# Bind("OutflowFromID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Payment to" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPaymentto" ToolTip="Payment to" runat="server" Text='<%# Bind("OutflowFrom") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:DropDownList ID="ddlPaymentto_OutFlow" ToolTip="Payment to" CssClass="md-form-control form-control login_form_content_input" runat="server" Width="99%" AutoPostBack="True"
                                                                            OnSelectedIndexChanged="ddlPaymentto_OutFlow_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%--<asp:RequiredFieldValidator ID="rfvddlPaymentto_OutFlow" runat="server" ControlToValidate="ddlPaymentto_OutFlow"
                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Outflow" SetFocusOnError="True"
                                                                    InitialValue="-1" ErrorMessage="Select Payment to in Outflow"></asp:RequiredFieldValidator>--%>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvddlPaymentto_OutFlow" runat="server" ControlToValidate="ddlPaymentto_OutFlow"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Outflow" SetFocusOnError="True"
                                                                                InitialValue="-1" ErrorMessage="Select Payment to in Outflow"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Entity ID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEntityID_OutFlow" runat="server" Text='<%# Bind("EntityID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Entity Name" ItemStyle-Width="25%" FooterStyle-Width="25%">
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="lblHeading" ToolTip="Entity Name" runat="server" Text="Customer/Entity Name"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEntityName_OutFlow" runat="server" Text='<%# Bind("Entity") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <uc:Suggest ID="ddlEntityName_OutFlow" ToolTip="Customer/Entity Name" runat="server" ServiceMethod="GetVendors"
                                                                            ErrorMessage="Select a Customer/Entity Name in Outflow" ReadOnly="true"
                                                                            ValidationGroup="Outflow" IsMandatory="true" />
                                                                        <%-- <asp:DropDownList ID="ddlEntityName_OutFlow" runat="server" Width="99%">
                                                                                            </asp:DropDownList>
                                                                                            <asp:RequiredFieldValidator ID="rfvddlEntityName_OutFlow" runat="server" ControlToValidate="ddlEntityName_OutFlow"
                                                                                                CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Outflow" SetFocusOnError="True"
                                                                                                InitialValue="0" ErrorMessage="Select a Customer/Entity Name in Outflow"></asp:RequiredFieldValidator>--%>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Amount" ItemStyle-Width="11%" FooterStyle-Width="11%"
                                                                ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAmount_Outflow" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtAmount_Outflow" ToolTip="Amount" class="md-form-control form-control login_form_content_input requires_true" Width="95%" runat="server" MaxLength="10" Style="text-align: right">
                                                                        </asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftextExtxtAmount_Outflow" runat="server" FilterType="Numbers,Custom"
                                                                            TargetControlID="txtAmount_Outflow" ValidChars=".">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <%--<asp:RequiredFieldValidator ID="rfvtxtAmount_Outflow" runat="server" ControlToValidate="txtAmount_Outflow"
                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Outflow" SetFocusOnError="True"
                                                                    ErrorMessage="Enter the Amount in Outflow"></asp:RequiredFieldValidator>--%>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtAmount_Outflow" runat="server" ControlToValidate="txtAmount_Outflow"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Outflow" SetFocusOnError="True"
                                                                                ErrorMessage="Enter the Amount in Outflow"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <ItemStyle HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="7%" FooterStyle-Width="7%" FooterStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnRemove" runat="server" AccessKey="K" ToolTip="Remove [Alt+K]" OnClientClick="return confirm('Are you sure want to delete this record?');" CausesValidation="false" CssClass="grid_btn_delete" CommandName="Delete"
                                                                        Text="Remove"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">


                                                                        <asp:Button ID="btnAddOut" runat="server" Text="Add" CausesValidation="true" AccessKey="B" ToolTip="Add Outflow [Alt+B]" ValidationGroup="Outflow"
                                                                            OnClick="btnAddOutflow_OnClick" CssClass="grid_btn" />




                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <%-- Columns to be added for IRR Calculation--%>
                                                            <asp:TemplateField Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAccountingIRR" runat="server" Text='<%# Bind("Accounting_IRR") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBusinessIRR" runat="server" Text='<%# Bind("Business_IRR") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblComapnyIRR" runat="server" Text='<%# Bind("Company_IRR") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCashFlow_Flag_ID" runat="server" Text='<%# Bind("CashFlow_Flag_ID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%-- Columns to be added for IRR Calculation Ends--%>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                            <div id="trTotalOutFlow" runat="server" style="width: 100%" class="row">
                                                <table width="100%">
                                                    <tr align="right">
                                                        <td width="100%">


                                                            <asp:Label ID="lblTotal" runat="server" Text="Contract Amount Approved :"></asp:Label>
                                                            <asp:Label ID="lblTotalOutFlowAmount" ToolTip="Contract Amount Approved" runat="server" Text="0"></asp:Label>
                                                            <asp:HiddenField ID="hdnROIRule" runat="server" />
                                                            <asp:HiddenField ID="hdnPayment" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>

                                            </div>
                                        </asp:Panel>



                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" ID="TabRepayment" CssClass="tabpan" BackColor="Red"
                        Width="90%">
                        <HeaderTemplate>
                            Repayment
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upRepayment" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="pnlRepayment" runat="server">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <asp:Panel ID="Panel11" runat="server" CssClass="stylePanel" GroupingText="Repayment Details"
                                                    Width="99%">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblFrequency_Display" Width="100%" runat="server" CssClass="styleDisplayLabel"
                                                                    Font-Bold="false"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="lblFrequencyData" Style="text-align: right" ToolTip="Tenure" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblTenureTypeDisplay" Text="Tenure Type" runat="server" CssClass="styleDisplayLabel"
                                                                    Font-Bold="false"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtTenureTypeData" Enabled="false" ToolTip="Tenure Type" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label runat="server" ID="lblTotalAmount" CssClass="styleDisplayLabel" Font-Bold="false"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox runat="server" Style="text-align: right" Enabled="false" ToolTip="Total Repayable Amount" class="md-form-control form-control login_form_content_input requires_true" ID="lblTotalAmountData"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblMarginResidual" runat="server" CssClass="styleDisplayLabel" Font-Bold="false"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="lblMarginResidualData" Style="text-align: right" Enabled="false" ToolTip="Rate" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                    </table>

                                                </asp:Panel>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <asp:Panel ID="Panel10" runat="server" CssClass="stylePanel" GroupingText="Repayment Summary"
                                                    Width="99%">
                                                    <div class="gird">
                                                        <asp:GridView ID="gvRepaymentSummary" runat="server" class="gird_details" AutoGenerateColumns="false"
                                                            Width="100%">
                                                            <Columns>
                                                                <asp:BoundField DataField="CashFlow" HeaderText="Cash Flow Description" />
                                                                <asp:BoundField DataField="TotalPeriodInstall" HeaderText="Amount" ItemStyle-HorizontalAlign="Right" />
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>

                                                </asp:Panel>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="panIRR" HorizontalAlign="Left" runat="server" CssClass="stylePanel" GroupingText="IRR Details"
                                                    Width="100%">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtAccountIRR_Repay" ToolTip="Accounting IRR" class="md-form-control form-control login_form_content_input requires_true" runat="server" Style="text-align: right"></asp:TextBox>
                                                                <%-- <asp:RequiredFieldValidator ID="rfvAccountingIRR" runat="server" Display="None" ValidationGroup="Repayment Details"
                                                                    ErrorMessage="Calculate Accounting IRR" ControlToValidate="txtAccountIRR_Repay"
                                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvAccountingIRR" runat="server" ValidationGroup="Repayment Details"
                                                                        ErrorMessage="Calculate Accounting IRR" ControlToValidate="txtAccountIRR_Repay"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblAccountIRR_Repay" CssClass="styleReqFieldLabel"
                                                                        Text="Accounting IRR" Font-Bold="true"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtBusinessIRR_Repay" ToolTip="Business IRR" class="md-form-control form-control login_form_content_input requires_true" runat="server" Style="text-align: right"></asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvBusinessIRR" runat="server"  ValidationGroup="Repayment Details"
                                                                    ErrorMessage="Calculate Business IRR" ControlToValidate="txtBusinessIRR_Repay"
                                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvBusinessIRR" runat="server" ValidationGroup="Repayment Details"
                                                                        ErrorMessage="Calculate Business IRR" ControlToValidate="txtBusinessIRR_Repay"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblBusinessIRR_Repay" CssClass="styleReqFieldLabel"
                                                                        Font-Bold="true" Text="Business IRR"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCompanyIRR_Repay" ToolTip="Company IRR" runat="server" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"
                                                                    ReadOnly="True"></asp:TextBox>
                                                                <%--<asp:RequiredFieldValidator ID="rfvCompanyIRR" runat="server" Display="None" ValidationGroup="Repayment Details"
                                                                    ErrorMessage="Calculate Company IRR" ControlToValidate="txtCompanyIRR_Repay"
                                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCompanyIRR" runat="server" ValidationGroup="Repayment Details"
                                                                        ErrorMessage="Calculate Company IRR" ControlToValidate="txtCompanyIRR_Repay"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblCompanyIRR_Repay" CssClass="styleReqFieldLabel"
                                                                        Font-Bold="true" Text="Company IRR"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>


                                        <div class="row">

                                            <asp:Panel runat="server" ID="Panel2" CssClass="stylePanel" GroupingText="Repayment Details"
                                                Width="99%">
                                                <div class="gird">
                                                    <asp:GridView ID="gvRepaymentDetails" class="gird_details" runat="server" AutoGenerateColumns="False"
                                                        ShowFooter="True" OnRowDeleting="gvRepaymentDetails_RowDeleting" OnRowDataBound="gvRepaymentDetails_RowDataBound"
                                                        OnRowCreated="gvRepaymentDetails_RowCreated" Width="100%">
                                                        <Columns>
                                                            <asp:BoundField DataField="slno" HeaderText="Sl.No" ItemStyle-HorizontalAlign="Center">
                                                                <FooterStyle Width="2%" />
                                                                <ItemStyle HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundField>
                                                            <%-- <asp:TemplateField HeaderText="S.No" HeaderStyle-Width="2%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                    <asp:Label ID="lblSno" Visible="false" runat="server" Text='<%#Eval("slno")%>'></asp:Label>

                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:TemplateField>--%>
                                                            <asp:TemplateField HeaderText="Repayment CashFlow" ItemStyle-Width="23%" FooterStyle-Width="23%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCashFlow" runat="server" Text='<%# Bind("CashFlow") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:DropDownList ID="ddlRepaymentCashFlow_RepayTab" ToolTip="Repayment CashFlow" runat="server" Width="98%" AutoPostBack="true"
                                                                            OnSelectedIndexChanged="ddlRepaymentCashFlow_RepayTab_SelectedIndexChanged"
                                                                            CssClass="md-form-control form-control login_form_content_input">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%--<asp:RequiredFieldValidator ID="rfvddlRepaymentCashFlow_RepayTab" runat="server"
                                                                    ControlToValidate="ddlRepaymentCashFlow_RepayTab" CssClass="styleMandatoryLabel"
                                                                    Display="None" ValidationGroup="TabRepayment1" SetFocusOnError="True" InitialValue="-1"
                                                                    ErrorMessage="Select a Repayment cashflow"></asp:RequiredFieldValidator>--%>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvddlRepaymentCashFlow_RepayTab" runat="server"
                                                                                ControlToValidate="ddlRepaymentCashFlow_RepayTab" CssClass="validation_msg_box_sapn"
                                                                                Display="Dynamic" ValidationGroup="TabRepayment1" SetFocusOnError="True" InitialValue="-1"
                                                                                ErrorMessage="Select a Repayment cashflow"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>

                                                                </FooterTemplate>
                                                                <FooterStyle Width="23%" />
                                                                <ItemStyle Width="23%" />
                                                            </asp:TemplateField>
                                                            <%--<asp:TemplateField HeaderText="Amount" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                <FooterStyle HorizontalAlign="Right" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAmountRepaymentCashFlow_RepayTab" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtAmountRepaymentCashFlow_RepayTab" runat="server" Width="97%"
                                                                        MaxLength="10">
                                                                    </asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="ftextExtxtAmountRepaymentCashFlow_RepayTab" runat="server"
                                                                        FilterType="Numbers" TargetControlID="txtAmountRepaymentCashFlow_RepayTab">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <asp:RequiredFieldValidator ID="rfvtxtAmountRepaymentCashFlow_RepayTab" runat="server"
                                                                        ControlToValidate="txtAmountRepaymentCashFlow_RepayTab" CssClass="styleMandatoryLabel"
                                                                        Display="None" ValidationGroup="TabRepayment1" SetFocusOnError="True" ErrorMessage="Enter the amount"></asp:RequiredFieldValidator>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>--%>
                                                            <asp:TemplateField HeaderText="EMI" ItemStyle-Width="10%" FooterStyle-Width="10%"
                                                                FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                <FooterStyle HorizontalAlign="Right" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPerInstallmentAmount_RepayTab" runat="server" Text='<%# Bind("PerInstall") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtPerInstallmentAmount_RepayTab" ToolTip="Per Installment Amount" runat="server" Width="95%" Style="text-align: right;"
                                                                            MaxLength="10" class="md-form-control form-control login_form_content_input">
                                                                        </asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftextExtxtPerInstallmentAmount_RepayTab" runat="server"
                                                                            FilterType="Custom,Numbers" TargetControlID="txtPerInstallmentAmount_RepayTab" ValidChars=".">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%-- <asp:RequiredFieldValidator ID="rfvtxtPerInstallmentAmount_RepayTab" runat="server"
                                                                    ControlToValidate="txtPerInstallmentAmount_RepayTab" CssClass="styleMandatoryLabel"
                                                                    Display="None" ValidationGroup="TabRepayment1" SetFocusOnError="True" ErrorMessage="Enter the Per installment amount"></asp:RequiredFieldValidator>--%>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtPerInstallmentAmount_RepayTab" runat="server"
                                                                                ControlToValidate="txtPerInstallmentAmount_RepayTab" CssClass="validation_msg_box_sapn"
                                                                                Display="Dynamic" ValidationGroup="TabRepayment1" SetFocusOnError="True" ErrorMessage="Enter the Per installment amount"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false" HeaderText="Breakup Percentage" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                <FooterStyle HorizontalAlign="Right" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBreakup_RepayTab" runat="server" Text='<%# Bind("Breakup") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtBreakup_RepayTab" runat="server" Width="95%" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                            class="md-form-control form-control login_form_content_input">
                                                                        </asp:TextBox>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="From Installment" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                <FooterStyle HorizontalAlign="Right" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFromInstallment_RepayTab" runat="server" Text='<%# Bind("FromInstall") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtFromInstallment_RepayTab" ToolTip="From Installment" runat="server" Width="95%" MaxLength="3"
                                                                            Style="text-align: right" Text="1" class="md-form-control form-control login_form_content_input"><%--ReadOnly="true" --%>
                                                                        </asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftextExtxtFromInstallment_RepayTab" runat="server"
                                                                            FilterType="Numbers" TargetControlID="txtFromInstallment_RepayTab">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtFromInstallment_RepayTab" runat="server" CssClass="validation_msg_box_sapn" ControlToValidate="txtFromInstallment_RepayTab"
                                                                                Display="Dynamic" ValidationGroup="TabRepayment1"
                                                                                SetFocusOnError="True" ErrorMessage="Enter the From installment"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="To Installment" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                <FooterStyle HorizontalAlign="Right" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblToInstallment_RepayTab" runat="server" Text='<%# Bind("ToInstall") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtToInstallment_RepayTab" ToolTip="To Installment" runat="server" Width="95%" MaxLength="3"
                                                                            Style="text-align: right" class="md-form-control form-control login_form_content_input">
                                                                        </asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftextExtxtToInstallment_RepayTab" runat="server"
                                                                            FilterType="Numbers" TargetControlID="txtToInstallment_RepayTab">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%--    <asp:RequiredFieldValidator ID="rfvtxtToInstallment_RepayTab" runat="server" ControlToValidate="txtToInstallment_RepayTab"
                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="TabRepayment1"
                                                                    SetFocusOnError="True" ErrorMessage="Enter the To installment"></asp:RequiredFieldValidator>--%>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtToInstallment_RepayTab" runat="server" ControlToValidate="txtToInstallment_RepayTab"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="TabRepayment1"
                                                                                SetFocusOnError="True" ErrorMessage="Enter the To installment"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:CompareValidator ID="cmpvFromTOInstall" runat="server" ErrorMessage="To installment should be greater than the From installment"
                                                                                ControlToValidate="txtToInstallment_RepayTab" ControlToCompare="txtFromInstallment_RepayTab"
                                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="TabRepayment1" Type="Integer" Operator="GreaterThanEqual"></asp:CompareValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="From Date" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblfromdate_RepayTab" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"FromDate")).ToString(strDateFormat) %> '></asp:Label>
                                                                    <asp:TextBox ID="txRepaymentFromDate" ToolTip="From Date" runat="server" Visible="false" BackColor="Navy"
                                                                        ForeColor="White" Font-Names="calibri" Font-Size="12px" Style="color: White"
                                                                        Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"FromDate")).ToString(strDateFormat) %> '
                                                                        AutoPostBack="True" OnTextChanged="txRepaymentFromDate_TextChanged" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="calext_FromDate" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate"
                                                                        TargetControlID="txRepaymentFromDate">
                                                                    </cc1:CalendarExtender>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtfromdate_RepayTab" ToolTip="From Date" runat="server"
                                                                            class="md-form-control form-control login_form_content_input">
                                                                        </asp:TextBox>
                                                                        <cc1:CalendarExtender ID="CalendarExtenderSD_fromdate_RepayTab" runat="server" Enabled="True"
                                                                            TargetControlID="txtfromdate_RepayTab">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%--  <asp:RequiredFieldValidator ID="rfvtxtfromdate_RepayTab" runat="server" ControlToValidate="txtfromdate_RepayTab"
                                                                        CssClass="styleMandatoryLabel" Display="None" ValidationGroup="TabRepayment1"
                                                                        SetFocusOnError="True" ErrorMessage="Enter the from date"></asp:RequiredFieldValidator>--%>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <FooterStyle Width="10%" />
                                                                <ItemStyle Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="To Date" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTODate_ReapyTab" runat="server" Width="100%" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"ToDate")).ToString(strDateFormat) %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtToDate_RepayTab" ToolTip="To Date" runat="server" Visible="false"
                                                                            class="md-form-control form-control login_form_content_input">
                                                                        </asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <cc1:CalendarExtender ID="CalendarExtenderSD_ToDate_RepayTab" runat="server" Enabled="True"
                                                                            OnClientDateSelectionChanged="checkDate_PrevSystemDate" TargetControlID="txtToDate_RepayTab">
                                                                        </cc1:CalendarExtender>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <FooterStyle Width="10%" />
                                                                <ItemStyle Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Add" ItemStyle-Width="5%" FooterStyle-Width="5%">
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <FooterStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnRemoveRepayment" ToolTip="Remove [Alt+6]" OnClientClick="return confirm('Are you sure want to delete this record?');" AccessKey="6" CausesValidation="false" runat="server" CommandName="Delete"
                                                                        Text="Remove" Visible="false" CssClass="grid_btn_delete"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">

                                                                        <asp:Button ID="btnAddRepayment" runat="server" Text="Add" ToolTip="Add [Alt+W]" AccessKey="W" CssClass="grid_btn"
                                                                            OnClick="btnAddRepayment_OnClick" CausesValidation="false" ValidationGroup="TabRepayment1" OnClientClick="return fnCheckPageValidators('TabRepayment1',false)"></asp:Button>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Repayment CashFlowId" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCashFlowId" runat="server" Text='<%# Bind("CashFlowId") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%-- Columns to be added for IRR Calculation--%>
                                                            <asp:TemplateField Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAccountingIRR" runat="server" Text='<%# Bind("Accounting_IRR") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBusinessIRR" runat="server" Text='<%# Bind("Business_IRR") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblComapnyIRR" runat="server" Text='<%# Bind("Company_IRR") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCashFlow_Flag_ID" runat="server" Text='<%# Bind("CashFlow_Flag_ID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%-- Columns to be added for IRR Calculation--%>
                                                        </Columns>
                                                    </asp:GridView>
                                            </asp:Panel>
                                        </div>
                                        </div>
                                    
                                    
                                    <div align="center" class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div align="right" class="row">
                                                <table width="99.9%">
                                                    <tr align="right">
                                                        <td>
                                                            <%--<asp:Button runat="server" ID="btnCalIRR" Text="Calculate IRR" ToolTip="Calculate IRR [Alt+M]" AccessKey="M" CssClass="save_btn"
                                                                OnClick="btnCalIRR_Click" />--%>
                                                            <div class="md-input">
                                                                <button class="css_btn_enabled" id="btnCalIRR" title="Calculate IRR [Alt+M]" onclick="if(Confirmmsg('Are you sure want to Calculate IRR?'))" onserverclick="btnCalIRR_Click" causesvalidation="false" runat="server"
                                                                    type="button" accesskey="M">
                                                                    <i class="fa fa-calculator" aria-hidden="true"></i>&emsp;<u></u>Calculate IRR 
                                                                </button>
                                                            </div>



                                                            <%--  <asp:Button runat="server" CssClass="save_btn" ID="btnReset" AccessKey="N" ToolTip="Reset [Alt+N]" Text="Reset"
                                                                OnClick="btnReset_Click" OnClientClick="return Confirmmsg('Are you sure want to Reset Repayment Structure?')" />--%>


                                                            <div class="md-input">
                                                                <button class="css_btn_enabled" id="btnReset" title="Reset Structure [Alt+N]" onclick="if(Confirmmsg('Are you sure want to Reset Repayment Structure?'))" onserverclick="btnReset_Click" causesvalidation="false" runat="server"
                                                                    type="button" accesskey="N">
                                                                    <i class="fa fa-calculator" aria-hidden="true"></i>&emsp;<u></u>Reset Structure
                                                                </button>
                                                            </div>



                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>

                                            <input id="hdnCTR" type="hidden" runat="server" />
                                            <input id="hdnPLR" type="hidden" runat="server" />
                                            <input id="hdnRoundOff" type="hidden" runat="server" />


                                        </div>

                                    </div>
                                        <div class="row">
                                            <div class="gird">
                                                <asp:GridView ID="grvRepayStructure" runat="server" OnRowDataBound="grvRepayStructure_RowDataBound" class="gird_details" Width="100%" AutoGenerateColumns="false">
                                                    <Columns>
                                                        <asp:BoundField DataField="InstallmentNo" HeaderText="Installment No" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="Installment_Date" HeaderText="Installment Date" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="From_Date" HeaderText="Start Billing Date" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="To_Date" HeaderText="End Billing Date" ItemStyle-HorizontalAlign="Center" />

                                                        <asp:BoundField DataField="NoofDays" HeaderText="No of days" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="EMI" HeaderText="EMI" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="InstallmentAmount" HeaderText="Installment Amount" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="FinanceCharges" HeaderText="Finance Charges" ItemStyle-HorizontalAlign="Center"
                                                            Visible="true" />
                                                        <asp:BoundField DataField="PrincipalAmount" HeaderText="Principal Amount" ItemStyle-HorizontalAlign="Center"
                                                            Visible="true" />
                                                        <asp:BoundField DataField="INSURANCE_AMT" HeaderText="LIP Customer" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="INSURANCE_PAYABLE" HeaderText="LIP Company" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="Deal_Commission" HeaderText="Deal.Commission" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="Insurance" HeaderText="Insurance" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="Others" HeaderText="Others" ItemStyle-HorizontalAlign="Center" />

                                                        <asp:BoundField DataField="CUS_OW" Visible="false" HeaderText="Cus OW" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="ET_IW" Visible="false" HeaderText="ET IW" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="ET_OW" Visible="false" HeaderText="ET OW" ItemStyle-HorizontalAlign="Center" />
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>

                                        <div class="row">

                                            <asp:Button ID="btnGenerateRepay" CssClass="grid_btn" runat="server" Style="display: none" Text="Button"
                                                CausesValidation="false" OnClick="btnGenerateRepay_Click" />
                                        </div>
                                    </asp:Panel>
                                </ContentTemplate>
                                <%--  <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnCalIRR" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnGenerateRepay" EventName="Click" />
                                            </Triggers>--%>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" ID="TabInvoice" CssClass="tabpan" BackColor="Red" Width="85%">
                        <HeaderTemplate>
                            Guarantee / Invoice Details
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upGuarantor" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel3" runat="server">
                                        <div class="row">
                                            <asp:Panel runat="server" ID="pnlGuarantorFromDMS" Width="100%" CssClass="stylePanel" GroupingText="New Guarantor Details From DMS">
                                                <div id="div3" style="overflow: auto; width: 100%;" runat="server">
                                                    <div class="gird">
                                                        <asp:GridView ID="gvGuarantorFromDMS" runat="server" AutoGenerateColumns="False" ShowFooter="false"
                                                            Width="100%" class="gird_details">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Customer type">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="ddlGuarantortype_GuarantorTab" runat="server" Text='<%# Bind("Guarantor") %>'>
                                                                        </asp:Label>
                                                                        <asp:Label ID="lblstgGuarAutoId" Visible="false" runat="server" Text='<%# Bind("APPLICATION_PROC_GURANTOR_ID") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Nature of Relation">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblNatureofRelation" runat="server" Text='<%# Bind("Nature_of_Relation") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="GuaranteeID" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblGuaranteeID" runat="server" Text='<%# Bind("Code") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Co-App/Guarantor">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="ddlCodeGuarantorTab" Font-Bold="true" ForeColor="Red" OnClick="ddlCode_GuarantorTab_Click" CausesValidation="false" runat="server" Text='<%# Bind("Name") %>'>
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Guarantee Amount"
                                                                    ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtGuaranteeamount_GuarantorTab" runat="server" Text='<%# Bind("Amount") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Charge Sequence">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="ddlChargesequence_GuarantorTab" runat="server" Text='<%# Bind("ChargeSequence") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>

                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlGuarantorHid" runat="server">
                                        <div class="row">
                                            <asp:Panel runat="server" ID="pnlGuarantor" Width="100%" CssClass="stylePanel" GroupingText="Guarantor Details">
                                                <div id="div18" style="overflow: auto; width: 100%;" runat="server">
                                                    <div class="gird">
                                                        <asp:GridView ID="gvGuarantor" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                                                            Width="100%" OnRowDeleting="gvGuarantor_RowDeleting" class="gird_details" OnRowDataBound="gvGuarantor_RowDataBound">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Customer type">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="ddlGuarantortype_GuarantorTab" runat="server" Text='<%# Bind("Guarantor") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlGuarantortype_GuarantorTab" ToolTip="Customer type" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlGuarantortype_SelectedIndexChanged" Width="100%"
                                                                                CssClass="md-form-control form-control login_form_content_input">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <%--<asp:RequiredFieldValidator ID="rfvddlGuarantortype_GuarantorTab" runat="server"
                                                                        ControlToValidate="ddlGuarantortype_GuarantorTab" CssClass="styleMandatoryLabel"
                                                                        ValidationGroup="Guarantor" Display="None" InitialValue="-1" SetFocusOnError="True"
                                                                        ErrorMessage="Select a Guarantor type"></asp:RequiredFieldValidator>--%>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlGuarantortype_GuarantorTab" runat="server"
                                                                                    ControlToValidate="ddlGuarantortype_GuarantorTab" CssClass="validation_msg_box_sapn"
                                                                                    ValidationGroup="Guarantor" Display="Dynamic" InitialValue="-1" SetFocusOnError="True"
                                                                                    ErrorMessage="Select a Guarantor type"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Nature of Relation">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblNatureofRelation" runat="server" Text='<%# Bind("Nature_of_Relation") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlNatureofRelation" ToolTip="Nature of Relation" runat="server" AutoPostBack="true"
                                                                                Width="100%" CssClass="md-form-control form-control login_form_content_input">
                                                                            </asp:DropDownList>
                                                                            <%--<asp:RequiredFieldValidator ID="rfvNatureofRelation" runat="server"
                                                                        ControlToValidate="ddlNatureofRelation" CssClass="styleMandatoryLabel"
                                                                        ValidationGroup="Guarantor" Display="None" InitialValue="-1" SetFocusOnError="True"
                                                                        ErrorMessage="Select Nature of Relation"></asp:RequiredFieldValidator>--%>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>

                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvNatureofRelation" runat="server"
                                                                                    ControlToValidate="ddlNatureofRelation" CssClass="validation_msg_box_sapn"
                                                                                    ValidationGroup="Guarantor" Display="Dynamic" InitialValue="-1" SetFocusOnError="True"
                                                                                    ErrorMessage="Select Nature of Relation"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="GuaranteeID" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblGuaranteeID" runat="server" Text='<%# Bind("Code") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Co-App/Guarantor">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="ddlCode_GuarantorTab" runat="server" Text='<%# Bind("Name") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <UC4:ICM ID="ucCustomerLov" ReadOnly="true" ButtonEnabled="false" ToolTip="Guarantor Name" onblur="fnLoadCustomerg()" class="md-form-control form-control login_form_content_input requires_true" HoverMenuExtenderLeft="true" runat="server" ShowHideAddressImageButton="false" AutoPostBack="false" DispalyContent="Both"
                                                                                        strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" />

                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </td>
                                                                                <td>
                                                                                    <i style="font-size: 6px; color: aliceblue">
                                                                                        <button id="btnCreateCustomerGuarantor" runat="server" onserverclick="btnCreateApplicantGuarantor_Click" causesvalidation="false" title="Create Customer" class="btn_control"><i class="fa fa-plus-square"></i></button>
                                                                                        <asp:HiddenField runat="server" ID="hdnAge" />
                                                                                    </i>
                                                                                </td>
                                                                            </tr>
                                                                        </table>



                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Guarantee Amount"
                                                                    ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtGuaranteeamount_GuarantorTab" runat="server" Text='<%# Bind("Amount") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtGuaranteeamount_GuarantorTab_Footer" ToolTip="Guarantee Amount" runat="server" Style="text-align: right"
                                                                                Width="100%" class="md-form-control form-control login_form_content_input requires_true">
                                                                            </asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="ftxtGuarateeAmount" runat="server" TargetControlID="txtGuaranteeamount_GuarantorTab_Footer"
                                                                                FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                            <%-- <asp:RequiredFieldValidator ID="rfvtxtGuaranteeamount_GuarantorTab" runat="server"
                                                                        ControlToValidate="txtGuaranteeamount_GuarantorTab_Footer" CssClass="styleMandatoryLabel"
                                                                        ValidationGroup="Guarantor" Display="None" SetFocusOnError="True" ErrorMessage="Enter the Guarantee Amount"></asp:RequiredFieldValidator>--%>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvtxtGuaranteeamount_GuarantorTab" runat="server"
                                                                                    ControlToValidate="txtGuaranteeamount_GuarantorTab_Footer" CssClass="validation_msg_box_sapn"
                                                                                    ValidationGroup="Guarantor" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter the Guarantee Amount"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Charge Sequence">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="ddlChargesequence_GuarantorTab" runat="server" Text='<%# Bind("ChargeSequence") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlChargesequence_GuarantorTab" ToolTip="Charge Sequence" runat="server" Width="100%"
                                                                                class="md-form-control form-control login_form_content_input">
                                                                            </asp:DropDownList>
                                                                            <%-- <asp:RequiredFieldValidator ID="rfvddlChargesequence_GuarantorTab" runat="server"
                                                                        ControlToValidate="ddlChargesequence_GuarantorTab" CssClass="styleMandatoryLabel"
                                                                        ValidationGroup="Guarantor" Display="None" InitialValue="-1" SetFocusOnError="True"
                                                                        ErrorMessage="Select a Charge Sequence"></asp:RequiredFieldValidator>--%>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlChargesequence_GuarantorTab" runat="server"
                                                                                    ControlToValidate="ddlChargesequence_GuarantorTab" CssClass="validation_msg_box_sapn"
                                                                                    ValidationGroup="Guarantor" Display="Dynamic" InitialValue="-1" SetFocusOnError="True"
                                                                                    ErrorMessage="Select a Charge Sequence"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="View Customer">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lbtnViewCustomer" ToolTip="View Customer" CausesValidation="false" runat="server" CommandName="Edit"
                                                                            Text="View"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="View Accounts">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lbtnViewAccts" CausesValidation="false" ToolTip="View Accounts" runat="server" CommandName="Accounts"
                                                                            Text="Accounts" OnClick="lbtnViewAccts_OnClick"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField Visible="false" HeaderText="From Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblFromDate" runat="server" Text='<%# Bind("EFFEC_DATE") %>'>
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtFromDate" runat="server" ToolTip="From Date" AutoPostBack="true"
                                                                                Width="120px" CssClass="md-form-control form-control login_form_content_input">
                                                                            </asp:TextBox>
                                                                            <%--<asp:Image ID="imgGuarantee" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                            <cc1:CalendarExtender runat="server" TargetControlID="txtFromDate" PopupButtonID="imgGuarantee" ID="CalGuarantee" Enabled="True">
                                                                            </cc1:CalendarExtender>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvtxtFromDate" runat="server"
                                                                                    ControlToValidate="txtFromDate" CssClass="validation_msg_box_sapn"
                                                                                    ValidationGroup="Guarantor" Display="Dynamic" SetFocusOnError="True"
                                                                                    ErrorMessage="Enter the From Date"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvGuarantee" runat="server"
                                                                                    ControlToValidate="txtFromDate" CssClass="validation_msg_box_sapn"
                                                                                    ValidationGroup="Guarantor" Display="Dynamic" InitialValue="-1" SetFocusOnError="True"
                                                                                    ErrorMessage="Select the Guarantee"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnRemove" CausesValidation="false" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" AccessKey="1" ToolTip="Remove [Alt+1]" CommandName="Delete"
                                                                            Text="Remove" CssClass="grid_btn_delete"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">

                                                                            <asp:Button ID="LbtnAddInvoice" runat="server" AccessKey="A" ToolTip="Add [Alt+A]" CausesValidation="true" OnClick="btnAddGuarantor_OnClick"
                                                                                Text="Add" ValidationGroup="Guarantor" class="grid_btn"></asp:Button>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </asp:Panel>


                                            <asp:Panel runat="server" ID="pnlLienAccount" Width="100%" CssClass="stylePanel" GroupingText="Lien Account">

                                                <div class="row">

                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <div class="md-input">
                                                            <uc:Suggest ID="ddlLienAccount" class="md-form-control form-control" runat="server" ToolTip="Lien Account" ServiceMethod="GetLienAccountNo"
                                                                IsMandatory="false" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label class="tess">
                                                                <asp:Label ID="lblLienAccount" runat="server" Text="Lien Account" ToolTip="Add Lien Account" CssClass="styleDisplayLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                        <%--  <div class="md-input">--%>
                                                        <%-- <i class="fa fa-arrow-circle-right btn_i" aria-hidden="true" style="top: 10px !important; left: 25px"></i>--%>
                                                        <%--  <asp:Button ID="btnLienAccount" runat="server" Text="Add Lien Account" AccessKey="A" ToolTip="Add Deal [Alt+A]" class="css_btn_enabled" OnClick="btnLienAccount_Click" CausesValidation="false" UseSubmitBehavior="false" />--%>
                                                        <%-- </div>--%>

                                                        <div class="md-input">
                                                            <button class="css_btn_enabled" id="btnLienAccount" title="Add Lien Account[Alt+Y]" causesvalidation="false" onserverclick="btnLienAccount_Click" runat="server"
                                                                type="submit" accesskey="Y">
                                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u></u>Add Lien Account
                                                            </button>
                                                        </div>

                                                    </div>

                                                </div>

                                                <div class="row">

                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="gird">
                                                            <asp:GridView runat="server" ID="grvLienAccount" AutoGenerateColumns="False" ShowFooter="false"
                                                                OnRowDataBound="grvLienAccount_RowDataBound" class="gird_details" OnRowDeleting="grvLienAccount_RowDeleting" ToolTip="Lien Account">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="S.No" HeaderStyle-Width="2%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                            <asp:Label ID="lblSno" Visible="false" runat="server" Text='<%#Eval("sno")%>'></asp:Label>

                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Account No" HeaderStyle-Width="16%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblContractNo" runat="server" Text='<%#Eval("Contract_No")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="16%" HorizontalAlign="Left"></ItemStyle>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Finance Amount" HeaderStyle-Width="16%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFinanceAmount" runat="server" Text='<%#Eval("finance_amount")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="16%" HorizontalAlign="Right"></ItemStyle>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Tenor" HeaderStyle-Width="16%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTenure" runat="server" Text='<%#Eval("tenure")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="16%" HorizontalAlign="Center"></ItemStyle>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Schedule B Amount" HeaderStyle-Width="16%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblScheduleB" runat="server" Text='<%#Eval("SCHB")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="16%" HorizontalAlign="Right" />
                                                                        <FooterStyle Width="16%" HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderStyle-Width="16%">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="btnRemoveDaysLien" OnClick="btnRemoveDaysLien_Click" Text="Delete" CssClass="grid_btn_delete" AccessKey="7" ToolTip="Delete [Alt+7]" runat="server"
                                                                                CausesValidation="false" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                                                                        </ItemTemplate>

                                                                        <ItemStyle Width="16%" HorizontalAlign="Center" />
                                                                    </asp:TemplateField>

                                                                </Columns>
                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>

                                            </asp:Panel>

                                            <asp:Panel runat="server" ID="pnlLoanaccts" CssClass="stylePanel" Width="100%" GroupingText="Guarantor Loan Accounts"
                                                Visible="false">
                                                <div id="divAccts" style="overflow: auto; width: 100%; height: 100px;" runat="server">
                                                    <div class="gird">
                                                        <br />

                                                        <asp:GridView ID="grvLoanaccts" runat="server" class="gird_details" AutoGenerateColumns="false"
                                                            Width="100%">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Scheme Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblPrdNm" runat="server" Text='<%#Eval("PRODUCT_NM")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Account No">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAccNum" runat="server" Text='<%#Eval("ACCNUM")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Account Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAccdt" runat="server" Text='<%#Eval("ACCDT")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Tenure">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblTenr" runat="server" Text='<%#Eval("TENR")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Amount Financed">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAmtFincd" runat="server" Text='<%#Eval("AMTFINCD")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Account Status">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAcctStatus" runat="server" Text='<%#Eval("ACCT_STATUS")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>


                                                        <br />
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel runat="server" ID="pnlCollateralDetails" Width="100%" CssClass="stylePanel" Style="display: none" GroupingText="Collateral Details">
                                                <div id="div81" style="overflow: auto; width: 98%; padding-left: 1%;" runat="server">
                                                    <div class="gird">
                                                        <br />
                                                        <asp:GridView ID="gvCollateralDetails" class="gird_details" runat="server" AutoGenerateColumns="false"
                                                            Width="98%" Caption="Collateral reference">
                                                            <Columns>
                                                                <asp:BoundField DataField="ID" HeaderText="ID" />
                                                                <asp:BoundField DataField="Collateralreference" HeaderText="Collateral reference" />
                                                                <asp:BoundField DataField="Description" HeaderText="Description" />
                                                                <asp:BoundField DataField="Collateralvalue" HeaderText="Collateral value" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <br />
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel runat="server" ID="pnlInvoiceDetails" Width="100%" CssClass="stylePanel" GroupingText="Invoice Details">
                                                <div id="div9" style="overflow: auto; width: 98%; padding-left: 1%;" runat="server">
                                                    <div class="gird">
                                                        <br />
                                                        <asp:GridView ID="gvInvoiceDetails" runat="server" class="gird_details" AutoGenerateColumns="false" Width="98%"
                                                            OnRowDataBound="gvInvoiceDetails_RowDataBound">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Invoice Transaction reference" ItemStyle-HorizontalAlign="Right"
                                                                    Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblInvoiceReferNo" runat="server" Text='<%#Bind("Invoice_Id") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="Doc_Invoice_No" HeaderText="Invoice Reference" ItemStyle-Width="15%" />
                                                                <asp:BoundField DataField="Invoice_No" HeaderText="Invoice No" />
                                                                <asp:BoundField DataField="Vendor" HeaderText="Vendor Name" />
                                                                <%-- <asp:TemplateField HeaderText="Invoice Details">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lbtnViewInvoice" CausesValidation="false" runat="server" Text="View"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>--%>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <br />
                                                    </div>
                                                </div>
                                            </asp:Panel>


                                        </div>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" ID="TabAlerts" CssClass="tabpan" Width="80%" BackColor="Red">
                        <HeaderTemplate>
                            Alerts
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upAlert" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="pnlAlert" runat="server">
                                        <div class="row">
                                            <div id="div2" style="overflow: auto; width: 98%; padding-left: 1%;" runat="server">
                                                <div class="gird">
                                                    <br />
                                                    <asp:GridView ID="gvAlert" runat="server" class="gird_details" AutoGenerateColumns="False" ShowFooter="True"
                                                        OnRowDataBound="gvAlert_RowDataBound" OnRowDeleting="gvAlert_RowDeleting" Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="TypeId" Visible="False" ItemStyle-Width="15%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTypeId" runat="server" Text='<%# Bind("TypeId") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="User Type" ItemStyle-Width="25%" FooterStyle-Width="25%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblUserType" runat="server" Text='<%# Bind("User_Type") %>' />
                                                                    <asp:Label ID="lblUserTypeId" Visible="false" runat="server" Text='<%# Bind("User_Type_Id") %>' />
                                                                </ItemTemplate>
                                                                <%-- <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:DropDownList ID="ddlUserType" OnSelectedIndexChanged="ddlUserType_SelectedIndexChanged" ToolTip="User Type" runat="server" Width="100%"
                                                                            CssClass="md-form-control form-control">
                                                                            <asp:ListItem Value="1" Text="Customer" Selected="True"></asp:ListItem>
                                                                            <asp:ListItem Value="2" Text="Employee"></asp:ListItem>
                                                                            <asp:ListItem Value="3" Text="User"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvUserType" runat="server" ControlToValidate="ddlUserType"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Alert"
                                                                                SetFocusOnError="True" ErrorMessage="Select a Type"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>--%>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Type" ItemStyle-Width="25%" FooterStyle-Width="25%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>' />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:DropDownList ID="ddlType_AlertTab" ToolTip="Type" runat="server" Width="100%"
                                                                            CssClass="md-form-control form-control login_form_content_input">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%-- <asp:RequiredFieldValidator ID="rfvAlertType" runat="server" ControlToValidate="ddlType_AlertTab"
                                                                    CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Alert" InitialValue="-1"
                                                                    SetFocusOnError="True" ErrorMessage="Select a Type"></asp:RequiredFieldValidator>--%>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvAlertType" runat="server" ControlToValidate="ddlType_AlertTab"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Alert" InitialValue="-1"
                                                                                SetFocusOnError="True" ErrorMessage="Select a Type"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="User ContactId" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblUserContactid" runat="server" Text='<%# Bind("UserContactId") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="User Contact">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblUserContact" runat="server" Text='<%# Bind("UserContact") %>' />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <uc:Suggest ID="ddlContact_AlertTab" runat="server" ToolTip="User Contact" ServiceMethod="GetSaleAlertUser"
                                                                            ErrorMessage="Select a User Contact" IsMandatory="true" ValidationGroup="Alert" CssClass="md-form-control form-control login_form_content_input" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%--  <asp:DropDownList ID="ddlContact_AlertTab" runat="server" Width="100%">
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator ID="rfvUserContact" runat="server" ControlToValidate="ddlContact_AlertTab"
                                                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ErrorMessage="Select a User Contact"
                                                                                            InitialValue="-1" ValidationGroup="Alert"></asp:RequiredFieldValidator>--%>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="EMail">
                                                                <ItemTemplate>
                                                                    <%--'<%# Bind("EMail") %>'--%>
                                                                    <asp:CheckBox ID="ChkEmail" ToolTip="EMail" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "EMail")))%>' />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <asp:CheckBox ID="ChkEmail" ToolTip="EMail" runat="server"></asp:CheckBox>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <FooterStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="SMS">
                                                                <ItemTemplate>
                                                                    <%--'<%# Bind("SMS") %>'--%>
                                                                    <asp:CheckBox ID="ChkSMS" runat="server" ToolTip="SMS" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "SMS")))%>' />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <asp:CheckBox ID="ChkSMS" ToolTip="SMS" runat="server"></asp:CheckBox>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <FooterStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField FooterStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnRemove" CausesValidation="false" OnClientClick="return confirm('Are you sure want to Remove this record?');" runat="server" AccessKey="8" CommandName="Delete"
                                                                        Text="Remove" ToolTip="Remove [Alt+8]" CssClass="grid_btn_delete"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">

                                                                        <asp:Button ID="btnAddAlert" runat="server" Text="Add" CausesValidation="true" ToolTip="Add [Alt+0]" AccessKey="0" CssClass="grid_btn"
                                                                            OnClick="btnAddAlert_OnClick" ValidationGroup="Alert"></asp:Button>
                                                                    </div>
                                                                </FooterTemplate>
                                                                <FooterStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <br />
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" ID="TabFollowUp" CssClass="tabpan" BackColor="Red" Width="100%">
                        <HeaderTemplate>
                            Follow Up
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upFollowup" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="pnlFollowup" runat="server">
                                        <asp:Panel runat="server" ID="Panel1" CssClass="stylePanel" GroupingText="Followup details"
                                            Width="100%">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtLOB_Followup" ReadOnly="true" ToolTip="Line of Business" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblLOB_Followup" CssClass="styleDisplayLabel" Text="Line of Business"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtBranch_Followup" ReadOnly="true" ToolTip="Branch" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblBranch_Followup" CssClass="styleDisplayLabel" Text="Branch"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtEnquiry_Followup" ReadOnly="true" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblEnquiry_Followup" CssClass="styleDisplayLabel" Text="Enquiry Number"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtEnquiryDate_Followup" ReadOnly="true" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblEnquiryDate_Followup" CssClass="styleDisplayLabel"
                                                                Text="Date"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtCustNameAdd_Followup" ReadOnly="true" runat="server" ToolTip="Prospect Name & Address" class="md-form-control form-control login_form_content_input requires_true" TextMode="MultiLine"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblCustNameAdd_Followup" CssClass="styleDisplayLabel"
                                                                Text="Prospect Name & Address"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtOfferNo_Followup" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblOfferNo_Followup" runat="server" CssClass="styleDisplayLabel" Text="Offer Number"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div style="display: none" class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtApplication_Followup" ToolTip="Application Number" ReadOnly="true" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblApplication_Followup" runat="server" CssClass="styleDisplayLabel"
                                                                Text="Application Number"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                            </div>



                                        </asp:Panel>
                                        <asp:Panel runat="server" ID="Panel7" CssClass="stylePanel" GroupingText="Followup details"
                                            Width="100%">



                                            <div id="DivFollow" runat="server" style="width: 100%; overflow: scroll;">
                                                <div class="gird">
                                                    <br />
                                                    <asp:GridView ID="gvFollowUp" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                                                        OnRowDeleting="gvFollowUp_RowDeleting" class="gird_details" OnRowCreated="gvFollowUp_RowCreated" Width="100%" Style="overflow: scroll">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDate_GridFollowup" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"Date")).ToString(strDateFormat) %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtDate_GridFollowup" ToolTip="Date" runat="server" Width="90px"
                                                                            class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtDate_GridFollowup" ID="CalendarExtenderSD_FollowupDate"
                                                                            Enabled="True" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%--<asp:RequiredFieldValidator ID="rfvtxtDate_GridFollowup" runat="server" ControlToValidate="txtDate_GridFollowup"
                                                                    ValidationGroup="FollowUp" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                    ErrorMessage="Select the Date"></asp:RequiredFieldValidator>--%>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtDate_GridFollowup" runat="server" ControlToValidate="txtDate_GridFollowup"
                                                                                ValidationGroup="FollowUp" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                                ErrorMessage="Select the Date"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="From User" Visible="false" ItemStyle-Width="0%" FooterStyle-Width="0%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblfrom_GridFollowup_ID" runat="server" Text='<% #Bind("FromUserId")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="From User Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblfrom_GridFollowup" runat="server" ToolTip="From User Name" Text='<% #Bind("From")%>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <uc:Suggest ID="ddlfrom_GridFollowup" ToolTip="From User Name" runat="server" Width="180px" ServiceMethod="GetSaleAlertUser"
                                                                            ErrorMessage="Select a From User Name" IsMandatory="true" ValidationGroup="FollowUp" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <%-- <asp:DropDownList ID="ddlfrom_GridFollowup" runat="server">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvFromUser" runat="server" ControlToValidate="ddlfrom_GridFollowup"
                                                                                    InitialValue="-1" ValidationGroup="FollowUp" CssClass="styleMandatoryLabel" Display="None"
                                                                                    SetFocusOnError="True" ErrorMessage="Select a From UserName"></asp:RequiredFieldValidator>--%>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="To User" Visible="false" ItemStyle-Width="0%" FooterStyle-Width="0%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTo_GridFollowupid" runat="server" Text='<%#Bind("ToUserId")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="To User Name" ItemStyle-Width="17%" FooterStyle-Width="17%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTo_GridFollowup" runat="server" Text='<%#Bind("To")%>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <%-- <asp:DropDownList ID="ddlTo_GridFollowup" runat="server">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvToUser" runat="server" ControlToValidate="ddlTo_GridFollowup"
                                                                                    ValidationGroup="FollowUp" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                                    InitialValue="-1" ErrorMessage="Select a To UserName"></asp:RequiredFieldValidator>--%>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <uc:Suggest ID="ddlTo_GridFollowup" runat="server" ToolTip="To UserName" Width="180px" ServiceMethod="GetSaleAlertUser"
                                                                            ErrorMessage="Select a To User Name" IsMandatory="true" ValidationGroup="FollowUp" />
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Action Details">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblActionDetails" runat="server" Text='<%#Bind("Action")%>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtAction_GridFollowup" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Action Details" runat="server" MaxLength="80" TextMode="MultiLine"
                                                                            onkeyup="maxlengthfortxt(80)">
                                                                        </asp:TextBox>
                                                                        <%--<asp:RequiredFieldValidator ID="rfvtxtAction_GridFollowup" runat="server" ControlToValidate="txtAction_GridFollowup"
                                                                    ValidationGroup="FollowUp" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                    ErrorMessage="Enter an Action Details"></asp:RequiredFieldValidator>--%>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtAction_GridFollowup" runat="server" ControlToValidate="txtAction_GridFollowup"
                                                                                ValidationGroup="FollowUp" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                                ErrorMessage="Enter an Action Details"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Action Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblActionDate" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"ActionDate")).ToString(strDateFormat) %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtActionDate_GridFollowup" runat="server" ToolTip="Action Date" Width="90px"
                                                                            class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtActionDate_GridFollowup"
                                                                            ID="CalendarExtenderSD_FollowupActionDate" Enabled="True" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                                                        </cc1:CalendarExtender>
                                                                        <%--<asp:RequiredFieldValidator ID="rfvtxtActionDate_GridFollowup" runat="server" ControlToValidate="txtActionDate_GridFollowup"
                                                                    ValidationGroup="FollowUp" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                    ErrorMessage="Enter an Action Date"></asp:RequiredFieldValidator>--%>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div class="grid_validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtActionDate_GridFollowup" runat="server" ControlToValidate="txtActionDate_GridFollowup"
                                                                                ValidationGroup="FollowUp" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                                ErrorMessage="Enter an Action Date"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Customer Response">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCustomerResponse" runat="server" Text='<%#Bind("CustomerResponse")%>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtCustomerResponse_GridFollowup" ToolTip="Customer Response" runat="server" MaxLength="80"
                                                                            TextMode="MultiLine" onkeyup="maxlengthfortxt(80)" CssClass="md-form-control form-control login_form_content_input">
                                                                        </asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Remarks">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRemarks" runat="server" Text='<%#Bind("Remarks")%>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtRemarks_GridFollowup" runat="server" ToolTip="Remarks" MaxLength="80" TextMode="MultiLine"
                                                                            onkeyup="maxlengthfortxt(80)" class="md-form-control form-control login_form_content_input">
                                                                        </asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnRemove" CausesValidation="false" AccessKey="9" ToolTip="Remove [Alt+9]" runat="server" CommandName="Delete"
                                                                        Text="Remove" CssClass="grid_btn_delete"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">

                                                                        <asp:Button ID="btnAddFollowup" runat="server" Text="Add" AccessKey="A" ToolTip="Add [Alt+A]" CausesValidation="true"
                                                                            class="grid_btn" OnClick="btnAddFollowUp_OnClick" ValidationGroup="FollowUp"></asp:Button>

                                                                        <%--<button class="grid_btn" id="btnAddFollowup" validationgroup="FollowUp" title="Alt+B" accesskey="B" runat="server" onserverclick="btnAddFollowUp_OnClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>--%>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <br />
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlIdAdditionalParameter" runat="server" CssClass="stylePanel" GroupingText="Additional Parameter Informations">
                                            <div class="row">
                                                <div class="gird col-lg-6 col-md-9 col-sm-12 col-xs-12">
                                                    <asp:Panel GroupingText="Additional Parameter Informations" ID="pnlAddiotnalInfo" CssClass="stylePanel" runat="server" ToolTip="Additional Parameter Informations">
                                                        <asp:GridView ID="grvAdditionalInfo" runat="server" AutoGenerateColumns="False"
                                                            OnRowDataBound="grvAdditionalInfo_RowDataBound" class="gird_details">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Parameter Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblParamName" runat="server" Text='<%# Bind("Param_Name") %>'></asp:Label>
                                                                        <asp:Label ID="lblParamType" runat="server" Text='<%# Bind("Param_Type") %>' Visible="false"></asp:Label>
                                                                        <asp:Label ID="lblLookupType" runat="server" Text='<%# Bind("Lookup_Type") %>' Visible="false"></asp:Label>
                                                                        <asp:Label ID="lblParamSize" runat="server" Text='<%# Bind("Param_Size") %>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Values">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtValues" runat="server" Visible="false" class="md-form-control form-control login_form_content_input requires_true" Text='<%# Bind("PARAM_VALUES") %>'></asp:TextBox>
                                                                        <asp:DropDownList ID="ddlValues" runat="server" Visible="false" class="md-form-control form-control"></asp:DropDownList>
                                                                        <asp:Label ID="lblParamValues" Text='<%#Eval("PARAM_VALUES")%>' runat="server" Visible="false"></asp:Label>
                                                                        <cc1:FilteredTextBoxExtender ID="fteValues" runat="server" FilterType="Custom"
                                                                            Enabled="True" TargetControlID="txtValues">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtValues"
                                                                            Format="dd/MM/YYYY" ID="calAddValues" Enabled="True">
                                                                        </cc1:CalendarExtender>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="PARAM_ID" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblPARAM_ID" runat="server" Text='<%# Bind("PARAM_ID") %>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="PARAM_DET_ID" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblPARAM_DET_ID" runat="server" Text='<%# Bind("PARAM_DET_ID") %>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="CONSTANT_TRAN_ID" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCONSTANT_TRAN_ID" runat="server" Text='<%# Bind("CONSTANT_TRAN_ID") %>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" ID="TabMLA_SLA" Visible="false" CssClass="tabpan" BackColor="Red" Width="70%">
                        <HeaderTemplate>
                            Prime Account Details
                        </HeaderTemplate>
                        <ContentTemplate>
                            <div class="row"></div>
                        </ContentTemplate>
                    </cc1:TabPanel>

                    <cc1:TabPanel runat="server" ID="TabAppraisalInfo" CssClass="tabpan" BackColor="Red"
                        Width="65%">
                        <HeaderTemplate>
                            Appraisal Info
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:Panel ID="pnlAppraisalInfo" runat="server">
                                <div id="divAppraisal" runat="server" class="row">
                                    <div class="col-md-12">

                                        <asp:Panel runat="server" ID="pnlApplicanAppraisaltDetails" CssClass="stylePanel" Width="100%" GroupingText="Appraisal Information">
                                            <asp:GridView ID="grvApplicanAppraisalInformation" HorizontalAlign="Center" runat="server" AutoGenerateColumns="false"
                                                Width="100%" ShowFooter="false" OnRowDataBound="grvApplicanAppraisalInformation_RowDataBound"
                                                OnRowCommand="grvApplicanAppraisalInformation_RowCommand" OnRowDeleting="grvApplicanAppraisalInformation_RowDeleting"
                                                OnRowEditing="grvApplicanAppraisalInformation_RowEditing" OnRowCancelingEdit="grvApplicanAppraisalInformation_RowCancelingEdit"
                                                OnRowUpdating="grvApplicanAppraisalInformation_RowUpdating">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>

                                                        </ItemTemplate>
                                                        <HeaderStyle Width="1%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="1%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false" HeaderText="APPRAISAL_INFO_DET_ID">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblVerDetId" runat="server" Text='<%#Eval("APPRAISAL_INFO_DET_ID")%>'>></asp:Label>

                                                        </ItemTemplate>
                                                        <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="5%" HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Description">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAPPRAISALINFOID" Visible="false" runat="server" Text='<%#Eval("APPRAISAL_INFO_ID")%>'>></asp:Label>
                                                            <asp:Label ID="lblAPPRAISALINFONAME" runat="server" Text='<%#Eval("APPRAISAL_INFO_NAME")%>'>></asp:Label>
                                                            <asp:Label ID="lblISGROUP" Visible="false" runat="server" Text='<%#Eval("IS_GROUP")%>'>></asp:Label>
                                                            <asp:Label ID="lblAPPRAISALINFODATATYPE" Visible="false" runat="server" Text='<%#Eval("APPRAISAL_INFO_DATATYPE")%>'>></asp:Label>
                                                            <asp:Label ID="lblisEditable" Visible="false" runat="server" Text='<%#Eval("IS_EDITABLE")%>'>></asp:Label>


                                                        </ItemTemplate>
                                                        <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="5%" HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Value">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="lblVaue" class="md-form-control form-control login_form_content_input requires_true" Width="98%" runat="server" Text='<%#Eval("Appraisal_info_Value")%>'></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fltlblVaue" runat="server" TargetControlID="lblVaue"
                                                                FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Remarks">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtRemarks" onkeyup="maxlengthfortxt(200);" class="md-form-control form-control login_form_content_input requires_true" Width="100%" TextMode="MultiLine" runat="server" Text='<%#Eval("Appraisal_info_Remarks")%>'></asp:TextBox>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>

                                        </asp:Panel>
                                        <asp:Panel runat="server" ID="pnlPromoter" CssClass="stylePanel" Width="100%" GroupingText="Promoter">
                                            <div class="gird">
                                                <asp:GridView ID="grvPropomoter" runat="server" class="gird_details" AutoGenerateColumns="False" EditRowStyle-CssClass="styleFooterInfo"
                                                    ShowFooter="True" OnRowDataBound="grvPropomoter_RowDataBound" OnRowDeleting="grvPropomoter_RowDeleting">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Sl.No." ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="SerialNoHidden" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                <asp:Label ID="lblSerialNo" runat="server" Visible="false" Text='<%# Bind("Sno") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Promoter" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPromoter" runat="server" Text='<%# Bind("PromoterName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:TextBox ID="txtPromoter" ToolTip="Charge Amount" Width="100%"
                                                                        runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <div class="grid_validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtPromoter" runat="server"
                                                                            ControlToValidate="txtPromoter" CssClass="validation_msg_box_sapn"
                                                                            ValidationGroup="gvpromo" Display="Dynamic" SetFocusOnError="True"
                                                                            ErrorMessage="Enter the Promoter Name"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Identification Type" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblIdentificatonType" runat="server" Text='<%# Bind("IdentificatonType") %>'></asp:Label>
                                                                <asp:Label ID="lblIdentificatonTypeId" runat="server" Visible="false" Text='<%# Bind("IdentificatonType_Id") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:DropDownList ID="ddlIdentificationType" ToolTip="Type" runat="server" Width="100%"
                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <div class="grid_validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvddlIdentificationType" runat="server" ControlToValidate="ddlIdentificationType"
                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="-1" ValidationGroup="gvpromo"
                                                                            SetFocusOnError="True" ErrorMessage="Select the Identification Type"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Identification Value" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblIdentifcationValue" runat="server" Text='<%# Bind("IdentificationValue") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:TextBox ID="txtIdenValue" ToolTip="Identification Value" Width="100%"
                                                                        runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <div class="grid_validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvIdentificationValue" runat="server"
                                                                            ControlToValidate="txtIdenValue" CssClass="validation_msg_box_sapn"
                                                                            ValidationGroup="gvpromo" Display="Dynamic" SetFocusOnError="True"
                                                                            ErrorMessage="Select the Identification Value"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnRemove" CausesValidation="false" ToolTip="Remove [Alt+9]" runat="server" CommandName="Delete"
                                                                    Text="Remove" CssClass="grid_btn_delete"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input" style="margin: 0px;">

                                                                    <asp:Button ID="btnAddPromoter" runat="server" Text="Add" AccessKey="A" ToolTip="Add [Alt+A]" CausesValidation="true"
                                                                        class="grid_btn" OnClick="btnAddPromoter_Click" ValidationGroup="gvpromo"></asp:Button>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>

                                        </asp:Panel>

                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" ID="TabRisk" CssClass="tabpan" BackColor="Red"
                        Width="65%">
                        <HeaderTemplate>
                            Risk Rating
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:Panel GroupingText="Stage Status" ID="pnlStageStatus" CssClass="stylePanel" runat="server" ToolTip="Stage Status">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="chkDataEntryStage" Checked="true" AutoPostBack="true" OnCheckedChanged="chkStageStatus_CheckedChanged" Text="Data Entry Stage Completed" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <div class="row">
                                <asp:Panel runat="server" ID="pnlRiskRating" CssClass="stylePanel" HorizontalAlign="Left" Width="99%" GroupingText="Risk Rating">

                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlRiskRating" class="md-form-control form-control" ToolTip="Risk Rating" runat="server">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvddlRiskRating" runat="server" ErrorMessage="Select the Risk Rating"
                                                        SetFocusOnError="true" ControlToValidate="ddlRiskRating" CssClass="validation_msg_box_sapn" InitialValue="0" ValidationGroup="Risk Rating"
                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                                <label class="tess">
                                                    <asp:Label runat="server" ID="lblRiskRating" ToolTip="Risk Rating" CssClass="styleReqFieldLabel" Text="Risk Rating"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtRiskRemarks" ToolTip="Risk Remarks" TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true" onkeyup="maxlengthfortxt(500);" runat="server"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>

                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvtxtRiskRemarks" runat="server" ErrorMessage="Select the Risk Remakrs"
                                                        SetFocusOnError="true" ControlToValidate="txtRiskRemarks" CssClass="validation_msg_box_sapn" ValidationGroup="Risk Rating"
                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>

                                                <label>
                                                    <asp:Label runat="server" ID="lblRiskRemarks" ToolTip="Risk Remarks" CssClass="styleReqFieldLabel" Text="Risk Remarks"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtRiskScore" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Risk Score" onkeyup="maxlengthfortxt(6);" runat="server"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="fltRiskScore" runat="server" FilterType="Numbers"
                                                    TargetControlID="txtRiskScore">
                                                </cc1:FilteredTextBoxExtender>

                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvtxtRiskScore" runat="server" ErrorMessage="Select the Risk Score"
                                                        SetFocusOnError="true" ControlToValidate="txtRiskScore" CssClass="validation_msg_box_sapn" ValidationGroup="Risk Rating"
                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>

                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" ID="lblRiskScore" ToolTip="Risk Score" CssClass="styleReqFieldLabel" Text="Risk Score"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtRiskDocumentNo" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Risk Document No" onkeyup="maxlengthfortxt(15);" runat="server"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvtxtRiskDocumentNo" runat="server" ErrorMessage="Select the Risk Document No"
                                                        SetFocusOnError="true" ControlToValidate="txtRiskDocumentNo" CssClass="validation_msg_box_sapn" ValidationGroup="Risk Rating"
                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>

                                                <label>
                                                    <asp:Label runat="server" ID="lblRiskDocumentNo" ToolTip="Risk Document No" CssClass="styleReqFieldLabel" Text="Risk Document No"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlRiskQualityValue" class="md-form-control form-control" ToolTip="Risk Quality Value" runat="server">
                                                </asp:DropDownList>

                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvddlRiskQualityValue" InitialValue="0" runat="server" ErrorMessage="Select the Risk Quality Value"
                                                        SetFocusOnError="true" ControlToValidate="ddlRiskQualityValue" CssClass="validation_msg_box_sapn" ValidationGroup="Risk Rating"
                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>

                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label runat="server" ID="lblRiskQualityValue" ToolTip="Risk Quality Value" CssClass="styleReqFieldLabel" Text="Risk Quality Value"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtAMLClasification" ToolTip="AML Clasification" onkeyup="maxlengthfortxt(25);" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>

                                                <%--  <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvtxtAMLClasification" runat="server" ErrorMessage="Select the AML Clasification"
                                                        SetFocusOnError="true" ControlToValidate="txtAMLClasification" CssClass="validation_msg_box_sapn" ValidationGroup="Risk Rating"
                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>--%>

                                                <label>
                                                    <asp:Label runat="server" ID="lblAMLCalsification" ToolTip="AML Clasification" CssClass="styleDisplayFieldLabel" Text="AML Clasification"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                    </div>



                                </asp:Panel>

                            </div>



                        </ContentTemplate>
                    </cc1:TabPanel>

                </cc1:TabContainer>
            </div>
            <%--</div>--%>

            <asp:HiddenField ID="hdnIsGuarantor" runat="server" />
        </ContentTemplate>
        <Triggers>
            <%-- <asp:PostBackTrigger ControlID="ddlLOB" />--%>
            <%--<asp:AsyncPostBackTrigger ControlID="ddlLOB" />--%>
        </Triggers>
    </asp:UpdatePanel>
    <input id="hdnBON" type="hidden" value="0" runat="server" />
    <br />


    <%--<div class="btn_height" id="btndiv" runat="server"></div>--%>
    <div align="right" class="fixed_btn_InLine">
        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvprint" visible="true">
            <div class="md-input">
                <asp:DropDownList ID="ddlTemplateType" Enabled="true" runat="server" ToolTip="Template Type"
                    class="md-form-control form-control">
                    <asp:ListItem Text="KYC" Value="1"></asp:ListItem>
                    <asp:ListItem Text="LPO Print" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Welcome Letter" Value="3"></asp:ListItem>
                    <%--<asp:ListItem Text="Overdue Interest Calculation" Value="4"></asp:ListItem>--%>
                </asp:DropDownList>
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>
                    <asp:Label ID="lblTemplateType" runat="server" CssClass="styleReqFieldLabel" Text="Template Type"
                        ToolTip="Template Type"></asp:Label>
                </label>
            </div>
        </div>
        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" causesvalidation="false" onclick="if(fnSaveValidation())" onserverclick="btnSave_OnClick" runat="server"
            type="button" accesskey="S">
            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
        </button>
        <%--onclick="if(fnSaveValidation())" --%>
        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_OnClick" runat="server"
            type="button" accesskey="L">
            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
        </button>
        <button class="css_btn_enabled" id="btnExit" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
            type="button" accesskey="X">
            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
        </button>
        <button class="css_btn_enabled" id="btnApplicationCancel" title="WithDraw Application[Alt+W]" onclick="if(fnConfirmDealCancel())" causesvalidation="false" onserverclick="btnApplicationCancel_Click" runat="server"
            type="button" accesskey="W">
            <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>W</u>ithDraw Application
        </button>
        <button class="css_btn_enabled" id="btnKYCPDFPrint" title="Print the Details[Alt+P]" causesvalidation="false" visible="false" onserverclick="btnKYCPDFPrint_ServerClick" runat="server"
            type="button" accesskey="P">
            <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;<u>P</u>rint
        </button>
    </div>
    <%-- <div id="btndiv" runat="server" align="right" class="row">


        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
           <div class="row" style="float: right; margin-top: 5px;">

                <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnSaveValidation())" causesvalidation="false" onserverclick="btnSave_OnClick" runat="server"
                    type="submit" accesskey="S">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_OnClick" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
                <button class="css_btn_enabled" id="btnExit" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                    type="button" accesskey="X">
                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;E<u>x</u>it
                </button>
                <button class="css_btn_enabled" id="btnApplicationCancel" title="Cancel CheckList[Alt+C]" onclick="if(fnConfirmDealCancel())" causesvalidation="false" onserverclick="btnApplicationCancel_Click" runat="server"
                    type="button" accesskey="W">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u>W</u>ithDraw Application
                </button>
            </div>
        </div>
    </div>--%>


    <%--   <div id="btndiv" runat="server" class="row">

        
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="row" style="float: right; margin-top: 5px;">

                <div class="col-lg-2 col-md-3 col-sm-9 col-xs-12" style="margin-left: 10px;">
                    <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                    <asp:Button ID="btnSave" runat="server" AccessKey="S" Text="Save"
                        OnClick="btnSave_OnClick" CssClass="save_btn fa fa-floppy-o" CausesValidation="true" OnClientClick="return fnSaveValidation()" />
                </div>
                <div class="col-lg-2 col-md-3 col-sm-9 col-xs-12" style="margin-left: 10px;">
                    <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                    <asp:Button ID="btnClear" runat="server" AccessKey="C" CausesValidation="False" CssClass="save_btn fa fa-eraser"
                        UseSubmitBehavior="False" Text="Clear" OnClick="btnClear_OnClick" />
                    <cc1:ConfirmButtonExtender ID="btnClear_ConfirmButtonExtender" runat="server" ConfirmText="Are you sure want to clear?"
                        Enabled="True" TargetControlID="btnClear">
                    </cc1:ConfirmButtonExtender>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-9 col-xs-12" style="margin-left: 10px;">
                    <i class="fa fa-share btn_i" aria-hidden="true"></i>


                    <asp:Button ID="btnCalcel" runat="server" AccessKey="X" CausesValidation="False" CssClass="save_btn fa fa-eraser"
                        UseSubmitBehavior="False" Text="Exit" OnClientClick="fnConfirmExit();" OnClick="btnCancel_Click" />


                </div>
                <div class="col-lg-2 col-md-3 col-sm-9 col-xs-12" style="margin-left: 10px;">
                    <i class="fa fa-share btn_i" aria-hidden="true"></i>
                    <asp:Button ID="btnApplicationCancel" CssClass="save_btn fa fa-eraser" runat="server" CausesValidation="False"
                        Text="Application Cancel" OnClientClick="return Confirmmsg('Are you sure you want to cancel the Application?'); "
                        OnClick="btnApplicationCancel_Click" />
                </div>


            </div>
        </div>
    </div>--%>

    <br />
    <div>
        <asp:ValidationSummary ID="vsApplicationProcessing" runat="server" CssClass="styleMandatoryLabel"
            Width="98%" Enabled="true" ShowMessageBox="false" ValidationGroup="Main Page"
            HeaderText="Correct the following validation(s):  " ShowSummary="true" />
    </div>



    <div>
        <asp:ValidationSummary ID="TabRepayment1" runat="server" CssClass="styleMandatoryLabel"
            Enabled="true" ValidationGroup="TabRepayment1" Width="98%" ShowMessageBox="false"
            HeaderText="Correct the following validation(s):  " ShowSummary="true" />
        <asp:ValidationSummary ID="vsAsset" runat="server" CssClass="styleMandatoryLabel"
            Enabled="true" ValidationGroup="tcAsset" Width="98%" ShowMessageBox="false" HeaderText="Correct the following validation(s):  "
            ShowSummary="true" />
        <asp:ValidationSummary ID="vsInflow" runat="server" CssClass="styleMandatoryLabel"
            Enabled="true" ValidationGroup="Inflow" Width="98%" ShowMessageBox="false" HeaderText="Correct the following validation(s):  "
            ShowSummary="true" />
        <asp:ValidationSummary ID="vsOutflow" runat="server" CssClass="styleMandatoryLabel"
            Enabled="true" ValidationGroup="Outflow" Width="98%" ShowMessageBox="false" HeaderText="Correct the following validation(s):  "
            ShowSummary="true" />
        <asp:ValidationSummary ID="vsRepayment" runat="server" CssClass="styleMandatoryLabel"
            Enabled="true" ValidationGroup="GridRepayment" Width="98%" ShowMessageBox="false"
            HeaderText="Correct the following validation(s):  " ShowSummary="true" />
        <asp:ValidationSummary ID="vsGuarantor" runat="server" CssClass="styleMandatoryLabel"
            Enabled="true" ValidationGroup="Guarantor" Width="98%" ShowMessageBox="false"
            HeaderText="Correct the following validation(s):  " ShowSummary="true" />
        <asp:ValidationSummary ID="vsAlert" runat="server" CssClass="styleMandatoryLabel"
            Enabled="true" ValidationGroup="Alert" Width="98%" ShowMessageBox="false" HeaderText="Correct the following validation(s):  "
            ShowSummary="true" />
        <asp:ValidationSummary ID="vsFollowUp" runat="server" CssClass="styleMandatoryLabel"
            Enabled="true" ValidationGroup="FollowUp" Width="98%" ShowMessageBox="false"
            HeaderText="Correct the following validation(s):  " ShowSummary="true" />
        <asp:ValidationSummary ID="vsMoratorium" runat="server" CssClass="styleMandatoryLabel"
            Enabled="true" ValidationGroup="Moratorium" Width="98%" ShowMessageBox="false"
            HeaderText="Correct the following validation(s):  " ShowSummary="true" />
        <asp:CustomValidator ID="cvApplicationProcessing" runat="server" CssClass="styleMandatoryLabel"
            Enabled="true" Width="98%" />
    </div>


    <asp:HiddenField ID="hdnEnquiryNo" runat="server" />
    <asp:HiddenField ID="Guarantee" runat="server" />



    <script language="javascript" type="text/javascript">
        var tab;
        //var prm = Sys.WebForms.PageRequestManager.getInstance();
        //prm.add_initializeRequest(initializeRequest);
        //prm.add_endRequest(endRequest);
        //var postbackElement;

        //function initializeRequest(sender, args) {
        //    document.body.style.cursor = "wait";
        //    if (prm.get_isInAsyncPostBack()) {
        //        //debugger
        //        args.set_cancel(true);
        //    }
        //}
        //function endRequest(sender, args) {
        //    document.body.style.cursor = "default";

        //}

        var btnActive_index = 0;
        var index = 0;
        function pageLoad() {
            ////debugger;

            tab = $find('ctl00_ContentPlaceHolder1_TabContainerAP');
            var querymode = location.search.split("qsMode=");
            var queryupload = location.search.split("AsyncFileUploadID=");
            if (querymode.length > 1) {
                if (querymode[1].length > 1) {
                    querymode = querymode[1].split("&");
                    querymode = querymode[0];
                }
                else {
                    querymode = querymode[1];
                }
                if (tab != null) {
                    //debugger;
                    //alert('Debug--tab<>1');
                    tab.add_activeTabChanged(on_Change);
                    var newindex = tab.get_activeTabIndex(index);
                    btnActive_index = newindex;
                    var btnSave = document.getElementById('<%=btnSave.ClientID %>')
                    var btnclear = document.getElementById('<%=btnClear.ClientID %>')

                    //if (newindex > 4) {

                    //    btnSave.disabled = false;
                    //    btnSave.className = "css_btn_enabled";

                    //}
                    //else {

                    //    btnSave.className = "css_btn_disabled";
                    //    btnSave.disabled = true;
                    //}
                    debugger;
                    if (querymode == "Q") {
                        btnSave.className = "css_btn_disabled";
                        btnSave.disabled = true;
                    }
                    else {

                        btnSave.disabled = false;
                        btnSave.className = "css_btn_enabled";
                    }
                }
            }
            //ddlDealTransfer_SelectedIndexChanged();
        }
        function SetData(ObJ, data) {
            ////debugger;

            if ((document.getElementById(ObJ).value == "___.__") || (document.getElementById(ObJ).value == "")) {
                document.getElementById(ObJ).value = data;
            }
        }

        function fnAssignBranch(ddlBranchList) {
            var varBranch = ddlBranchList.selectedIndex;
            var txtFollowupBranch = document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabFollowUp_txtBranch_Followup');
            if (txtFollowupBranch != null) {
                txtFollowupBranch.value = ddlBranchList.options[varBranch].innerText;
            }
        }


        function funRateZeroCheck() {
            FunRestIrr();
            var vRate = document.getElementById('<%=txtRate.ClientID %>').value;
            if (parseFloat(vRate) < 0) {
                alert('Rate should be greater than or equal zero');
                document.getElementById('<%=txtRate.ClientID %>').value = "";
                return;
            }
            if (document.getElementById('<%=txtDiscountRateforLineofCredit.ClientID %>') != null) {
                document.getElementById('<%=txtDiscountRateforLineofCredit.ClientID %>').value = "";
            }
            FunRestIrr();
        }


        function FunRestIrr() {
            ////debugger;
            var lobcode = FunGetSelectedLob();

            if (lobcode != "FT" || lobcode != "WC") {

                document.getElementById('<%=txtBusinessIRR_Repay.ClientID %>').value = "";
            }


        }


        function fnValidateEMail(ObJ1, ObJ2) {
            ////debugger;
            var email = document.getElementById(ObJ1).checked;
            var sms = document.getElementById(ObJ2).checked;
            if (email == false && sms == false) {
                alert('Select EMail or SMS');
                return false;
            }
            else
                return true;
        }

        function fnAllowNumbersOnlyZero(isSpaceAllowed, Obj1) {
            ////debugger;

            var sKeyCode = window.event.keyCode;
            var anyval = document.getElementById(Obj1).value;

            //alert(sKeyCode);
            if ((!isSpaceAllowed) && (sKeyCode == 32)) {
                window.event.keyCode = 0;
                return false;
            }
            if ((sKeyCode < 48 || sKeyCode > 57) && (sKeyCode != 32 && sKeyCode != 95) || (sKeyCode == 48)) {
                if (anyval == 0) {
                    window.event.keyCode = 0;
                    return false;
                }
            }
        }


        function funForceControlValidation() {

            if (!fnCheckPageValidators('Main Page', false)) {
                return false;
            }
        }


        function fnMoveNextTab(Source_Invoker) {
            //debugger;
            var hdnQueryModeVal = document.getElementById('<%=hdnQueryMode.ClientID %>').value;
            //alert('Debug--fnMoveNextTab-1');
            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            var Valgrp = document.getElementById('<%=vsApplicationProcessing.ClientID %>')
            if (hdnQueryModeVal != "Q")
                Valgrp.validationGroup = strValgrp;
            var newindex = tab.get_activeTabIndex(index);
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            var btnclear = document.getElementById('<%=btnClear.ClientID %>')

            var lobcode2 = FunGetSelectedLob();

            //alert('Debug--fnMoveNextTab-2');

            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;

            }
            else if (Source_Invoker == 'btnPrevTab') {
                newindex = btnActive_index - 1;
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }





            //var hdnQueryModeVal = document.getElementById('<%=hdnQueryMode.ClientID %>').value;
            if (hdnQueryModeVal != "Q") {
                debugger;
                btnSave.disabled = false;
                btnSave.className = "css_btn_enabled";
            }


            //alert('Debug--fnMoveNextTab-3');

            var txtStatus = document.getElementById('<%=ddlStatus.ClientID %>');
            if (txtStatus != null)//2--Approved,4-Rejected,5-Cancelled
            {
                if (txtStatus.value == '2' || txtStatus.value == '4' || txtStatus == '5') {
                    if (lobcode2.toLowerCase() == "ft") {
                        if (txtStatus.value == '2') {
                            debugger;
                            btnSave.disabled = false;
                            btnSave.className = "css_btn_enabled";
                        }
                    } else {
                        debugger;
                        btnSave.disabled = true;
                        btnSave.className = "css_btn_disabled";

                        if (typeof (btnApplicationCancel) != "undefined") {
                            btnApplicationCancel.disabled = true;
                            btnApplicationCancel.className = "css_btn_disabled";
                        }
                    }
                }
            }


            var varddlLob = document.getElementById('<%=ddlLOB.ClientID %>');




            //alert('Debug--fnMoveNextTab-4');
            var txtMLAFinanceAmount = document.getElementById('<%=txtFinanceAmount.ClientID %>');
            var txtFinanceAmount = document.getElementById('<%=txtFinanceAmount.ClientID %>');
            if (txtMLAFinanceAmount != null && txtFinanceAmount != null) {
                txtMLAFinanceAmount.value = txtFinanceAmount.value;
            }



            if (newindex > index) {
                if (hdnQueryModeVal == "Q") {
                    debugger;
                    btnSave.disabled = true;
                    btnSave.className = "css_btn_disabled";
                    return;
                }
                if (!fnCheckPageValidators(strValgrp, false)) {
                    tab.set_activeTabIndex(index);
                    //alert('Debug--fnMoveNextTab-5');
                }
                else {
                    //alert('Debug--fnMoveNextTab-6');
                    var lobcode = FunGetSelectedLob();
                    var IsAssetAvail;
                    var IsCheckAssetAvail;
                    switch (lobcode.toLowerCase()) {
                        case "te": //Term loan Extensible
                        case "tl": //Term loan
                        case "ft": //Factoring 
                        case "wc": //Working Capital
                            IsAssetAvail = "No";
                            break;
                        default:
                            IsAssetAvail = "Yes";
                            break;
                    }
                    switch (lobcode.toLowerCase()) {
                        case "te": //Term loan Extensible
                        case "tl": //Term loan
                        case "ft": //Factoring 
                        case "wc": //Working Capital
                        case "ln": //Working Capital
                            IsCheckAssetAvail = false;
                            break;
                        default:
                            IsCheckAssetAvail = true;
                            break;
                    }
                    //alert('Debug--fnMoveNextTab-7');
                    //alert(lobcode);
                    //alert(index+'1');
                    var hdnQueryModeVal = document.getElementById('<%=hdnQueryMode.ClientID %>').value;

                    switch (index) {

                        case 0:






                            if (lobcode == "FT") {

                                if (!FunCheckGridIsEmpty('<%=grvCustSubLimit.ClientID %>', 'No')) {
                                    tab.set_activeTabIndex(index);
                                    alert('Atleast one customer needs to be Mapped');
                                    return;

                                }
                                else {

                                }

                            }




                            if (IsAssetAvail == "No") {
                                if (IsCheckAssetAvail) {
                                    if (FunCheckGridIsEmpty('<%=gvAssetDetails.ClientID %>', 'No')) {
                                        index = tab.get_activeTabIndex(index);

                                    }
                                    else {
                                        tab.set_activeTabIndex(index);

                                        alert('Add atleast one asset details');
                                        return;
                                    }
                                }
                                else {
                                    index = tab.get_activeTabIndex(index);
                                }
                            }
                            else {
                                if (IsCheckAssetAvail) {
                                    if (FunCheckGridIsEmpty('<%=gvAssetDetails.ClientID %>', 'No')) {
                                        index = tab.get_activeTabIndex(index);
                                    }
                                    else {

                                        tab.set_activeTabIndex(index);
                                        alert('Add atleast one asset details');
                                        return;

                                    }
                                }
                                else {
                                    index = tab.get_activeTabIndex(index);
                                }
                            }
                            tab.set_activeTabIndex(newindex);
                            btnActive_index = index;
                            break;
                        case 1:
                            //alert('Case1');

                            if (document.getElementById('<%=chk_lblMargin.ClientID %>').checked) {
                                if (document.getElementById('<%=txt_Margin_Percentage.ClientID %>').value == "") {

                                    alert('Margin Percentage Mandatory');
                                    tab.set_activeTabIndex(index);
                                    return;
                                }
                                if (parseFloat(document.getElementById('<%=txt_Margin_Percentage.ClientID %>').value) == 0) {

                                    alert('Margin Percentage should be greater than the Zero');
                                    document.getElementById('<%=txt_Margin_Percentage.ClientID %>').value = "";
                                    tab.set_activeTabIndex(index);
                                    return;
                                }
                            }
                            if (FunCheckGridIsEmpty('<%=gvOutFlow.ClientID %>', 'Yes')) {

                                if (document.getElementById('<%=txtBusinessIRR_Repay.ClientID %>').value == "") {
                                    document.getElementById('<%=btnGenerateRepay.ClientID %>').click();
                                }
                                index = tab.get_activeTabIndex(index);

                            }
                            else {


                                if (lobcode.toLowerCase() != "OL") {

                                    if (lobcode == "FT" || lobcode == "WC") {

                                        index = tab.get_activeTabIndex(index);
                                        return;
                                    }
                                    else {



                                        if (hdnQueryModeVal != "Q") {
                                            alert('Add atleast one Outflow details');
                                            tab.set_activeTabIndex(index);
                                        }
                                        else {
                                            index = tab.get_activeTabIndex(index);
                                        }
                                        return;
                                    }
                                }
                                else {
                                    if (document.getElementById('<%=txtBusinessIRR_Repay.ClientID %>').value == "") {
                                        document.getElementById('<%=btnGenerateRepay.ClientID %>').click();
                                    }
                                    index = tab.get_activeTabIndex(index);
                                }
                            }
                            tab.set_activeTabIndex(newindex);
                            btnActive_index = index;

                            break;
                        case 2:






                            if (FunCheckGridIsEmpty('<%=gvRepaymentSummary.ClientID %>', 'No')) {
                                index = tab.get_activeTabIndex(index);
                            }
                            else {
                                tab.set_activeTabIndex(index);
                                alert('Add atleast one Repayment details');
                                return;
                            }
                            tab.set_activeTabIndex(newindex);
                            btnActive_index = index;
                            break;
                        case 4:
                            index = tab.get_activeTabIndex(index);
                            tab.set_activeTabIndex(newindex);
                            btnActive_index = index;

                            break;
                        case 5:
                            index = tab.get_activeTabIndex(index);
                            tab.set_activeTabIndex(newindex);
                            btnActive_index = index;
                            break;
                        default:
                            index = tab.get_activeTabIndex(index);
                            tab.set_activeTabIndex(newindex);
                            btnActive_index = index;
                            break;

                    }


                }
            }
            else {
                tab.set_activeTabIndex(newindex);
                index = tab.get_activeTabIndex(newindex);





            }
        }


        var index = 0;
        function on_Change(sender, e) {
            fnMoveNextTab('Tab');
        }
        function FunGetSelectedLob() {
            //debugger;
            return document.getElementById('<%=hdnLobCode.ClientID %>').value;

        }
        function FunCheckGridIsEmpty(gridview, isfooterexists) {
            //debugger;
            if (document.getElementById(gridview) == null) {
                return false;
            }
            var table = document.getElementById(gridview);
            var rows = table.getElementsByTagName("tr");

            if (isfooterexists == 'No') {
                if (rows.length > 1) {
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                if (rows.length > 4) {
                    return true;
                }
                else {
                    return false;
                }
            }
        }

        function FunChkAllFooterValues(gridid) {
            //debugger;
            //Get all the control of the type INPUT in the base control.
            var Combos = gridid.getElementsByTagName("select");
            for (var n = 0; n < Combos.length; ++n) {
                if (Combos[n].innerText == "") {
                    return false;
                }
            }
        }
        function FunddlRoiOnChange(varRoiPayment) {
            //debugger;

            var Prevval;
            var Dropdown;
            if (varRoiPayment == 'Payment') {
                Prevval = document.getElementById('<%=hdnPayment.ClientID %>').value;
                Dropdown = document.getElementById('<%=ddlPaymentRuleList.ClientID %>');
            }
            else {

                Prevval = document.getElementById('<%=hdnROIRule.ClientID %>').value;
                Dropdown = document.getElementById('<%=ddlROIRuleList.ClientID %>');
            }
            if (Prevval != "") // IF Change the Existing value
            {
                if (Prevval != Dropdown.value.trim()) {
                    if (confirm('All cashflow related details will be reset. Are you sure want to continue?')) {
                        return true;
                    }
                    else {
                        Dropdown.value = Prevval;
                        return false;
                    }
                }
                else {
                    return false; // If value not changed.
                }
            }
            else // At First Time
            {
                if (Dropdown.value.trim() > 0) {
                    return true;
                }
                else // Without selecting the value
                {
                    return false;
                }
            }
        }
        function fnLoadCustomer() {
            //debugger;
            var VartxtCustomerCode = document.getElementById('<%=txtCustomerCode.ClientID %>').value;
            if (VartxtCustomerCode != null) {
                if (document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_ucCustomerCodeLov_hdnID').value.trim() != "") {
                    document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_btnLoadCustomer').click();
                }
            }
        }
        function fnLoadCustomerg() {
            //debugger;

            document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_btnGuar').click();
        }
        function checkApplicationDate(sender, args) {

            //debugger;
            var varApplicationDate = document.getElementById('<%=txtApplicationDateDate.ClientID %>').value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var today = new Date();
            var varOfferDate = document.getElementById('<%=txtOfferDate.ClientID %>');
            if (varOfferDate != null) {
                var varOfferDateValue = document.getElementById('<%=txtOfferDate.ClientID %>').value;
                if (varOfferDateValue != "") {
                    var varOffdate = Date.parseInvariant(varOfferDateValue, sender._format);
                    if (selectedDate < varOffdate) {
                        alert('InflowDate should be greater than or equal to Offer Date');
                        sender._textbox.set_Value(today.format(sender._format));
                    }
                    else {
                        sender._textbox.set_Value(selectedDate.format(sender._format));

                    }
                }
                else {
                    if (selectedDate < varapplndate) {
                        alert('InflowDate should be greater than or equal to Application Date');
                        sender._textbox.set_Value(today.format(sender._format));
                    }
                    else {
                        sender._textbox.set_Value(selectedDate.format(sender._format));
                    }
                }
            }

        }

        function checkApplicationDate_outflow(sender, args) {
            //debugger;
            var varApplicationDate = document.getElementById('<%=txtApplicationDateDate.ClientID %>').value;
            var dt_app = Date.parseInvariant(varApplicationDate, sender._format);
            //var dt_app = new Date(varApplicationDate);             
            var dd = new Date(sender._selectedDate);
            if (dd < dt_app) {
                alert('OutflowDate should be greater than or equal to Application Date');
                sender._textbox.set_Value('');
            }
            else {
                sender._textbox.set_Value(dd.format(sender._format));
            }
        }





        function uploadComplete(sender, args) {
            //debugger;
            var objID = sender._inputFile.id.split("_");
            objID = "<%= gvPRDDT.ClientID %>" + "_" + objID[5];
            if (document.getElementById(objID + "_myThrobber") != null) {
                document.getElementById(objID + "_myThrobber").innerText = args._fileName;
                document.getElementById(objID + "_hidThrobber").value = args._fileName;
            }
        }

        function fnSaveValidation() {
            var lobcode2 = FunGetSelectedLob();

            if (lobcode2.toLowerCase() == "hp") {
                if (document.getElementById('<%=txtRate.ClientID %>').value != "" && document.getElementById('<%=txtFloorRate.ClientID %>').value != "") {

                    if (parseFloat(document.getElementById('<%=txtRate.ClientID %>').value) < parseFloat(document.getElementById('<%=txtFloorRate.ClientID %>').value)) {
                        alert('Roi Rate should greater than or equal to Floor Rate');
                    }
                }
            }


            if (!fnCheckPageValidators("Main Page", false)) {
                alert("Fill the Mandatory value in Main Tab");
                return false;
            }

            if (!fnCheckPageValidators("Offer Terms", false)) {
                alert("Fill the Mandatory value in Offer Terms Tab");
                return false;
            }

            if (!fnCheckPageValidators("Risk Rating", false)) {
                alert("Fill the Mandatory value in Risk Tab");
                return false;
            }






            if (lobcode2.toLowerCase() == "hp" || lobcode2.toLowerCase() == "tl") {
                Prevval = document.getElementById('<%=hdnPayment.ClientID %>').value;
                Dropdown = document.getElementById('<%=ddlPaymentRuleList.ClientID %>')


                if (Prevval != "") // IF Change the Existing value
                {
                    if (Prevval != Dropdown.value.trim()) {
                        if (confirm('Payment Rule changed check the offer Terms Tab')) {
                            return false;
                        }

                    }

                }
            }


            if (lobcode2.toLowerCase() == "hp" || lobcode2.toLowerCase() == "tl") {

                var PrevvalROI = document.getElementById('<%=hdnROIRule.ClientID %>').value;
                var DropdownROI = document.getElementById('<%=ddlROIRuleList.ClientID %>')



                if (PrevvalROI != "") // IF Change the Existing value
                {
                    if (PrevvalROI != DropdownROI.value.trim()) {
                        if (confirm('ROI Rule changed check the offer Terms Tab')) {
                            return false;
                        }

                    }

                }
            }







            if (confirm('Do you want to save?')) {
                Page_BlockSubmit = false;
                var a = event.srcElement;

                if (a.type == "button") {
                    a.style.display = 'none';
                }
                return true;
            }
            else {
                return false;
            }



            var hdnIsGuarantor = document.getElementById('<%= hdnIsGuarantor.ClientID %>').value;
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            alert('Line2');
            if (!FunCheckGridIsEmpty('<%=gvGuarantor.ClientID %>', 'Yes')) {


                if (confirm('No Guarantor for this Application, Would you like to Continue?')) {
                    var a = event.srcElement;
                    if (a.type == "submit") {
                        a.style.display = 'none';
                    }
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                if (hdnIsGuarantor == "1") {
                    if (confirm('No Guarantor for this Application, Would you like to Continue?')) {
                        var a = event.srcElement;
                        if (a.type == "submit") {
                            a.style.display = 'none';
                        }
                        return true;
                    }
                    else {
                        return false;
                    }
                }
            }
            alert('Line3');
            var lobcode = FunGetSelectedLob();
            if (lobcode.toLowerCase() == "ft") {

                alert(lobcode);
                alert('Line4');

                if (!fnCheckPageValidators("Main Page", false)) {
                    alert('hi');
                    alert("Fill the Mandatory value in Main Tab");
                    tab.set_activeTabIndex(1);
                    //Page_BlockSubmit = true;
                    var a = event.srcElement;
                    //a.style.removeAttribute('display');
                    if (a.type == "submit") {
                        a.style.display = 'block';
                    }
                    return;
                }
                if (!fnCheckPageValidators("Offer Terms", false)) {
                    alert("Fill the Mandatory value Offer Terms tab");
                    tab.set_activeTabIndex(2);
                    //var a = event.srcElement;
                    //a.style.removeAttribute('display');
                    return;
                }
                return true;
            }
            else {
                alert('Line5');



                var Repayment_Mode = document.getElementById('<%=ddl_Repayment_Mode.ClientID %>').value;

                switch (lobcode.toLowerCase()) {
                    case "tl": //Term loan
                        if (Repayment_Mode != "5") {
                            if (!fnCheckPageValidators("Repayment Details", false)) {
                                alert("Fill the Mandatory value in Repayment tab");
                                tab.set_activeTabIndex(2);

                                var a = event.srcElement;
                                //a.style.display = 'block';
                                a.style.removeAttribute('display');

                                return false;
                            }
                        }
                        break;
                    case "ft": //Factoring 
                        if (Repayment_Mode != "5") {
                            if (!fnCheckPageValidators("Repayment Details", false)) {
                                alert("Fill the Mandatory value in Repayment tab");
                                tab.set_activeTabIndex(2);

                                var a = event.srcElement;
                                //a.style.display = 'block';
                                a.style.removeAttribute('display');

                                return false;
                            }
                        }
                        break;
                    default:
                        if (!fnCheckPageValidators("Repayment Details", false)) {
                            alert("Fill the Mandatory value in Repayment tab");
                            tab.set_activeTabIndex(2);

                            var a = event.srcElement;
                            //a.style.display = 'block';
                            a.style.removeAttribute('display');

                            return false;
                        }
                        break;
                }

                alert('Line6');

                if (!fnCheckPageValidators("Prime Account Details", false)) {
                    alert("Fill the Mandatory value in Prime Account Details tab");
                    tab.set_activeTabIndex(6);

                    var a = event.srcElement;
                    //a.style.display = 'block';
                    a.style.removeAttribute('display');

                    return false;
                }
                alert('Line7');
                var a = event.srcElement;
                a.style.removeAttribute('display');
                alert('Line8');
                return fnCheckPageValidators('Application');
            }
        }




    </script>
</asp:Content>
