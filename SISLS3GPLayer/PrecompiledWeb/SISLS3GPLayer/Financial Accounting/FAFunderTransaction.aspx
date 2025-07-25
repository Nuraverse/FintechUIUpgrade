<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAFunderTransaction, App_Web_hqzzel3u" title="Untitled Page" %>

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
                <cc1:TabContainer ID="tcFunderTransaction" runat="server" CssClass="styleTabPanel"
                    Width="99%" TabStripPlacement="top" ActiveTabIndex="0">
                    <cc1:TabPanel runat="server" HeaderText="Funder Details" ID="tbGeneral" CssClass="tabpan"
                        BackColor="Red" TabIndex="0">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upGeneral" runat="server">
                                <ContentTemplate>
                                    <asp:Panel GroupingText="Funder Informations" ID="pnlFunderInfo" runat="server" CssClass="stylePanel">
                                        <table width="100%" border="0" cellspacing="0">
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                </td>
                                                <%--<td class="styleFieldAlign">
                                                    <asp:DropDownList ID="ddlGLCode" runat="server" ToolTip="GL Code">
                                                        <asp:ListItem Value="0" Text="--Select--" />
                                                        <asp:ListItem Value="GL1" Text="GL1" />
                                                        <asp:ListItem Value="GL2" Text="GL2" />
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvGLCode" runat="server" ControlToValidate="ddlGLCode"
                                                        InitialValue="0" ErrorMessage="Enter GL Code" Display="None" SetFocusOnError="True"
                                                        ValidationGroup="Main" />
                                                </td>--%>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <table>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label runat="server" ID="lblDealNumber" CssClass="styleReqFieldLabel" Text="Deal Number"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="25%">
                                                                <asp:DropDownList ID="ddlDealNumber" runat="server" ToolTip="Deal Number" Width="170px"
                                                                    OnSelectedIndexChanged="ddlDealNumber_SelectedIndexChanged" AutoPostBack="true">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlDealNumber"
                                                                    InitialValue="0" ErrorMessage="Select Deal Number" Display="None" SetFocusOnError="True"
                                                                    ValidationGroup="Main" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label runat="server" ID="lblTrancheRefNo" CssClass="styleReqFieldLabel" Text="Tranche/Serial Ref No"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="25%">
                                                                <asp:DropDownList ID="ddlTrancheRefNo" OnSelectedIndexChanged="ddlTrancheRefNo_SelectedIndexChanged"
                                                                    AutoPostBack="true" runat="server" ToolTip="Tranche Ref No" Width="170px">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTrancheRefNo"
                                                                    InitialValue="0" ErrorMessage="Select Tranche Ref No" Display="None" SetFocusOnError="True"
                                                                    ValidationGroup="Main" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label runat="server" ID="lblFunderTranNo" Text="Funder Transaction Number"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="25%">
                                                                <asp:TextBox ID="txtFunderTranNo" Width="165px" runat="server" ToolTip="Funder Transaction Number"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label runat="server" ID="lblTranDate" Text="Funder Transaction Date"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="25%">
                                                                <asp:TextBox ID="txtFundTransDate" runat="server" Width="165px" ToolTip="Funder Transaction Date"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblNatureofFund" ToolTip="Nature of Fund" runat="server" Text="Nature of Fund"
                                                                    CssClass="styleReqFieldLabel" />
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:DropDownList ID="ddlNatureofFund" onmouseover="ddl_itemchanged(this)" runat="server" Enabled="false">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <table>
                                                                    <tr>
                                                                        <td class="styleFieldLabel" width="25%">
                                                                        </td>
                                                                        <td class="styleFieldLabel" width="25%">
                                                                        </td>
                                                                        <td class="styleFieldLabel" width="25%">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldAlign" width="25%">
                                                                        </td>
                                                                        <td class="styleFieldAlign" width="25%">
                                                                        </td>
                                                                        <td class="styleFieldAlign" width="25%">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td colspan="2" valign="top">
                                                    <table width="100%" align="center" cellspacing="0">
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%" style="padding-bottom: 0px">
                                                                <asp:Label runat="server" ID="lblFundercode" CssClass="styleReqFieldLabel" Text="Funder Code/Name"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                                <asp:DropDownList ID="ddlFunderCode" runat="server" ToolTip="Funder Code/Name" AutoPostBack="true"
                                                                    Width="170px" OnSelectedIndexChanged="ddlFunderCode_SelectedIndexChanged" />
                                                                <%-- <cc1:ComboBox ID="ddlFunderCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                      AutoPostBack ="true"    OnSelectedIndexChanged="ddlFunderCode_SelectedIndexChanged">
                                                    </cc1:ComboBox>--%>
                                                                <asp:RequiredFieldValidator ID="rfvFunderCode" runat="server" ControlToValidate="ddlFunderCode"
                                                                    InitialValue="0" ErrorMessage="Select Funder Code/Name" Display="None" SetFocusOnError="True"
                                                                    ValidationGroup="Main" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label runat="server" ID="lblLocation" Text="Location" />
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <%--   <asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location" />--%>
                                                                <asp:TextBox ID="txtLocation" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    Width="165px" ToolTip="Location" ReadOnly="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%" style="padding-bottom: 0px">
                                                                <asp:Label ID="lblComcity" runat="server" CssClass="styleReqFieldLabel" Text="City"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtComCity" runat="server" MaxLength="30" Width="60%" ReadOnly="true"></asp:TextBox>
                                                                <%--<cc1:ComboBox ID="txtComCity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                    onblur="FunTrimwhitespace(this,'City in Communication Address');" AppendDataBoundItems="true"
                                                                    CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                </cc1:ComboBox>--%>
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
                                                                <asp:TextBox ID="txtComState" runat="server" MaxLength="60" Width="60%" ReadOnly="true"></asp:TextBox>
                                                                <%-- <cc1:ComboBox ID="txtComState" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                    onblur="FunTrimwhitespace(this,'State in Communication Address');" AppendDataBoundItems="true"
                                                                    CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                </cc1:ComboBox>--%>
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
                                                                <asp:TextBox ID="txtComCountry" runat="server" MaxLength="60" Width="37%" ReadOnly="true"></asp:TextBox>
                                                                <%--  <cc1:ComboBox ID="txtComCountry" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                    AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                                    Width="80px">
                                                                </cc1:ComboBox>--%>
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
                                                                <%--<asp:RequiredFieldValidator ID="rfvComPincode" runat="server" ControlToValidate="txtComPincode"
                                                                    ErrorMessage="Enter Pincode/Zipcode in Communication Address" CssClass="styleMandatoryLabel"
                                                                    Display="None" SetFocusOnError="True" ValidationGroup="Main"></asp:RequiredFieldValidator>--%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:Panel ID="pnlCurrencyInfo" runat="server" GroupingText="facility Details">
                                                        <table width="100%">
                                                            <tr>
                                                                <td>
                                                                    <table>
                                                                        <tr>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblCurrecncyCode" Text="Foreign Currency"></asp:Label>
                                                                            </td>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblCurrencyValue" Text="Currency (INR)"></asp:Label>
                                                                            </td>
                                                                            <td class="styleFieldLabel" colspan="2">
                                                                                <table>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:Label runat="server" Width="75px" ID="lblBaseRate" Text="Base Rate"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label runat="server" Width="75px" ID="lblSpreadRate" Text="Spread"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Label runat="server" Width="75px" ID="lblbTotalRate" Text="Total Rate"></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="styleFieldAlign" width="20%">
                                                                                <asp:TextBox ID="txtCurrecncyCode" runat="server" Width="75%" ToolTip="Currency Code"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                                            </td>
                                                                            <td class="styleFieldAlign" width="20%">
                                                                                <asp:TextBox ID="txtCurrencyValue" runat="server" Width="40%" ToolTip="Currency Code"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                                            </td>
                                                                            <td class="styleFieldAlign" colspan="2">
                                                                                <table>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtBaseRate" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                                                Width="75px" ToolTip="Base Rate" ReadOnly="true" Style="text-align: right;" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtSpreadRate" runat="server" Width="75px" ToolTip="Spread Rate"
                                                                                                onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtTotalRate" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                                                Width="75px" ToolTip="Total Rate" ReadOnly="true" Style="text-align: right;" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblCommitmentAmt" CssClass="styleReqFieldLabel" Text="Commitment Amount (FC)" />
                                                                            </td>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblCommitmentAmtINR" CssClass="styleReqFieldLabel"
                                                                                    Text="Commitment Amount (INR)" />
                                                                            </td>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblTrancheAmount" Text="Tranche Amount (FC)"></asp:Label>
                                                                            </td>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblTrancheAmountINR" Text="Tranche Amount(INR)"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="styleFieldAlign" width="20%">
                                                                                <asp:TextBox ID="txtCommitAmt" runat="server" Width="100%" ToolTip="Currency Code"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                                            </td>
                                                                            <td class="styleFieldAlign" width="20%">
                                                                                <asp:TextBox ID="txtCommitAmtINR" runat="server" Width="90%" ToolTip="Currency Code"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                                            </td>
                                                                            <td class="styleFieldAlign" width="20%">
                                                                                <asp:TextBox ID="txtTrancheAmt" runat="server" Width="100%" ToolTip="Tranche Amount"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                                            </td>
                                                                            <td class="styleFieldAlign" width="20%">
                                                                                <asp:TextBox ID="txtTrancheAmtINR" runat="server" Width="90%" ToolTip="Tranche Amount(INR)"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblAvailedAmt" CssClass="styleReqFieldLabel" Text="Availed Amount (FC)" />
                                                                            </td>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblAvailedAmtINR" CssClass="styleReqFieldLabel" Text="Availed Amount (INR)" />
                                                                            </td>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblTransactionAmt" CssClass="styleReqFieldLabel" Text="Transaction Amount (FC)" />
                                                                            </td>
                                                                            <td class="styleFieldLabel" width="25%">
                                                                                <asp:Label runat="server" ID="lblTransactionAmtINR" CssClass="styleReqFieldLabel"
                                                                                    Text="Transaction Amount(INR)" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="styleFieldAlign" width="25%">
                                                                                <asp:TextBox ID="txtAvailedAmt" runat="server" Width="100%" MaxLength="12" Style="text-align: right;"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                    ToolTip="Availed Amount" ReadOnly="true" />
                                                                                <%-- <cc1:FilteredTextBoxExtender ID="ftxtCommitAmt" TargetControlID="txtCommitAmt" FilterType="Numbers"
                                                                                runat="server" Enabled="True" AutoPostBack="true" OnTextChanged="txtCommitAmt_TextChanged"/>--%>
                                                                                <asp:RequiredFieldValidator ID="rfvTAX" runat="server" ControlToValidate="txtCommitAmt"
                                                                                    ErrorMessage="Enter Availed Amount" Display="None" SetFocusOnError="True" ValidationGroup="Main" />
                                                                            </td>
                                                                            <td class="styleFieldAlign" width="25%">
                                                                                <asp:TextBox ID="txtAvailedAmtINR" runat="server" Width="90%" ToolTip="Availed Amount INR"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" ReadOnly="true" />
                                                                            </td>
                                                                            <td class="styleFieldAlign" width="25%">
                                                                                <asp:TextBox ID="txtTransactionAmt" runat="server" Width="100%" MaxLength="12" Style="text-align: right;"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true" OnTextChanged="txtCommitAmt_TextChanged"
                                                                                    onkeypress="fnAllowNumbersOnly(false,false,this)" ToolTip="Commitment Amount" />
                                                                                <asp:RequiredFieldValidator ID="RFVTransactionAmt" runat="server" ControlToValidate="txtTransactionAmt"
                                                                                    ErrorMessage="Enter Transaction Amount" Display="None" SetFocusOnError="True"
                                                                                    ValidationGroup="Main" />
                                                                                <%-- <cc1:FilteredTextBoxExtender ID="ftxtCommitAmt" TargetControlID="txtCommitAmt" FilterType="Numbers"
                                                                                runat="server" Enabled="True" />--%>
                                                                                <%----%>
                                                                            </td>
                                                                            <td class="styleFieldAlign" width="25%">
                                                                                <asp:TextBox ID="txtTransactionamtINR" runat="server" Width="90%" ToolTip="Transaction Amount INR"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" />
                                                                                <asp:RequiredFieldValidator ID="RFVTransactionamtINR" runat="server" ControlToValidate="txtTransactionamtINR"
                                                                                    ErrorMessage="Enter Transaction Amount INR" Display="None" SetFocusOnError="True"
                                                                                    ValidationGroup="Main" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Panel ID="pnlTerms" runat="server" GroupingText="Terms Details">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <tr>
                                                                        <td class="styleFieldLabel" width="25%">
                                                                            <asp:Label runat="server" ID="lblTenure" CssClass="styleReqFieldLabel" Text="Tenure" />
                                                                        </td>
                                                                        <td class="styleFieldAlign" width="20%">
                                                                            <asp:DropDownList ID="ddlTenureType" onchange="FunClearTenure();" runat="server"
                                                                                ToolTip="Interest Tenure Type" Width="100px" />
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtTenure" runat="server" ToolTip="Tenure" MaxLength="3" Width="50%"
                                                                                Style="text-align: right;" OnTextChanged="txtTenure_TextChanged" AutoPostBack="true"
                                                                                onmouseover="txt_MouseoverTooltip(this)" onblur="ChkIsZero(this,'Tenure')" onkeypress="fnAllowNumbersOnly(false,false,this)" />
                                                                        </td>
                                                                        <%--<td class="styleFieldAlign" width="25%">
                                                                          
                                                                            <asp:Label ID="lblMonth" runat="server" Text="(In Months)" Font-Size="Small" />
                                                                        </td>--%>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel" width="25%">
                                                                            <asp:Label runat="server" ID="lblInterestCalc" CssClass="styleReqFieldLabel" Text="Interest Calculation" />
                                                                        </td>
                                                                        <td class="styleFieldAlign" width="25%">
                                                                            <asp:DropDownList ID="ddlInterestCalc" runat="server" ToolTip="Interest Calculation"
                                                                                Width="100px" />
                                                                            <asp:RequiredFieldValidator ID="rfvddlInterestCalc" runat="server" ControlToValidate="ddlInterestCalc"
                                                                                InitialValue="0" ErrorMessage="Select InterestCalc" Display="None" SetFocusOnError="True"
                                                                                ValidationGroup="Main" />
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtInterestCalcdate" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                                ToolTip="Interest Calc start date" Width="75%" />
                                                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtInterestCalcdate"
                                                                                PopupButtonID="txtInterestCalcdate" ID="CEInterestCalcdate" Enabled="True">
                                                                            </cc1:CalendarExtender>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel" width="25%">
                                                                            <asp:Label runat="server" ID="lblInterestLevy" CssClass="styleReqFieldLabel" Text="Interest Credit" />
                                                                        </td>
                                                                        <td class="styleFieldAlign" width="25%">
                                                                            <asp:DropDownList ID="ddlInterestLevy" runat="server" ToolTip="Interest Credit" Width="100px" />
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtInterestLevy" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                                ToolTip="Interest Credit start date" Width="75%" />
                                                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtInterestLevy"
                                                                                PopupButtonID="txtInterestLevy" ID="CEInterestLevy" Enabled="True">
                                                                            </cc1:CalendarExtender>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:RequiredFieldValidator ID="rfvTenure" runat="server" ControlToValidate="txtTenure"
                                                                                ErrorMessage="Enter Tenure" Display="None" SetFocusOnError="True" ValidationGroup="Main" />
                                                                            <asp:RequiredFieldValidator ID="rfvTenure1" runat="server" ControlToValidate="txtTenure"
                                                                                ErrorMessage="Enter Tenure" Display="None" SetFocusOnError="True" ValidationGroup="btngo" />
                                                                            <asp:RequiredFieldValidator ID="rfvTenure2" runat="server" ControlToValidate="txtTenure"
                                                                                ErrorMessage="Enter Tenure" Display="None" SetFocusOnError="True" ValidationGroup="btngoB" />
                                                                            <asp:RequiredFieldValidator ID="rfvddlTenureType" runat="server" ControlToValidate="ddlTenureType"
                                                                                InitialValue="0" ErrorMessage="Select Tenure Type" Display="None" SetFocusOnError="True"
                                                                                ValidationGroup="Main" />
                                                                            <asp:RequiredFieldValidator ID="rfvddlTenureType1" runat="server" ControlToValidate="ddlTenureType"
                                                                                InitialValue="0" ErrorMessage="Select Tenure Type" Display="None" SetFocusOnError="True"
                                                                                ValidationGroup="btngo" />
                                                                            <asp:RequiredFieldValidator ID="rfvddlTenureType2" runat="server" ControlToValidate="ddlTenureType"
                                                                                InitialValue="0" ErrorMessage="Select Tenure Type" Display="None" SetFocusOnError="True"
                                                                                ValidationGroup="btngoB" />
                                                                        </td>
                                                                    </tr>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                                <td colspan="2">
                                                    <table>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="10%">
                                                                <asp:Label runat="server" ID="lblValidUpto" CssClass="styleReqFieldLabel" Text="Maturity Date" />
                                                            </td>
                                                            <td class="styleFieldAlign" width="25%">
                                                                <asp:TextBox ID="txtValidUpto" runat="server" Width="75%" ToolTip="Valid Upto" onmouseover="txt_MouseoverTooltip(this)" />
                                                                <%--AutoPostBack="true" OnTextChanged="txtValidUpto_TextChanged"--%>
                                                                <%-- <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtValidUpto"
                                                                    OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="txtValidUpto"
                                                                    ID="CalendarExtender1" Enabled="false">
                                                                </cc1:CalendarExtender>
                                                                <asp:RequiredFieldValidator ID="rfvVAT" runat="server" ControlToValidate="txtValidUpto"
                                                                    ErrorMessage="Enter Valid Upto" Display="None" SetFocusOnError="True" ValidationGroup="Main" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="10%">
                                                                <asp:Label runat="server" ID="lblArrangement" CssClass="styleReqFieldLabel" Text="Arrangement"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="25%">
                                                                <asp:DropDownList ID="ddlArrangement" runat="server" ToolTip="Arrangement" Width="170px">
                                                                    <asp:ListItem Value="0" Text="--Select--" />
                                                                    <asp:ListItem Value="1" Text="Blanket " />
                                                                    <%-- <asp:ListItem Value="2" Text="Performance" />--%>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label runat="server" ID="lblInvestmentLein" CssClass="styleReqFieldLabel" Text="Investment Lein"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="25%">
                                                                <asp:DropDownList ID="ddlInvestmentLein" runat="server" ToolTip="Investment Lein"
                                                                    Width="170px">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <table>
                                                        <tr>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td colspan="2" valign="top">
                                                    <table>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Receiving Schedule" ID="tpSchedule" CssClass="tabpan"
                        BackColor="Red">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="upSchedule" runat="server">
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label runat="server" ID="lblInflowType" Text="Inflow Type"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:DropDownList ID="ddlInflowType" runat="server" ToolTip="Inflow Type" Width="170px" />
                                                <%-- <asp:RequiredFieldValidator ID="rfvddlInflowType" runat="server" ControlToValidate="ddlInflowType"
                                                    InitialValue="0" ErrorMessage="Select Inflow Type" Display="None" SetFocusOnError="True"
                                                    ValidationGroup="Main" />--%>
                                                <asp:RequiredFieldValidator ID="rfvddlInflowType1" runat="server" ControlToValidate="ddlInflowType"
                                                    InitialValue="0" ErrorMessage="Select Inflow Type" Display="None" SetFocusOnError="True"
                                                    ValidationGroup="btngo" />
                                            </td>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label runat="server" ID="lblType" CssClass="styleReqFieldLabel" Text="Receipt Frequency"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:DropDownList ID="ddlReceivingType" runat="server" ToolTip="Receipt Frequency"
                                                    Width="170px">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlReceivingType"
                                                    InitialValue="0" ErrorMessage="Select Receiving Frequency" Display="None" SetFocusOnError="True"
                                                    ValidationGroup="btngo" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label runat="server" ID="Label2" CssClass="styleReqFieldLabel" Text="First Due Date" />
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:TextBox ID="txtReceivingDate" runat="server" Width="165px" ToolTip="Receiving Date"
                                                    onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true" />
                                                <%-- <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtReceivingDate"
                                                    OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="txtReceivingDate"
                                                    ID="CEReceivingDate" Enabled="True">
                                                </cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtReceivingDate"
                                                    ErrorMessage="Enter First Due Date" Display="None" SetFocusOnError="True" ValidationGroup="btngo" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnGo" runat="server" Text="Go" ToolTip="Go" CssClass="styleSubmitShortButton"
                                                    ValidationGroup="btngo" OnClientClick="return fnCheckPageValidators('btngo',false)"
                                                    OnClick="btnGoR_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <asp:Panel GroupingText="Receiving Schedule Details" ID="pnlReceiving" runat="server"
                                                    CssClass="stylePanel" Width="100%">
                                                    <asp:GridView ID="gvReceiving" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                        Width="90%" OnRowDataBound="gvReceiving_RowDataBound" OnRowCommand="gvReceiving_RowCommand"
                                                        OnRowDeleting="gvReceiving_RowDeleting" OnRowEditing="gvReceiving_RowEditing"
                                                        OnRowCancelingEdit="gvReceiving_RowCancelingEdit" OnRowUpdating="gvReceiving_RowUpdating">
                                                        <Columns>
                                                            <%--Serial Number--%>
                                                            <asp:TemplateField HeaderText="Sl No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                                    <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />
                                                                    <asp:HiddenField ID="hdn_TranID" runat="server" Value='<%#Eval("Funder_Tran_Details_ID") %>' />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <%--Funder Reference Number --%>
                                                            <asp:TemplateField HeaderText="Tranche Reference Number" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRefNo" runat="server" Text='<%#Eval("Fund_Ref_No") %>' ToolTip="Fund Reference Number" />
                                                                </ItemTemplate>
                                                                <%--    <EditItemTemplate>
                                                        <asp:TextBox ID="txtFund_Ref_No" runat="server" Text='<%#Eval("Fund_Ref_No") %>'
                                                            ToolTip="Funder Reference Number" AutoPostBack="true" OnTextChanged="txtFund_Ref_No_OnTextChanged" />
                                                        <cc1:ComboBox ID="ComboRefNo" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                           AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                        </cc1:ComboBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftxtComCity" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    TargetControlID="txtComCity" ValidChars=" ">
                                                                </cc1:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator ID="rfvComboRefNo" runat="server" ControlToValidate="txtFund_Ref_No"
                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="vgUpdate"
                                                            ErrorMessage="Enter Funder Reference Number"></asp:RequiredFieldValidator>
                                                    </EditItemTemplate>--%>
                                                                <FooterTemplate>
                                                                    <br></br>
                                                                    <center>
                                                                        <asp:TextBox ID="txtFund_Ref_No" runat="server" ToolTip="Fund Reference Number" AutoPostBack="true"
                                                                            onmouseover="txt_MouseoverTooltip(this)" OnTextChanged="txtFund_Ref_No_OnTextChanged" />
                                                                        <%-- <cc1:ComboBox ID="ComboRefNo" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                           Width ="100px"   AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                        </cc1:ComboBox>--%>
                                                                        <%--<cc1:FilteredTextBoxExtender ID="ftxtComCity" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    TargetControlID="txtComCity" ValidChars=" ">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                        <asp:RequiredFieldValidator ID="rfvComboRefNo" runat="server" ControlToValidate="txtFund_Ref_No"
                                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="vgAdd"
                                                                            ErrorMessage="Enter Funder Reference Number"></asp:RequiredFieldValidator>
                                                                    </center>
                                                                </FooterTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <FooterStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <%--Rate --%>
                                                            <asp:TemplateField HeaderText="Rate" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRate" runat="server" Text='<%#Eval("Fund_Rate") %>' ToolTip="Rate" />
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="txtRate" onkeypress="fnAllowNumbersOnly(true,false,this)" Width="60px"
                                                                        onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" onblur="funChkDecimialF(this,2,2,'Rate',true);"
                                                                        MaxLength="5" runat="server" Text='<%#Eval("Fund_Rate") %>' ToolTip="Rate" />
                                                                    <cc1:FilteredTextBoxExtender ID="ftxtRate" TargetControlID="txtRate" FilterType="Custom,Numbers"
                                                                        ValidChars="." runat="server" Enabled="True" />
                                                                    <asp:RequiredFieldValidator ID="rfvRate" runat="server" ControlToValidate="txtRate"
                                                                        ErrorMessage="Enter Rate" Display="None" SetFocusOnError="True" ValidationGroup="vgUpdate" />
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <br></br>
                                                                    <center>
                                                                        <%--onblur="funChkDecimialF(this,2,2,'Rate');" --%>
                                                                        <asp:TextBox ID="txtRate" onkeypress="fnAllowNumbersOnly(true,false,this)" Width="60px"
                                                                            onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" onblur="funChkDecimialF(this,2,2,'Rate',true);"
                                                                            MaxLength="5" runat="server" ToolTip="Rate" />
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtRate" TargetControlID="txtRate" FilterType="Custom,Numbers"
                                                                            ValidChars="." runat="server" Enabled="True" />
                                                                        <asp:RequiredFieldValidator ID="rfvRate" runat="server" ControlToValidate="txtRate"
                                                                            ErrorMessage="Enter Rate" Display="None" SetFocusOnError="True" ValidationGroup="vgAdd" />
                                                                    </center>
                                                                </FooterTemplate>
                                                                <%--<ItemStyle Width="8%" HorizontalAlign="Right" />
                                                                <FooterStyle Width="8%" HorizontalAlign="Right" />--%>
                                                            </asp:TemplateField>
                                                            <%--Received Date--%>
                                                            <asp:TemplateField HeaderText="Due Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblReceivedDate" runat="server" Text='<%#Eval("Due_Date") %>' ToolTip="Due Date" />
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="txtReceivedDate" Width="100px" Text='<%#Eval("Due_Date") %>' runat="server"
                                                                        onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true" OnTextChanged="txtReceivedDate_OnTextChanged"
                                                                        ToolTip="Due Date" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtReceivedDate"
                                                                        OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="txtReceivedDate"
                                                                        ID="CalReceivedDate" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <asp:RequiredFieldValidator ID="rfvReceivedDate" runat="server" ControlToValidate="txtReceivedDate"
                                                                        ErrorMessage="Enter Due Date" Display="None" SetFocusOnError="True" ValidationGroup="vgUpdate" />
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Label ID="lblTot" runat="server" Text="Total" Style="text-align: right;" />
                                                                    <br></br>
                                                                    <center>
                                                                        <asp:TextBox ID="txtReceivedDate" onmouseover="txt_MouseoverTooltip(this)" Width="100px"
                                                                            runat="server" ToolTip="Due Date" />
                                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtReceivedDate"
                                                                            OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="txtReceivedDate"
                                                                            ID="CalReceivedDate" Enabled="True">
                                                                        </cc1:CalendarExtender>
                                                                        <asp:RequiredFieldValidator ID="rfvReceivedDate" runat="server" ControlToValidate="txtReceivedDate"
                                                                            ErrorMessage="Enter Due Date" Display="None" SetFocusOnError="True" ValidationGroup="vgAdd" />
                                                                    </center>
                                                                </FooterTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <FooterStyle HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <%--Received Amount--%>
                                                            <asp:TemplateField HeaderText="Due Amount" ItemStyle-HorizontalAlign="Right">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblReceivedAmount" runat="server" Text='<%#Eval("Due_Amount") %>'
                                                                        ToolTip="Due Amount" Style="text-align: right;" />
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="txtReceivedAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                        onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                        Text='<%#Eval("Due_Amount") %>' runat="server" ToolTip="Due Amount" />
                                                                    <cc1:FilteredTextBoxExtender ID="ftxtDueAmt" TargetControlID="txtReceivedAmount"
                                                                        FilterType="Numbers" runat="server" Enabled="True" />
                                                                    <asp:HiddenField ID="hdnDueAmt" runat="server" Value='<%#Eval("Due_Amount") %>' />
                                                                    <asp:RequiredFieldValidator ID="rfvReceivedAmount" runat="server" ControlToValidate="txtReceivedAmount"
                                                                        ErrorMessage="Enter Due Amount" Display="None" SetFocusOnError="True" ValidationGroup="vgUpdate" />
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Label ID="lblTotDue" runat="server" Text='<%#Eval("TotDue") %>' Style="text-align: right;" />
                                                                    <br></br>
                                                                    <center>
                                                                        <asp:TextBox ID="txtReceivedAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                            onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                            runat="server" ToolTip="Due Amount" />
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtDueAmt" TargetControlID="txtReceivedAmount"
                                                                            FilterType="Numbers" runat="server" Enabled="True" />
                                                                        <asp:RequiredFieldValidator ID="rfvReceivedAmount" runat="server" ControlToValidate="txtReceivedAmount"
                                                                            ErrorMessage="Enter Due Amount" Display="None" SetFocusOnError="True" ValidationGroup="vgAdd" />
                                                                    </center>
                                                                </FooterTemplate>
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                <FooterStyle HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <%--JV Reference Number--%>
                                                            <asp:TemplateField HeaderText="JV Reference Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <%--<EditItemTemplate>
                                                        <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                    </FooterTemplate>--%>
                                                            </asp:TemplateField>
                                                            <%--Add Edit Update Cancel Delete--%>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    &nbsp;
                                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex%>'
                                                                        ToolTip="Edit" CommandName="Edit" CausesValidation="false"></asp:LinkButton>
                                                                    &nbsp;
                                                                    <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                        ToolTip="Delete" OnClientClick="return confirm('On Deleting Fund Reference Number Respective \nBorrower Repay Details will also be Deleted \nAre you sure want to delete?');"
                                                                        CausesValidation="false"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                        ToolTip="Update" ValidationGroup="vgUpdate" CausesValidation="false"></asp:LinkButton>
                                                                    &nbsp; &nbsp;
                                                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                        ToolTip="Cancel" CausesValidation="false"></asp:LinkButton>
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <br></br>
                                                                    <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" CommandName="Add" ValidationGroup="vgAdd"
                                                                        ToolTip="Add" CausesValidation="true"></asp:LinkButton>
                                                                </FooterTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <FooterStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Borrower Repayment Schedule" ID="TpBorower"
                        CssClass="tabpan" BackColor="Red">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label runat="server" ID="lblOutflowType" Text="Outflow Type"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:DropDownList ID="ddlOutflowType" runat="server" ToolTip="Outflow Type" Width="170px"
                                                    OnSelectedIndexChanged="ddlOutflowType_SelectedIndexChanged" />
                                                <%--<asp:RequiredFieldValidator ID="rfvddlOutflowType" runat="server" ControlToValidate="ddlOutflowType"
                                                    InitialValue="0" ErrorMessage="Select Outflow Type" Display="None" SetFocusOnError="True"
                                                    ValidationGroup="Main" />--%>
                                                <asp:RequiredFieldValidator ID="rfvddlOutflowType1" runat="server" ControlToValidate="ddlOutflowType"
                                                    InitialValue="0" ErrorMessage="Select Outflow Type" Display="None" SetFocusOnError="True"
                                                    ValidationGroup="btngoB" />
                                            </td>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label runat="server" ID="lblRepaymentType" CssClass="styleReqFieldLabel" Text="Repayment Frequency"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:DropDownList ID="ddlRepaymentType" runat="server" ToolTip="Repayment Type" Width="170px">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlRepaymentType"
                                                    InitialValue="0" ErrorMessage="Select Repayment Frequency" Display="None" SetFocusOnError="True"
                                                    ValidationGroup="btngoB" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="18%">
                                                <asp:Label runat="server" ID="lblRepaymentDate" CssClass="styleReqFieldLabel" Text="Repayment Date" />
                                            </td>
                                            <td class="styleFieldAlign" width="25%">
                                                <asp:TextBox ID="txtRepayDate" runat="server" Width="165px" ToolTip="Repayment Date"
                                                    onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true" />
                                                <%-- <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRepayDate"
                                                    OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="txtRepayDate"
                                                    ID="CERepayDate" Enabled="True">
                                                </cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtRepayDate"
                                                    ErrorMessage="Enter Repayment Date" Display="None" SetFocusOnError="True" ValidationGroup="btngoB" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnGoB" runat="server" Text="Go" ToolTip="Go" CssClass="styleSubmitShortButton"
                                                    ValidationGroup="btngoB" OnClientClick="return fnCheckPageValidators('btngoB',false)"
                                                    OnClick="btnGoB_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <asp:Panel GroupingText="Borrower Repay Details" ID="pnlBorrowerRepay" runat="server"
                                                    CssClass="stylePanel">
                                                    <asp:GridView ID="gvBorrowerRepay" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                        Width="90%" OnRowDataBound="gvBorrowerRepay_RowDataBound" OnRowCommand="gvBorrowerRepay_RowCommand"
                                                        OnRowDeleting="gvBorrowerRepay_RowDeleting" OnRowEditing="gvBorrowerRepay_RowEditing"
                                                        OnRowCancelingEdit="gvBorrowerRepay_RowCancelingEdit" OnRowUpdating="gvBorrowerRepay_RowUpdating">
                                                        <Columns>
                                                            <%--Serial Number--%>
                                                            <asp:TemplateField HeaderText="Sl No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                                    <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />
                                                                    <asp:HiddenField ID="hdn_TranID" runat="server" Value='<%#Eval("Funder_Tran_DTL1_ID") %>' />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <%--Funder Reference Number --%>
                                                            <asp:TemplateField HeaderText="Tranche Reference Number" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRefNo" runat="server" Text='<%#Eval("Fund_Ref_No") %>' ToolTip="Fund Reference Number" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <br></br>
                                                                    <center>
                                                                        <asp:TextBox ID="txtFund_Ref_No" runat="server" ToolTip="Fund Reference Number" />
                                                                        <%--<asp:DropDownList ID="ddlFund_Ref_No" runat="server" ToolTip="ddl" />--%>
                                                                        <%--<cc1:ComboBox ID="ComboRefNo" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                           Width ="100px"   AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                        </cc1:ComboBox>--%>
                                                                        <%--<cc1:FilteredTextBoxExtender ID="ftxtComCity" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    TargetControlID="txtComCity" ValidChars=" ">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                        <%-- <asp:RequiredFieldValidator ID="rfvComboRefNo" runat="server" ControlToValidate="ddlFund_Ref_No"
                                                                            InitialValue="0" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                            ValidationGroup="vgBRAdd" ErrorMessage="Select Fund Reference Number"></asp:RequiredFieldValidator>--%>
                                                                    </center>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="20%" HorizontalAlign="Left" />
                                                                <FooterStyle Width="20%" HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <%--Repay Date--%>
                                                            <asp:TemplateField HeaderText="Repay Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRepayDate" runat="server" Text='<%#Eval("Repay_Date") %>' ToolTip="Repay Date" />
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="txtRepayDate" Width="100px" Text='<%#Eval("Repay_Date") %>' runat="server"
                                                                        onmouseover="txt_MouseoverTooltip(this)" ToolTip="Due Date" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRepayDate"
                                                                        PopupButtonID="txtRepayDate" ID="CalRepayDate" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <asp:RequiredFieldValidator ID="rfvRepayDate" runat="server" ControlToValidate="txtRepayDate"
                                                                        ErrorMessage="Enter Repay Date" Display="None" SetFocusOnError="True" ValidationGroup="vgBRUpdate" />
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Label ID="lblTot" runat="server" Text="Total" />
                                                                    <br></br>
                                                                    <center>
                                                                        <asp:TextBox ID="txtRepayDate" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="Repay Date" />
                                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRepayDate"
                                                                            PopupButtonID="txtRepayDate" ID="CalRepayDate" Enabled="True">
                                                                        </cc1:CalendarExtender>
                                                                        <asp:RequiredFieldValidator ID="rfvRePayDate" runat="server" ControlToValidate="txtRepayDate"
                                                                            ErrorMessage="Enter Repay Date" Display="None" SetFocusOnError="True" ValidationGroup="vgBRAdd" />
                                                                    </center>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <%--Repay Amount--%>
                                                            <asp:TemplateField HeaderText="Repay Amount">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRepayAmount" runat="server" Text='<%#Eval("Repay_Amount") %>' ToolTip="Repay Amount" />
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="txtRepayAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                        onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                        Text='<%#Eval("Repay_Amount") %>' runat="server" ToolTip="Repay Amount" />
                                                                    <cc1:FilteredTextBoxExtender ID="ftxtRepayAmt" TargetControlID="txtRepayAmount" FilterType="Numbers"
                                                                        runat="server" Enabled="True" />
                                                                    <asp:HiddenField ID="hdnRepayAmt" runat="server" Value='<%#Eval("Repay_Amount") %>' />
                                                                    <asp:RequiredFieldValidator ID="rfvRepayAmount" runat="server" ControlToValidate="txtRepayAmount"
                                                                        ErrorMessage="Enter Repay Amount" Display="None" SetFocusOnError="True" ValidationGroup="vgBRUpdate" />
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Label ID="lblTotRepay" runat="server" Text='<%#Eval("TotRepay") %>' />
                                                                    <br></br>
                                                                    <center>
                                                                        <asp:TextBox ID="txtRepayAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                            onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                            runat="server" ToolTip="Repay Amount" />
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtRepayAmt" TargetControlID="txtRepayAmount" FilterType="Numbers"
                                                                            runat="server" Enabled="True" />
                                                                        <asp:RequiredFieldValidator ID="rfvRepayAmount" runat="server" ControlToValidate="txtRepayAmount"
                                                                            ErrorMessage="Enter Repay Amount" Display="None" SetFocusOnError="True" ValidationGroup="vgBRAdd" />
                                                                    </center>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                                <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <%--Hedge Reference Number--%>
                                                            <asp:TemplateField HeaderText="Hedge Reference Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHedgeNo" runat="server" Text='<%#Eval("Hedge_No") %>' ToolTip="JV Reference Number" />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                <EditItemTemplate>
                                                                    <asp:DropDownList ID="ddlHedgeNo" runat="server" AutoPostBack="true" Width="110px">
                                                                        <asp:ListItem Value="0" Text="--Select--" />
                                                                    </asp:DropDownList>
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <br></br>
                                                                    <center>
                                                                        <asp:DropDownList ID="ddlHedgeNo" runat="server" AutoPostBack="true" Width="110px">
                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                        </asp:DropDownList>
                                                                    </center>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                                <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <%--Hedge Amount--%>
                                                            <asp:TemplateField HeaderText="Hedge Amount">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHedgeAmount" runat="server" Text='<%#Eval("Hedge_Amount") %>' ToolTip="Repay Amount" />
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="txtHedgeAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                        onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                        Text='<%#Eval("Hedge_Amount") %>' runat="server" ToolTip="Hedge Amount" />
                                                                    <%--<cc1:FilteredTextBoxExtender ID="fHedgeAmount" TargetControlID="HedgeAmount" FilterType="Numbers"
                                                                        runat="server" Enabled="True" />
                                                                    <asp:HiddenField ID="hdnHedgeAmount" runat="server" Value='<%#Eval("Hedge_Amount") %>' />--%>
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <br></br>
                                                                    <center>
                                                                        <asp:TextBox ID="txtHedgeAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                            onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                            runat="server" ToolTip="Hedge Amount" />
                                                                        <%--  <cc1:FilteredTextBoxExtender ID="ftxtRepayAmt" TargetControlID="txtRepayAmount" FilterType="Numbers"
                                                                            runat="server" Enabled="True" />--%>
                                                                        <%--<asp:RequiredFieldValidator ID="rfvRepayAmount" runat="server" ControlToValidate="txtRepayAmount"
                                                                            ErrorMessage="Enter Repay Amount" Display="None" SetFocusOnError="True" ValidationGroup="vgBRAdd" />--%>
                                                                    </center>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                                <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <%--JV Reference Number--%>
                                                            <asp:TemplateField HeaderText="JV Reference Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                <EditItemTemplate>
                                                                    <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                                </EditItemTemplate>
                                                                <%--<FooterTemplate>
                                                        <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                    </FooterTemplate>--%>
                                                            </asp:TemplateField>
                                                            <%--Add Edit Update Cancel Delete--%>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    &nbsp;
                                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex%>'
                                                                        ToolTip="Edit" CommandName="Edit" CausesValidation="false"></asp:LinkButton>
                                                                    &nbsp;
                                                                    <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                        ToolTip="Delete" OnClientClick="return confirm('Are you sure want to delete?');"
                                                                        CausesValidation="false"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                        ToolTip="Update" ValidationGroup="vgBRUpdate" CausesValidation="true"></asp:LinkButton>
                                                                    &nbsp; &nbsp;
                                                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                        ToolTip="Cancel" CausesValidation="false"></asp:LinkButton>
                                                                </EditItemTemplate>
                                                                <FooterTemplate>
                                                                    <br></br>
                                                                    <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" CommandName="Add" ValidationGroup="vgBRAdd"
                                                                        ToolTip="Add" CausesValidation="true"></asp:LinkButton>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                                <FooterStyle Width="15%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" ID="TabMoratorium" CssClass="tabpan" BackColor="Red"
                        Width="65%">
                        <HeaderTemplate>
                            Moratorium
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                        <tr>
                                            <td valign="top">
                                                <div id="div10" style="overflow: auto; width: 98%; padding-left: 1%;" runat="server">
                                                    <br />
                                                    <asp:GridView ID="grvMorotorium" runat="server" Width="98%" AutoGenerateColumns="false"
                                                        ShowFooter="true" FooterStyle-HorizontalAlign="Center" OnRowCommand="grvMorotorium_RowCommand"
                                                        OnRowDataBound="grvMorotorium_RowDataBound" OnRowDeleting="grvMorotorium_RowDeleting">
                                                        <Columns>
                                                            <%--Serial Number--%>
                                                            <asp:TemplateField HeaderText="Sl No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMorotorium_Sl" runat="server" Text='<%#Eval("SLNo") %>' ToolTip="Cashflow Type" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--Morotorium type ID--%>
                                                            <asp:TemplateField HeaderText="Morotorium Type ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMorotorium_Type_ID" runat="server" Text='<%#Eval("Moratoriumtype") %>'
                                                                        ToolTip="Cashflow Type" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--Morotorium type--%>
                                                            <asp:TemplateField HeaderText="Morotorium Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMorotorium_Type" runat="server" Text='<%#Eval("Moratorium") %>'
                                                                        ToolTip="Morotorium Type" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:DropDownList ID="ddlMorotorium_Type" runat="server" Width="100%">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="rfvMorotorium_Type" runat="server" ControlToValidate="ddlMorotorium_Type"
                                                                        CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ErrorMessage="Select the Moratorium Type"
                                                                        InitialValue="-1" ValidationGroup="btnAddMor"></asp:RequiredFieldValidator>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <%--From date--%>
                                                            <asp:TemplateField HeaderText="From Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFrom_Date" runat="server" Text='<%#Eval("Fromdate") %>' ToolTip="Frequency" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtFrom_Date" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                        runat="server" ToolTip="From Date" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtFrom_Date"
                                                                        PopupButtonID="txtFrom_Date" ID="CEFrom_Date" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <asp:RequiredFieldValidator ID="rfvFrom_Date" runat="server" ControlToValidate="txtFrom_Date"
                                                                        ErrorMessage="Enter From Date" Display="None" SetFocusOnError="True" ValidationGroup="btnAddMor" />
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <%--To date--%>
                                                            <asp:TemplateField HeaderText="To Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTo_Date" runat="server" Text='<%#Eval("Todate") %>' ToolTip="Frequency" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtTo_Date" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                        runat="server" ToolTip="To Date" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtTo_Date"
                                                                        PopupButtonID="txtTo_Date" ID="CETo_Date" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <asp:RequiredFieldValidator ID="rfvTo_Date" runat="server" ControlToValidate="txtTo_Date"
                                                                        ErrorMessage="Enter To Date" Display="None" SetFocusOnError="True" ValidationGroup="btnAddMor" />
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <%--No of days--%>
                                                            <asp:TemplateField HeaderText="No of days" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblNo_of_days" runat="server" Text='<%#Eval("Noofdays") %>' ToolTip="No of days" />
                                                                </ItemTemplate>
                                                                <%-- <FooterTemplate>
                                                                    <asp:TextBox ID="txtNo_of_days" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                        runat="server" ToolTip="No of days" />
                                                                </FooterTemplate>--%>
                                                            </asp:TemplateField>
                                                            <%-- Action --%>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnRemove" Text="Remove" CommandName="Delete" runat="server"
                                                                        CausesValidation="false" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Button ID="btnAddMor" runat="server" CommandName="Add" CssClass="styleGridShortButton"
                                                                        Text="Add" ValidationGroup="btnAddMor"></asp:Button>
                                                                </FooterTemplate>
                                                                <FooterStyle HorizontalAlign="Center" />
                                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <br />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Interest schedule Details" ID="tpInterest"
                        CssClass="tabpan" BackColor="Red">
                        <ContentTemplate>
                            <%--  <asp:UpdatePanel ID="upInterest" runat="server" >
                                <ContentTemplate>--%>
                            <asp:Panel GroupingText="Interest schedule Details" ID="pnlInterest" runat="server"
                                CssClass="stylePanel">
                                <asp:GridView ID="gvInterest" runat="server" AutoGenerateColumns="false" Width="100%"
                                    ShowFooter="true">
                                    <Columns>
                                        <%--Serial Number--%>
                                        <asp:TemplateField HeaderText="Sl No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                            </ItemTemplate>
                                            <ItemStyle Width="4%" />
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Fund Reference Number" DataField="Fund_Ref_No" />
                                        <%--<asp:BoundField HeaderText="Due Date" DataField="Due_Date" />--%>
                                        <asp:TemplateField HeaderText="Due Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDueDate" runat="server" Text='<%#Eval("Due_Date") %>' ToolTip="Due Date" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <FooterTemplate>
                                                <asp:Label ID="lblTotal" runat="server" Text="Total:" ToolTip="Total" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <%-- <asp:BoundField HeaderText="Due Amount" DataField="Due_Amount" ItemStyle-HorizontalAlign="Right" />--%>
                                        <asp:TemplateField HeaderText="Due Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDueAmount" runat="server" Text='<%#Eval("Due_Amount") %>' ToolTip="Due Amount" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterTemplate>
                                                <asp:Label ID="lblTotDueAmount" runat="server" Text="" ToolTip="Total Due Amount" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payment Reference Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPayRefNO" runat="server" Text='<%#Eval("Payment_Ref_No") %>' ToolTip="Payment Reference Number" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <%--<FooterTemplate>
                                                <asp:Label ID="FlblTot" runat="server" Text="Total:" ToolTip="Total" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" />--%>
                                        </asp:TemplateField>
                                        <%--    <asp:BoundField HeaderText="Payment Amount" DataField="Payment_Amount" ItemStyle-HorizontalAlign="Right" />--%>
                                        <asp:TemplateField HeaderText="Payment Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPayAmt" runat="server" Text='<%#Eval("Payment_Amount") %>' ToolTip="Payment Amount" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterTemplate>
                                                <asp:Label ID="lblTotPayAmount" runat="server" Text='<%#Eval("TotInterest") %>' ToolTip="Total Payment Amount" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Remarks" DataField="Remarks" ItemStyle-HorizontalAlign="Right" />
                                        <%--<asp:TemplateField HeaderText="Remarks">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtRemarks" runat="server" Text='<%#Eval("Remarks") %>' TextMode ="MultiLine"  />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                            <%-- </ContentTemplate>
                            </asp:UpdatePanel>--%>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Cashflow" ID="tpcashflow" CssClass="tabpan"
                        BackColor="Red">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Panel GroupingText="Cashflow" ID="pnlCashflow" runat="server" CssClass="stylePanel">
                                        <asp:GridView ID="grvCashflows" runat="server" Width="90%" AutoGenerateColumns="false"
                                            ShowFooter="true" FooterStyle-HorizontalAlign="Center" OnRowCommand="grvCashflows_RowCommand"
                                            OnRowDataBound="grvCashflows_RowDataBound" OnRowDeleting="grvCashflows_RowDeleting">
                                            <Columns>
                                                <%--Serial Number--%>
                                                <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                        <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />
                                                        <asp:HiddenField ID="hdn_Fund_CF_ID" runat="server" Value='<%#Eval("Fund_CF_ID") %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <%--Type--%>
                                                <asp:TemplateField HeaderText="Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblType" runat="server" Text='<%#Eval("Type") %>' ToolTip="Cashflow Type" />
                                                        <asp:Label ID="lblTypeID" runat="server" Text='<%#Eval("TypeID") %>' Visible="false"
                                                            ToolTip="Cashflow Type ID" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                        </asp:DropDownList>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <%--Frequency--%>
                                                <asp:TemplateField HeaderText="CashFlow Desc">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCashFlow" runat="server" Text='<%#Eval("CashFlow") %>' ToolTip="CashFlow" />
                                                        <asp:Label ID="lblCashFlowID" runat="server" Text='<%#Eval("CashFlowID") %>' Visible="false"
                                                            ToolTip="Cashflow desc ID" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:DropDownList ID="ddlCashFlow" runat="server" AutoPostBack="true">
                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                        </asp:DropDownList>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <%--Frequency--%>
                                                <asp:TemplateField HeaderText="Frequency">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFrequency" runat="server" Text='<%#Eval("Frequency") %>' ToolTip="Frequency" />
                                                        <asp:Label ID="lblFrequencyID" runat="server" Text='<%#Eval("FrequencyID") %>' Visible="false"
                                                            ToolTip="Cashflow Frequency ID" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:DropDownList ID="ddlFrequency" runat="server" AutoPostBack="true">
                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                        </asp:DropDownList>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <%--Date--%>
                                                <asp:TemplateField HeaderText="Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCFDate" runat="server" Text='<%#Eval("CFDate") %>' ToolTip="Frequency" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtCFDate" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                            runat="server" ToolTip="CashFlow Date" />
                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtCFDate"
                                                            PopupButtonID="txtCFDate" ID="CEtxtCFDate" Enabled="True">
                                                        </cc1:CalendarExtender>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <%--Amount--%>
                                                <asp:TemplateField HeaderText="Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCFAmount" Style="text-align: right;" runat="server" Text='<%#Eval("CFAmount") %>'
                                                            ToolTip="Frequency" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtCFAmount" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                            Style="text-align: right;" runat="server" ToolTip="Amount" />
                                                    </FooterTemplate>
                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <%--checkbox for Formula Field--%>
                                                <asp:TemplateField HeaderText="Condition">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCondition" Visible="false" runat="server" Text='<%#Eval("Condition") %>'
                                                            ToolTip="Condition" />
                                                        <asp:CheckBox ID="cbkConditionI" AutoPostBack="true" runat="server" OnCheckedChanged="cbkConditionI_CheckedChanged" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:CheckBox ID="cbkCondition" AutoPostBack="true" runat="server" OnCheckedChanged="cbkCondition_CheckedChanged" />
                                                    </FooterTemplate>
                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
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
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                    <asp:Panel GroupingText="Condition" ID="pnlConditions" runat="server" CssClass="stylePanel"
                                        Visible="false">
                                        <table>
                                            <tr>
                                                <td class="styleFieldLabel" width="10%">
                                                    <asp:Label runat="server" ID="lblFields" Text="Fields"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:DropDownList ID="ddlFields" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFields_SelectedIndexChanged">
                                                        <asp:ListItem Value="0" Text="--Select--" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="styleFieldLabel" width="18%">
                                                    <asp:Label runat="server" ID="lblNumericOperator" Text="Numeric Operator"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="25%">
                                                    <asp:DropDownList ID="ddlNumericOperators" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlNumericOperators_SelectedIndexChanged">
                                                        <asp:ListItem Value="0" Text="--Select--" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="styleFieldLabel" colspan="2">
                                                    <%--   <asp:Label runat="server" ID="lblValues" Text="Values"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign" width="25%">
                                            <asp:TextBox ID="txtValues" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                Style="text-align: right;" runat="server" ToolTip="Amount" />--%>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <asp:TextBox ID="txtFormula" Width="100%" onmouseover="txt_MouseoverTooltip(this)"
                                                        runat="server" ToolTip="Formula" TextMode="MultiLine" Rows="5" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" HeaderText="Others" ID="TpOthers" CssClass="tabpan"
                        BackColor="Red">
                        <ContentTemplate>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <asp:Panel GroupingText="Others" ID="pnlOthers" runat="server" CssClass="stylePanel">
                                        <table width="100%">
                                            <tr>
                                                <td class="styleFieldLabel" width="12%">
                                                    <asp:Label runat="server" ID="lblIntApplMoney" Text="Int. on Appl. Money(%)"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="20%">
                                                    <asp:TextBox ID="txtIntApplMoney" Width="75%" onmouseover="txt_MouseoverTooltip(this)"
                                                        runat="server" ToolTip="Int. on Appl. Money(%)" />
                                                </td>
                                                <td class="styleFieldLabel" width="12%">
                                                    <asp:Label runat="server" ID="lblApplMoneyHC" CssClass="styleReqFieldLabel" Text="Appln. Money HC"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="20%">
                                                    <asp:TextBox ID="txtApplMoneyHC" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                        runat="server" ToolTip="Appln. Money HC" />
                                                </td>
                                                <td class="styleFieldLabel" width="8%">
                                                    <asp:Label runat="server" ID="lblApplMoneyISIN" CssClass="styleReqFieldLabel" Text="ISIN"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="20%">
                                                    <asp:TextBox ID="txtApplMoneyISIN" Width="75%" onmouseover="txt_MouseoverTooltip(this)"
                                                        runat="server" ToolTip="ISIN" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="12%">
                                                    <asp:Label runat="server" ID="lblDateofAvailment" Text="Date of Availment"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="20%">
                                                    <asp:TextBox ID="txtDateofAvailment" Width="75%" onmouseover="txt_MouseoverTooltip(this)"
                                                        runat="server" ToolTip="Date of Availment" />
                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDateofAvailment"
                                                        PopupButtonID="txtDateofAvailment" ID="CEDateofAvailment" Enabled="True">
                                                    </cc1:CalendarExtender>
                                                </td>
                                                <td class="styleFieldLabel" width="12%">
                                                    <asp:Label runat="server" ID="lblAvailmentAmount" CssClass="styleReqFieldLabel" Text="Availment Amount"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="20%">
                                                    <asp:TextBox ID="txtAvailmentAmount" Width="75%" onmouseover="txt_MouseoverTooltip(this)"
                                                        runat="server" ToolTip="Availment Amount" />
                                                </td>
                                                <td class="styleFieldLabel" width="8%">
                                                    <asp:Label runat="server" ID="lblAvailmentISIN" CssClass="styleReqFieldLabel" Text="ISIN"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="20%">
                                                    <asp:TextBox ID="txtAvailmentISIN" Width="75%" onmouseover="txt_MouseoverTooltip(this)"
                                                        runat="server" ToolTip="ISIN" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="12%">
                                                    <asp:Label runat="server" ID="lblAllotmentDate" Text="Allotment Date"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="20%">
                                                    <asp:TextBox ID="txtAllotmentDate" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                        runat="server" ToolTip="Allotmen tDate" />
                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtAllotmentDate"
                                                        PopupButtonID="txtAllotmentDate" ID="CEAllotmentDate" Enabled="True">
                                                    </cc1:CalendarExtender>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel GroupingText="CP Details" ID="pnlCP" runat="server" CssClass="stylePanel">
                                        <table width="100%">
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblCP" Text="Roll Over"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:CheckBox ID="chkCP" AutoPostBack="true" runat="server" OnCheckedChanged="chkCP_CheckedChanged" />
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblPrevFundTran" Text="Fund Tran No"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:DropDownList ID="ddlPrevFundTran" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPrevFundTran_SelectedIndexChanged">
                                                        <asp:ListItem Value="0" Text="--Select--" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
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
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" OnClick="btnSave_Click"
                                ToolTip="Save" Text="Save" CausesValidation="true" OnClientClick="return fnCheckPageValidators('Main')"
                                ValidationGroup="Main" />
                            <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                                ToolTip="Clear_FA" Text="Clear_FA" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />
                            <asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                                ToolTip="Cancel" Text="Cancel" OnClick="btnCancel_Click" />
                            <asp:Button ID="btnCalIRR" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                                Text="Calculate IRR" OnClick="btnCalIRR_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:ValidationSummary ID="vsFunderTransaction" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="Main" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="vsFunderTransactionR" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="btngo" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="vsFunderTransactionB" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="btngoB" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgUpdate" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgBRAdd" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="ValidationSummary4" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgBRUpdate" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />
                <asp:ValidationSummary ID="vsbtnAddMor" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                    ValidationGroup="btnAddMor" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                <asp:CustomValidator ID="cvFunderTransaction" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />
                <asp:HiddenField ID="hdn_DueAmtTot" Value="0" runat="server" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="txthiddenfield" runat="server" Visible="false"></asp:TextBox>

    <script type="text/javascript">
        function checkDate_PrevSystemDate1(sender, args) {

            if (sender._selectedDate < new Date()) {

                //alert('You cannot select a date less than or equal to system date');
                alert('Selected date cannot be less than or equal to system date');
                //sender._textbox.set_Value('');
            }
            document.getElementById(sender._textbox._element.id).focus();

        }

        //Method to Check zero only in the Text box     
        function ChkIsZeroL(textbox) {
            if (parseFloat(textbox.value) == 0) {
                textbox.focus();
                //textbox.value='';
                alert('Rate should not be 0');
            }

        }


        //Round of to desired prefix and sufix   
        function funChkDecimialF(txtbox, prefixLen, sufixLen, strFieldName, IsZeroCheckReq) {
            if (txtbox.value != '') {
                if (IsZeroCheckReq) {
                    if (parseFloat(txtbox.value) == 0) {
                        txtbox.focus();
                        txtbox.value = '';
                        if (strFieldName == undefined) {
                            alert('Value Can not be 0');
                            txtbox.value = "0";
                            txtbox.focus();
                            return false;
                        }
                        else {
                            alert(strFieldName + ' Can not be 0');
                            txtbox.value = "0";
                            txtbox.focus();
                            return false;
                        }
                    }
                }
                if (isNaN(parseFloat(txtbox.value))) {
                    alert('Enter a valid decimal');
                    txtbox.value = "";
                    txtbox.focus();
                    return false;
                }
                else {
                    var str = txtbox.value.split('.');

                    if (str[0].length > prefixLen) {
                        if (strFieldName == '') {
                            alert('Value precision should not exceed ' + prefixLen + ' digits');
                        }
                        else {
                            alert(strFieldName + ' precision should not exceed ' + prefixLen + ' digits');
                        }
                        txtbox.focus();
                        return false;
                    }
                    txtbox.value = parseFloat(txtbox.value).toFixed(sufixLen);
                }
            }
            return true;
        }

        function FunClearTenure() {
            var txtTenure = document.getElementById('<%=txtTenure.ClientID%>');
            txtTenure.value = '';
        }
           
    </script>

</asp:Content>
