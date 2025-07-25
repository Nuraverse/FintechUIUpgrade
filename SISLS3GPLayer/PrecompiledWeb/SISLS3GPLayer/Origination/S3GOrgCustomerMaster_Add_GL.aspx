<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3GOrgCustomerMaster_Add_GL, App_Web_midi1nyg" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <cc1:TabContainer ID="tcCustomerMaster" runat="server" CssClass="styleTabPanel" Width="99%"
                    TabStripPlacement="top" ActiveTabIndex="0">
                    <cc1:TabPanel runat="server" HeaderText="Customer Details" ID="tbAddress" CssClass="tabpan"
                        BackColor="Red" TabIndex="0">
                        <HeaderTemplate>
                            Main
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upAddress" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel GroupingText="Customer Informations" ID="pnlCustomerInfo" runat="server"
                                        CssClass="stylePanel">
                                        <table width="100%" border="0" cellspacing="0">
                                            <tr>
                                                <td class="styleFieldAlign">
                                                    <asp:CheckBox runat="server" ID="chkCustomer" Text="Customer" TextAlign="Right" />
                                                    <asp:CheckBox runat="server" ID="chkGuarantor1" Text="Guarantor1" TextAlign="Right" />
                                                    <asp:CheckBox runat="server" ID="chkGuarantor2" Text="Guarantor2" TextAlign="Right" />
                                                    <asp:CheckBox runat="server" ID="chkCoApplicant" Text="Co-Applicant" TextAlign="Right" />
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="100%" border="0" cellspacing="0">
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblCustomercode" CssClass="styleReqFieldLabel" Text="Customer Code"
                                                        Visible="False"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtCustomercode" runat="server" Width="60%" ReadOnly="True" Visible="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="20%">
                                                    <asp:Label runat="server" ID="lblTitle" CssClass="styleReqFieldLabel" Text="Title"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="30%">
                                                    <asp:DropDownList ID="ddlTitle" runat="server" Width="33%" TabIndex="0">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvTitle" runat="server" ControlToValidate="ddlTitle"
                                                        CssClass="styleMandatoryLabel" Display="None" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                                <td class="styleFieldLabel" width="20%">
                                                    <asp:Label runat="server" ID="lblCustomerName" CssClass="styleReqFieldLabel" Text="Customer Name"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="30%">
                                                    <asp:TextBox ID="txtCustomerName" runat="server" Width="95%" MaxLength="100" onfocusOut="fnvalidcustomername(this);"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtCustomerName" ValidChars=" ." TargetControlID="txtCustomerName"
                                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                        Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ValidationGroup="Main" ID="rvfCustomerName" runat="server"
                                                        ControlToValidate="txtCustomerName" CssClass="styleMandatoryLabel" Display="None"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblCustomerType" CssClass="styleReqFieldLabel" Text="Customer Type"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:UpdatePanel ID="upCustomerType" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:DropDownList ID="ddlCustomerType" runat="server" Width="50%" OnSelectedIndexChanged="ddlCustomerType_OnSelectedIndexChanged"
                                                                AutoPostBack="True">
                                                            </asp:DropDownList>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvCustomerType" runat="server"
                                                        ControlToValidate="ddlCustomerType" CssClass="styleMandatoryLabel" Display="None"
                                                        InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblFamilyName" CssClass="styleDisplayLabel" Text="Family Name"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtFamilyName" runat="server" MaxLength="50" Width="75%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <asp:UpdatePanel ID="upGroupCode" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label runat="server" ID="lblgroupcode" CssClass="styleDisplayLabel" Text="Group Code / Name"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="cmbGroupCode" runat="server" MaxLength="4" OnTextChanged="cmbGroupCode_OnTextChanged"
                                                                AutoPostBack="true" Width="23%"></asp:TextBox>
                                                            <cc1:TextBoxWatermarkExtender ID="txtwmkGroupCode" WatermarkText="--Select--" runat="server"
                                                                TargetControlID="cmbGroupCode" Enabled="true">
                                                            </cc1:TextBoxWatermarkExtender>
                                                            <cc1:AutoCompleteExtender ID="AutoCompleteExtenderDemo" runat="server" TargetControlID="cmbGroupCode"
                                                                ServiceMethod="GetCompletionList" MinimumPrefixLength="1" CompletionSetCount="20"
                                                                DelimiterCharacters="" Enabled="True" ServicePath="">
                                                            </cc1:AutoCompleteExtender>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="cmbGroupCode"
                                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                                Enabled="True">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <asp:TextBox ID="txtGroupName" runat="server" MaxLength="50" Width="60%"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvGroupName" runat="server" ControlToValidate="txtGroupName"
                                                                Enabled="false" Display="None" SetFocusOnError="true" ValidationGroup="Main"
                                                                ErrorMessage="Enter the Group Name"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label runat="server" ID="lblConstitutionName" CssClass="styleReqFieldLabel"
                                                                Text="Constitution Name"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:UpdatePanel ID="upConstitutionName" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:DropDownList ID="ddlConstitutionName" runat="server" Width="77%" AutoPostBack="True"
                                                                        OnSelectedIndexChanged="ddlConstitutionName_OnSelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                            <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvConstitutionName" runat="server"
                                                                ControlToValidate="ddlConstitutionName" CssClass="styleMandatoryLabel" Display="None"
                                                                InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </tr>
                                            <tr>
                                                <asp:UpdatePanel ID="upIndustryCode" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label runat="server" ID="lblIndustryCode" CssClass="styleDisplayLabel" Text="Industry Code / Name"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="cmbIndustryCode" runat="server" MaxLength="3" OnTextChanged="cmbIndustryCode_OnTextChanged"
                                                                AutoPostBack="true" Width="23%"></asp:TextBox>
                                                            <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" WatermarkText="--Select--"
                                                                runat="server" TargetControlID="cmbIndustryCode" Enabled="true">
                                                            </cc1:TextBoxWatermarkExtender>
                                                            <cc1:AutoCompleteExtender ID="AutoCompleteList" runat="server" TargetControlID="cmbIndustryCode"
                                                                ServiceMethod="GetIndustryList" MinimumPrefixLength="1" CompletionSetCount="3"
                                                                DelimiterCharacters="" Enabled="True" ServicePath="">
                                                            </cc1:AutoCompleteExtender>
                                                            <cc1:FilteredTextBoxExtender ID="FTBEIndustryCode" runat="server" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                Enabled="True" TargetControlID="cmbIndustryCode">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <asp:RequiredFieldValidator ID="rfvIndustryCode" runat="server" ControlToValidate="cmbIndustryCode"
                                                                Display="None" InitialValue="" SetFocusOnError="true" ValidationGroup="Main"
                                                                Enabled="false" ErrorMessage="Select / Enter the Industry Code"></asp:RequiredFieldValidator>
                                                            <asp:TextBox ID="txtIndustryName" runat="server" Width="60%" MaxLength="50"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtIndustryName" runat="server" Enabled="True"
                                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtIndustryName"
                                                                ValidChars="  .~`!@#$%^&amp;*()_-+=[]{};':&lt;&gt;,?/">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <asp:RequiredFieldValidator ID="rfvIndustryName" runat="server" ControlToValidate="txtIndustryName"
                                                                Enabled="false" Display="None" SetFocusOnError="true" ValidationGroup="Main"
                                                                ErrorMessage="Enter the Industry Name"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td class="styleFieldLabel" valign="top">
                                                            <asp:Label runat="server" ID="lblNotes" CssClass="styleDisplayLabel" Text="Notes"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" rowspan="2">
                                                            <asp:TextBox ID="txtNotes" runat="server" Width="90%" MaxLength="250" TextMode="MultiLine"
                                                                onkeyup="maxlengthfortxt(250);"></asp:TextBox>
                                                        </td>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblCustomerPostingGroup" CssClass="styleReqFieldLabel"
                                                        Text="Posting Group Code"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:DropDownList ID="ddlPostingGroup" runat="server" Width="230px">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvPostingGroup" runat="server"
                                                        ControlToValidate="ddlPostingGroup" CssClass="styleMandatoryLabel" Display="None"
                                                        SetFocusOnError="True" InitialValue="-1" ErrorMessage="Select a Customer Posting Code"></asp:RequiredFieldValidator>
                                                    <asp:RadioButtonList ID="rbCreditType" runat="server" RepeatDirection="Horizontal"
                                                        AutoPostBack="false" Visible="false" ToolTip="Credit Type">
                                                        <asp:ListItem Text="Oneshot" Value="0" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Revolving" Value="1"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <table width="100%">
                                        <tr>
                                            <td width="49%">
                                                <asp:Panel GroupingText="Communication Address" ID="pnlCommAddress" runat="server"
                                                    CssClass="stylePanel">
                                                    <table width="100%" align="center" cellspacing="0">
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%" style="padding-bottom: 0px">
                                                                <asp:Label ID="lblComAddress1" runat="server" CssClass="styleReqFieldLabel" Text="Address 1"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                                <%--<asp:TextBox ID="txtComAddress1" runat="server" MaxLength="60" TextMode="MultiLine"
                                                                    Columns="30" onkeyup="maxlengthfortxt(64)"></asp:TextBox>--%>
                                                                <asp:TextBox ID="txtComAddress1" runat="server" MaxLength="60" Width="95%"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvComAddress1" runat="server" ControlToValidate="txtComAddress1"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%" style="padding-bottom: 0px">
                                                                <asp:Label ID="lblComAddress2" runat="server" CssClass="styleDisplayLabel" Text="Address 2"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <%-- <asp:TextBox ID="txtCOmAddress2" runat="server" MaxLength="60" TextMode="MultiLine"
                                                                    Columns="30" onkeyup="maxlengthfortxt(64)"></asp:TextBox>--%>
                                                                <asp:TextBox ID="txtCOmAddress2" runat="server" MaxLength="60" Width="95%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%" style="padding-bottom: 0px">
                                                                <asp:Label ID="lblComcity" runat="server" CssClass="styleReqFieldLabel" Text="City"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <uc2:Suggest ID="txtComCity" runat="server" ServiceMethod="GetCityList" ValidationGroup="Main"
                                                                    IsMandatory="true" ItemToValidate="Text" Width="170px" />
                                                                <%--<asp:TextBox ID="txtComCity" runat="server" MaxLength="30" Width="60%"></asp:TextBox>--%>
                                                                <%--<cc1:ComboBox ID="txtComCity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                    AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                </cc1:ComboBox>--%>
                                                                <%--<cc1:FilteredTextBoxExtender ID="ftxtComCity" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    TargetControlID="txtComCity" ValidChars=" ">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                <%--<asp:RequiredFieldValidator ID="rfvComCity" runat="server" ControlToValidate="txtComCity"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Main"
                                                                    InitialValue="0"></asp:RequiredFieldValidator>--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label ID="lblComState" runat="server" CssClass="styleReqFieldLabel" Text="State"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <%--<asp:TextBox ID="txtComState" runat="server" MaxLength="60" Width="60%"></asp:TextBox>--%>
                                                                <cc1:ComboBox ID="txtComState" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                    AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                </cc1:ComboBox>
                                                                <%--<cc1:FilteredTextBoxExtender ID="ftxtComState" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    TargetControlID="txtComState" ValidChars=" ">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                <asp:RequiredFieldValidator ID="rfvComState" runat="server" ControlToValidate="txtComState"
                                                                    InitialValue="0" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                    ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label ID="lblComCountry" runat="server" CssClass="styleReqFieldLabel" Text="Country"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <%-- <asp:TextBox ID="txtComCountry" runat="server" MaxLength="60" Width="37%"></asp:TextBox>--%>
                                                                <cc1:ComboBox ID="txtComCountry" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                    AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                                    Width="80px">
                                                                </cc1:ComboBox>
                                                                <%--<cc1:FilteredTextBoxExtender ID="ftxtComCountry" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    TargetControlID="txtComCountry" ValidChars=" ">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                <asp:RequiredFieldValidator ID="rfvComCountry" runat="server" ControlToValidate="txtComCountry"
                                                                    InitialValue="0" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                    ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                                <asp:Label ID="lblCompincode" runat="server" CssClass="styleReqFieldLabel" Text="PIN"></asp:Label>
                                                                <asp:TextBox ID="txtComPincode" runat="server" MaxLength="10" Width="34%"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtComPincode" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    TargetControlID="txtComPincode" ValidChars=" ">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:RequiredFieldValidator ID="rfvComPincode" runat="server" ControlToValidate="txtComPincode"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label ID="lblComTelephone" runat="server" CssClass="styleReqFieldLabel" Text="Telephone"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtComTelephone" runat="server" MaxLength="12" Width="102px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtComTelephone" runat="server" Enabled="True"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtComTelephone"
                                                                    ValidChars=" -">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:RequiredFieldValidator ID="rfvComTelephone" runat="server" ControlToValidate="txtComTelephone"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                                <asp:Label ID="lblComMobile" runat="server" CssClass="styleDisplayLabel" Text="[M]"></asp:Label>
                                                                &nbsp;&nbsp;
                                                                <asp:TextBox ID="txtComMobile" runat="server" MaxLength="12" Width="34%"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtComMobile" runat="server" Enabled="True" FilterType="Numbers"
                                                                    TargetControlID="txtComMobile" ValidChars=" -">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label ID="lblComEmail" runat="server" CssClass="styleDisplayLabel" Text="EMail Id"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtComEmail" runat="server" MaxLength="60" Width="85%"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvComEmail" runat="server" ControlToValidate="txtComEmail"
                                                                    Enabled="false" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                    ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="revEmailId" runat="server" ControlToValidate="txtComEmail"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationExpression="^[\w\.=-]+@[\w\.-]+\.[\w]{2,3}$"
                                                                    ValidationGroup="Main" Enabled="false"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label ID="lblComWebSite" runat="server" CssClass="styleDisplayLabel" Text="Web Site"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtComWebsite" runat="server" MaxLength="60" Width="85%"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="revComWebsite" runat="server" ControlToValidate="txtComWebsite"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"
                                                                    ValidationGroup="Main"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnCopyAddress" runat="server" Text=">>" ToolTip="Copy Address" OnClick="btnCopyAddress_Click" />
                                            </td>
                                            <td width="49%">
                                                <asp:Panel GroupingText="Permanent Address" ID="pnlPermenantAddress" runat="server"
                                                    CssClass="stylePanel">
                                                    <table width="100%" cellspacing="0">
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblPerAddress1" CssClass="styleReqFieldLabel" Text="Address 1"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <%-- <asp:TextBox ID="txtPerAddress1" runat="server" MaxLength="60" TextMode="MultiLine"
                                                                    onkeyup="maxlengthfortxt(64)" Columns="30"></asp:TextBox>--%>
                                                                <asp:TextBox ID="txtPerAddress1" runat="server" MaxLength="60" Width="95%"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvtxtPerAddress1" runat="server"
                                                                    ControlToValidate="txtPerAddress1" CssClass="styleMandatoryLabel" Display="None"
                                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblPerAddress2" CssClass="styleDisplayLabel" Text="Address 2"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <%-- <asp:TextBox ID="txtPerAddress2" runat="server" Columns="30" MaxLength="60" TextMode="MultiLine"
                                                                    onkeyup="maxlengthfortxt(64)"></asp:TextBox>--%>
                                                                <asp:TextBox ID="txtPerAddress2" runat="server" Columns="30" MaxLength="60" Width="95%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblPerCity" CssClass="styleReqFieldLabel" Text="City"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <uc2:Suggest ID="txtPerCity" runat="server" ServiceMethod="GetCityList" 
                                                                    ValidationGroup="Main" IsMandatory="true" ItemToValidate="Text" Width="170px"/>
                                                                <%-- <asp:TextBox ID="txtPerCity" runat="server" Width="60%" MaxLength="30"></asp:TextBox>--%>
                                                                <%-- <cc1:ComboBox ID="txtPerCity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                    AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                </cc1:ComboBox>--%>
                                                                <%-- <cc1:FilteredTextBoxExtender ID="ftxtPerCity" runat="server" ValidChars=" " FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    Enabled="True" TargetControlID="txtPerCity">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                <%-- <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvPerCity" runat="server"
                                                                    ControlToValidate="txtPerCity" CssClass="styleMandatoryLabel" Display="None"
                                                                    SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblPerState" CssClass="styleReqFieldLabel" Text="State"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <%--<asp:TextBox ID="txtPerState" runat="server" Width="60%" MaxLength="60"></asp:TextBox>--%>
                                                                <cc1:ComboBox ID="txtPerState" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                    AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                </cc1:ComboBox>
                                                                <%-- <cc1:FilteredTextBoxExtender ID="ftxtPerState" runat="server" ValidChars=" " FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    Enabled="True" TargetControlID="txtPerState">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvPerState" runat="server"
                                                                    ControlToValidate="txtPerState" CssClass="styleMandatoryLabel" Display="None"
                                                                    SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblPerCountry" CssClass="styleReqFieldLabel" Text="Country"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <%-- <asp:TextBox ID="txtPerCountry" runat="server" Width="37%" MaxLength="60"></asp:TextBox>--%>
                                                                <cc1:ComboBox ID="txtPerCountry" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                    AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                                    Width="80px">
                                                                </cc1:ComboBox>
                                                                <%-- <cc1:FilteredTextBoxExtender ID="ftxtPerCountry" runat="server" ValidChars=" " FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    Enabled="True" TargetControlID="txtPerCountry">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvPerCountry" runat="server"
                                                                    ControlToValidate="txtPerCountry" CssClass="styleMandatoryLabel" Display="None"
                                                                    SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                                                <asp:Label runat="server" ID="lblPerpincode" CssClass="styleReqFieldLabel" Text="PIN"></asp:Label>
                                                                <asp:TextBox ID="txtPerPincode" runat="server" Width="34%" MaxLength="10"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtPerPincode" runat="server" ValidChars=" " FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    Enabled="True" TargetControlID="txtPerPincode">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:RequiredFieldValidator ValidationGroup="Main" ID="rvfPerPincode" runat="server"
                                                                    ControlToValidate="txtPerPincode" CssClass="styleMandatoryLabel" Display="None"
                                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblPerTelephone" CssClass="styleReqFieldLabel" Text="Telephone"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtPerTelephone" runat="server" MaxLength="12" Width="102px"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtPerTelephone" runat="server" ValidChars=" -"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"
                                                                    TargetControlID="txtPerTelephone">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvPerTelephone" runat="server"
                                                                    ControlToValidate="txtPerTelephone" CssClass="styleMandatoryLabel" Display="None"
                                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <asp:Label runat="server" ID="lblPerMobile" CssClass="styleDisplayLabel" Text="[M]"></asp:Label>
                                                                &nbsp;&nbsp;
                                                                <asp:TextBox ID="txtPerMobile" runat="server" Width="34%" MaxLength="12"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtPerMobile" runat="server" ValidChars=" -" FilterType="Numbers"
                                                                    Enabled="True" TargetControlID="txtPerMobile">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblPerEmail" CssClass="styleDisplayLabel" Text="EMail Id"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtPerEmail" runat="server" Width="85%" MaxLength="60"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvPerEmail" runat="server"
                                                                    ControlToValidate="txtPerEmail" CssClass="styleMandatoryLabel" Display="None"
                                                                    Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ValidationGroup="Main" Enabled="false" ID="revPerEmail"
                                                                    runat="server" ControlToValidate="txtPerEmail" Display="None" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" ValidationExpression="^[\w\.=-]+@[\w\.-]+\.[\w]{2,3}$"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblPerWebSite" CssClass="styleDisplayLabel" Text="Web Site"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtPerWebSite" runat="server" Width="85%" MaxLength="60"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ValidationGroup="Main" ID="revPerWebSite" runat="server"
                                                                    ControlToValidate="txtPerWebSite" Display="None" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlCustomerType" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Personal Details" ID="tpPersonal" CssClass="tabpan"
                        BackColor="Red">
                        <HeaderTemplate>
                            Personal Details
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upPersonal" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel GroupingText="Individual Customer" ID="pnlIndividual" runat="server" CssClass="stylePanel">
                                        <table width="100%" border="0" cellspacing="0">
                                            <tr>
                                                <td colspan="6">
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="styleFieldLabel" width="16%">
                                                                <asp:Label runat="server" ID="lblGender" CssClass="styleReqFieldLabel" Text="Gender"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="15%">
                                                                <asp:DropDownList ID="ddlGender" runat="server" Width="70%">
                                                                    <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="Female" Value="0"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvGender" runat="server"
                                                                    ControlToValidate="ddlGender" CssClass="styleMandatoryLabel" Display="None" InitialValue="-1"
                                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblDOB" CssClass="styleReqFieldLabel" Text="Date of Birth"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="18%">
                                                                <asp:TextBox ID="txtDOB" runat="server" Width="75%" ContentEditable="false" OnTextChanged="txtDOB_OnTextChanged"
                                                                    AutoPostBack="true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtDOB" runat="server" ValidChars="/-" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                    Enabled="true" TargetControlID="txtDOB">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:Image ID="imgDOB" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtDOB" PopupButtonID="imgDOB"
                                                                    Format="dd/MM/YYYY" ID="CalendarExtenderSD" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                </cc1:CalendarExtender>
                                                                <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvDOB" runat="server"
                                                                    ControlToValidate="txtDOB" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblAge" CssClass="styleDisplayLabel" Text="Age"></asp:Label>
                                                            </td>
                                                            <td width="23%">
                                                                <asp:TextBox ID="txtAge" runat="server" Width="30%" ReadOnly="True" Style="text-align: right;"></asp:TextBox>
                                                            </td>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6" style="height: 5px">
                                                    <hr class="styleCheklist" style="height: 0.5" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="styleFieldLabel" width="16%">
                                                                <asp:Label runat="server" ID="lblMaritalStatus" CssClass="styleDisplayLabel" Text="Marital Status"
                                                                    Width="99%"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="15%">
                                                                <asp:DropDownList ID="ddlMaritalStatus" runat="server" Width="98%">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblSpouseName" CssClass="styleDisplayLabel" Text="Spouse Name"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="18%">
                                                                <asp:TextBox ID="txtSpouseName" runat="server" MaxLength="40" Width="160px" Enabled="true"></asp:TextBox>
                                                            </td>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblChildren" CssClass="styleDisplayLabel" Text="Children"></asp:Label>
                                                            </td>
                                                            <td width="23%">
                                                                <asp:TextBox ID="txtChildren" runat="server" MaxLength="2" Width="30%" Enabled="false"
                                                                    Style="text-align: right;"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtChildren" runat="server" ValidChars="" FilterType="Numbers"
                                                                    Enabled="true" TargetControlID="txtChildren">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="16%">
                                                                <asp:Label runat="server" ID="lblTotalDependents" CssClass="styleDisplayLabel" Text="Total Dependents"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="15%">
                                                                <asp:TextBox ID="txtTotalDependents" runat="server" MaxLength="2" Width="20%" Enabled="false"
                                                                    Style="text-align: right;"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtTotalDependents" runat="server" ValidChars=""
                                                                    FilterType="Numbers" Enabled="true" TargetControlID="txtTotalDependents">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblWeddingdate" CssClass="styleDisplayLabel" Text="Wedding Date"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="18%">
                                                                <asp:TextBox ID="txtWeddingdate" runat="server" Width="75%" ContentEditable="false"
                                                                    Enabled="true"></asp:TextBox>
                                                                <asp:Image ID="ImgWeddingdate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtWeddingdate" PopupButtonID="ImgWeddingdate"
                                                                    Format="DD/MM/YYYY" ID="CalendarWeddingdate" Enabled="true" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                </cc1:CalendarExtender>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <hr class="styleCheklist" style="height: 0.5" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="styleFieldLabel" width="16%">
                                                                <asp:Label runat="server" ID="lblQualification" CssClass="styleReqFieldLabel" Text="Qualification"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="15%">
                                                                <asp:TextBox ID="txtQualification" runat="server" MaxLength="40" Width="140px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvQualification"
                                                                    runat="server" ControlToValidate="txtQualification" CssClass="styleMandatoryLabel"
                                                                    Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblProfession" CssClass="styleReqFieldLabel" Text="Profession"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="18%">
                                                                <asp:TextBox ID="txtProfession" runat="server" MaxLength="40" Width="155px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvtxtProfession"
                                                                    runat="server" ControlToValidate="txtProfession" CssClass="styleMandatoryLabel"
                                                                    Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblHouseType" CssClass="styleReqFieldLabel" Text="House/Flat"></asp:Label>
                                                            </td>
                                                            <td width="23%">
                                                                <asp:DropDownList ID="ddlHouseType" runat="server" Width="95%">
                                                                    <%--                                                                <asp:ListItem Value="-1" Text="<--Select-->"></asp:ListItem>
                                                                <asp:ListItem Text="House" Value="House"></asp:ListItem>
                                                                <asp:ListItem Text="Flat" Value="Flat"></asp:ListItem>--%>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvHouseType"
                                                                    runat="server" ControlToValidate="ddlHouseType" CssClass="styleMandatoryLabel"
                                                                    Display="None" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="14%">
                                                                <asp:Label runat="server" ID="lblOwn" CssClass="styleReqFieldLabel" Text="Own"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="15%">
                                                                <asp:DropDownList ID="ddlOwn" runat="server" Width="80%" onchange="fnDisableOwnMandatory(this);">
                                                                    <asp:ListItem Value="-1" Text="--Select--"></asp:ListItem>
                                                                    <asp:ListItem Text="YES" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="NO" Value="0"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvOwn" runat="server"
                                                                    ControlToValidate="ddlOwn" CssClass="styleMandatoryLabel" Display="None" InitialValue="-1"
                                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblCurrentMarketValue" CssClass="styleDisplayLabel"
                                                                    Text="Current Market Value"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="18%">
                                                                <asp:TextBox ID="txtCurrentMarketValue" runat="server" MaxLength="10" Width="70%"
                                                                    Style="text-align: right;"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtCurrentMarketValue" runat="server" ValidChars=""
                                                                    FilterType="Numbers" Enabled="true" TargetControlID="txtCurrentMarketValue">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="frvCurrentMarketValue"
                                                                    ErrorMessage="Enter the Current Market Value" runat="server" ControlToValidate="txtCurrentMarketValue"
                                                                    CssClass="styleMandatoryLabel" Enabled="false" Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblRemainingLoanValue" CssClass="styleDisplayLabel"
                                                                    Text="Remaining Loan Value"></asp:Label>
                                                            </td>
                                                            <td width="23%">
                                                                <asp:TextBox ID="txtRemainingLoanValue" runat="server" MaxLength="10" Width="96%"
                                                                    Style="text-align: right;"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtRemainingLoanValue" runat="server" ValidChars=""
                                                                    FilterType="Numbers" Enabled="true" TargetControlID="txtRemainingLoanValue">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblTotNetWorth" CssClass="styleDisplayLabel" Text="Total Net Worth"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="15%">
                                                                <asp:TextBox ID="txtTotNetWorth" runat="server" Width="95%" MaxLength="10" Style="text-align: right;"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtTotNetWorth" runat="server" ValidChars="" FilterType="Numbers"
                                                                    Enabled="true" TargetControlID="txtTotNetWorth">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel GroupingText="Non Individual Customer" ID="pnlNonIndividual" runat="server"
                                        CssClass="stylePanel">
                                        <table width="99%" cellspacing="0">
                                            <tr>
                                                <td class="styleFieldLabel" width="20%">
                                                    <asp:Label runat="server" ID="lblPublic" CssClass="styleReqFieldLabel" Text="Public/Closely held"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:DropDownList ID="ddlPublic" runat="server" Width="60%">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvPublic" runat="server"
                                                        ControlToValidate="ddlPublic" CssClass="styleMandatoryLabel" Display="None" InitialValue="-1"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblDirectors" CssClass="styleReqFieldLabel" Text="No.of Directors/Partners"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtDirectors" runat="server" Width="15%" MaxLength="2" Style="text-align: right;"
                                                        onblur="ChkIsZero(this, 'No.of Directors/Partners')"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtDirectors" runat="server" ValidChars="" FilterType="Numbers"
                                                        Enabled="true" TargetControlID="txtDirectors">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvDirectors"
                                                        runat="server" ControlToValidate="txtDirectors" CssClass="styleMandatoryLabel"
                                                        Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="20%">
                                                    <asp:Label runat="server" ID="lblStockExchange" CssClass="styleDisplayLabel" Text="Listed Exchange"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtSE" runat="server" Width="145px" MaxLength="40"></asp:TextBox>
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblPaidCapital" CssClass="styleDisplayLabel" Text="Paid Up Capital"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtPaidCapital" runat="server" Width="45%" MaxLength="11" Style="text-align: right;"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtPaidCapital" runat="server" ValidChars="" FilterType="Numbers"
                                                        Enabled="true" TargetControlID="txtPaidCapital">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="20%">
                                                    <asp:Label runat="server" ID="lblfacevalue" CssClass="styleDisplayLabel" Text="Face Value of Shares"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtfacevalue" runat="server" Width="35%" MaxLength="7" Style="text-align: right;"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtfacevalue" runat="server" ValidChars="" FilterType="Numbers"
                                                        Enabled="true" TargetControlID="txtfacevalue">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblbookvalue" CssClass="styleDisplayLabel" Text="Book Value of Shares"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtbookvalue" runat="server" Width="30%" MaxLength="7" Style="text-align: right;"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtbookvalue" runat="server" ValidChars="" FilterType="Numbers"
                                                        Enabled="true" TargetControlID="txtbookvalue">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="20%">
                                                    <asp:Label runat="server" ID="lblBusinessProfile" CssClass="styleReqFieldLabel" Text="Business Profile"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtBusinessProfile" runat="server" Width="145px" MaxLength="240"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtBusinessProfile" runat="server" ValidChars=" .~`!@#$%^&*()_-+=[]{};':<>,?/"
                                                        FilterType="Custom,LowercaseLetters,UppercaseLetters,Numbers" Enabled="true"
                                                        TargetControlID="txtBusinessProfile">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvBusinessProfile"
                                                        runat="server" ControlToValidate="txtBusinessProfile" CssClass="styleMandatoryLabel"
                                                        Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblGeographical" CssClass="styleReqFieldLabel" Text="Geographical Coverage"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtGeographical" runat="server" Width="200px" MaxLength="120"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvGeographical"
                                                        runat="server" ControlToValidate="txtGeographical" CssClass="styleMandatoryLabel"
                                                        Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="20%">
                                                    <asp:Label runat="server" ID="lblnobranch" CssClass="styleReqFieldLabel" Text="No.of Branches"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtnobranch" runat="server" Width="15%" MaxLength="5" Style="text-align: right;"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtnobranch" runat="server" ValidChars="" FilterType="Numbers"
                                                        Enabled="true" TargetControlID="txtnobranch">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvnobranch" runat="server"
                                                        ControlToValidate="txtnobranch" CssClass="styleMandatoryLabel" Display="None"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblGovernment" CssClass="styleDisplayLabel" Text="Govt./ Institutional Participation"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:DropDownList ID="ddlGovernment" runat="server" Width="90%">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="20%">
                                                    <asp:Label runat="server" ID="lblStake" CssClass="styleDisplayLabel" Text="Promoters Stake %"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtPercentageStake" runat="server" Width="25%" Style="text-align: right;"
                                                        MaxLength="5" onkeypress="fnAllowNumbersOnly(true,false,this);"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvPercentageStake"
                                                        runat="server" ControlToValidate="txtPercentageStake" CssClass="styleMandatoryLabel"
                                                        ErrorMessage="Sum of Promoters Stake % and JV Partner Stake % should be 100"
                                                        Display="None" EnableClientScript="true" Enabled="false"></asp:RequiredFieldValidator>
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblJVPartnerName" CssClass="styleDisplayLabel" Text="JV Partner Name"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtJVPartnerName" runat="server" Width="210px" MaxLength="120"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="20%">
                                                    <asp:Label runat="server" ID="lblJVPartnerStake" CssClass="styleDisplayLabel" Text="JV Partner Stake %"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtJVPartnerStake" runat="server" Width="25%" Style="text-align: right;"
                                                        MaxLength="5" onkeypress="fnAllowNumbersOnly(true,false,this);"></asp:TextBox>
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblCEO" CssClass="styleReqFieldLabel" Text="CEO Name"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="20%">
                                                    <asp:TextBox ID="txtCEOName" runat="server" Width="210px" MaxLength="50"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvCEOName" runat="server"
                                                        ControlToValidate="txtCEOName" CssClass="styleMandatoryLabel" Display="None"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="20%">
                                                    <asp:Label runat="server" ID="lblCEOAge" CssClass="styleReqFieldLabel" Text="Age of CEO"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtCEOAge" runat="server" Width="15%" MaxLength="2" Style="text-align: right;"
                                                        onchange="ChkIsZero(this, 'Age of CEO')"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtCEOAge" runat="server" ValidChars="" FilterType="Numbers"
                                                        Enabled="true" TargetControlID="txtCEOAge">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvCEOAge" runat="server"
                                                        ControlToValidate="txtCEOAge" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvCheckAge" runat="server"
                                                        ControlToValidate="txtCEOAge" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                        Enabled="false" ErrorMessage="Experience of CEO is not match with age of CEO"></asp:RequiredFieldValidator>
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblCEOexperience" CssClass="styleReqFieldLabel" Text="Experience (in Years)"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtCEOexperience" runat="server" Width="15%" MaxLength="2" Style="text-align: right;"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtCEOexperience" runat="server" ValidChars=""
                                                        FilterType="Numbers" Enabled="true" TargetControlID="txtCEOexperience">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvCEOexperience"
                                                        runat="server" ControlToValidate="txtCEOexperience" CssClass="styleMandatoryLabel"
                                                        Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="20%">
                                                    <asp:Label runat="server" ID="lblResidentialAddress" CssClass="styleReqFieldLabel"
                                                        Text="Residential Address"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtResidentialAddress" runat="server" MaxLength="300" TextMode="MultiLine"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ValidationGroup="Personal Details" ID="rfvResidentialAddress"
                                                        runat="server" ControlToValidate="txtResidentialAddress" CssClass="styleMandatoryLabel"
                                                        Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblCEOWeddingDate" CssClass="styleDisplayLabel" Text="Wedding Anniversary Date"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtCEOWeddingDate" runat="server" ContentEditable="false" Width="40%"></asp:TextBox>
                                                    <asp:Image ID="imgCEOWeddingDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtCEOWeddingDate" PopupButtonID="imgCEOWeddingDate"
                                                        Format="DD/MM/YYYY" ID="CalendarCEOWeddingDate" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                    </cc1:CalendarExtender>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" ID="tbBankDetails" CssClass="tabpan" BackColor="Red">
                        <HeaderTemplate>
                            Bank Details
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <table cellpadding="0" id="tblBankDetails" runat="server" border="0" cellspacing="0"
                                        style="width: 99%">
                                        <tr>
                                            <td class="styleFieldLabel">
                                                <asp:Label runat="server" ID="lblAccountType" CssClass="styleReqFieldLabel" Text="Account Type"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <asp:DropDownList ID="ddlAccountType" runat="server">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ValidationGroup="Add" ID="rfvAccountType" runat="server"
                                                    ControlToValidate="ddlAccountType" CssClass="styleMandatoryLabel" Display="None"
                                                    InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel">
                                                <asp:Label runat="server" ID="lblAccountNumber" CssClass="styleReqFieldLabel" Text="Account Number"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <asp:TextBox ID="txtAccountNumber" runat="server" MaxLength="16"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftxtAccountNumber" runat="server" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                    Enabled="True" TargetControlID="txtAccountNumber">
                                                </cc1:FilteredTextBoxExtender>
                                                <asp:RequiredFieldValidator ValidationGroup="Add" ID="rfvAccountNumber" runat="server"
                                                    ControlToValidate="txtAccountNumber" CssClass="styleMandatoryLabel" Display="None"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="styleFieldLabel">
                                                <asp:Label runat="server" ID="lblMICRCode" CssClass="styleReqFieldLabel" Text="MICR Code"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <asp:TextBox ID="txtMICRCode" runat="server" Width="45%" MaxLength="10" onblur="jsMICRvaildate(this);"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftxtMICRCode" runat="server" ValidChars=" ." FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                    Enabled="True" TargetControlID="txtMICRCode">
                                                </cc1:FilteredTextBoxExtender>
                                                <asp:RequiredFieldValidator ValidationGroup="Add" ID="rfvMICRCode" runat="server"
                                                    ControlToValidate="txtMICRCode" CssClass="styleMandatoryLabel" Display="None"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel">
                                                <asp:Label runat="server" ID="lblBankName" CssClass="styleReqFieldLabel" Text="Bank Name"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" colspan="3">
                                                <asp:TextBox ID="txtBankName" runat="server" MaxLength="40" Width="40%"></asp:TextBox>
                                                <asp:RequiredFieldValidator ValidationGroup="Add" ID="rfvBankName" runat="server"
                                                    ControlToValidate="txtBankName" CssClass="styleMandatoryLabel" Display="None"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel">
                                                <asp:Label runat="server" ID="lblBankBranch" CssClass="styleReqFieldLabel" Text="Bank Branch"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" colspan="3">
                                                <asp:TextBox ID="txtBankBranch" runat="server" MaxLength="40" Width="40%"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftxtBankBranch" runat="server" ValidChars=" ." FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                    Enabled="True" TargetControlID="txtBankBranch">
                                                </cc1:FilteredTextBoxExtender>
                                                <asp:RequiredFieldValidator ValidationGroup="Add" ID="rfvBankBranch" runat="server"
                                                    ControlToValidate="txtBankBranch" CssClass="styleMandatoryLabel" Display="None"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel">
                                                <asp:Label runat="server" ID="lblBankAddress" CssClass="styleReqFieldLabel" Text="Bank Address"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" colspan="2">
                                                <asp:TextBox ID="txtBankAddress" runat="server" MaxLength="300" TextMode="MultiLine"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftxtBankAddress" runat="server" ValidChars="  :;!@$%^&*_-'.#,/(`)?+<>\~[]{}=|"
                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"
                                                    TargetControlID="txtBankAddress">
                                                </cc1:FilteredTextBoxExtender>
                                                <asp:RequiredFieldValidator ValidationGroup="Add" ID="rfvBankAddress" runat="server"
                                                    ControlToValidate="txtBankAddress" CssClass="styleMandatoryLabel" Display="None"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:CheckBox runat="server" ID="chkDefaultAccount" CssClass="styleDisplayLabel"
                                                    Text="Default Account" />
                                            </td>
                                            <td align="center">
                                                <asp:Button ID="btnAdd" runat="server" CssClass="styleSubmitShortButton" OnClick="btnAdd_Click"
                                                    OnClientClick="return fnCheckPageValidators('Add','f');" Text="Add" ValidationGroup="Add" />
                                                <asp:Button ID="btnModify" runat="server" CssClass="styleSubmitShortButton" OnClick="btnModify_Click"
                                                    OnClientClick="return fnCheckPageValidators('Add','f');" Text="Modify" ValidationGroup="Add" />
                                                <asp:Button ID="btnBnkClear" runat="server" CausesValidation="false" CssClass="styleSubmitShortButton"
                                                    Text="Clear" OnClick="btnBnkClear_Click" />
                                                <input id="hdnBankId" runat="server" type="hidden"></input>
                                            </td>
                                        </tr>
                                    </table>
                                    <table width="100%">
                                        <tr>
                                            <td align="left" width="80%">
                                                <div style="overflow: auto; width: 98%;">
                                                    <br />
                                                    <asp:GridView ID="grvBankDetails" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        EmptyDataText="No Bank Details Found!..." OnRowDataBound="grvBankDetails_RowDataBound"
                                                        OnRowDeleting="grvBankDetails_RowDeleting" OnSelectedIndexChanged="grvBankDetails_SelectedIndexChanged"
                                                        Width="100%">
                                                        <Columns>
                                                            <asp:CommandField ShowSelectButton="True" Visible="false" />
                                                            <asp:TemplateField HeaderText="ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBankMappingId" runat="server" Text='<%#Bind("BankMapping_ID") %>'></asp:Label></ItemTemplate>
                                                                <ItemStyle Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Entity ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMasterId" runat="server" Text='<%#Bind("Master_ID") %>'></asp:Label></ItemTemplate>
                                                                <ItemStyle Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Account Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAccountType" runat="server" Text='<%#Bind("AccountType") %>'></asp:Label></ItemTemplate>
                                                                <ItemStyle Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="AccountType_ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAccountTypeId" runat="server" Text='<%#Bind("AccountType_ID") %>'></asp:Label></ItemTemplate>
                                                                <ItemStyle Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="Account_Number" HeaderText="Account Number">
                                                                <ItemStyle Width="5%" Wrap="True" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="MICR_Code" HeaderText="MICR Code">
                                                                <ItemStyle Width="10%" Wrap="True" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Bank_Name" HeaderText="Bank Name">
                                                                <ItemStyle Width="10%" Wrap="True" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Branch_Name" HeaderText="Bank Branch">
                                                                <ItemStyle Width="10%" Wrap="True" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="Bank Address">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="lblBankAddress" Enabled="false" runat="server" Text='<%#Bind("Bank_Address") %>'
                                                                        TextMode="MultiLine"></asp:TextBox></ItemTemplate>
                                                                <ItemStyle Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Default Account">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkDefaultAccount" Enabled="false" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "IsDefaultAccount")))%>' />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkbtnDelete" runat="server" CommandName="Delete" Text="Remove"></asp:LinkButton></ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <br />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:ValidationSummary ID="Bank" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                                    ShowMessageBox="false" HeaderText="Correct the following validation(s):" ValidationGroup="Add" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" ID="TabConstitution" CssClass="tabpan" BackColor="Red">
                        <HeaderTemplate>
                            Constitution Document Details</HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upConstitution" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="div2" style="overflow: auto; width: 98%; padding-left: 10px;" runat="server"
                                        border="1">
                                        <br />
                                        <asp:GridView ID="gvConstitutionalDocuments" runat="server" AutoGenerateColumns="False"
                                            Width="100%" OnRowDataBound="gvConstitutionalDocuments_RowDataBound">
                                            <Columns>
                                                <asp:BoundField DataField="ID" HeaderText="ID" />
                                                <asp:BoundField DataField="DocumentFlag" HeaderText="Document Flag">
                                                    <HeaderStyle Width="5%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="DocumentDescription" HeaderText="Document Description">
                                                    <HeaderStyle Width="35%" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Mandatory">
                                                    <ItemTemplate>
                                                        <%--<%# Bind("IsMandatory") %>--%>
                                                        <asp:CheckBox ID="chkIsMandatory" runat="server" Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "IsMandatory")))%>'>
                                                        </asp:CheckBox>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="5%" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Image Copy">
                                                    <ItemTemplate>
                                                        <%--<%# Bind("IsNeedImageCopy") %>--%>
                                                        <asp:CheckBox ID="chkIsNeedImageCopy" runat="server" Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "IsNeedImageCopy")))%>'>
                                                        </asp:CheckBox>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="5%" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="File Upload">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txOD" runat="server" Width="100px" MaxLength="500" Text='<%# Bind("Document_Path") %>'
                                                            Visible="false"></asp:TextBox><cc1:AsyncFileUpload ID="asyFileUpload" runat="server"
                                                                Width="175px" OnClientUploadComplete="uploadComplete" OnUploadedComplete="asyncFileUpload_UploadedComplete" />
                                                        <asp:Label runat="server" ID="myThrobber" Visible="false" Text='<%# Bind("Document_Path") %>'></asp:Label><asp:HiddenField
                                                            ID="hidThrobber" runat="server" />
                                                        <asp:TextBox ID="txthidden" runat="server" Width="100px" MaxLength="500" Text='<%# Bind("Document_Path") %>'
                                                            Visible="false"></asp:TextBox><input id="bOD" onclick="return openFileDialog(this.id,'bOD','fileOpenDocument','txOD', 'paper')"
                                                                style="width: 17px; height: 22px" type="button" runat="server" title="Click to browse file"
                                                                value="..." visible="False" /></ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="View">
                                                    <ItemTemplate>
                                                        <%--<%# Bind("IsNeedImageCopy") %>--%>
                                                        <asp:LinkButton ID="hlnkView" runat="server" OnClick="hlnkView_Click" Text="View"></asp:LinkButton></ItemTemplate>
                                                    <HeaderStyle Width="5%" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Remark" HeaderText="Remarks">
                                                    <HeaderStyle Width="35%" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Collected">
                                                    <ItemTemplate>
                                                        <%--<%# Bind("Collected") %>--%>
                                                        <asp:CheckBox ID="chkCollected" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Collected")))%>'>
                                                        </asp:CheckBox>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="5%" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Scanned">
                                                    <ItemTemplate>
                                                        <%--<%# Bind("Scanned") %>--%>
                                                        <asp:CheckBox ID="chkScanned" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Scanned")))%>'>
                                                        </asp:CheckBox>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="5%" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Values">
                                                    <ItemTemplate>
                                                        <%--<asp:TextBox ID="txtValues" runat="server" onkeypress="fnCheckSpecialChars(true)" MaxLength="20"
                                                            onkeyup="fnNotAllowPasteSpecialChar(this,'special')" Text='<%# Bind("Values") %>'></asp:TextBox>--%>
                                                        <asp:TextBox ID="txtValues" ValidationGroup="Customer" runat="server" MaxLength="30"
                                                            Text='<%# Bind("Values") %>'></asp:TextBox><%--><asp:RegularExpressionValidator
                                                            ID="revtxtPanNumber" runat="server" ErrorMessage="Enter a valid Tax Account Number" ValidationGroup="Customer" SetFocusOnError="true"
                                                            Display="None" ControlToValidate="txtValues" Enabled="false" ValidationExpression="[a-zA-Z_0-9](\w|\W)"></asp:RegularExpressionValidator><cc1:FilteredTextBoxExtender ID="FTBEtaxnumber" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                            TargetControlID="txtValues" runat="server" Enabled="false">
                                                        </cc1:FilteredTextBoxExtender>--%></ItemTemplate>
                                                    <HeaderStyle Width="5%" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" Visible="false" />
                                            </Columns>
                                        </asp:GridView>
                                        <br />
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" ID="TabCustomerTrack" CssClass="tabpan" BackColor="Red">
                        <HeaderTemplate>
                            Customer Track</HeaderTemplate>
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:CheckBox runat="server" ID="chkBadTrack" Text="Black Listed" TextAlign="Left"
                                            Font-Bold="true" Font-Size="Larger" />
                                    </td>
                                </tr>
                            </table>
                            <asp:Label ID="lblNoCustomerTrack" CssClass="styleDisplayLabel" runat="server" Text="No Customer Track Details Found!..."
                                Visible="false"></asp:Label><div id="divTrack" style="overflow: auto; width: 98%;
                                    padding-left: 1%;" runat="server" border="1">
                                    <br />
                                    <asp:GridView ID="gvTrack" AutoGenerateColumns="false" HorizontalAlign="Center" ShowFooter="true"
                                        runat="server" Width="100%" OnRowCreated="gvTrack_RowCreated" OnRowDataBound="gvTrack_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField Visible="false" HeaderText="Lob Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLobId" runat="server" Text='<%#Bind("LOB_ID") %>'></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Line of Business">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLOBName" runat="server" Text='<%#Bind("LOB_NAME") %>'></asp:Label></ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:DropDownList ID="ddlLOBTrack" runat="server">
                                                    </asp:DropDownList>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false" HeaderText="PA SA REF ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPASAREFId" runat="server" Text='<%#Bind("PA_SA_REF_ID") %>'></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Account No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAccountNo" runat="server" Text='<%#Bind("ACCOUNTNO") %>'></asp:Label></ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:DropDownList ID="ddlAccountNo" runat="server">
                                                    </asp:DropDownList>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField Visible="false" HeaderText="TRACKTYPEID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTrackTypeId" runat="server" Text='<%#Bind("TRACK_TYPE_ID") %>'></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTypeId" runat="server" Text='<%#Bind("TRACK_TYPE") %>'></asp:Label></ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:DropDownList ID="ddlType" runat="server">
                                                    </asp:DropDownList>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDate" runat="server" Text='<%#Bind("DATE")%>'></asp:Label></ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtDate" runat="server" Width="128px"></asp:TextBox><cc1:FilteredTextBoxExtender
                                                        ID="ftbDate" runat="server" ValidChars="/-" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                        Enabled="true" TargetControlID="txtDate">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtDate" ID="CalendarDate"
                                                        Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                    </cc1:CalendarExtender>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Reason">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReason" runat="server" Text='<%#Bind("REASON") %>'></asp:Label></ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtReason" runat="server" Width="140px" MaxLength="100" TextMode="MultiLine"
                                                        onkeyup="maxlengthfortxt(100)"></asp:TextBox></FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="LoginBy" HeaderText="Login By" />
                                            <asp:TemplateField HeaderText="Release Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReleaseDate" runat="server" Text='<%#Bind("RELEASEDATE")%>'></asp:Label></ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtReleaseDate" runat="server" Width="128px"></asp:TextBox><cc1:FilteredTextBoxExtender
                                                        ID="ftbReleaseDate" runat="server" ValidChars="/-" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                        Enabled="true" TargetControlID="txtReleaseDate">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtReleaseDate" ID="CalendarReleaseDate"
                                                        Enabled="True" OnClientDateSelectionChanged="checkDate_PrevSystemDate">
                                                    </cc1:CalendarExtender>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Released By Id" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReleasedBy" runat="server" Text='<%#Bind("RELEASED_BY") %>'></asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ReleasedBy" HeaderText="Released By" />
                                            <asp:TemplateField ItemStyle-Width="15%" FooterStyle-Width="15%">
                                                <FooterTemplate>
                                                    <asp:Button ID="btnAdd" runat="server" Text="Add" CausesValidation="true" ValidationGroup="Track"
                                                        CssClass="styleSubmitButton" OnClick="Track_AddRow_OnClick" />
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                </div>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" ID="TabCreditDetails" CssClass="tabpan" BackColor="Red">
                        <HeaderTemplate>
                            Customer Credit Details</HeaderTemplate>
                        <ContentTemplate>
                            <asp:Label ID="lblNoCreditDetails" CssClass="styleDisplayLabel" runat="server" Text="No Records Found!..."
                                Visible="false"></asp:Label><asp:Panel ID="Panel1" runat="server">
                                    <asp:GridView ID="gvCredit" AutoGenerateColumns="true" HorizontalAlign="Center" EmptyDataText="No Customer Credit Details Found!..."
                                        OnRowDataBound="gvCredit_RowDataBound" runat="server" Width="100%">
                                    </asp:GridView>
                                </asp:Panel>
                            <asp:Panel ID="pnlCustomerCreditDetails" runat="server" Visible="false">
                                <table cellpadding="0" cellspacing="0" style="width: 99%">
                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblLOBName" CssClass="styleDisplayLabel"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtLOBName" runat="server" Width="200px" ReadOnly="true"></asp:TextBox>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblProductGroup" CssClass="styleDisplayLabel"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtProductGroup" runat="server" Width="200px" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel" align="right">
                                            <asp:Label runat="server" ID="lblSanctionamt" CssClass="styleDisplayLabel" Style="text-align: right;"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign" align="right">
                                            <asp:TextBox ID="txtSanctionamt" runat="server" Width="200px" ReadOnly="true" Style="text-align: right;"></asp:TextBox>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblValid" CssClass="styleDisplayLabel"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtValidupto" runat="server" Width="178px" ReadOnly="true"></asp:TextBox><asp:Image
                                                ID="imgValidupto" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender runat="server" TargetControlID="txtValidupto" PopupButtonID="imgValidupto"
                                                ID="CalendarValidupto" Enabled="True" OnClientDateSelectionChanged="checkDate_PrevSystemDate">
                                            </cc1:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr align="right">
                                        <td class="styleFieldLabel" align="right">
                                            <asp:Label runat="server" ID="lblUtilizedAmt" CssClass="styleDisplayLabel" Style="text-align: right;"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign" align="right">
                                            <asp:TextBox ID="txtUtilizedAmt" runat="server" Width="200px" ReadOnly="true" Style="text-align: right;"></asp:TextBox>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblFacilityType" CssClass="styleDisplayLabel"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtFacilityType" runat="server" Width="200px" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                </cc1:TabContainer>
            </td>
        </tr>
        <tr>
            <td align="center">
                <br />
                <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" OnClick="btnSave_Click"
                    Text="Save" CausesValidation="true" ValidationGroup="Customer" OnClientClick="return fnCheckPageValidators('Customer')" />
                <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />
                <asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Cancel" OnClick="btnCancel_Click" />
                <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:ValidationSummary ID="vsCustomerMaster" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                    ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ShowMessageBox="false" HeaderText="Correct the following validation(s):"
                    ValidationGroup="Customer" />
                <asp:CustomValidator ID="cvCustomerMaster" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="txthiddenfield" runat="server" Visible="false"></asp:TextBox><script
        src="../Scripts/Common.js" language="javascript" type="text/javascript"></script><script
            language="javascript" type="text/javascript">
                                                                                             var querymode;
                                                                                             querymode = location.search.split("qsMode=");
                                                                                             querymode = querymode[1];

                                                                                             var tab;
                                                                                             function pageLoad() {
                                                                                                 tab = $find('ctl00_ContentPlaceHolder1_tcCustomerMaster');
                                                                                                 querymode = location.search.split("qsMode=");
                                                                                                 querymode = querymode[1];
                                                                                                 if (querymode != 'Q' && tab != null) {
                                                                                                     tab.add_activeTabChanged(on_Change);
                                                                                                     var newindex = tab.get_activeTabIndex(index);
                                                                                                     var btnSave = document.getElementById('<%=btnSave.ClientID %>')
                                                                                                     var btnclear = document.getElementById('<%=btnClear.ClientID %>')
                                                                                                     if (newindex > 2)

                                                                                                         btnSave.disabled = false;
                                                                                                     else

                                                                                                         btnSave.disabled = true;
                                                                                                 }
                                                                                             }

                                                                                             function fnDisableOwnMandatory(ddlOwn) {
                                                                                                 var own = ddlOwn.options.value;
                                                                                                 if (own == "1") {
                                                                                                     document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_frvCurrentMarketValue').enabled = true;
                                                                                                     document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_lblCurrentMarketValue').setAttribute("className", "styleReqFieldLabel");
                                                                                                     document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtCurrentMarketValue').disabled = false;
                                                                                                     document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtRemainingLoanValue').disabled = false;
                                                                                                     document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtTotNetWorth').disabled = false;



                                                                                                 }
                                                                                                 else if (own == "0") {
                                                                                                     document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_frvCurrentMarketValue').enabled = false;
                                                                                                     document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_lblCurrentMarketValue').setAttribute("className", "styleDisplayLabel");
                                                                                                     document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtCurrentMarketValue').disabled = true;
                                                                                                     document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtRemainingLoanValue').disabled = true;
                                                                                                     document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtTotNetWorth').disabled = true;
                                                                                                     document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtCurrentMarketValue').value = "";
                                                                                                     document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtRemainingLoanValue').value = "";
                                                                                                     document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_txtTotNetWorth').value = "";
                                                                                                 }

                                                                                             }
                                                                                             function jsMICRvaildate(txtMICRCode) {
                                                                                                 if (txtMICRCode.value.length > 0) {
                                                                                                     if (txtMICRCode.value.length < txtMICRCode.maxLength) {
                                                                                                         alert('Enter a valid MICR Code');
                                                                                                         document.getElementById(txtMICRCode.id).focus();
                                                                                                     }
                                                                                                 }
                                                                                             }
                                                                                             function fnSetEmptyText(txtControl) {
                                                                                                 txtControl.setAttribute("value", "");
                                                                                                 txtControl.setAttribute("readonly", true);
                                                                                             }
                                                                                             function fnvalidcustomername(txtCustomerName) {
                                                                                                 if (txtCustomerName.value == "0") {
                                                                                                     alert('Customer Name should not be 0');
                                                                                                     document.getElementById(txtCustomerName.id).focus();
                                                                                                 }
                                                                                                 //Added by saranya for issue raised by vasanth on 03-Mar-2012
                                                                                                 if (txtCustomerName.value.split('  ')[1] != null) {
                                                                                                     alert('Customer Name should not carry more than one space between two words');
                                                                                                     document.getElementById(txtCustomerName.id).value = "";
                                                                                                     document.getElementById(txtCustomerName.id).focus();
                                                                                                 }
                                                                                                 //End Here
                                                                                             }
                                                                                             var index = 0;
                                                                                             function on_Change(sender, e) {

                                                                                                 var strValgrp = tab._tabs[index]._tab.outerText.trim();
                                                                                                 var Valgrp = document.getElementById('<%=vsCustomerMaster.ClientID %>')
                                                                                                 Valgrp.validationGroup = strValgrp;
                                                                                                 var newindex = tab.get_activeTabIndex(index);
                                                                                                 fnCheckStack();
                                                                                                 fnCheckCEOAge();
                                                                                                 var btnSave = document.getElementById('<%=btnSave.ClientID %>')
                                                                                                 var btnclear = document.getElementById('<%=btnClear.ClientID %>')
                                                                                                 if (newindex > 2) {
                                                                                                     btnSave.disabled = false;
                                                                                                 }
                                                                                                 else {
                                                                                                     btnSave.disabled = true;

                                                                                                 }
                                                                                                 if (newindex > index && index != 1) {
                                                                                                     if (!fnCheckPageValidators(strValgrp, false)) {
                                                                                                         tab.set_activeTabIndex(index);
                                                                                                         return;
                                                                                                     }
                                                                                                     else {
                                                                                                         switch (index) {
                                                                                                             case 0:
                                                                                                                 {
                                                                                                                     var cmbGroupCode = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_cmbGroupCode');
                                                                                                                     var txtGroupName = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_txtGroupName');
                                                                                                                     var chkCustomer = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_chkCustomer');
                                                                                                                     var chkGuarantor1 = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_chkGuarantor1');
                                                                                                                     var chkGuarantor2 = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_chkGuarantor2');
                                                                                                                     var chkCoApplicant = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tbAddress_chkCoApplicant');
                                                                                                                     if (cmbGroupCode.value != '--Select--' && txtGroupName.value == '') {
                                                                                                                         alert('Enter the Group Name');
                                                                                                                         tab.set_activeTabIndex(index);
                                                                                                                     }
                                                                                                                     else if ((!chkCustomer.checked) && (!chkGuarantor1.checked) && (!chkGuarantor2.checked) && (!chkCoApplicant.checked)) {
                                                                                                                         alert('Select atleast one Relation Type(Customer/Guarantor1/Guarantor2/Co-Applicant)');
                                                                                                                         tab.set_activeTabIndex(index);
                                                                                                                     }
                                                                                                                     else {
                                                                                                                         index = tab.get_activeTabIndex(index);

                                                                                                                     }
                                                                                                                 }
                                                                                                                 break;
                                                                                                         }
                                                                                                         index = tab.get_activeTabIndex(index);
                                                                                                         return;
                                                                                                     }
                                                                                                 }
                                                                                                 else {
                                                                                                     tab.set_activeTabIndex(newindex);
                                                                                                     index = tab.get_activeTabIndex(newindex);
                                                                                                 }

                                                                                             }
                                                                                             function uploadComplete(sender, args) {

                                                                                                 var objID = sender._inputFile.id.split("_");
                                                                                                 objID = "<%= gvConstitutionalDocuments.ClientID %>" + "_" + objID[5];
                                                                                                 if (document.getElementById("ctl00_ContentPlaceHolder1_tcCustomerMaster_TabConstitution_gvConstitutionalDocuments_ctl02_myThrobber") != null) {
                                                                                                     document.getElementById("ctl00_ContentPlaceHolder1_tcCustomerMaster_TabConstitution_gvConstitutionalDocuments_ctl02_myThrobber").innerText = args._fileName;
                                                                                                     document.getElementById("ctl00_ContentPlaceHolder1_tcCustomerMaster_TabConstitution_gvConstitutionalDocuments_ctl02_hidThrobber").value = args._fileName;
                                                                                                 }
                                                                                             }
                                                                                             function funCheckFirstLetterisNumeric(textbox, msg) {

                                                                                                 var FieldValue = new Array();
                                                                                                 FieldValue = textbox.value.trim();
                                                                                                 if (FieldValue.length > 0 && FieldValue.value != '') {
                                                                                                     if (isNaN(FieldValue[0])) {
                                                                                                         return true;
                                                                                                     }
                                                                                                     else {
                                                                                                         alert(msg + ' name cannot begin with a number');
                                                                                                         textbox.focus();
                                                                                                         textbox.value = '';
                                                                                                         event.returnValue = false;
                                                                                                         return false;
                                                                                                     }
                                                                                                 }
                                                                                             }

                                                                                             function fnCheckStack() {
                                                                                                 //alert('got');
                                                                                                 //debugger;
                                                                                                 var txtPromotersStake = document.getElementById('<%=txtPercentageStake.ClientID %>');
                                                                                                 var txtJVStake = document.getElementById('<%=txtJVPartnerStake.ClientID %>');

                                                                                                 var rfvPercentageStake = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_rfvPercentageStake');

                                                                                                 ValidatorEnable(rfvPercentageStake, false);
                                                                                                 rfvPercentageStake.initialvalue = '';

                                                                                                 if (txtPromotersStake.value != '' || txtJVStake.value != '') {
                                                                                                     if (parseFloat(txtPromotersStake.value) + parseFloat(txtJVStake.value) != 100) {
                                                                                                         ValidatorEnable(rfvPercentageStake, true);
                                                                                                         rfvPercentageStake.initialvalue = txtPromotersStake.value;
                                                                                                     }
                                                                                                 }
                                                                                             }

                                                                                             function fnCheckCEOAge() {
                                                                                                 //alert('got');
                                                                                                 var txtCEOAge = document.getElementById('<%=txtCEOAge.ClientID %>');
                                                                                                 var txtCEOexperience = document.getElementById('<%=txtCEOexperience.ClientID %>');

                                                                                                 var rfvCheckAge = document.getElementById('ctl00_ContentPlaceHolder1_tcCustomerMaster_tpPersonal_rfvCheckAge');
                                                                                                 ValidatorEnable(rfvCheckAge, false);
                                                                                                 rfvCheckAge.initialvalue = '';

                                                                                                 if (txtCEOAge.value != '' && txtCEOexperience.value != '') {
                                                                                                     if (parseFloat(txtCEOAge.value) <= parseFloat(txtCEOexperience.value)) {
                                                                                                         //alert('The Experience of CEO is not match with age of CEO.');
                                                                                                         //txtBox.value = '';
                                                                                                         ValidatorEnable(rfvCheckAge, true);
                                                                                                         rfvCheckAge.initialvalue = txtCEOAge.value;
                                                                                                     }
                                                                                                 }
                                                                                             }

                                                                                             //Added by Thangam M on 12/Mar/2012 to fix bug id - 5451
                                                                                             function fnClearAsyncUploader(rowCount) {
                                                                                                 //            debugger;

                                                                                                 for (var x = 0; x < rowCount; x++) {
                                                                                                     var ctrlName = 'ctl00_ContentPlaceHolder1_tcCustomerMaster_TabConstitution_gvConstitutionalDocuments_ctl';
                                                                                                     if (x.toString().length == 1)
                                                                                                         ctrlName = ctrlName + '0' + (x + 2).toString();
                                                                                                     else
                                                                                                         ctrlName = ctrlName + (x + 2).toString();

                                                                                                     ctrlName = ctrlName + '_asyFileUpload'

                                                                                                     var AsyncUploader = $get(ctrlName);
                                                                                                     if (AsyncUploader != null) {
                                                                                                         var txts = AsyncUploader.getElementsByTagName("input");

                                                                                                         for (var i = 0; i < txts.length; i++) {
                                                                                                             if (txts[i].type == "text") {
                                                                                                                 txts[i].value = "";
                                                                                                             }
                                                                                                         }
                                                                                                     }
                                                                                                 }
                                                                                             }
        
                                                                                             
        
        </script></asp:Content>
