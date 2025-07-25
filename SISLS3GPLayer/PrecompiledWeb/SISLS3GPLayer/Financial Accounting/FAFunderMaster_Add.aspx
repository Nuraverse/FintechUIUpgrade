<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAFunderMaster_Add, App_Web_mv5fp02i" title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
                <cc1:TabContainer ID="tcFunderMaster" runat="server" CssClass="styleTabPanel" Width="99%"
                    TabStripPlacement="top" ActiveTabIndex="0">
                    <cc1:TabPanel runat="server" HeaderText="Funder Details" ID="tbAddress" CssClass="tabpan"
                        BackColor="Red" TabIndex="0">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upAddress" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel GroupingText="Funder Informations" ID="pnlFunderInfo" runat="server" CssClass="stylePanel">
                                        <table width="100%" border="0" cellspacing="0">
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblFunderName" CssClass="styleReqFieldLabel" Text="Funder Name"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtFunderName" Width="165px" runat="server" MaxLength="50" onmouseover="txt_MouseoverTooltip(this)"
                                                        onblur="FunTrimwhitespace(this,'Funder Name');" onfocusOut="fnvalidFundername(this);"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtFunderName" ValidChars="-/()&&#8216;., " TargetControlID="txtFunderName"
                                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                        Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ValidationGroup="Main" ID="rvfFunderName" runat="server"
                                                        ErrorMessage="Enter Funder Name" ControlToValidate="txtFunderName" CssClass="styleMandatoryLabel"
                                                        Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblFundercode" CssClass="styleReqFieldLabel" Text="Funder Code"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtFundercode" Width="165px" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="True"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblGLCode" CssClass="styleReqFieldLabel" Text="Account"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <cc1:ComboBox ID="ddlGLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlGLCode_OnSelectedIndexChanged"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                    </cc1:ComboBox>
                                                    <%--<asp:DropDownList ID="ddlGLCode" Width="170px" runat="server" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlGLCode_OnSelectedIndexChanged" ToolTip="Account">
                                                    </asp:DropDownList>--%>
                                                    <asp:RequiredFieldValidator ID="rfvGLCode" runat="server" ControlToValidate="ddlGLCode"
                                                        InitialValue="--Select--" ErrorMessage="Select Account" Display="None" SetFocusOnError="True"
                                                        ValidationGroup="Main" />
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblTAXNo" CssClass="styleReqFieldLabel" Text="TAX Number" />
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtTAXNo" runat="server" Width="165px" MaxLength="20" onmouseover="txt_MouseoverTooltip(this)"
                                                        onblur="FunTrimwhitespace(this,'TAX Number');" ToolTip="TAX Number" />
                                                    <asp:RequiredFieldValidator ID="rfvTAX" runat="server" ControlToValidate="txtTAXNo"
                                                        Display="None" ErrorMessage="Enter TAX Number/VAT Number" SetFocusOnError="True"
                                                        ValidationGroup="Main" />
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" ValidChars="-/, ." TargetControlID="txtTAXNo"
                                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                        Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="20%">
                                                    <asp:Label runat="server" ID="lblSLCode" Text="Sub Account"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <cc1:ComboBox ID="ddlSLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlSLCode_OnSelectedIndexChanged"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                    </cc1:ComboBox>
                                                    <%--<asp:DropDownList ID="ddlSLCode" Width="170px" runat="server" Enabled="false" ToolTip="Sub Account"  
                                                     AutoPostBack ="true" OnSelectedIndexChanged ="ddlSLCode_OnSelectedIndexChanged">
                                                    </asp:DropDownList>--%>
                                                    <asp:RequiredFieldValidator ID="rfvSLCode" runat="server" ControlToValidate="ddlSLCode"
                                                        InitialValue="--Select--" ErrorMessage="Select Sub Account" Display="None" SetFocusOnError="True"
                                                        ValidationGroup="Main" />
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblVATNo" CssClass="styleReqFieldLabel" Text="VAT Number" />
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtVATNo" runat="server" MaxLength="20" Width="165px" onmouseover="txt_MouseoverTooltip(this)"
                                                        onblur="FunTrimwhitespace(this,'VAT Number');" ToolTip="VAT Number" />
                                                    <asp:RequiredFieldValidator ID="rfvVAT" runat="server" ControlToValidate="txtVATNo"
                                                        Enabled="false" Display="None" SetFocusOnError="True" ValidationGroup="Main" />
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" ValidChars="-/, ." TargetControlID="txtVATNo"
                                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                        Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                                <%--<td class="styleFieldLabel" width="25%">
                                 <asp:Label runat="server" ID="lblRemarks" Text="Remarks"/>

