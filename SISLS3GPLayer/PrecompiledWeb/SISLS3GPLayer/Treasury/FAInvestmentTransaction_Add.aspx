<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="true" inherits="Financial_Accounting_FAInvestmentTransaction_Add, App_Web_ezlcepmc" title="Investment Transaction" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/FALOVMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
    <%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">

        function uploadComplete(sender, args) {
            var objID = sender._inputFile.id.split("_");
            objID = "<%= gvDocumentDetails.ClientID %>" + "_" + objID[5];
            if (document.getElementById(objID + "_myThrobber") != null) {
                document.getElementById(objID + "_myThrobber").innerText = args._fileName;
                document.getElementById(objID + "_hidThrobber").value = args._fileName;
            }
            if (document.getElementById(objID + "_txt") != null) {
                document.getElementById(objID + "_txt").value = 'valueExist';
            }
        }
        function fnLoadEntity() {
            document.getElementById('<%=btnCreateCustomer.ClientID %>').click();
        }
      
    </script>

    <script type="text/javascript">
        /* AsyncFileUpload - OnClientUploadComplete */
        function asyncUploadComplete(sender, args) {
            // Assemble info of uploaded file
            var contentType = args.get_contentType();
            var info = args.get_length() + " bytes";
            if (contentType.length > 0) {
                info += " - " + contentType;
            }
            info += " - " + args.get_fileName();
            // Put info in the first input field after the AsyncFileUpload control
            var source = $(sender.get_element());
            source.nextAll('input').val(info);
            // Validate immediately
            ValidatorEnable(source.nextAll('span')[0], true);
        }
        // AsyncFileUpload - OnClientUploadStarted
        function asyncUploadStarted(sender, args) {
            // Clear_FA the first input field after the AsyncFileUpload control
            var source = $(sender.get_element());
            source.nextAll('input').val('');
        }
    </script>

    <asp:UpdatePanel ID="upContainer" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <cc1:TabContainer ID="tcInvestmentTransaction" runat="server" CssClass="styleTabPanel"
                            AutoPostBack="false" ScrollBars="None" Width="100%" ActiveTabIndex="0">
                            <cc1:TabPanel runat="server" ID="tpMain" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Investment Transaction Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel runat="server" ID="upINVSTTRA" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Panel ID="pnlInvestmentMasterDetails" GroupingText="Investment Master Details"
                                                runat="server" CssClass="stylePanel">
                                                <table width="100%">
                                                    <tr>
                                                        <td width="50%">
                                                            <%--<asp:Panel ID="Panel1" GroupingText="Investment Master Details"
                                                runat="server" CssClass="stylePanel">--%>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td class="styleFieldLabel">
                                                                        <span class="styleDisplayLabel">Transaction Number</span>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:HiddenField ID="hdnInvstTransId" runat="server" />
                                                                        <asp:HiddenField ID="hdnMode" runat="server" />
                                                                        <asp:TextBox ID="txtTransactionNumber" onmouseover="txt_MouseoverTooltip(this)" runat="server"></asp:TextBox>
                                                                        <asp:TextBox ID="txtTransactionDate" Visible="false" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldLabel" style="width: 25%;">
                                                                        <span class="styleReqFieldLabel">Location</span>
                                                                    </td>
                                                                    <td class="styleFieldAlign" style="width: 25%;">
                                                                       <%-- <asp:DropDownList ID="ddlLocation" runat="server" onmouseover="ddl_itemchanged(this)"
                                                                            AutoPostBack="True" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged">
                                                                        </asp:DropDownList>--%>
                                                                        <UC:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" OnItem_Selected="ddlLocation_SelectedIndexChanged" ItemToValidate ="Value" ValidationGroup="BtnSave" IsMandatory="true" ErrorMessage="Select Location" />
                                                                        <%--  <cc1:ComboBox ID="ddlLocation" AutoPostBack="true" runat="server" AutoCompleteMode="SuggestAppend"
                                                                    DropDownStyle="DropDownList" CssClass="WindowsStyle" MaxLength="0" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged">
                                                                </cc1:ComboBox>--%>
                                                                      <%--  <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlLocation"
                                                                            Display="None" ErrorMessage="Select Location" InitialValue="0" ValidationGroup="BtnSave"
                                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldLabel">
                                                                        <span class="styleReqFieldLabel">Investment Type</span>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:DropDownList ID="ddlInvestmentType" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                            AutoPostBack="True" OnSelectedIndexChanged="ddlInvestmentType_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvInvestmentType" runat="server" ControlToValidate="ddlInvestmentType"
                                                                            SetFocusOnError="True" Display="None" ErrorMessage="Select Investment Type" InitialValue="0"
                                                                            ValidationGroup="BtnSave"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldLabel">
                                                                        <span class="styleReqFieldLabel">Transaction Type</span>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:DropDownList ID="ddlTransactionType" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                            AutoPostBack="True" OnSelectedIndexChanged="ddlTransactionType_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvTransactionType" runat="server" ControlToValidate="ddlTransactionType"
                                                                            SetFocusOnError="True" Display="None" ErrorMessage="Select Transaction Type"
                                                                            InitialValue="0" ValidationGroup="BtnSave"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldLabel">
                                                                        <span class="styleReqFieldLabel">Investment Code</span>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:DropDownList ID="ddlInvestmentCode" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                            AutoPostBack="True" OnSelectedIndexChanged="ddlInvestmentCode_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvInvestmentCode" runat="server" ControlToValidate="ddlInvestmentCode"
                                                                            SetFocusOnError="True" InitialValue="0" Display="None" ErrorMessage="Select Investment Code"
                                                                            ValidationGroup="BtnSave"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldLabel">
                                                                        <span class="styleReqFieldLabel">Serial Number</span>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:DropDownList ID="ddlSerialNumber" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                            AutoPostBack="True" OnSelectedIndexChanged="ddlSerialNumber_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvSerialNo" runat="server" ControlToValidate="ddlSerialNumber"
                                                                            SetFocusOnError="True" Display="None" ErrorMessage="Select Investment Serial Number"
                                                                            InitialValue="0" ValidationGroup="BtnSave" Enabled="false"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldLabel">
                                                                        <span class="styleDisplayLabel">Investment Description</span>
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:TextBox ID="txtInvestmentDesc" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                            TextMode="MultiLine"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldLabel" style="width: 25%;">
                                                                        <span class="styleReqFieldLabel">Date</span>
                                                                    </td>
                                                                    <td class="styleFieldAlign" style="width: 25%;">
                                                                        <asp:TextBox ID="txtDate" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                            AutoPostBack="true" Width="50%" OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                                                                        <asp:Image ID="imgDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate"
                                                                            OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="imgDate"
                                                                            ID="ceDate" Enabled="True">
                                                                        </cc1:CalendarExtender>
                                                                        <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate"
                                                                            SetFocusOnError="true" ErrorMessage="Select Date" Display="None" ValidationGroup="BtnSave"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldLabel" style="width: 25%;">
                                                                        <span class="styleReqFieldLabel">Status</span>
                                                                    </td>
                                                                    <td class="styleFieldAlign" style="width: 25%;">
                                                                        <asp:TextBox ID="txtStatus" ReadOnly="true" runat="server" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <%--</asp:Panel>--%>
                                                        </td>
                                                        <td width="50%">
                                                            <asp:Panel ID="PnlEntityInformation" Height="100%" runat="server" ToolTip="Entity Information"
                                                                GroupingText="Entity Information" CssClass="stylePanel" Width="98%">
                                                                <table width="100%">
                                                                    <tr>
                                                                        <td>
                                                                            <table width="100%">
                                                                                <tr>
                                                                                    <td width="32%">
                                                                                        <asp:Label runat="server" ToolTip="Entity" Text="Entity" ID="lblCode" CssClass="styleMandatoryLabel"></asp:Label>
                                                                                    </td>
                                                                                    <td width="60%">
                                                                                        <asp:TextBox ID="txtCode" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                                            Style="display: none;" MaxLength="50" Width="65%" ContentEditable="false"></asp:TextBox>
                                                                                        <uc2:LOV ID="ucLov" onblur="fnLoadEntity()" runat="server" DispalyContent="Code"
                                                                                            TextWidth="65%" />
                                                                                        <asp:Button ID="btnCreateCustomer" runat="server" UseSubmitBehavior="true" Text="Create"
                                                                                            Style="display: none;" OnClick="btnCreateCustomer_Click" CssClass="styleSubmitShortButton"
                                                                                            CausesValidation="false" />
                                                                                        <asp:RequiredFieldValidator Display="None" ID="RFVtxtCode" CssClass="styleMandatoryLabel"
                                                                                            runat="server" SetFocusOnError="True" ControlToValidate="txtCode" ErrorMessage="Select Entity"
                                                                                            ValidationGroup="BtnSave"></asp:RequiredFieldValidator>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <uc1:FAAddressDetail ActiveViewIndex="0" ID="ucFAAddressDetail" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            <asp:Panel ID="pnlInvestmentTransaction" runat="server" GroupingText="Investment Transaction Details"
                                                CssClass="stylePanel">
                                                <table width="100%">
                                                    <tr>
                                                        <td class="styleFieldLabel" style="width: 25%;">
                                                            <span class="styleReqFieldLabel">Units</span>
                                                        </td>
                                                        <td class="styleFieldAlign" style="width: 25%;">
                                                            <asp:TextBox ID="txtUnits" runat="server" AutoPostBack="True" MaxLength="6" OnTextChanged="txtUnits_TextChanged"
                                                                onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtDueAmt" TargetControlID="txtUnits" FilterType="numbers"
                                                                runat="server" Enabled="True" />
                                                            <asp:HiddenField ID="hdn_Sale_Quantity" runat="server" />
                                                            <asp:HiddenField ID="hdn_Old_Value" runat="server" />
                                                            <%--    onblur="return funChkDecimial(this,6,0,'Units',true);"--%>
                                                            <asp:RequiredFieldValidator ID="rfvUnits" runat="server" ControlToValidate="txtUnits"
                                                                Display="None" ErrorMessage="Enter Units" SetFocusOnError="True" ValidationGroup="BtnSave"></asp:RequiredFieldValidator>
                                                            <%--<asp:RangeValidator ID="rgUnits" runat="server" Type="Integer" MinimumValue="1" MaximumValue="999999"
                                                                ErrorMessage="" ControlToValidate="txtUnits" SetFocusOnError="true" Display="None"
                                                                ValidationGroup="BtnSave"></asp:RangeValidator>--%>
                                                        </td>
                                                        <td class="styleFieldLabel" style="width: 25%;">
                                                            <span class="styleDisplayLabel">Unit Face Value</span>
                                                        </td>
                                                        <td class="styleFieldAlign" style="width: 25%;">
                                                            <asp:TextBox ID="txtUnitFaceValue" runat="server" Style="text-align: right;" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Unit Value</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtUnitValue" runat="server" MaxLength="17" onpaste="return false;"
                                                                onkeypress="fnAllowNumbersDesimal(false)" AutoPostBack="True" Style="text-align: right;"
                                                                OnTextChanged="txtUnitValue_TextChanged" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvUnitValue" runat="server" ControlToValidate="txtUnitValue"
                                                                Display="None" ErrorMessage="Enter Unit value" SetFocusOnError="True" ValidationGroup="BtnSave"
                                                                Enabled="true"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Sale/Purchase Amount</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtSalePurchaseAmount" onmouseover="txt_MouseoverTooltip(this)"
                                                                runat="server" onpaste="return false;" AutoPostBack="true" OnTextChanged="FunPriCost_RealizationAmount"
                                                                onkeypress="fnAllowNumbersDesimal(false)" Style="text-align: right;"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvSalePurchaseAmount" runat="server" ControlToValidate="txtSalePurchaseAmount"
                                                                Display="None" ErrorMessage="Enter Sale/Purchase Amount" SetFocusOnError="True"
                                                                ValidationGroup="BtnSave"></asp:RequiredFieldValidator>
                                                            <%--<asp:RangeValidator ID="rvSalePurchaseAmount" runat="server" Type="Double" MinimumValue="1"
                                                                MaximumValue="999999999999999" ErrorMessage="" ControlToValidate="txtSalePurchaseAmount"
                                                                SetFocusOnError="true" Display="None" ValidationGroup="BtnSave"></asp:RangeValidator>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleDisplayLabel">Other Charges</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtOtherChanges" runat="server" MaxLength="17" onpaste="return false;"
                                                                onkeypress="fnAllowNumbersDesimal(false)" AutoPostBack="true" Style="text-align: right;"
                                                                OnTextChanged="txtOtherChanges_TextChanged" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleDisplayLabel">Total Cost/ Realization</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtTotalCost" runat="server" Style="text-align: right;" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                            <%-- <asp:RangeValidator ID="rvTotalCost" runat="server" Type="Double" MinimumValue="1"
                                                                MaximumValue="999999999999999" ErrorMessage="" ControlToValidate="txtTotalCost"
                                                                SetFocusOnError="true" Display="None" ValidationGroup="BtnSave"></asp:RangeValidator>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleDisplayLabel">Market Value</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtMarketValue" runat="server" onpaste="return false;" onkeypress="fnAllowNumbersDesimal(false)"
                                                                Style="text-align: right;" AutoPostBack="true" OnTextChanged="txtMarketValue_TextChanged"
                                                                onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvMarketValue" runat="server" ControlToValidate="txtMarketValue"
                                                                Display="None" ErrorMessage="Enter Market Value" SetFocusOnError="True" Enabled="false"
                                                                ValidationGroup="BtnSave"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Tenure</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlTenureType" runat="server" Width="80px" AutoPostBack="true"
                                                                onmouseover="ddl_itemchanged(this)" OnSelectedIndexChanged="ddlTenureType_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <asp:TextBox ID="txtTenure" runat="server" Width="40px" MaxLength="4" AutoPostBack="true"
                                                                onkeypress="fnAllowNumbersOnly('false',false,this)" Style="text-align: right;"
                                                                OnTextChanged="txtTenure_TextChanged" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvTenureType" runat="server" ControlToValidate="ddlTenureType"
                                                                InitialValue="0" ErrorMessage="Select Tenure Type" ValidationGroup="BtnSave"
                                                                SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                                                            <asp:RequiredFieldValidator ID="rfvTenure" runat="server" ControlToValidate="txtTenure"
                                                                SetFocusOnError="true" InitialValue="" ErrorMessage="Enter Tenure" ValidationGroup="BtnSave"
                                                                Display="None"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Maturity Date</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtMaturityDate" runat="server" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <span class="styleReqFieldLabel">Profit/Loss</span>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtProfitLoss" runat="server" Style="text-align: right;" onkeypress="fnAllowNumbersOnly('false',false,this)"
                                                                onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td colspan="2">
                                                        </td>
                                                        <td colspan="2">
                                                            <asp:Button ID="btnGenerateRepayment_Schedule" runat="server" Text="Generate Returns Schedule"
                                                                CssClass="styleSubmitLongButton170" ValidationGroup="btnGenerateRepayment" OnClick="btnGenerateRepayment_Schedule_Click" />
                                                            <asp:RequiredFieldValidator ID="rfvRepaymentInvestmentType" runat="server" ControlToValidate="ddlInvestmentType"
                                                                SetFocusOnError="True" Display="None" ErrorMessage="Select the Investment Type"
                                                                InitialValue="0" ValidationGroup="btnGenerateRepayment"></asp:RequiredFieldValidator>
                                                            <asp:RequiredFieldValidator ID="rfvRepaymentTransactionType" runat="server" ControlToValidate="ddlTransactionType"
                                                                SetFocusOnError="True" Display="None" ErrorMessage="Select the Transaction Type"
                                                                InitialValue="0" ValidationGroup="btnGenerateRepayment"></asp:RequiredFieldValidator>
                                                            <asp:RequiredFieldValidator ID="rfvRepaymentInvestmentCode" runat="server" ControlToValidate="ddlInvestmentCode"
                                                                SetFocusOnError="True" InitialValue="0" Display="None" ErrorMessage="Select the Investment Code"
                                                                ValidationGroup="btnGenerateRepayment"></asp:RequiredFieldValidator>
                                                            <asp:RequiredFieldValidator ID="rfvDateforRepayment" runat="server" ControlToValidate="txtDate"
                                                                SetFocusOnError="true" ErrorMessage="Select the Date" ValidationGroup="btnGenerateRepayment"
                                                                Display="None"></asp:RequiredFieldValidator>
                                                            <asp:RequiredFieldValidator ID="rfvSalePurchaseAmountforRepayment" runat="server"
                                                                ControlToValidate="txtSalePurchaseAmount" Display="None" ErrorMessage="Enter the Sale/Purchase Amount"
                                                                SetFocusOnError="True" ValidationGroup="btnGenerateRepayment"></asp:RequiredFieldValidator>
                                                            <asp:RequiredFieldValidator ID="rfvTunureTypeforRepayment" runat="server" ControlToValidate="ddlTenureType"
                                                                InitialValue="0" ErrorMessage="Select the Tenure Type" ValidationGroup="btnGenerateRepayment"
                                                                SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                                                            <asp:RequiredFieldValidator ID="rfvTenureforRepayment" runat="server" ControlToValidate="txtTenure"
                                                                SetFocusOnError="true" InitialValue="" ErrorMessage="Enter the Tenure" ValidationGroup="btnGenerateRepayment"
                                                                Display="None"></asp:RequiredFieldValidator>
                                                            <asp:HiddenField ID="hdnInterestPeriodicity" runat="server" Value="Half Yearly" />
                                                            <asp:HiddenField ID="hdnRateofInterest" runat="server" Value="10.52" />
                                                            <asp:HiddenField ID="hdnNatureofInterset" runat="server" Value="Fixed" />
                                                            <asp:HiddenField ID="hdnInterestType" runat="server" Value="Simple" />
                                                            <asp:HiddenField ID="hdnInterestfrequency" runat="server" Value="Half Yearly" />
                                                            <asp:HiddenField ID="hdnDenominatorDays" runat="server" Value="360" />
                                                            <asp:HiddenField ID="hdnNoofDays_Interest" runat="server" Value="0" />
                                                            <asp:HiddenField ID="hdnInterest_Amount" runat="server" Value="0" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="tpRepaymet" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Returns Schedule
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel ID="upschedule" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <table width="100%">
                                                            <tr>
                                                                <td>
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr style="width: 100%;">
                                                                <td colspan="2">
                                                                    <asp:Panel ID="pnlSchedule" runat="server" GroupingText="Returns Schedule Details"
                                                                        CssClass="stylePanel">
                                                                        <div runat="server" id="divAcc" class="container" style="min-height: 100px; max-height: 250px;
                                                                            width: 70%; overflow-x: hidden; overflow-y: scroll; text-align: center;">
                                                                            <asp:GridView ID="gvRepaymentschedule" runat="server" AutoGenerateColumns="false"
                                                                                Width="98%" OnRowDataBound="gvRepaymentschedule_RowDataBound">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="S.No" ItemStyle-Width="20%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSerialNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="From Date" Visible="false">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblFrom_Date" runat="server" Text='<%#Bind("From_Date") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="To Date" Visible="false">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblTo_Date" runat="server" Text='<%#Bind("To_Date") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Interest Date" ItemStyle-Width="25%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblInterest_Date" runat="server" Text='<%#Bind("Interest_Date") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="No of Days" ItemStyle-Width="25%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblNoofDays" runat="server" Text='<%#Bind("No_of_Days") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Amount" ItemStyle-Width="30%" ItemStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <asp:TextBox ID="txtAmount" runat="server" Width="90%" Text='<%#Bind("Amount") %>'
                                                                                                Style="text-align: right;" onkeypress="fnAllowNumbersDesimal(false)" onblur="return funChkDecimial(this,10,2,'Amount',true);"></asp:TextBox>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                            <tr style="width: 100%;" align="center">
                                                                <td>
                                                                    <asp:Button ID="btnPrintRepaymentSchedule" runat="server" Text="Print Schedule" CssClass="styleSubmitButton"
                                                                        OnClick="btnPrintRepaymentSchedule_Click" />
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="tpDocument" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Document Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel ID="upDocumentDetails" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Panel ID="pnlDocumentDetails" runat="server" GroupingText="Document Details"
                                                            CssClass="stylePanel">
                                                            <div runat="server" id="div1" class="container" style="min-height: 100px; max-height: 250px;
                                                                overflow-x: hidden; overflow-y: scroll; text-align: center;">
                                                                <asp:GridView ID="gvDocumentDetails" runat="server" AutoGenerateColumns="false" Width="98%"
                                                                    ShowFooter="true" OnRowCommand="gvDocumentDetails_RowCommand" OnRowDeleting="gvDocumentDetails_RowDeleting">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="S.No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%#Bind("SNo") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Document Name" Visible="true">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="lblDocument_Name" runat="server" Text='<%#Bind("Document_Name") %>'
                                                                                    onmouseover="txt_MouseoverTooltip(this)" contentEditable="false" Width="98%"
                                                                                    Style="border-color: White;" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtDocument_Name" runat="server" onkeyDown="maxlengthfortxt(100)"
                                                                                    onblur="FunTrimwhitespace(this,'Document Name');" TextMode="MultiLine" Rows="2"
                                                                                    Width="98%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvDocName" runat="server" ControlToValidate="txtDocument_Name"
                                                                                    ValidationGroup="btnDocAdd" Display="None" ErrorMessage="Enter the Document Name"
                                                                                    SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtDocument_Name" runat="server" TargetControlID="txtDocument_Name"
                                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" FilterMode="ValidChars"
                                                                                    ValidChars="!@#$%^&*(){}{}|\-_:><?/. ">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="30%" />
                                                                            <HeaderStyle HorizontalAlign="Center" Width="30%" />
                                                                            <FooterStyle HorizontalAlign="Left" Width="30%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Document Ref Number">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="lblDocument_Ref_No" contentEditable="false" Width="98%" Style="border-color: White;"
                                                                                    runat="server" Text='<%#Bind("Document_Ref_No") %>' onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtDocument_Ref_No" Width="98%" runat="server" Text="" onkeyDown="maxlengthfortxt(50)"
                                                                                    onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvDocRefNo" runat="server" ControlToValidate="txtDocument_Ref_No"
                                                                                    ValidationGroup="btnDocAdd" Display="None" ErrorMessage="Enter Document Reference Number"
                                                                                    SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtDocument_Ref_No" runat="server" TargetControlID="txtDocument_Ref_No"
                                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" FilterMode="ValidChars"
                                                                                    ValidChars="!@#$%^&*(){}{}|\-_:><?/.">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="25%" />
                                                                            <HeaderStyle HorizontalAlign="Center" Width="25%" />
                                                                            <FooterStyle HorizontalAlign="Left" Width="25%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Document Path" Visible="true">
                                                                            <ItemTemplate>
                                                                                <asp:Label runat="server" ID="lblScan" Text='<%# Eval("File_Path")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Upload/View Document">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="hyplnkView" CommandName="View Document" CommandArgument='<%# Bind("File_Path") %>'
                                                                                    ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery" runat="server" ToolTip="View Document" />
                                                                                <asp:Label runat="server" ID="lblPath" Text='<%# Eval("File_Path")%>' Visible="false"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txOD" runat="server" MaxLength="500" Text='<%# Bind("Upload") %>'
                                                                                    Style="display: none;"></asp:TextBox>
                                                                                <asp:TextBox runat="server" ID="txt" Style="display: none" MaxLength="0" />
                                                                                <cc1:AsyncFileUpload ID="asyFileUpload" OnClientUploadComplete="uploadComplete" runat="server"
                                                                                    Width="100px" ToolTip="File Upload" />
                                                                                <asp:Label runat="server" ID="myThrobber" Visible="false"></asp:Label>
                                                                                <asp:HiddenField runat="server" ID="hidThrobber" />
                                                                                <asp:RequiredFieldValidator ID="rfvDocfileUpload" runat="server" ControlToValidate="txt"
                                                                                    ValidationGroup="btnDocAdd" Display="None" ErrorMessage="Upload File" SetFocusOnError="false">
                                                                                </asp:RequiredFieldValidator>
                                                                                <input id="bOD" onclick="return openFileDialog(this.id,'bOD','fileOpenDocument','txOD', 'paper')"
                                                                                    style="width: 17px; height: 22px" type="button" runat="server" title="Click to browse file"
                                                                                    value="..." visible="False" />
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                            <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />
                                                                            <FooterStyle HorizontalAlign="Center" Width="15%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="Delete"
                                                                                    ToolTip="Delete" OnClientClick="return confirm('Are you sure want to delete?');"
                                                                                    CausesValidation="false" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Button ID="btnAdd" runat="server" Text="Add" CommandName="Add" ValidationGroup="btnDocAdd"
                                                                                    CssClass="styleSubmitShortButton"></asp:Button>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                                            <HeaderStyle HorizontalAlign="Center" Width="10%" />
                                                                            <FooterStyle HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </asp:Panel>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="tpPhysicalDemat" CssClass="tabpan" BackColor="Red"
                                Width="100%">
                                <HeaderTemplate>
                                    Physical/Demat
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="updemat" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Panel ID="pnldemat" runat="server" GroupingText="Physical/Demat Details" CssClass="stylePanel"
                                                Width="100%">
                                                <div runat="server" id="div2" class="container" style="min-height: 150px; max-height: 250px;
                                                    overflow-x: scroll; overflow-y: hidden; text-align: center;">
                                                    <asp:GridView ID="gvPhysicalDemat" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                                                        OnRowDeleting="gvPhysicalDemat_RowDeleting" OnRowCommand="gvPhysicalDemat_RowCommand"
                                                        OnRowDataBound="gvPhysicalDemat_RowDataBound" Width="130%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Physical/Demat" HeaderStyle-Width="4%" FooterStyle-Width="4%"
                                                                ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPhySial_Demat_ID" runat="server" Text='<%#Bind("PHYSICAL_DEMAT_ID") %>'
                                                                        Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblPhysial_Demat" runat="server" Text='<%#Bind("PHYSICAL_DEMAT") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:DropDownList runat="server" ID="ddlPhysial_Demat" onmouseover="ddl_itemchanged(this)"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlPhysial_Demat_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <%--<asp:RequiredFieldValidator ID="rfvPhysial_Demat" runat="server" ControlToValidate="ddlPhysial_Demat"
                                                                        Display="None" InitialValue="0" SetFocusOnError="true" ValidationGroup="BtnAdd"
                                                                        ErrorMessa--%<%-->ge="Select Physial or Demat"></asp:RequiredFieldValidator>--%>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Investment Serial No" HeaderStyle-Width="4%" FooterStyle-Width="4%"
                                                                ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInvestmentSerialNo" runat="server" Text='<%#Bind("INVESTMENT_SERIALNO") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtInvestmentSerialNo" runat="server" Width="70px" MaxLength="60" />
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Investment Description" HeaderStyle-Width="4%" FooterStyle-Width="4%"
                                                                ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInvestCode_Desc" runat="server" Text='<%#Bind("Invest_Desc") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Label ID="lblInvestCode_Desc" runat="server"></asp:Label>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="DP ID" HeaderStyle-Width="10%" FooterStyle-Width="10%"
                                                                ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDPID" runat="server" Text='<%#Bind("DP_ID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtDPID" runat="server" Width="95%" MaxLength="25" onkeyup="return maxlengthfortxt(25)"
                                                                        onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                                    <%--  <asp:RequiredFieldValidator ID="rfvDP_ID" runat="server" ControlToValidate="txtDPID"
                                                                        Display="None" InitialValue="" SetFocusOnError="true" ValidationGroup="BtnAdd"
                                                                        ErrorMessage="Enter DP ID"></asp:RequiredFieldValidator>--%>
                                                                    <cc1:FilteredTextBoxExtender ID="ftbeDP_ID" runat="server" TargetControlID="txtDPID"
                                                                        FilterType="UppercaseLetters, LowercaseLetters, Numbers,Custom" ValidChars="@&*()-.><:;/\]["
                                                                        Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="DP Name" FooterStyle-Width="10%" HeaderStyle-Width="10%"
                                                                ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDPName" runat="server" Text='<%#Bind("DP_NAME") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtDPName" Width="95%" runat="server" MaxLength="100" onkeyup="return maxlengthfortxt(100)"
                                                                        TextMode="MultiLine" Height="50px" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                                    <%--<asp:RequiredFieldValidator ID="rfvDP_Name" runat="server" ControlToValidate="txtDPName"
                                                                        Display="None" InitialValue="" SetFocusOnError="true" ValidationGroup="BtnAdd"
                                                                        ErrorMessage="Enter DP Name"></asp:RequiredFieldValidator>--%>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Client ID" FooterStyle-Width="10%" HeaderStyle-Width="10%"
                                                                ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblClientID" runat="server" Text='<%#Bind("CLIENT_ID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtClientID" Width="95%" runat="server" MaxLength="25" onkeyup="return maxlengthfortxt(25)"
                                                                        onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator ID="rfvClient_ID" runat="server" ControlToValidate="txtClientID"
                                                                        Display="None" InitialValue="" SetFocusOnError="true" ValidationGroup="BtnAdd"
                                                                        ErrorMessage="Enter Client ID"></asp:RequiredFieldValidator>--%>
                                                                    <cc1:FilteredTextBoxExtender ID="ftbeClient_ID" runat="server" TargetControlID="txtClientID"
                                                                        FilterType="UppercaseLetters, LowercaseLetters, Numbers, Custom" ValidChars="@&*()-.><:;/\]["
                                                                        Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Account Number" FooterStyle-Width="10%" HeaderStyle-Width="10%"
                                                                ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAccount_No" runat="server" Text='<%#Bind("ACCOUNT_NUMBER") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtAccountNo" runat="server" Width="95%" onmouseover="txt_MouseoverTooltip(this)"
                                                                        MaxLength="25" onkeyup="return maxlengthfortxt(25)"></asp:TextBox>
                                                                    <%--<asp:RequiredFieldValidator ID="rfvAccountNo" runat="server" ControlToValidate="txtAccountNo"
                                                                        Display="None" InitialValue="" SetFocusOnError="true" ValidationGroup="BtnAdd"
                                                                        ErrorMessage="Enter Account Number"></asp:RequiredFieldValidator>--%>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Maintained at" FooterStyle-Width="10%" HeaderStyle-Width="10%"
                                                                ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMaintained_At" runat="server" Text='<%#Bind("MAINTAINED_AT") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtMaintainedAt" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                        MaxLength="25" Width="95%" onkeyup="return maxlengthfortxt(25)"></asp:TextBox>
                                                                    <%--<asp:RequiredFieldValidator ID="rfvMaintainedAt" runat="server" ControlToValidate="txtMaintainedAt"
                                                                        Display="None" InitialValue="" SetFocusOnError="true" ValidationGroup="BtnAdd"
                                                                        ErrorMessage="Enter Maintained At"></asp:RequiredFieldValidator>--%>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Bought Date" FooterStyle-Width="7%" HeaderStyle-Width="7%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBought_Date" runat="server" Text='<%#Bind("BOUGHT_DATE") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtBought_Date" Width="95%" runat="server" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtBought_Date"
                                                                        PopupButtonID="txtBought_Date" ID="ceSaleDate" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                    </cc1:CalendarExtender>
                                                                    <%-- <asp:RequiredFieldValidator ID="rfvBought_Date" runat="server" ControlToValidate="txtBought_Date"
                                                                        Display="None" InitialValue="" SetFocusOnError="true" ValidationGroup="BtnAdd"
                                                                        ErrorMessage="Enter Bought Date"></asp:RequiredFieldValidator>--%>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Bought Quantity" FooterStyle-Width="5%" HeaderStyle-Width="5%"
                                                                ItemStyle-HorizontalAlign="Right">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBought_Quantity" runat="server" Text='<%#Bind("BOUGHT_QUANTITY") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtBought_Quantity" Width="95%" runat="server" onkeypress="fnAllowNumbersOnly('false',false,this)"
                                                                        MaxLength="8" onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;"></asp:TextBox>
                                                                    <%-- <asp:RequiredFieldValidator ID="rfvBought_Quantity" runat="server" ControlToValidate="txtBought_Quantity"
                                                                        Display="None" InitialValue="" SetFocusOnError="true" ValidationGroup="BtnAdd"
                                                                        ErrorMessage="Enter Bought Quantity"></asp:RequiredFieldValidator>--%>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Available Quantity" FooterStyle-Width="5%" HeaderStyle-Width="5%"
                                                                ItemStyle-HorizontalAlign="Right">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAvail_Quantity" runat="server" Text='<%#Bind("AVAIL_QUANTITY") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Label ID="lblAvail_Quantity" runat="server" Text='<%#Bind("AVAIL_QUANTITY") %>'></asp:Label>
                                                                    <%-- <asp:TextBox ID="txtAvailable_Quantity" Width="95%" runat="server" onkeypress="fnAllowNumbersOnly('false',false,this)"
                                                                        MaxLength="8" onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="rfvBought_Quantity" runat="server" ControlToValidate="txtBought_Quantity"
                                                                        Display="None" InitialValue="" SetFocusOnError="true" ValidationGroup="BtnAdd"
                                                                        ErrorMessage="Enter Bought Quantity"></asp:RequiredFieldValidator>--%>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Sale Date" FooterStyle-Width="7%" HeaderStyle-Width="7%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSale_Date" runat="server" Text='<%#Bind("SALE_DATE") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtSale_Date" Width="95%" runat="server" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtSale_Date"
                                                                        PopupButtonID="txtSale_Date" ID="ceBoughtDate" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                    </cc1:CalendarExtender>
                                                                    <asp:RequiredFieldValidator ID="rfvSale_Date" runat="server" ControlToValidate="txtSale_Date"
                                                                        Enabled="false" Display="None" InitialValue="" SetFocusOnError="true" ValidationGroup="BtnAdd"
                                                                        ErrorMessage="Enter Sale Date"></asp:RequiredFieldValidator>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Sale Quantity" FooterStyle-Width="5%" HeaderStyle-Width="5%"
                                                                ItemStyle-HorizontalAlign="Right">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblsale_Quantity" runat="server" Text='<%#Bind("SALE_QUANTITY") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtSale_Quantity" Width="95%" runat="server" onkeypress="fnAllowNumbersOnly('false',false,this)"
                                                                        MaxLength="8" onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="rfvSale_Quantity" runat="server" ControlToValidate="txtSale_Quantity"
                                                                        Enabled="false" Display="None" InitialValue="" SetFocusOnError="true" ValidationGroup="BtnAdd"
                                                                        ErrorMessage="Enter Sale Quantity"></asp:RequiredFieldValidator>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField FooterStyle-Width="4%" HeaderStyle-Width="4%">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="Delete"
                                                                        ToolTip="Delete" OnClientClick="return confirm('Are you sure want to delete?');"
                                                                        CausesValidation="false" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:LinkButton ID="btnAdd" runat="server" Text="Add" CommandName="Add" ValidationGroup="BtnAdd" />
                                                                    <%-- <asp:Button ID="btnAdd" runat="server" Text="Add" CommandName="Add" CssClass="styleSubmitShortButton"
                                                                        ValidationGroup="BtnAdd" />--%>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </td>
                </tr>
            </table>
            <asp:UpdatePanel ID="upbuttonEvent" runat="server">
                <ContentTemplate>
                    <div style="width: 100%; vertical-align: middle; text-align: center; margin-top: 10px;
                        margin-bottom: 10px;">
                        <asp:Button runat="server" ID="btnSave" OnClientClick="return fnCheckPageValidators('BtnSave')"
                            Text="Save" CssClass="styleSubmitButton" ValidationGroup="BtnSave" OnClick="btnSave_Click" />
                        <asp:Button runat="server" ID="btnClear" Text="Clear_FA" CssClass="styleSubmitButton"
                            OnClick="btnClear_Click" />
                        <asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click"
                            CssClass="styleSubmitButton" />
                        <asp:Button runat="server" ID="btnInvestmentCancel" Text="Investment Cancel" OnClick="btnInvestmentCancel_Click"
                            CssClass="styleSubmitButton" />
                    </div>
                    <div style="width: 95%; vertical-align: middle; text-align: center; margin-left: 20px;">
                        <asp:ValidationSummary CssClass="styleSummaryStyle" runat="server" ID="vsInvestmentTrans"
                            HeaderText="Correct the following validation(s):  " ShowSummary="true" ShowMessageBox="false"
                            ValidationGroup="BtnSave" />
                        <asp:ValidationSummary CssClass="styleSummaryStyle" runat="server" ID="vsPhysialDemat"
                            HeaderText="Correct the following validation(s):  " ShowSummary="true" ShowMessageBox="false"
                            ValidationGroup="BtnAdd" />
                        <asp:ValidationSummary CssClass="styleSummaryStyle" runat="server" ID="vsGenerateRepayment"
                            HeaderText="Correct the following validation(s):  " ShowSummary="true" ShowMessageBox="false"
                            ValidationGroup="btnGenerateRepayment" />
                        <asp:ValidationSummary CssClass="styleSummaryStyle" runat="server" ID="vsDocument"
                            HeaderText="Correct the following validation(s):  " ShowSummary="true" ShowMessageBox="false"
                            ValidationGroup="btnDocAdd" />
                    </div>
                    <asp:CustomValidator ID="cvInvestmentTransaction" runat="server" CssClass="styleMandatoryLabel"
                        Enabled="true" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
