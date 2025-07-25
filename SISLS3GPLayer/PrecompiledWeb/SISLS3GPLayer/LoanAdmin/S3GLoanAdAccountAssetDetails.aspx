<%@ page title="Asset Details" language="C#" masterpagefile="~/Common/MasterPage.master" autoeventwireup="true" inherits="LoanAd_S3G_LoanAdAccountAssetDetails, App_Web_iryvojbu" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <base target="_self" />
    <script language="javascript" type="text/javascript">
        function funcalassetvalue() {
            if (document.getElementById('<%=txtUnitCount.ClientID %>').value != "" && document.getElementById('<%=txtUnitValue.ClientID %>').value != "") {
                document.getElementById('<%=txtTotalAssetValue.ClientID %>').value = (parseFloat(document.getElementById('<%=txtUnitCount.ClientID %>').value) * parseFloat(document.getElementById('<%=txtUnitValue.ClientID %>').value));
            }
        }

        function funIsEmpty(textBox) {
            if (textBox.value == "") {
                textBox.value = "0";
            }
        }
        function funcalnoncapitalportion() {
            if (document.getElementById('<%=txtCapitalPortion.ClientID %>').value != "" && document.getElementById('<%=txtFinanceAmountAsset.ClientID %>').value != "") {
                document.getElementById('<%=txtNonCapitalPortion.ClientID %>').value = (parseFloat(document.getElementById('<%=txtFinanceAmountAsset.ClientID %>').value) - parseFloat(document.getElementById('<%=txtCapitalPortion.ClientID %>').value)).toFixed(3);

            }
        }
        function funcalcapitalportion() {
            if (document.getElementById('<%=txtNonCapitalPortion.ClientID %>').value != "" && document.getElementById('<%=txtFinanceAmountAsset.ClientID %>').value != "") {
                document.getElementById('<%=txtCapitalPortion.ClientID %>').value = (parseFloat(document.getElementById('<%=txtFinanceAmountAsset.ClientID %>').value) - parseFloat(document.getElementById('<%=txtNonCapitalPortion.ClientID %>').value)).toFixed(3);

            }
        }
        function ViewModal() {

            window.showModalDialog('../Origination/S3GOrgApplicationAssetDetails.aspx?qsMaster=Yes', 'Application Asset Details', 'dialogwidth:900px;dialogHeight:900px;');
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <table width="99%">
                <tr>
                    <td>
                        <asp:Panel ID="Panel2" runat="server" CssClass="stylePanel" GroupingText="Account Asset Details"
                            Height="75%" Width="99%">
                            <table width="100%">
                                <tr align="center">
                                    <td>
                                        <asp:RadioButtonList ID="rdnlAssetType" runat="server" RepeatDirection="Horizontal"
                                            AutoPostBack="True" OnSelectedIndexChanged="rdnlAssetType_SelectedIndexChanged">
                                            <asp:ListItem Text="Lease New Purchase" Value="0" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Lease Own Assets" Value="1"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table width="99%">
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblSlNo" runat="server" CssClass="styleDisplayLabel" Text="Sl. No."></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtSlNo" runat="server" Width="20px" ReadOnly="true" TabIndex="-1"
                                            Style="text-align: right;"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblRequiredFromDate" runat="server" CssClass="styleDisplayLabel" Text="Required From"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtRequiredFromDate" runat="server" Width="100px" TabIndex="-1"></asp:TextBox>
                                        <cc1:CalendarExtender ID="txtRequiredFromDate_CalendarExtender" runat="server" Enabled="false"
                                            OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="ImgtxtRequiredFromDate"
                                            TargetControlID="txtRequiredFromDate">
                                        </cc1:CalendarExtender>
                                        <asp:Image ID="ImgtxtRequiredFromDate" runat="server" Height="16px" ImageUrl="~/Images/calendaer.gif" />
                                        <asp:RequiredFieldValidator ID="rfvRequiredFromDate" runat="server" ControlToValidate="txtRequiredFromDate"
                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Choose a Required from date"
                                            SetFocusOnError="True" ValidationGroup="TabAssetDetails"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" style="width: 20%">
                                        <asp:Label runat="server" ID="lblAssetCodeList" CssClass="styleReqFieldLabel" Text="Asset Code"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" colspan="3">
                                        <asp:DropDownList ID="ddlAssetCodeList" runat="server" TabIndex="1">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvAssetCodeList" runat="server" ControlToValidate="ddlAssetCodeList"
                                            ValidationGroup="TabAssetDetails" CssClass="styleMandatoryLabel" Display="None"
                                            InitialValue="0" SetFocusOnError="True" ErrorMessage="Select an Asset Code" Enabled="False"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" style="width: 20%">

                                        <asp:Label ID="lblLeaseAssetNo" runat="server" CssClass="styleReqFieldLabel" Text="Lease Asset No."></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" colspan="3">

                                        <asp:DropDownList ID="ddlLeaseAssetNo" runat="server" TabIndex="2">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvLeastAssetCodeNo" runat="server" ControlToValidate="ddlLeaseAssetNo"
                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select an Least Asset Number"
                                            InitialValue="0" SetFocusOnError="True" ValidationGroup="TabAssetDetails"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblUnitCount" CssClass="styleReqFieldLabel" Text="Unit Count"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtUnitCount" onchange="funcalassetvalue();" runat="server" Width="35px"
                                            MaxLength="4" TabIndex="3" Style="text-align: right;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvUnitCount" runat="server" ControlToValidate="txtUnitCount"
                                            ValidationGroup="TabAssetDetails" CssClass="styleMandatoryLabel" Display="None"
                                            SetFocusOnError="True" ErrorMessage="Enter the Unit count"></asp:RequiredFieldValidator>
                                        <cc1:FilteredTextBoxExtender ID="FilteredUnitCount" TargetControlID="txtUnitCount"
                                            FilterType="Numbers,Custom" runat="server" ValidChars="." FilterMode="ValidChars">
                                        </cc1:FilteredTextBoxExtender>
                                        <asp:RangeValidator ID="RangeVUnitCount" runat="server" SetFocusOnError="True" CssClass="styleMandatoryLabel"
                                            Display="None" ValidationGroup="TabAssetDetails" ErrorMessage="Unit Count cannot be Zero"
                                            ControlToValidate="txtUnitCount" MaximumValue="9999" MinimumValue="1">
                                        </asp:RangeValidator>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblUnitValue" runat="server" CssClass="styleReqFieldLabel" Text="Unit Value"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtUnitValue" runat="server" MaxLength="13" Style="text-align: right;"
                                            onchange="funcalassetvalue();" Width="100px" TabIndex="5" onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvUnitValue" runat="server" ControlToValidate="txtUnitValue"
                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Unit value"
                                            SetFocusOnError="True" ValidationGroup="TabAssetDetails"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblTotalAssetValue" CssClass="styleDisplayLabel" Text="Total Asset Value"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtTotalAssetValue" Style="text-align: right;" runat="server" Width="150px"
                                            TabIndex="-1"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblMarginPercentage" runat="server" CssClass="styleDisplayLabel" Text="Margin %"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtMarginPercentage" Style="text-align: right;" runat="server" Width="50px"
                                            TabIndex="6" MaxLength="6" onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                        <asp:RangeValidator ID="rngvMarginPercentage" runat="server" ErrorMessage="Margin% should be between 1 and 100"
                                            ControlToValidate="txtMarginPercentage" MaximumValue="100" MinimumValue="0.0001"
                                            ValidationGroup="TabAssetDetails" Display="None" Type="Double">
                                        </asp:RangeValidator>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblMarginAmountAsset" CssClass="styleDisplayLabel"
                                            Text="Margin Amount"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtMarginAmountAsset" Style="text-align: right;" runat="server"
                                            Width="100px" TabIndex="7" MaxLength="13" onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblBookDepreciationPerc" runat="server" CssClass="styleDisplayLabel"
                                            Text="Book Depreciation %"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtBookDepreciationPerc" Style="text-align: right;" runat="server"
                                            ReadOnly="True" Width="50px" TabIndex="-1"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblBlockDepreciationPerc" CssClass="styleDisplayLabel"
                                            Text="Block Depreciation %"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtBlockDepreciationPerc" Style="text-align: right;" runat="server"
                                            Width="50px" ReadOnly="True" TabIndex="-1"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblFinanceAmountAsset0" runat="server" CssClass="styleReqFieldLabel"
                                            Text="Finance Amount"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtFinanceAmountAsset" Style="text-align: right;" runat="server"
                                            MaxLength="10" Width="100px" TabIndex="8"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvFinanceAmountAsset" runat="server" ControlToValidate="txtFinanceAmountAsset"
                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Finance Amount"
                                            SetFocusOnError="True" ValidationGroup="TabAssetDetails"></asp:RequiredFieldValidator>
                                        <cc1:FilteredTextBoxExtender ID="FEFinAmt" TargetControlID="txtFinanceAmountAsset"
                                            FilterType="Numbers,Custom" runat="server" ValidChars="." FilterMode="ValidChars">
                                        </cc1:FilteredTextBoxExtender>
                                        <asp:RangeValidator ID="RVFinAmt" runat="server" SetFocusOnError="True" CssClass="styleMandatoryLabel"
                                            Display="None" ValidationGroup="TabAssetDetails" ErrorMessage="Finance Amount cannot be Zero"
                                            ControlToValidate="txtFinanceAmountAsset" MaximumValue="9999999999" MinimumValue="1">
                                        </asp:RangeValidator>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblCapitalPortion" CssClass="styleReqFieldLabel" Text="Capital Portion"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtCapitalPortion" onchange="funcalnoncapitalportion();" Style="text-align: right;" runat="server" MaxLength="10"
                                            TabIndex="9" Width="100px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCapitalPortion" runat="server" ControlToValidate="txtCapitalPortion"
                                            ValidationGroup="TabAssetDetails" CssClass="styleMandatoryLabel" Display="None"
                                            SetFocusOnError="True" ErrorMessage="Enter the Capital Portion">
                                        </asp:RequiredFieldValidator>
                                        <cc1:FilteredTextBoxExtender ID="FilteredCapitalPortion" TargetControlID="txtCapitalPortion"
                                            FilterType="Numbers,Custom" runat="server" ValidChars=".">
                                        </cc1:FilteredTextBoxExtender>
                                        <asp:RangeValidator ID="RangeVCapitalPortion" runat="server" SetFocusOnError="True"
                                            CssClass="styleMandatoryLabel" Display="None" ValidationGroup="TabAssetDetails"
                                            ErrorMessage="Capital Portion cannot be Zero." ControlToValidate="txtCapitalPortion"
                                            MaximumValue="9999999999" MinimumValue="1">
                                        </asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblNonCapitalPortion" runat="server" CssClass="styleReqFieldLabel"
                                            Text="Non-Capital Portion"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtNonCapitalPortion" onchange="funcalcapitalportion();" Style="text-align: right;" runat="server"
                                            MaxLength="10" Width="100px" TabIndex="10"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvNonCapitalPortion" runat="server" ControlToValidate="txtNonCapitalPortion"
                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Non-Capital Portion"
                                            SetFocusOnError="True" ValidationGroup="TabAssetDetails"></asp:RequiredFieldValidator>
                                        <cc1:FilteredTextBoxExtender ID="FTTxtnonCap" TargetControlID="txtNonCapitalPortion"
                                            FilterType="Numbers,Custom" runat="server" ValidChars="." FilterMode="ValidChars">
                                        </cc1:FilteredTextBoxExtender>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblPayTo" CssClass="styleReqFieldLabel" Text="Pay To"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlPayTo" runat="server" OnSelectedIndexChanged="ddlPayTo_SelectedIndexChanged"
                                            AutoPostBack="true" TabIndex="11">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvPayTo" runat="server" ControlToValidate="ddlPayTo"
                                            ValidationGroup="TabAssetDetails" CssClass="styleMandatoryLabel" Display="None"
                                            InitialValue="-1" SetFocusOnError="True" ErrorMessage="Select a Pay To"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblNewLeaseAssetNo" runat="server" CssClass="styleReqFieldLabel" Text="Lease Asset No."
                                            Visible="False"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlNewLeaseAssetNo" runat="server" Visible="False" OnSelectedIndexChanged="ddlNewLeaseAssetNo_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvNewLeaseAssetNo" runat="server" ControlToValidate="ddlNewLeaseAssetNo"
                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select an Least Asset Number"
                                            InitialValue="0" SetFocusOnError="True" ValidationGroup="TabAssetDetails"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblEntityNameList" CssClass="styleReqFieldLabel" Text="Entity Name"></asp:Label>
                                        <asp:Label ID="lblCustomerName" runat="server" CssClass="styleDisplayLabel" Text="Customer Name" Visible="False"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" colspan="3">
                                        <%--<asp:DropDownList ID="ddlEntityNameList" runat="server" Visible="False" TabIndex="13">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvEntityNameList" runat="server" ControlToValidate="ddlEntityNameList"
                                            CssClass="styleMandatoryLabel" Display="None" InitialValue="-1" SetFocusOnError="True"
                                            ValidationGroup="TabAssetDetails" ErrorMessage="Select an Entity Name"></asp:RequiredFieldValidator>--%>
                                        <uc2:Suggest ID="ddlEntityNameList" runat="server" ServiceMethod="GetVendors"
                                            ErrorMessage="Select an Entity Name"
                                            ValidationGroup="TabAssetDetails" IsMandatory="true" />
                                        <asp:TextBox ID="txtCustomerName" runat="server" Width="250px" ReadOnly="true" TabIndex="-1" Visible="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblPaymentPercentage" runat="server" CssClass="styleDisplayLabel"
                                            Style="display: none;" Text="Payment %"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtPaymentPercentage" Style="text-align: right; display: none;"
                                            runat="server" MaxLength="6" Width="100px" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                            TabIndex="12"></asp:TextBox>
                                        <asp:RangeValidator ID="RangeValidator4" runat="server" ErrorMessage="Payment % should be between 1 and 100"
                                            ControlToValidate="txtPaymentPercentage" MaximumValue="100" MinimumValue="0.0001"
                                            ValidationGroup="TabAssetDetails" Display="None" Type="Double">
                                        </asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblAssetTypeofSecurity" runat="server" CssClass="styleDisplayLabel"
                                            Text="Type of Security"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlAssetTypeofSecurity" runat="server"
                                            AutoPostBack="false">
                                        </asp:DropDownList>
                                        <%--         <asp:RequiredFieldValidator ID="rfvAssetTypeofSecurity" runat="server" ControlToValidate="ddlAssetTypeofSecurity"
                                            ValidationGroup="TabAssetDetails" CssClass="styleMandatoryLabel" Display="None"
                                            InitialValue="0" SetFocusOnError="True" ErrorMessage="Select Type of Security"></asp:RequiredFieldValidator>--%>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblSecurityIdentifierType" runat="server" CssClass="styleDisplayLabel"
                                            Text="Security Identifier 1 Type"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlSecurityIdentifierType" runat="server"
                                            AutoPostBack="true">
                                        </asp:DropDownList>
                                        <%--                <asp:RequiredFieldValidator ID="rfvSecurityIdentifierType" runat="server" ControlToValidate="ddlSecurityIdentifierType"
                                            ValidationGroup="TabAssetDetails" CssClass="styleMandatoryLabel" Display="None"
                                            InitialValue="0" SetFocusOnError="True" ErrorMessage="Select Security Identifier Type"></asp:RequiredFieldValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblSecurityIdentifierValue" runat="server" CssClass="styleDisplayLabel"
                                            Text="Security Identifier 1"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtSecurityIdentifierValue" MaxLength="50" runat="server">
                                        </asp:TextBox>
                                        <%-- <asp:RequiredFieldValidator ID="rfvSecurityIdentifierValue" runat="server" ControlToValidate="txtSecurityIdentifierValue"
                                            ValidationGroup="TabAssetDetails" CssClass="styleMandatoryLabel" Display="None"
                                            SetFocusOnError="True" ErrorMessage="Select Security Identifier Value"></asp:RequiredFieldValidator>--%>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblSecurityIdentifierValue2" runat="server" CssClass="styleDisplayLabel"
                                            Text="Security Identifier 2 Type"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlSecurityIdentifierType2" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>

                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lbl" runat="server" CssClass="styleDisplayLabel"
                                            Text="Security Identifier 2"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtSecurityIdentifierValue2" MaxLength="50" runat="server">
                                        </asp:TextBox>
                                        <%-- <asp:RequiredFieldValidator ID="rfvSecurityIdentifierValue" runat="server" ControlToValidate="txtSecurityIdentifierValue"
                                            ValidationGroup="TabAssetDetails" CssClass="styleMandatoryLabel" Display="None"
                                            SetFocusOnError="True" ErrorMessage="Select Security Identifier Value"></asp:RequiredFieldValidator>--%>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblMargintoDealer" CssClass="styleDisplayLabel"
                                            Text="Down Payment to Dealer"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtMargintoDealer" runat="server" Width="120px" MaxLength="7"
                                            onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>

                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblMargintoMFC" CssClass="styleDisplayLabel"
                                            Text="Down Payment to MFC"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtMargintoMFC" runat="server" Width="120px" MaxLength="7"
                                            onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblTradeIn" CssClass="styleDisplayLabel"
                                            Text="Trade In"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtTradeIn" runat="server" Width="120px" MaxLength="7"
                                            onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblEngineNo" CssClass="styleDisplayLabel"
                                            Text="Engine No"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtEngineNo" runat="server" Width="120px"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblChasisNumber" CssClass="styleDisplayLabel"
                                            Text="Chasis Number"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtChasisNumber" runat="server" Width="120px"></asp:TextBox>
                                    </td>


                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblDateOfRegistration" CssClass="styleDisplayLabel"
                                            Text="Date of Registration"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtDateofRegistration" runat="server" Width="120px"></asp:TextBox>
                                        <asp:Image ID="imgtxtDateofRegistration" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                        <cc1:CalendarExtender runat="server" TargetControlID="txtDateofRegistration" PopupButtonID="imgtxtDateofRegistration" ID="caltxtDateofRegistration">
                                        </cc1:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="rfvimgtxtDateofRegistration" runat="server" ControlToValidate="txtDateofRegistration"
                                            Display="None" ValidationGroup="TabAssetDetails" CssClass="styleMandatoryLabel" SetFocusOnError="True"
                                            ErrorMessage="Date of Registration"></asp:RequiredFieldValidator>
                                    </td>

                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblRegistrationNo" CssClass="styleDisplayLabel"
                                            Text="Registration No"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtRegistrationNo" runat="server" Width="120px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvxtRegistrationNo" runat="server" ControlToValidate="txtRegistrationNo"
                                            Display="None" ValidationGroup="TabAssetDetails" CssClass="styleMandatoryLabel" SetFocusOnError="True"
                                            ErrorMessage="Enter the Registration No"></asp:RequiredFieldValidator>
                                    </td>



                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblRegistrationExpiryDate" CssClass="styleDisplayLabel"
                                            Text="Registration Expiry Date"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtRegistrationExpiryDate" runat="server" Width="120px"></asp:TextBox>
                                        <asp:Image ID="imgtxtRegistrationExpiryDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                        <cc1:CalendarExtender runat="server" TargetControlID="txtRegistrationExpiryDate" PopupButtonID="imgtxtRegistrationExpiryDate" ID="calimgtxtRegistrationExpiryDate">
                                        </cc1:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="rfvcalimgtxtRegistrationExpiryDate" runat="server" ControlToValidate="txtRegistrationExpiryDate"
                                            Display="None" ValidationGroup="TabAssetDetails" CssClass="styleMandatoryLabel" SetFocusOnError="True"
                                            ErrorMessage="Select the Registration Expiry Date"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblModelYear" CssClass="styleDisplayLabel"
                                            Text="Model Year"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtModelYear" runat="server" Width="120px"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblManuFactoringYear" CssClass="styleDisplayLabel"
                                            Text="Manufactoring Year"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtManufactoringYear" runat="server" Width="120px"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblRegisteredOwener" CssClass="styleDisplayLabel"
                                            Text="Registered Owner"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtRegisteredOwner" runat="server" Width="120px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblDealerCommissioBasisRate" ToolTip="Dealer Commission Rate" CssClass="styleDisplayLabel" Text="Dealer Commission Rate"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtDealerCommissionBasisRate" ToolTip="Dealer Commission Rate" onkeyup="maxlengthfortxt(15);" runat="server" Width="100px"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" ID="lblDealerCommissionAmount" ToolTip="Dealer Commission Amount" CssClass="styleDisplayLabel" Text="Dealer Commission Amount"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtDealerCommissionAmount" ToolTip="Dealer Commission Amount" onkeyup="maxlengthfortxt(15);" runat="server" Width="100px"></asp:TextBox>
                                    </td>

                                </tr>

                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="99%">
                            <tr>
                                <td class="styleFieldLabel" align="center" style="width: 99%; padding-left: 35%">
                                    <asp:Button ID="btnOK" runat="server" CausesValidation="true" CssClass="styleSubmitButton"
                                        Text="OK" UseSubmitBehavior="False" ValidationGroup="TabAssetDetails" OnClick="btnOK_Click"
                                        TabIndex="15" />
                                    &nbsp;<asp:Button ID="btnCancel" runat="server" CausesValidation="false" CssClass="styleSubmitButton"
                                        Text="Cancel" UseSubmitBehavior="False" ValidationGroup="TabAssetDetails" OnClick="btnCancel_Click"
                                        TabIndex="16" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td>
                        <table width="99%">
                            <tr>
                                <td>
                                    <asp:ValidationSummary ID="vs_TabAssetDetails" runat="server" CssClass="styleMandatoryLabel"
                                        Width="705px" ValidationGroup="TabAssetDetails" HeaderText="Please correct the following validation(s):  " />
                                    <asp:CustomValidator ID="cv_TabAssetDetails" runat="server" CssClass="styleMandatoryLabel"
                                        Display="None" ValidationGroup="TabAssetDetails"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblErrorMessage" runat="server" Style="color: Red; font-size: 14px">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:CustomValidator ID="cvApplicationAsset" runat="server" CssClass="styleMandatoryLabel"
                Enabled="true" Width="98%" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <input type="hidden" id="hdnCustomerID" runat="server" />
    <input type="hidden" id="hdnAssetAvailDate" runat="server" />
</asp:Content>
