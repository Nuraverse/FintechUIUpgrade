<%@ page title="Asset Details" language="C#" masterpagefile="~/Common/MasterPage.master" autoeventwireup="true" enableeventvalidation="true" inherits="Origination_S3G_OrgApplicationAssetDetails, App_Web_w304vrwx" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <base target="_self" />



    <script type="text/javascript">
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
    </script>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <asp:Panel ID="Panel2" runat="server" CssClass="stylePanel" GroupingText="Application Asset Details"
                                Height="75%" Width="99%">

                                <div class="row">
                                    <div class="col-lg-1 col-md-2 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtSlNo" Enabled="false" runat="server" CssClass="md-form-control form-control login_form_content_input requires_false" TabIndex="-1"
                                                Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblSlNo" runat="server" CssClass="styleDisplayLabel" Text="Sl. No."></asp:Label>

                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-11 col-md-10 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <%-- <asp:DropDownList ID="ddlAssetCodeList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlAssetCodeList_SelectedIndexChanged"
                                        TabIndex="1">
                                    </asp:DropDownList>--%>

                                            <uc2:Suggest ID="ddlAssetCodeList" runat="server" ErrorMessage="Select the Asset" ValidationGroup="TabAssetDetails"
                                                OnItem_Selected="ddlAssetCodeList_SelectedIndexChanged"
                                                ServiceMethod="GetAsset" IsMandatory="true" AutoPostBack="true" />


                                            <%--                                    <asp:TextBox ID="txtAssetCodeList" class="md-form-control form-control login_form_content_input requires_true"  runat="server"  AutoPostBack="true" OnTextChanged="ddlAssetCodeList_SelectedIndexChanged">
                                    </asp:TextBox>
                                    <cc1:AutoCompleteExtender ID="autoClientNameSearch" MinimumPrefixLength="3" OnClientPopulated="Client_ItemPopulated"
                                        OnClientItemSelected="Client_ItemSelected"
                                        runat="server" TargetControlID="txtAssetCodeList"
                                        ServiceMethod="GetAsset" Enabled="True" CompletionSetCount="5"
                                        CompletionListCssClass="CompletionList" DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
                                        CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                        ShowOnlyCurrentWordInCompletionListItem="true">
                                    </cc1:AutoCompleteExtender>
                                   
                                    <div class="validation_msg_box">
                                        <asp:HiddenField ID="hdnAssetCodeList" runat="server" />
                                        <asp:RequiredFieldValidator ID="rfvClientNameList" runat="server"  CssClass="validation_msg_box_sapn" Display="Dynamic" ControlToValidate="txtAssetCodeList"
                                             SetFocusOnError="True"
                                            ErrorMessage="Select the Asset" ValidationGroup="TabAssetDetails"></asp:RequiredFieldValidator>
                                    </div>--%>



                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblAssetCodeList" CssClass="styleReqFieldLabel" Text="Asset"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="row" style="padding: 5px !important;">
                                        <div class="row">
                                            <%-- <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <asp:RadioButtonList ID="rdnlAssetType" runat="server" RepeatDirection="Horizontal"
                                            AutoPostBack="True" OnSelectedIndexChanged="rdnlAssetType_SelectedIndexChanged">
                                            <asp:ListItem Text="Lease New Purchase" Value="0" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Lease Own Assets" Value="1"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <br />--%>


                                            <div class="row">


                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtAssetClass" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblAssetClass" CssClass="styleDisplayLabel" Text="Class"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtMake" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblMake" CssClass="styleDisplayLabel" Text="Make"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtAssetType" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblType" CssClass="styleDisplayLabel" Text="Type"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtModel" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblModel" CssClass="styleDisplayLabel" Text="Model"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>


                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtPurpose" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lbltxtPurpose" CssClass="styleDisplayLabel" Text="Purpose"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>


                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlYearofManufacturer" runat="server" OnSelectedIndexChanged="ddlYearofManufacturer_SelectedIndexChanged"
                                                            AutoPostBack="true">
                                                        </asp:DropDownList>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="RfvddlYearofManufacturer" runat="server" ControlToValidate="ddlYearofManufacturer"
                                                                ValidationGroup="TabAssetDetails" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                InitialValue="0" SetFocusOnError="True" ErrorMessage="Select a Year Manufacturer"></asp:RequiredFieldValidator>
                                                        </div>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblYearofManufacture" CssClass="styleReqFieldLabel" Text="Year of Manufacture"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>


                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtUnitCount" class="md-form-control form-control login_form_content_input requires_true" onchange="funcalassetvalue();" Text="1" runat="server"
                                                            AutoPostBack="false"
                                                            MaxLength="4" Style="text-align: right"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredUnitCount" TargetControlID="txtUnitCount"
                                                            FilterType="Numbers" runat="server">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvUnitCount" runat="server" ControlToValidate="txtUnitCount"
                                                                ValidationGroup="TabAssetDetails" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                SetFocusOnError="True" ErrorMessage="Enter the Unit count"></asp:RequiredFieldValidator>
                                                            <asp:RangeValidator ID="RangeVUnitCount" runat="server" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                                                Display="Dynamic" ValidationGroup="TabAssetDetails" ErrorMessage="Unit Count cannot be Zero"
                                                                ControlToValidate="txtUnitCount" MaximumValue="9999" MinimumValue="1">
                                                            </asp:RangeValidator>
                                                        </div>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblUnitCount" CssClass="styleReqFieldLabel" Text="Unit Count"></asp:Label>
                                                            <input id="HdnGPSDecimal" type="hidden" runat="server" />
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtUnitValue" class="md-form-control form-control login_form_content_input requires_true" runat="server" onchange="funcalassetvalue();"
                                                            AutoPostBack="false" Style="text-align: right"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="flttxtUnitValue" TargetControlID="txtUnitValue"
                                                            FilterType="Numbers,Custom" ValidChars=".," runat="server">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvUnitValue" runat="server" ControlToValidate="txtUnitValue"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Unit value"
                                                                SetFocusOnError="True" ValidationGroup="TabAssetDetails"></asp:RequiredFieldValidator>
                                                        </div>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblUnitValue" runat="server" CssClass="styleReqFieldLabel" Text="Unit Value"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtTotalAssetValue" class="md-form-control form-control login_form_content_input requires_true" runat="server" Style="text-align: right"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <cc1:FilteredTextBoxExtender ID="flttxtTotalAssetValue" TargetControlID="txtTotalAssetValue"
                                                            FilterType="Numbers,Custom" ValidChars=".," runat="server">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblTotalAssetValue" CssClass="styleDisplayLabel" Text="Asset Cost"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtDiscountAmount" class="md-form-control form-control login_form_content_input requires_true" runat="server" Style="text-align: right"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblDiscountAmount" CssClass="styleDisplayLabel" Text="Discount Amount"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtMarginPercentage" TabIndex="-1" class="md-form-control form-control login_form_content_input requires_true" runat="server" Style="text-align: right"
                                                            AutoPostBack="true"
                                                            onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                                        <div class="validation_msg_box">
                                                            <asp:RangeValidator ID="rngvMarginPercentage" runat="server" ErrorMessage="Margin% should be between 1 and 100"
                                                                ControlToValidate="txtMarginPercentage" MaximumValue="100" MinimumValue="0" ValidationGroup="TabAssetDetails"
                                                                Display="None" Type="Double">
                                                            </asp:RangeValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblMarginPercentage" runat="server" CssClass="styleDisplayLabel" Text="Down Payment %"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtMarginAmountAsset" TabIndex="-1" class="md-form-control form-control login_form_content_input requires_true" runat="server" Style="text-align: right"
                                                            onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtMarginAmountAsset" runat="server" ControlToValidate="txtMarginAmountAsset"
                                                                ValidationGroup="TabAssetDetails" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                SetFocusOnError="True" ErrorMessage="Enter the Down Payment Amount"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblMarginAmountAsset" CssClass="styleReqFieldLabel"
                                                                Text="Down Payment Amount"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>



                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtBookDepreciationPerc" class="md-form-control form-control login_form_content_input requires_true" runat="server" Style="text-align: right"
                                                            ReadOnly="True" TabIndex="-1"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblBookDepreciationPerc" runat="server" CssClass="styleDisplayLabel"
                                                                Text="Book Depreciation %"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtFinanceAmountAsset" Enabled="false" AutoPostBack="false" class="md-form-control form-control login_form_content_input requires_true" runat="server" Style="text-align: right"
                                                            MaxLength="10"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FEFinAmt" TargetControlID="txtFinanceAmountAsset"
                                                            FilterType="Numbers,Custom" ValidChars=".," runat="server">
                                                        </cc1:FilteredTextBoxExtender>

                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvFinanceAmountAsset" runat="server" ControlToValidate="txtFinanceAmountAsset"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Finance Amount"
                                                                SetFocusOnError="True" ValidationGroup="TabAssetDetails"></asp:RequiredFieldValidator>

                                                            <asp:RangeValidator ID="RVFinAmt" runat="server" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                                                Display="Dynamic" ValidationGroup="TabAssetDetails" ErrorMessage="Finance Amount cannot be Zero"
                                                                ControlToValidate="txtFinanceAmountAsset" MaximumValue="9999999999" MinimumValue="1">
                                                            </asp:RangeValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblFinanceAmountAsset0" runat="server" CssClass="styleReqFieldLabel"
                                                                Text="Finance Amount"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>



                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlPayTo" runat="server" OnSelectedIndexChanged="ddlPayTo_SelectedIndexChanged"
                                                            AutoPostBack="true">
                                                            <asp:ListItem Value="0">Entity</asp:ListItem>
                                                            <asp:ListItem Value="1" Selected="True">Customer</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvPayTo" runat="server" ControlToValidate="ddlPayTo"
                                                                ValidationGroup="TabAssetDetails" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                InitialValue="-1" SetFocusOnError="True" ErrorMessage="Select a Pay To"></asp:RequiredFieldValidator>
                                                        </div>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblPayTo" CssClass="styleReqFieldLabel" Text="Pay To"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <uc2:Suggest ID="ddlEntityNameList" runat="server" OnItem_Selected="ddlEntityNameList_Item_Selected" ServiceMethod="GetVendors"
                                                            ErrorMessage="Select an Entity Name"
                                                            ValidationGroup="TabAssetDetails" IsMandatory="true" />
                                                        <asp:TextBox ID="txtCustomerName" class="md-form-control form-control login_form_content_input requires_true" runat="server" ReadOnly="true" TabIndex="-1" Visible="False"></asp:TextBox>

                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvCustomerName" runat="server" ControlToValidate="txtCustomerName"
                                                                Display="Dynamic" CssClass="validation_msg_box_sapn" SetFocusOnError="True" ValidationGroup="TabAssetDetails"
                                                                ErrorMessage="Enter the Customer Name"></asp:RequiredFieldValidator>
                                                        </div>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblEntityNameList" CssClass="styleReqFieldLabel" Text="Entity Name"></asp:Label>
                                                            <asp:Label ID="lblCustomerName" runat="server" CssClass="styleDisplayLabel" Text="Customer Name" Visible="False"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlAssetTypeofSecurity" runat="server"
                                                            AutoPostBack="false">
                                                        </asp:DropDownList>

                                                        <div class="validation_msg_box">
                                                            <%-- <asp:RequiredFieldValidator ID="rfvAssetTypeofSecurity" runat="server" ControlToValidate="ddlAssetTypeofSecurity"
                                                                ValidationGroup="TabAssetDetails" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                InitialValue="0" SetFocusOnError="True" ErrorMessage="Select Type of Security"></asp:RequiredFieldValidator>--%>
                                                        </div>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblAssetTypeofSecurity" runat="server" CssClass="styleDisplayLabel"
                                                                Text="Type of Security"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlSecurityIdentifierType" runat="server"
                                                            AutoPostBack="false">
                                                        </asp:DropDownList>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblSecurityIdentifierType" runat="server" CssClass="styleDisplayLabel"
                                                                Text="Security Identifier 1 Type"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtSecurityIdentifierValue" class="md-form-control form-control login_form_content_input requires_true" MaxLength="50" runat="server">
                                                        </asp:TextBox>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblSecurityIdentifierValue" runat="server" CssClass="styleDisplayLabel"
                                                                Text="Security Identifier 1"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlSecurityIdentifierType2" runat="server">
                                                        </asp:DropDownList>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblSecurityIdentifierValue2" runat="server" CssClass="styleDisplayLabel"
                                                                Text="Security Identifier 2 Type"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtSecurityIdentifierValue2" class="md-form-control form-control login_form_content_input requires_true" MaxLength="50" runat="server">
                                                        </asp:TextBox>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lbl" runat="server" CssClass="styleDisplayLabel"
                                                                Text="Security Identifier 2"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtMargintoDealer" onchange="funcalassetMarginAmt_dp();" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="7"
                                                            onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="flttxtMargintoDealer" TargetControlID="txtMargintoDealer"
                                                            FilterType="Numbers,Custom" ValidChars=".," runat="server">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblMargintoDealer" CssClass="styleDisplayLabel"
                                                                Text="Down Payment to Dealer"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtMargintoMFC" onchange="funcalassetMarginAmt_dp();" class="md-form-control form-control login_form_content_input requires_true" runat="server" MaxLength="7"
                                                            onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="flttxtMargintoMFC" TargetControlID="txtMargintoMFC"
                                                            FilterType="Numbers,Custom" ValidChars=".," runat="server">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblMargintoMFC" CssClass="styleDisplayLabel"
                                                                Text="Down Payment to MFC"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtTradeIn" runat="server" onchange="funcalassetMarginAmt_dp();" class="md-form-control form-control login_form_content_input requires_true" MaxLength="7"
                                                            onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <cc1:FilteredTextBoxExtender ID="flttxtTradeIn" TargetControlID="txtTradeIn"
                                                            FilterType="Numbers,Custom" ValidChars=".," runat="server">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblTradeIn" CssClass="styleDisplayLabel"
                                                                Text="Trade In"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtEngineNo" Enabled="false" OnTextChanged="txtEngineNo_TextChanged" AutoPostBack="true" MaxLength="25" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblEngineNo" CssClass="styleDisplayLabel"
                                                                Text="Engine No"></asp:Label>
                                                        </label>
                                                        <div id="divrfvtxtEngineNo" runat="server" class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtEngineNo" Enabled="false" runat="server" ControlToValidate="txtEngineNo"
                                                                Display="Dynamic" ValidationGroup="TabAssetDetails" CssClass="validation_msg_box_sapn" SetFocusOnError="True"
                                                                ErrorMessage="Engine No"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtChasisNumber" Enabled="false" MaxLength="25" OnTextChanged="txtChasisNumber_TextChanged" ToolTip="Chassis Number" AutoPostBack="true" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblChasisNumber" CssClass="styleDisplayLabel"
                                                                Text="Chassis Number"></asp:Label>
                                                        </label>
                                                        <div id="divrfvtxtChasisNumber" runat="server" class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtChasisNumber" Enabled="false" runat="server" ControlToValidate="txtChasisNumber"
                                                                Display="Dynamic" ValidationGroup="TabAssetDetails" CssClass="validation_msg_box_sapn" SetFocusOnError="True"
                                                                ErrorMessage="Chassis Number"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtDateofRegistration" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>

                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtDateofRegistration" PopupButtonID="imgtxtDateofRegistration" ID="caltxtDateofRegistration">
                                                        </cc1:CalendarExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvimgtxtDateofRegistration" Enabled="false" runat="server" ControlToValidate="txtDateofRegistration"
                                                                Display="Dynamic" ValidationGroup="TabAssetDetails" CssClass="validation_msg_box_sapn" SetFocusOnError="True"
                                                                ErrorMessage="Date of Registration"></asp:RequiredFieldValidator>
                                                        </div>

                                                        <label>
                                                            <asp:Label runat="server" ID="lblDateOfRegistration" CssClass="styleDisplayLabel"
                                                                Text="Date of Registration"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div style="margin-top: -5px">

                                                        <%-- <asp:TextBox ID="txtRegistrationNo1" onkeyup="maxlengthfortxt(8);" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>--%>

                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <div>
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtRegistrationNo1" MaxLength="10" CssClass="md-form-control form-control login_form_content_input requires_true"
                                                                                runat="server" ToolTip="Registration Number1"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="Label1" CssClass="styleDisplayLabel"
                                                                                    Text="Registration Number1"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div>
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtRegNo2" MaxLength="10" CssClass="md-form-control form-control login_form_content_input requires_true"
                                                                                runat="server" ToolTip="Registration Number2"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="Label2" CssClass="styleDisplayLabel"
                                                                                    Text="Registration Number2"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>

                                                        <%-- <cc1:FilteredTextBoxExtender ID="ftxtRegAla" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters"
                                                            TargetControlID="txtRegistrationNo1" ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXZabcdefghijklmnopqrstuvwxyz">
                                                        </cc1:FilteredTextBoxExtender>--%>
                                                        <cc1:FilteredTextBoxExtender ID="ftxtRegAla" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                            TargetControlID="txtRegistrationNo1">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <cc1:FilteredTextBoxExtender ID="ftxtRegNo" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                            TargetControlID="txtRegNo2" ValidChars="">
                                                        </cc1:FilteredTextBoxExtender>



                                                    </div>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvRegistrationNo1" Enabled="false" runat="server" ControlToValidate="txtRegistrationNo1"
                                                            Display="Dynamic" ValidationGroup="TabAssetDetails" CssClass="validation_msg_box_sapn" SetFocusOnError="True"
                                                            ErrorMessage="Enter the Registration No"></asp:RequiredFieldValidator>
                                                    </div>

                                                </div>


                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtRegistrationExpiryDate" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>

                                                        <cc1:CalendarExtender runat="server" TargetControlID="txtRegistrationExpiryDate" PopupButtonID="imgtxtRegistrationExpiryDate" ID="calimgtxtRegistrationExpiryDate">
                                                        </cc1:CalendarExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvcalimgtxtRegistrationExpiryDate" Enabled="false" runat="server" ControlToValidate="txtRegistrationExpiryDate"
                                                                Display="Dynamic" ValidationGroup="TabAssetDetails" CssClass="validation_msg_box_sapn" SetFocusOnError="True"
                                                                ErrorMessage="Select the Registration Expiry Date"></asp:RequiredFieldValidator>
                                                        </div>

                                                        <label>
                                                            <asp:Label runat="server" ID="lblRegistrationExpiryDate" CssClass="styleDisplayLabel"
                                                                Text="Registration Expiry Date"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtModelYear" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblModelYear" CssClass="styleDisplayLabel"
                                                                Text="Model Year"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div style="display: none" class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtManufactoringYear" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblManuFactoringYear" CssClass="styleDisplayLabel"
                                                                Text="Manufactoring Year"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtRegisteredOwner" onkeyup="maxlengthfortxt(50);" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblRegisteredOwener" CssClass="styleDisplayLabel"
                                                                Text="Registered Owner"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlAssetType" runat="server" onchange="return funAssetTypeChage();" ToolTip="Asset Type"
                                                            class="md-form-control form-control login_form_content_input requires_false">
                                                        </asp:DropDownList>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblAssetType" ToolTip="Asset Type" runat="server" Text="Asset Type" CssClass="styleReqFieldLabel"></asp:Label>

                                                        </label>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvAssetType" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlAssetType"
                                                                ErrorMessage="Select the Asset Type" Display="Dynamic" InitialValue="0" ValidationGroup="TabAssetDetails" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:HiddenField ID="hdnDealerCommissionId" runat="server" />
                                                        <asp:TextBox ID="txtDealerCommissionBasisRate" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Dealer Commission Rate" onkeyup="maxlengthfortxt(15);" runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblDealerCommissioBasisRate" ToolTip="Dealer Commission Rate" CssClass="styleDisplayLabel" Text="Dealer Commission Rate"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtDealerCommissionAmount" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Dealer Commission Amount" onkeyup="maxlengthfortxt(15);" runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblDealerCommissionAmount" ToolTip="Dealer Commission Amount" CssClass="styleDisplayLabel" Text="Dealer Commission Amount"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>



                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <%--<asp:Panel ID="pnlDealerComission" Height="75%" Width="99%" CssClass="stylePanel" GroupingText="Dealer Commission" runat="server">
                        <div class="row">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <button class="css_btn_enabled" id="btnCheckDealerComission" title="Get Commission[Alt+D]" causesvalidation="false" onserverclick="btnCheckDealerComission_Click" runat="server"
                                        type="button" accesskey="D">
                                        <i class="fa fa-external-link-square" aria-hidden="true"></i>&emsp;Get C<u></u>ommission
                                    </button>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                   <asp:HiddenField ID="hdnDealerCommissionId" runat="server" />
                                    <asp:TextBox ID="txtDealerCommissionBasisRate" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Dealer Commission Rate" onkeyup="maxlengthfortxt(15);" runat="server"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblDealerCommissioBasisRate" ToolTip="Dealer Commission Rate" CssClass="styleDisplayLabel" Text="Dealer Commission Rate"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtDealerCommissionAmount" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Dealer Commission Amount" onkeyup="maxlengthfortxt(15);" runat="server"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblDealerCommissionAmount" ToolTip="Dealer Commission Amount" CssClass="styleDisplayLabel" Text="Dealer Commission Amount"></asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>--%>
                        </div>

                        <div class="row">
                            <%-- <asp:Button ID="btnOK" ValidationGroup="TabAssetDetails" runat="server" CausesValidation="true"
                        class="css_btn_enabled" Text="OK" UseSubmitBehavior="False" OnClick="btnOK_Click" />--%>
                            <%--                    <asp:Button ID="btnCancel" runat="server" CausesValidation="false" class="css_btn_enabled"
                        Text="Exit" UseSubmitBehavior="False" ValidationGroup="TabAssetDetails" OnClick="btnCancel_Click" />--%>
                            <button class="css_btn_enabled" id="btnOK" title="Exit[Alt+O]" validationgroup="TabAssetDetails" onclick="if(funPriCheckSaveValidation())" causesvalidation="false" onserverclick="btnOK_Click" runat="server"
                                type="button" accesskey="O">
                                <i class="fa fa-arrow-down" aria-hidden="true"></i>&emsp;<u>O</u>K
                            </button>
                            <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                type="button" accesskey="X">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                            </button>
                        </div>
                        <div style="display: none" class="row">
                            <asp:ValidationSummary ID="vs_TabAssetDetails" runat="server" CssClass="styleMandatoryLabel"
                                Width="705px" ValidationGroup="TabAssetDetails" HeaderText="Correct the following validation(s):  " />
                            <asp:CustomValidator ID="cv_TabAssetDetails" runat="server" CssClass="styleMandatoryLabel"
                                Display="None" ValidationGroup="TabAssetDetails"></asp:CustomValidator>
                            <asp:Label ID="lblErrorMessage" runat="server" Style="color: Red; font-size: 14px">
                            </asp:Label>
                        </div>
                        <div style="display: none" class="row">
                            <asp:CustomValidator ID="cvApplicationAsset" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" Width="98%" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <input type="hidden" id="hdnCustomerID" runat="server" />
    <input type="hidden" id="hdnAssetAvailDate" runat="server" />
    <script src="../Content/Scripts/UserScript.js"></script>
    <script language="javascript" type="text/javascript">


        //window.onunload = refreshParent;
        //function refreshParent() {
        //alert('hi');
        //opener.window.document.getElementById(strControl).focus();
        //window.close();
        //}

        function funBacktoParenWindow() {

            opener.window.document.getElementById('ctl00_ContentPlaceHolder1_TabContainerAP_TabMainPage_TabContainerMainTab_TabAssetDetails_txtAssetFocus').focus();
            window.close();
        }


        function funcalassetvalue() {

            var varTotalAmt;
            var varSetZero;
            varSetZero = 0;
            document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = "0";

            var vUnitCount = document.getElementById('<%=txtUnitCount.ClientID %>').value;

            if (vUnitCount == "") {
                vUnitCount = 0;
            }




            if (parseFloat(vUnitCount) > 500) {
                alert('Asset Unit Count Should not exceed the 500');
                document.getElementById('<%=txtUnitCount.ClientID %>').value = "";
                return;
            }

            if (document.getElementById('<%=txtUnitCount.ClientID %>').value != "" && document.getElementById('<%=txtUnitValue.ClientID %>').value != "") {
                varTotalAmt = document.getElementById('<%=txtTotalAssetValue.ClientID %>').value = (parseFloat(document.getElementById('<%=txtUnitCount.ClientID %>').value) * parseFloat(document.getElementById('<%=txtUnitValue.ClientID %>').value)).toFixed(document.getElementById('<%=HdnGPSDecimal.ClientID %>').value);



                if (document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value != "") {
                    varTotalAmt = (varTotalAmt - parseFloat(document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value)).toFixed(3);
                }

                document.getElementById('<%=txtTotalAssetValue.ClientID %>').value = varTotalAmt; //-varMarginAmt;
                document.getElementById('<%=txtFinanceAmountAsset.ClientID %>').value = varTotalAmt;


            }
            else {
                document.getElementById('<%=txtTotalAssetValue.ClientID %>').value = "";
            }



            document.getElementById('<%=txtMargintoDealer.ClientID %>').value = varSetZero.toFixed(3);
            document.getElementById('<%=txtMargintoMFC.ClientID %>').value = varSetZero.toFixed(3);
            document.getElementById('<%=txtTradeIn.ClientID %>').value = varSetZero.toFixed(3);
            document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = varSetZero.toFixed(3);

        }



        function funcalassetMarginAmt_dp() {
            //Added by Sathish R on 20-Aug-2018
            var vartotper = 0;
            var VMargintoDealer = document.getElementById('<%=txtMargintoDealer.ClientID %>').value;
            var VtxtMargintoMFC = document.getElementById('<%=txtMargintoMFC.ClientID %>').value;
            var VtxtTotalMargin = 0;
            var VtxtLpoAssetAmount = document.getElementById('<%=txtFinanceAmountAsset.ClientID %>').value;
            var VtxtTotalAssetValue = document.getElementById('<%=txtTotalAssetValue.ClientID %>').value;
            var VtxtTradeIn = document.getElementById('<%=txtTradeIn.ClientID %>').value;


            var VtxtUnitValue = document.getElementById('<%=txtUnitValue.ClientID %>').value;



            if (VMargintoDealer == "") {
                VMargintoDealer = 0;
            }
            if (VtxtMargintoMFC == "") {
                VtxtMargintoMFC = 0;
            }
            if (VtxtLpoAssetAmount == "") {
                VtxtLpoAssetAmount = 0;
            }
            if (VtxtTotalAssetValue == "") {
                VtxtTotalAssetValue = 0;
            }
            if (VtxtTradeIn == "") {
                VtxtTradeIn = 0;
            }

            if (VtxtUnitValue == "") {
                VtxtUnitValue = 0;
            }


            VtxtTotalMargin = parseFloat(VMargintoDealer) + parseFloat(VtxtMargintoMFC) + parseFloat(VtxtTradeIn);



            if (parseFloat(VtxtTotalMargin) >= parseFloat(VtxtUnitValue)) {
                alert('Down Payment Amount should be Less than the Unit Value');
                document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = "";
                document.getElementById('<%=txtMarginPercentage.ClientID %>').value = "";
                return;
            }

            document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = parseFloat(VtxtTotalMargin).toFixed(3);
            if ((parseFloat(VtxtTotalAssetValue) - (parseFloat(VMargintoDealer) + parseFloat(VtxtMargintoMFC) + parseFloat(VtxtTradeIn))).toFixed(3) > 0) {
                document.getElementById('<%=txtFinanceAmountAsset.ClientID %>').value = (parseFloat(VtxtTotalAssetValue) - (parseFloat(VMargintoDealer) + parseFloat(VtxtMargintoMFC) + parseFloat(VtxtTradeIn))).toFixed(3);
            }
            else {
                alert('Lpo Amount Should be geater than the zero');
                document.getElementById('<%=txtFinanceAmountAsset.ClientID %>').value = "";
            }


            vartotper = (parseFloat(document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value) / parseFloat(document.getElementById('<%=txtTotalAssetValue.ClientID %>').value)) * 100;
            document.getElementById('<%=txtMarginPercentage.ClientID %>').value = vartotper.toFixed(2);

        }


        function funIsEmpty(textBox) {
            if (textBox.value == "") {
                textBox.value = "0";
            }
        }

        function ViewModal() {

            window.showModalDialog('../Origination/S3GOrgApplicationAssetDetails.aspx?qsMaster=Yes', 'Application Asset Details', 'dialogwidth:900px;dialogHeight:900px;');
        }
        function funPriCheckSaveValidation() {


            if (document.getElementById('<%=txtUnitValue.ClientID %>').value == "") {
                document.getElementById('<%=txtTotalAssetValue.ClientID %>').value = "";
                document.getElementById('<%=txtFinanceAmountAsset.ClientID %>').value = "";
                document.getElementById('<%=txtMarginPercentage.ClientID %>').value = "";
                document.getElementById('<%=txtMarginAmountAsset.ClientID %>').value = "";
            }


            if (!fnCheckPageValidators('TabAssetDetails', false)) {
                return false;
            }


            if (confirm('Do you want to Add Asset Details?')) {



                Page_BlockSubmit = false;
                var a = event.srcElement;

                if (a.type == "button") {
                    a.style.display = 'none';
                }
                //End here
                return true;
            }
            else {
                return false;
            }
        }


        function funAssetTypeChage() {//Sathish R-MFC Change-14-Nov-2018
            var v = document.getElementById('<%=ddlAssetType.ClientID %>').value;
            document.getElementById('<%=txtEngineNo.ClientID %>').value = "";
            document.getElementById('<%=txtChasisNumber.ClientID %>').value = "";
            if (v == "1") {
                document.getElementById('<%=txtEngineNo.ClientID %>').disabled = true;
                document.getElementById('<%=txtChasisNumber.ClientID %>').disabled = true;
                document.getElementById('<%=lblEngineNo.ClientID %>').className = "styleDisplayLabel";
                document.getElementById('<%=lblChasisNumber.ClientID %>').className = "styleDisplayLabel";

                document.getElementById('<%=rfvtxtEngineNo.ClientID %>').enabled = false;
                document.getElementById('<%=rfvtxtChasisNumber.ClientID %>').enabled = false;
                document.getElementById('<%=rfvtxtEngineNo.ClientID %>').style.visibility = "hidden";
                document.getElementById('<%=rfvtxtChasisNumber.ClientID %>').style.visibility = "hidden";
                document.getElementById('<%=divrfvtxtChasisNumber.ClientID %>').style.visibility = "hidden";
                document.getElementById('<%=divrfvtxtEngineNo.ClientID %>').style.visibility = "hidden";
            }
            else {

                document.getElementById('<%=txtEngineNo.ClientID %>').disabled = false;
                document.getElementById('<%=txtChasisNumber.ClientID %>').disabled = false;
                document.getElementById('<%=lblEngineNo.ClientID %>').className = "styleReqFieldLabel";
                document.getElementById('<%=lblChasisNumber.ClientID %>').className = "styleReqFieldLabel";

                document.getElementById('<%=rfvtxtEngineNo.ClientID %>').enabled = true;
                document.getElementById('<%=rfvtxtChasisNumber.ClientID %>').enabled = true;
                document.getElementById('<%=rfvtxtEngineNo.ClientID %>').style.visibility = "visible";
                document.getElementById('<%=rfvtxtChasisNumber.ClientID %>').style.visibility = "visible";

                document.getElementById('<%=divrfvtxtChasisNumber.ClientID %>').style.visibility = "visible";
                document.getElementById('<%=divrfvtxtEngineNo.ClientID %>').style.visibility = "visible";



            }



        }



    </script>


</asp:Content>