</td>
                                                <td class="styleFieldLabel" width="25%">
                                                <asp:TextBox ID="txtRemarks" runat ="server" ToolTip ="Remarks" />
                                                </td>--%>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblLocation" Text="Location" />
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                        AutoPostBack="true" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                    </cc1:ComboBox>
                                                    <%--<asp:DropDownList ID="ddlLocation" AutoPostBack="true" runat="server" Width="170px" ToolTip="Location" />--%>
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblRemarks" Text="Remarks" />
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:TextBox ID="txtRemarks" Width="165px" runat="server" MaxLength="100" onmouseover="txt_MouseoverTooltip(this)"
                                                        onblur="FunTrimwhitespace(this,'Remarks');" onkeyup="maxlengthfortxt(100);" TextMode="MultiLine"
                                                        ToolTip="Remarks" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label runat="server" ID="lblActive" Text="Active" />
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:CheckBox ID="chkActive" runat="server" />
                                                </td>
                                                <td class="styleFieldLabel" width="25%">
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
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
                                                                <asp:Label ID="lblComAddress1" runat="server" CssClass="styleReqFieldLabel" Text="Address1"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                                <%--<asp:TextBox ID="txtComAddress1" runat="server" MaxLength="60" TextMode="MultiLine"
                                                                    Columns="30" onkeyup="maxlengthfortxt(64)"></asp:TextBox>--%>
                                                                <asp:TextBox ID="txtComAddress1" runat="server" MaxLength="60" Width="95%" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Address1 in Communication Address');"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvComAddress1" runat="server" ControlToValidate="txtComAddress1"
                                                                    ErrorMessage="Enter Address1 in Communication Address" Display="None" SetFocusOnError="True"
                                                                    ValidationGroup="Main" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%" style="padding-bottom: 0px">
                                                                <asp:Label ID="lblComAddress2" runat="server" CssClass="styleDisplayLabel" Text="Address2"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <%-- <asp:TextBox ID="txtCOmAddress2" runat="server" MaxLength="60" TextMode="MultiLine"
                                                                    Columns="30" onkeyup="maxlengthfortxt(64)"></asp:TextBox>--%>
                                                                <asp:TextBox ID="txtCOmAddress2" runat="server" MaxLength="60" Width="95%" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Address2 in Communication Address');"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%" style="padding-bottom: 0px">
                                                                <asp:Label ID="lblComcity" runat="server" CssClass="styleReqFieldLabel" Text="City"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <%--<asp:TextBox ID="txtComCity" runat="server" MaxLength="30" Width="60%"></asp:TextBox>--%>
                                                                <cc1:ComboBox ID="txtComCity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                    onblur="FunTrimwhitespace(this,'City in Communication Address');" AppendDataBoundItems="true"
                                                                    CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                </cc1:ComboBox>
                                                                <%--<cc1:FilteredTextBoxExtender ID="ftxtComCity" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    TargetControlID="txtComCity" ValidChars=" ">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                <asp:RequiredFieldValidator ID="rfvComCity" runat="server" ControlToValidate="txtComCity"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Main"
                                                                    ErrorMessage="Enter City in Communication Address" InitialValue="0"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label ID="lblComState" runat="server" CssClass="styleReqFieldLabel" Text="State"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <%--<asp:TextBox ID="txtComState" runat="server" MaxLength="60" Width="60%"></asp:TextBox>--%>
                                                                <cc1:ComboBox ID="txtComState" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                    onblur="FunTrimwhitespace(this,'State in Communication Address');" AppendDataBoundItems="true"
                                                                    CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                </cc1:ComboBox>
                                                                <%--<cc1:FilteredTextBoxExtender ID="ftxtComState" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    TargetControlID="txtComState" ValidChars=" ">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                <asp:RequiredFieldValidator ID="rfvComState" runat="server" ControlToValidate="txtComState"
                                                                    InitialValue="0" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                    ErrorMessage="Enter State in Communication Address" ValidationGroup="Main"></asp:RequiredFieldValidator>
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
                                                                    ErrorMessage="Enter Country in Communication Address" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                                <asp:Label ID="lblCompincode" runat="server" CssClass="styleReqFieldLabel" Text="Pin"></asp:Label>
                                                                <asp:TextBox ID="txtComPincode" runat="server" MaxLength="10" Width="34%" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Pincode/Zipcode in Communication Address');"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtComPincode" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    TargetControlID="txtComPincode" ValidChars=" ">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:RequiredFieldValidator ID="rfvComPincode" runat="server" ControlToValidate="txtComPincode"
                                                                    ErrorMessage="Enter Pincode/Zipcode in Communication Address" CssClass="styleMandatoryLabel"
                                                                    Display="None" SetFocusOnError="True" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label ID="lblComTelephone" runat="server" CssClass="styleReqFieldLabel" Text="Telephone"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtComTelephone" runat="server" MaxLength="12" Width="102px" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Telephone in Communication Address');"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtComTelephone" runat="server" Enabled="True"
                                                                    FilterType="Numbers" TargetControlID="txtComTelephone">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:RequiredFieldValidator ID="rfvComTelephone" runat="server" ControlToValidate="txtComTelephone"
                                                                    ErrorMessage="Enter Telephone Number in Communication Address" CssClass="styleMandatoryLabel"
                                                                    Display="None" SetFocusOnError="True" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                                <asp:Label ID="lblComMobile" runat="server" CssClass="styleDisplayLabel" Text="[M]"></asp:Label>
                                                                &nbsp;&nbsp;
                                                                <asp:TextBox ID="txtComMobile" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    MaxLength="12" Width="34%"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtComMobile" runat="server" Enabled="True" FilterType="Numbers"
                                                                    TargetControlID="txtComMobile" ValidChars=" -">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label ID="lblComEmail" runat="server" CssClass="styleDisplayLabel" Text="e-Mail Id"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtComEmail" runat="server" MaxLength="60" Width="85%" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'e-Mail Id in Communication Address');"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvComEmail" runat="server" ControlToValidate="txtComEmail"
                                                                    Enabled="false" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                    ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="revEmailId" runat="server" ControlToValidate="txtComEmail"
                                                                    ErrorMessage=" Enter valid e-Mail Id in Communication Address" CssClass="styleMandatoryLabel"
                                                                    Display="None" SetFocusOnError="True" ValidationExpression="^[\w\.=-]+@[\w\.-]+\.[\w]{2,3}$"
                                                                    ValidationGroup="Main"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label ID="lblComWebSite" runat="server" CssClass="styleDisplayLabel" Text="Web Site"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtComWebsite" runat="server" MaxLength="60" Width="85%" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Web Site in Communication Address');"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ID="revComWebsite" runat="server" ControlToValidate="txtComWebsite"
                                                                    ErrorMessage=" Enter valid website in Communication Address (like www.s3g.com)"
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
                                                                <asp:Label runat="server" ID="lblPerAddress1" CssClass="styleReqFieldLabel" Text="Address1"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <%-- <asp:TextBox ID="txtPerAddress1" runat="server" MaxLength="60" TextMode="MultiLine"
                                                                    onkeyup="maxlengthfortxt(64)" Columns="30"></asp:TextBox>--%>
                                                                <asp:TextBox ID="txtPerAddress1" runat="server" MaxLength="60" Width="95%" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Address1 in Permanent Address');"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvtxtPerAddress1" runat="server"
                                                                    ErrorMessage="Enter Address1 in Permanent Address" ControlToValidate="txtPerAddress1"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblPerAddress2" CssClass="styleDisplayLabel" Text="Address2"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <%-- <asp:TextBox ID="txtPerAddress2" runat="server" Columns="30" MaxLength="60" TextMode="MultiLine"
                                                                    onkeyup="maxlengthfortxt(64)"></asp:TextBox>--%>
                                                                <asp:TextBox ID="txtPerAddress2" runat="server" Columns="30" MaxLength="60" Width="95%"
                                                                    onmouseover="txt_MouseoverTooltip(this)" onblur="FunTrimwhitespace(this,'Address2 in Permanent Address');"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblPerCity" CssClass="styleReqFieldLabel" Text="City"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <%-- <asp:TextBox ID="txtPerCity" runat="server" Width="60%" MaxLength="30"></asp:TextBox>--%>
                                                                <cc1:ComboBox ID="txtPerCity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                    AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                </cc1:ComboBox>
                                                                <%-- <cc1:FilteredTextBoxExtender ID="ftxtPerCity" runat="server" ValidChars=" " FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    Enabled="True" TargetControlID="txtPerCity">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvPerCity" runat="server"
                                                                    ErrorMessage="Enter City in Permanent Address" ControlToValidate="txtPerCity"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
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
                                                                    ErrorMessage="Enter State in Permanent Address" ControlToValidate="txtPerState"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
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
                                                                    ErrorMessage="Enter Country in Permanent Address" ControlToValidate="txtPerCountry"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                                                <asp:Label runat="server" ID="lblPerpincode" CssClass="styleReqFieldLabel" Text="Pin"
                                                                    onblur="FunTrimwhitespace(this,'Pincode/Zipcode in Permanent Address');"></asp:Label>
                                                                <asp:TextBox ID="txtPerPincode" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    Width="34%" MaxLength="10"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtPerPincode" runat="server" ValidChars=" " FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    Enabled="True" TargetControlID="txtPerPincode">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:RequiredFieldValidator ValidationGroup="Main" ID="rvfPerPincode" runat="server"
                                                                    ErrorMessage="Enter Pincode/Zipcode in Permanent Address" ControlToValidate="txtPerPincode"
                                                                    CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblPerTelephone" CssClass="styleReqFieldLabel" Text="Telephone"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtPerTelephone" runat="server" MaxLength="12" Width="102px" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Telephone in Permanent Address');"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtPerTelephone" runat="server" FilterType="Numbers"
                                                                    Enabled="True" TargetControlID="txtPerTelephone">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvPerTelephone" runat="server"
                                                                    ControlToValidate="txtPerTelephone" CssClass="styleMandatoryLabel" Display="None"
                                                                    ErrorMessage="Enter Telephone Number in Permanent Address" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <asp:Label runat="server" ID="lblPerMobile" CssClass="styleDisplayLabel" Text="[M]"></asp:Label>
                                                                &nbsp;&nbsp;
                                                                <asp:TextBox ID="txtPerMobile" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    Width="34%" MaxLength="12"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtPerMobile" runat="server" ValidChars=" -" FilterType="Numbers"
                                                                    Enabled="True" TargetControlID="txtPerMobile">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblPerEmail" CssClass="styleDisplayLabel" Text="e-Mail Id"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtPerEmail" runat="server" Width="85%" MaxLength="60" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'e-Mail Id in Permanent Address');"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ValidationGroup="Main" ID="rfvPerEmail" runat="server"
                                                                    ControlToValidate="txtPerEmail" CssClass="styleMandatoryLabel" Display="None"
                                                                    Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ValidationGroup="Main" ID="revPerEmail" ErrorMessage=" Enter valid e-Mail Id in Permanent Address"
                                                                    runat="server" ControlToValidate="txtPerEmail" Display="None" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" ValidationExpression="^[\w\.=-]+@[\w\.-]+\.[\w]{2,3}$"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label runat="server" ID="lblPerWebSite" CssClass="styleDisplayLabel" Text="Web Site"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtPerWebSite" runat="server" Width="85%" MaxLength="60" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Web Site in Permanent Address');"></asp:TextBox>
                                                                <asp:RegularExpressionValidator ValidationGroup="Main" ID="revPerWebSite" runat="server"
                                                                    ErrorMessage=" Enter valid website in Permanent Address (like www.s3g.com)" ControlToValidate="txtPerWebSite"
                                                                    Display="None" CssClass="styleMandatoryLabel" SetFocusOnError="True" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Conditions" ID="tpConditions" CssClass="tabpan"
                        BackColor="Red">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upConditions" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel GroupingText="Conditional Details" ID="Panel1" runat="server" CssClass="stylePanel"
                                        Width="100%">
                                        <asp:GridView ID="gvConditions" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                            Width="99%" OnRowDataBound="gvConditions_RowDataBound" OnRowCommand="gvConditions_RowCommand"
                                            OnRowDeleting="gvConditions_RowDeleting" OnRowEditing="gvConditions_RowEditing"
                                            OnRowCancelingEdit="gvConditions_RowCancelingEdit" OnRowUpdating="gvConditions_RowUpdating">
                                            <Columns>
                                                <%--Serial Number--%>
                                                <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="3%" />
                                                </asp:TemplateField>
                                                <%--Line of Business --%>
                                                <asp:TemplateField HeaderText="Line of Business">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLOB" runat="server" Text='<%#Eval("LOB") %>' ToolTip="Line of Business" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" OnSelectedIndexChanged="FunProGet_S3G_Credit_Exposure">
                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                            InitialValue="0" ErrorMessage="Select Line of Business" Display="None" SetFocusOnError="True"
                                                            ValidationGroup="vgAdd" />
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <center>
                                                            <asp:DropDownList ID="ddlLOB" runat="server" Width="110px" AutoPostBack="true" OnSelectedIndexChanged="ddlLOB_OnSelectedIndexChanged">
                                                                <asp:ListItem Value="0" Text="--Select--" />
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                                InitialValue="0" ErrorMessage="Select Line of Business" Display="None" SetFocusOnError="True"
                                                                ValidationGroup="vgAdd" />
                                                        </center>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="13%" />
                                                    <FooterStyle Width="13%" />
                                                </asp:TemplateField>
                                                <%--Asset --%>
                                                <asp:TemplateField HeaderText="Asset Category">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAsset" runat="server" Text='<%#Eval("AssetCat") %>' ToolTip="Asset Category" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddlAssetCategory" AutoPostBack="true" runat="server">
                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <center>
                                                            <asp:DropDownList ID="ddlAssetCategory" runat="server" AutoPostBack="true" Width="110px">
                                                                <asp:ListItem Value="0" Text="--Select--" />
                                                            </asp:DropDownList>
                                                        </center>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="13%" />
                                                    <FooterStyle Width="13%" />
                                                </asp:TemplateField>
                                                <%--Asset Class--%>
                                                <asp:TemplateField HeaderText="Asset Class">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAssetClass" runat="server" Text='<%#Eval("AssetClass") %>' ToolTip="Asset Class" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddlAssetClass" runat="server">
                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <center>
                                                            <asp:DropDownList ID="ddlAssetClass" runat="server" Width="110px">
                                                                <asp:ListItem Value="0" Text="--Select--" />
                                                            </asp:DropDownList>
                                                        </center>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="13%" />
                                                    <FooterStyle Width="13%" />
                                                </asp:TemplateField>
                                                <%--Category--%>
                                                <asp:TemplateField HeaderText="Bucket Category">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCategory" runat="server" Text='<%#Eval("BucketCat") %>' ToolTip="Category" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList AutoPostBack="true" ID="ddlBucketCategory" runat="server">
                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <center>
                                                            <asp:DropDownList ID="ddlBucketCategory" AutoPostBack="true" runat="server" Width="110px">
                                                                <asp:ListItem Value="0" Text="--Select--" />
                                                            </asp:DropDownList>
                                                        </center>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="13%" />
                                                    <FooterStyle Width="13%" />
                                                </asp:TemplateField>
                                                <%--Bucket--%>
                                                <asp:TemplateField HeaderText="Bucket Value">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBucket" runat="server" Text='<%#Eval("BucketVal") %>' ToolTip="Bucket" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddlBucket" AutoPostBack="true" runat="server">
                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <center>
                                                            <asp:DropDownList ID="ddlBucket" AutoPostBack="true" runat="server" Width="110px">
                                                                <asp:ListItem Value="0" Text="--Select--" />
                                                            </asp:DropDownList>
                                                        </center>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="13%" />
                                                    <FooterStyle Width="13%" />
                                                </asp:TemplateField>
                                                <%--Credit Score --%>
                                                <asp:TemplateField HeaderText="Collateral">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblExpVar" runat="server" Text='<%#Eval("ExpVar") %>' ToolTip="Exposure Variance" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Label ID="lblExpVar" runat="server" Text='<%#Eval("ExpVar") %>' ToolTip="Exposure Variance" />
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblftExpVar" runat="server" Text='<%#Eval("ExpVar") %>' />
                                                    </FooterTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                    <FooterStyle Width="10%" HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Credit Score">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCreditScore" runat="server" Text='<%#Eval("CreditScore") %>' ToolTip="Credit Score" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Label ID="lblCreditScore" runat="server" Text='<%#Eval("CreditScore") %>' ToolTip="Credit Score" />
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblftCreditScore" runat="server" Text='<%#Eval("CreditScore") %>' />
                                                    </FooterTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                    <FooterStyle Width="10%" HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <%--Exposure Variance --%>
                                                <%--Add Edit Update Cancel Delete--%>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <%-- &nbsp;
                                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex%>'
                                                            CommandName="Edit" CausesValidation="false"></asp:LinkButton>
                                                        &nbsp;--%>
                                                        <asp:LinkButton ID="lnkRemove" runat="server" Text="Remove" CommandName="Delete"
                                                            OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                            ValidationGroup="vgAdd" CausesValidation="false"></asp:LinkButton>
                                                        &nbsp; &nbsp;
                                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                            CausesValidation="false"></asp:LinkButton>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" CommandName="Add" ValidationGroup="vgAdd"
                                                            CausesValidation="true"></asp:LinkButton>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="10%" Font-Bold="true" HorizontalAlign="Center" />
                                                    <FooterStyle Width="10%" Font-Bold="true" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Bank Details" ID="tpBank" CssClass="tabpan"
                        BackColor="Red">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upBank" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel ID="pnlBankdetails" runat="server" Width="100%" GroupingText="Bank Details"
                                        CssClass="stylePanel">
                                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Horizontal" CssClass="stylePanel">
                                            <%--  <div style="overflow:scroll; width: 750px;">--%>
                                            <br />
                                            <asp:GridView ID="grvBankDetails" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                EmptyDataText="No Bank Details Found!..." Width="100%" ShowFooter="true" OnRowCommand="grvBankDetails_RowCommand"
                                                OnRowDataBound="grvBankDetails_RowDataBound" OnRowDeleting="grvBankDetails_RowDeleting">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Bank Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBankName" runat="server" Text='<%# Eval("Bank_Name")%>' />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <center>
                                                                <asp:TextBox ID="txtBankName" Width="140px" runat="server" MaxLength="50" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Bank Name');" />
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVtxtBankName" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" runat="server" ValidationGroup="BVgAdd" ControlToValidate="txtBankName"
                                                                    ErrorMessage="Enter Bank Name"></asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FTEtxtBankName" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    TargetControlID="txtBankName" runat="server" ValidChars=" " Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </center>
                                                        </FooterTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="18%" />
                                                        <FooterStyle Width="18%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Bank Address">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBankAddress" runat="server" Text='<%# Eval("Bank_Address")%>' />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <center>
                                                                <asp:TextBox ID="txtBankAddress" Width="150px" runat="server" TextMode="MultiLine"
                                                                    onmouseover="txt_MouseoverTooltip(this)" MaxLength="50" onkeyup="maxlengthfortxt(50)"
                                                                    onblur="FunTrimwhitespace(this,'Bank Address');" />
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVtxtBankAddress" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" runat="server" ValidationGroup="BVgAdd" ControlToValidate="txtBankAddress"
                                                                    ErrorMessage="Enter Bank Address"></asp:RequiredFieldValidator>
                                                            </center>
                                                        </FooterTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                        <FooterStyle Width="20%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="IFS Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblIFSCCode" runat="server" Text='<%# Eval("IFSC")%>' />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <center>
                                                                <asp:TextBox ID="txtIFSCCode" Width="80px" onmouseover="txt_MouseoverTooltip(this)"
                                                                    runat="server" MaxLength="11" onblur="FunTrimwhitespace(this,'IFS Code');" />
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVtxtIFSCCodeF" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" runat="server" ValidationGroup="BVgAdd" ControlToValidate="txtIFSCCode"
                                                                    ErrorMessage="Enter IFSC Code"></asp:RequiredFieldValidator>
                                                            </center>
                                                        </FooterTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                                        <FooterStyle Width="12%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAccountTypeID" Visible="false" runat="server" Text='<%# Eval("Bank_Acct_Type")%>' />
                                                            <asp:Label ID="lblAccountType" runat="server" Text='<%# Eval("Bank_Acct_Type_Desc")%>' />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <center>
                                                                <asp:DropDownList ID="ddlAccountType" Width="120px" AutoPostBack="true" runat="server" />
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVddlAccountTypeF" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" runat="server" ValidationGroup="BVgAdd" ControlToValidate="ddlAccountType"
                                                                    ErrorMessage="Select Account Type" InitialValue="0"></asp:RequiredFieldValidator>
                                                            </center>
                                                        </FooterTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                        <FooterStyle Width="15%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAccountNumber" runat="server" Text='<%# Eval("Bank_Acct_No")%>' />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <center>
                                                                <asp:TextBox ID="txtAccountNumber" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                    runat="server" MaxLength="20" />
                                                                <asp:RequiredFieldValidator Display="None" ID="RFVtxtAccountNumberF" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True" runat="server" ValidationGroup="BVgAdd" ControlToValidate="txtAccountNumber"
                                                                    ErrorMessage="Enter Account Number"></asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FTEtxtAccountNumberF" FilterType=" Numbers, UppercaseLetters, LowercaseLetters"
                                                                    TargetControlID="txtAccountNumber" runat="server" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </center>
                                                        </FooterTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="13%" />
                                                        <FooterStyle Width="13%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Default Account">
                                                        <ItemTemplate>
                                                            <center>
                                                                <%--Modified By Chandrasekar K On 08-Oct-2012--%>
                                                                <%--<asp:CheckBox ID="chkDefAcc" runat="server" AutoPostBack="true" OnCheckedChanged="FunPriSetDefault_BankAccount"
                                                                    Checked='<%# Eval("Def_Account") %>' />--%>
                                                                <asp:CheckBox ID="chkDefAcc" runat="server" AutoPostBack="true" OnCheckedChanged="FunPriSetDefault_BankAccount"
                                                                    Checked='<%#DataBinder.Eval(Container.DataItem, "Def_Account").ToString().ToUpper() == "TRUE"%>' />
                                                            </center>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <center>
                                                                <asp:CheckBox ID="chkDefAcc" runat="server" Enabled="false" AutoPostBack="true" OnCheckedChanged="FunPriSetDefault_BankAccount" />
                                                            </center>
                                                        </FooterTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="6%" />
                                                        <FooterStyle Width="6%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:LinkButton ID="btnAdd" runat="server" CommandName="Add" Text="Add" ValidationGroup="BVgAdd"></asp:LinkButton>
                                                        </FooterTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                        <FooterStyle HorizontalAlign="Center" Width="10%" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <br />
                                            <%--   </div>--%></asp:Panel>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Borrower Repayment schedule Details" ID="tpRepay"
                        CssClass="tabpan" BackColor="Red">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upRepay" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel GroupingText="Repay Details" ID="pnlRepay" runat="server" CssClass="stylePanel"
                                        Width="80%">
                                        <asp:GridView ID="gvRepayDetails" runat="server" AutoGenerateColumns="false" Width="100%"
                                            ShowFooter="true">
                                            <Columns>
                                                <%--Serial Number--%>
                                                <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="3%" />
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="Funder Reference Number" DataField="Fund_Ref_No" ItemStyle-Width="20%" />
                                                <asp:TemplateField HeaderText="Repay Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRepayDate" runat="server" Text='<%#Eval("Repay_Date") %>' ToolTip="Repay Date" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="15%" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotal" runat="server" Text="Total " ToolTip="Total" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <%--   <asp:BoundField HeaderText="Repayment Date" DataField="Repay_Date" ItemStyle-Width="20%" />--%>
                                                <asp:TemplateField HeaderText="Repay Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRepay" runat="server" Text='<%#Eval("Repay_Amount") %>' ToolTip="Repay Amount" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblRepayF" runat="server" Text='<%#Eval("TotRepay") %>' ToolTip="Total Repay Amount" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <%--  <asp:BoundField HeaderText="Repay Amount" DataField="Repay_Amount" ItemStyle-Width="15%" />--%>
                                                <asp:BoundField HeaderText="JV Reference Number" DataField="JV_No" ItemStyle-Width="20%" />
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Accounts Allocation Details" ID="tpAllocation"
                        CssClass="tabpan" BackColor="Red">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upAllocation" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Panel GroupingText="Accounts Allocation Details" ID="pnlAllocation" runat="server"
                                        CssClass="stylePanel">
                                        <asp:GridView ID="gvAllocation" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvAllocation_RowDataBound"
                                            ShowFooter="true">
                                            <Columns>
                                                <%--Serial Number--%>
                                                <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Line of Business">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLOB" runat="server" Text='<%#Eval("LOBName") %>' ToolTip="Line of Business" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="13%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Customer Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("Customer_Name") %>' ToolTip="Customer Name" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="13%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Account Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPANum" runat="server" Text='<%#Eval("PANum") %>' ToolTip="Account Number" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="11%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sub Account Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSANum" runat="server" Text='<%#Eval("SANum") %>' ToolTip="Sub Account Number" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTot" runat="server" Text="Total" ToolTip="Total" />
                                                    </FooterTemplate>
                                                    <FooterStyle Width="11%" HorizontalAlign="Right" />
                                                    <ItemStyle Width="11%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Gross Exposure">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblGross" runat="server" Text='<%#Eval("Gross_Exposure") %>' ToolTip="Gross Exposure" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotGross" runat="server" Text="" ToolTip="Total Gross Exposure" />
                                                    </FooterTemplate>
                                                    <FooterStyle Width="11%" HorizontalAlign="Right" />
                                                    <ItemStyle Width="11%" HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Net Exposure">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNet" runat="server" Text='<%#Eval("Net_Exposure") %>' ToolTip="Net Exposure" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotNet" runat="server" Text="" ToolTip="Total Net Exposure" />
                                                    </FooterTemplate>
                                                    <FooterStyle Width="11%" HorizontalAlign="Right" />
                                                    <ItemStyle Width="11%" HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Dues">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDue" runat="server" Text='<%#Eval("Dues") %>' ToolTip="Due" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotDue" runat="server" Text="" ToolTip="Total Dues" />
                                                    </FooterTemplate>
                                                    <FooterStyle Width="11%" HorizontalAlign="Right" />
                                                    <ItemStyle Width="11%" HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="No of Dues">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNOD" runat="server" Text='<%#Eval("NoofDues") %>' ToolTip="No of Dues" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotNOD" runat="server" Text="" ToolTip="Total No of Dues" />
                                                    </FooterTemplate>
                                                    <FooterStyle Width="8%" HorizontalAlign="Center" />
                                                    <ItemStyle Width="8%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Maturity Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMaturityDate" runat="server" Text='<%#Eval("Maturity_Date") %>'
                                                            ToolTip="Maturity Date" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="11%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <%--<asp:BoundField HeaderText="Line of Business" DataField="LOBName" ItemStyle-Width="13%" />
                                                <asp:BoundField HeaderText="Customer Name" DataField="Customer_Name" ItemStyle-Width="13%" />
                                                <asp:BoundField HeaderText="Account Number" DataField="PANum" ItemStyle-Width="11%" />
                                                <asp:BoundField HeaderText="Sub Account Number" DataField="SANum" ItemStyle-Width="11%" />
                                                <asp:BoundField HeaderText="Gross Exposure" DataField="Gross_Exposure" ItemStyle-Width="11%" />
                                                <asp:BoundField HeaderText="Net Exposure" DataField="Net_Exposure" ItemStyle-Width="11%" />
                                                <asp:BoundField HeaderText="Due" DataField="Dues" ItemStyle-Width="11%" />
                                                <asp:BoundField HeaderText="No of Dues" DataField="NoofDues" ItemStyle-Width="8%" />
                                                <asp:BoundField HeaderText="Maturity Date" DataField="Maturity_Date" ItemStyle-Width="13%" />
                                                --%>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" ID="TabAccountMap" CssClass="tabpan" BackColor="Red"
                        Width="65%">
                        <HeaderTemplate>
                            Account Map
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                        <tr>
                                            <td valign="top">
                                                <asp:GridView ID="grvAcctMapDtls" runat="server" Width="98%" AutoGenerateColumns="false"
                                                    ShowFooter="true" FooterStyle-HorizontalAlign="Center" OnRowCommand="grvAcctMapDtls_RowCommand"
                                                    OnRowDataBound="grvAcctMapDtls_RowDataBound" OnRowDeleting="grvAcctMapDtls_RowDeleting">
                                                    <Columns>
                                                        <%--Fund Type--%>
                                                        <asp:TemplateField HeaderText="Fund Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFund_Type" runat="server" Text='<%#Eval("Fund_Type") %>' ToolTip="Fund Type" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <%--<asp:TextBox ID="txtFund_Type" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                    runat="server" ToolTip="Fund Type" />--%>
                                                                <asp:DropDownList ID="ddlFund_Type" runat="server" Width="100%">
                                                                </asp:DropDownList>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <%--Fund Type--%>
                                                        <asp:TemplateField HeaderText="Fund Type Id" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFund_Type_Id" runat="server" Text='<%#Eval("Fund_Type_Id") %>'
                                                                    ToolTip="Fund Type Id" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--Account--%>
                                                        <asp:TemplateField HeaderText="Account">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblGL_Account" runat="server" Text='<%#Eval("GL_Account") %>' ToolTip="CashFlow" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <%-- <asp:TextBox ID="txtGL_Account" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                    runat="server" ToolTip="Account" />--%>
                                                                <asp:DropDownList ID="ddlGL_Account" AutoPostBack="true" OnSelectedIndexChanged="ddlGL_Account_SelectedIndexChanged" runat="server" Width="100%">
                                                                </asp:DropDownList>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <%--Account Code--%>
                                                        <asp:TemplateField HeaderText="GL Code" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblGL_Code" runat="server" Text='<%#Eval("GL_Code") %>' ToolTip="CashFlow" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--Sub Account--%>
                                                        <asp:TemplateField HeaderText="Sub Account">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSL_Account" runat="server" Style="text-align: right;" Text='<%#Eval("SL_Account") %>'
                                                                    ToolTip="Frequency" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <%-- <asp:TextBox ID="txtSL_Account" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                    runat="server" ToolTip="Sub Account" Style="text-align: right;" />--%>
                                                                <asp:DropDownList ID="ddlSL_Account" runat="server" Width="100%">
                                                                </asp:DropDownList>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <%--Sub Account Code--%>
                                                        <asp:TemplateField HeaderText="SL Code" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSL_Code" runat="server" Text='<%#Eval("SL_Code") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%-- Action --%>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="btnRemove" Text="Remove" CommandName="Delete" runat="server"
                                                                    CausesValidation="false" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Button ID="btnAddrow" CausesValidation="false" runat="server" CommandName="Add"
                                                                    CssClass="styleGridShortButton" Text="Add"></asp:Button>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Center" />
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                </cc1:TabContainer>
            </td>
        </tr>
        <tr>
            <td align="center">
                <br />
                <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" OnClick="btnSave_Click"
                    Text="Save" CausesValidation="true" OnClientClick="return fnCheckPageValidators('Main')"
                    ValidationGroup="Main" />
                <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Clear_FA" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />
                <asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Cancel" OnClick="btnCancel_Click" />
                <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />--%>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:ValidationSummary ID="vsFunderMaster" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                    ValidationGroup="Main" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="vsAdd" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                    ValidationGroup="vgAdd" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                <asp:CustomValidator ID="cvFunderMaster" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="BVgAdd" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="txthiddenfield" runat="server" Visible="false"></asp:TextBox>
    <asp:HiddenField ID="hdn_DefAcc" runat="server" />
    <%--    <script src="../Scripts/Common.js" language="javascript" type="text/javascript"></script>
--%>

    <script language="javascript" type="text/javascript">
        //            var querymode;
        //            querymode=location.search.split("qsMode=");
        //            querymode=querymode[1];

        //            var tab ;
        function TAX() {
            var TAX = document.getElementById('<%=txtTAXNo.ClientID%>');
            var VAT = document.getElementById('<%=txtVATNo.ClientID%>');
            var rfvVAT = document.getElementById('<%=rfvVAT.ClientID%>');
            var rfvTAX = document.getElementById('<%=rfvTAX.ClientID%>');

            if (TAX.value != "") {
                rfvVAT.Enabled = false;

            }
            else if (VAT.value != "") {
                rfvTAX.Enabled = false;
            }
            else {
                rfvTAX.Enabled = true;
            }

            //   if(TAX.value=="")
            //   {
            //   rfvVAT.Enabled=true ;
            //   VAT .Enabled=true  ;
            //   }
            //   else
            //   {
            //   VAT .Enabled=false ;
            //   rfvVAT .Enabled =false ;
            //   }

        }

        function fnTAX_VATvalidation() {
            var TAX = document.getElementById('<%=txtTAXNo.ClientID%>');
            var VAT = document.getElementById('<%=txtVATNo.ClientID%>');
            var rfvVAT = document.getElementById('<%=rfvVAT.ClientID%>');
            var rfvTAX = document.getElementById('<%=rfvTAX.ClientID%>');

            if (TAX.value != "") {
                ValidatorEnable(rfvVAT, false);
                //       rfvVAT .enabled=false ;
                //       VAT.setAttribute("Readonly","true") ;
                //       VAT .enabled=false ;

            }
            else if (VAT.value != "") {
                ValidatorEnable(rfvTAX, false);
            }
            else {
                ValidatorEnable(rfvTAX, false);
                ValidatorEnable(rfvVAT, false);
            }
        }

        function fnvalidFundername(txtFunderName) {
            if (txtFunderName.value == "0") {
                alert('Funder Name should not be 0');
                document.getElementById(txtFunderName.id).focus();
            }
        }
        //var index=0;

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


        function FnValidate(txtTAXNo, txtVATNo, rfvVAT, rfvTAX) {
            //alert(rfvTAX);
            //document.getElementById(rfvTAX).enabled=false;
            if ((document.getElementById(txtTAXNo).value == '') && (document.getElementById(txtVATNo).value == '')) {

                document.getElementById(rfvVAT).enabled = true;
                document.getElementById(rfvTAX).enabled = true;
                //document.getElementById(rfvVAT).className = 'styleReqFieldFocus';
                //document.getElementById(rfvTAX).className = 'styleReqFieldFocus';
            }
            else {
                document.getElementById(rfvVAT).enabled = false;
                document.getElementById(rfvTAX).enabled = false;

            }
            //        if(!fnCheckPageValidators('Main',false))
            //            return false;

            return true;
        }

        function fnDiableCredit(txtTAXNo, txtVATNo, ctrlId) {

            var txtTAXNo = document.getElementById(txtTAXNo);
            var txtVATNo = document.getElementById(txtVATNo);

            //var txtTAXNo=document.getElementById('ctl00_ContentPlaceHolder1_gvManualJournal_ctl03_txtTAXNo');
            //var txtVATNo=document.getElementById('ctl00_ContentPlaceHolder1_gvManualJournal_ctl03_txtVATNo');
            txtVATNo.disabled = false;
            txtTAXNo.disabled = false;
            //alert(txtTAXNo.value);
            if ((txtTAXNo.value == "") && (txtVATNo.value == "")) {
                txtTAXNo.value = "";
                txtVATNo.value = "";
                return;
            }

            if ((txtTAXNo.value != "") && (ctrlId == 'C')) {
                txtVATNo.value = "";
                return;
            }
            if ((txtVATNo.value != "") && (ctrlId == 'D')) {
                txtTAXNo.value = "";
                return;
            }

        }
      
    </script>

</asp:Content>
