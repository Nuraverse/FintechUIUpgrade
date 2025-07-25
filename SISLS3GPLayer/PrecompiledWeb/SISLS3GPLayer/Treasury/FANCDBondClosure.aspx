<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_FANCDBondClosure, App_Web_insjbia3" title="NCD Bond Closure" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/FALOVMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td class="stylePageHeading">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="stylePageHeading">
                                                <asp:Label ID="lblHeading" runat="server" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%">
                                        <tr>
                                            <td colspan="2" valign="top">
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
                                                            <%--<asp:TextBox ID="txtFunderTranNo" Width="165px" runat="server" ToolTip="Funder Transaction Number"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />--%>
                                                            <asp:DropDownList ID="ddlFunderTranNo" OnSelectedIndexChanged="ddlFunderTranNo_SelectedIndexChanged"
                                                                AutoPostBack="true" runat="server" ToolTip="Funder Transaction Number" Width="170px">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RFddlFunderTranNo" runat="server" ControlToValidate="ddlFunderTranNo"
                                                                InitialValue="0" ErrorMessage="Select Funder Transaction Number" Display="None"
                                                                SetFocusOnError="True" ValidationGroup="Main" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="20%" style="padding-bottom: 0px">
                                                            <asp:Label runat="server" ID="lblFundercode" CssClass="styleReqFieldLabel" Text="Funder Code/Name"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                            <asp:DropDownList ID="ddlFunderCode" runat="server" ToolTip="Funder Code/Name" Width="170px" />
                                                            <%--<asp:TextBox ID="txtFunderCode" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    Width="165px" ToolTip="Funder Name" ReadOnly="true" />--%>
                                                        </td>
                                                    </tr>
                                                    <%-- <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label runat="server" ID="lblTranDate" Text="Funder Transaction Date"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="25%">
                                                                <asp:TextBox ID="txtFundTransDate" runat="server" Width="165px" ToolTip="Funder Transaction Date"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                            </td>
                                                        </tr>--%>
                                                </table>
                                            </td>
                                            <td colspan="2" valign="top">
                                                <table width="100%" align="center" cellspacing="0">
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label runat="server" ID="lblLocation" Text="Location" />
                                                        </td>
                                                        <td class="styleFieldAlign">
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
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="20%">
                                                            <asp:Label ID="lblComState" runat="server" CssClass="styleReqFieldLabel" Text="State"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtComState" runat="server" MaxLength="60" Width="60%" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="20%">
                                                            <asp:Label ID="lblComCountry" runat="server" CssClass="styleReqFieldLabel" Text="Country"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtComCountry" runat="server" MaxLength="60" Width="37%" ReadOnly="true"></asp:TextBox>
                                                            <asp:Label ID="lblCompincode" runat="server" CssClass="styleReqFieldLabel" Text="Pin"></asp:Label>
                                                            <asp:TextBox ID="txtComPincode" ReadOnly="true" runat="server" Width="34%" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:Panel ID="pnlNCDDetails" runat="server" GroupingText="NCD / BONDS Details" CssClass="stylePanel">
                                                    <table>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblNCDBondValue" Text="NCD Bond Value"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtNCDBondValue" runat="server" Width="95%" ToolTip="NCD Bond Value"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                            </td>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblSubscriptionDate" Text="Subscription Date"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtSubscriptionDate" runat="server" Width="95%" ToolTip="Subscription Date"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                            </td>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblMaturityDate" Text="Maturity Date"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtMaturityDate" runat="server" Width="95%" ToolTip="Maturity Date"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblInterestRate" Text="Interest Rate (p.a)"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtInterestRate" runat="server" Width="95%" ToolTip="Interest Rate (p.a)"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                            </td>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblInterestDue" Text="Interest Due"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtInterestDue" runat="server" Width="95%" ToolTip="Interest Due"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                            </td>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="Label3" Text="Interest Paid"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtInterestPaid" runat="server" Width="95%" ToolTip="Interest Paid"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblTaxCertAmount" Text="Tax Certificate Amount"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtTaxCertAmount" runat="server" Width="95%" ToolTip="Tax Certificate Amount"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                            </td>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblTaxCertDate" Text="Tax Certificate Date"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtTaxCertDate" runat="server" Width="95%" ToolTip="Tax Certificate Date"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                            </td>
                                                            <td class="styleFieldAlign" width="15%">
                                                                <asp:CheckBoxList CssClass="styleDisplayLabel" RepeatDirection="Horizontal" runat="server"
                                                                    ID="rdbCallPut">
                                                                    <asp:ListItem Text="Call" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="Put" Value="1"></asp:ListItem>
                                                                </asp:CheckBoxList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:Panel ID="Panel1" runat="server" GroupingText="Closure Details" CssClass="stylePanel">
                                                    <table>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblNCDValueCls" Text="NCD Bond Value"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtNCDValueCls" runat="server" Width="95%" ToolTip="NCD Bond Value"
                                                                    onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" />
                                                            </td>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblClosureNoCls" Text="Closure No"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtClosureNoCls" runat="server" Width="95%" ToolTip="Closure No"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblInterestRateCls" Text="Rate of Interest"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtInterestRateCls" runat="server" Width="95%" ToolTip="Rate of Interest"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                            </td>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblClosureDateCls" Text="Date of Closure"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtClosureDateCls" runat="server" Width="95%" ToolTip="Closure Date"
                                                                    onmouseover="txt_MouseoverTooltip(this)" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:Panel ID="pnlPayDetails" runat="server" GroupingText="Pay Details" CssClass="stylePanel">
                                                    <table>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblPrincipalAmount" Text="Principal Amount"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtPrincipalAmount" runat="server" Width="95%" ToolTip="Principal Amount"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                            </td>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblPaymode" Text="Pay mode"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtPaymode" runat="server" Width="95%" ToolTip="Pay Mode" onmouseover="txt_MouseoverTooltip(this)"
                                                                    ReadOnly="true" Style="text-align: right;" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblInterestAmount" Text="Interest Amount"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtInterestAmount" runat="server" Width="95%" ToolTip="Interest Amount"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                            </td>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblBank" Text="Bank"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtBank" runat="server" Width="95%" ToolTip="Bank" onmouseover="txt_MouseoverTooltip(this)"
                                                                    ReadOnly="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblTDS" Text="Int. Tax Deduction"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtTDS" runat="server" Width="95%" ToolTip="Int. Tax Deduction"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                            </td>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblAccountNumber" Text="Account Number"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtAccountNumber" runat="server" Width="95%" ToolTip="Account Number"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblNetPayable" Text="Net Payable"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtNetPayable" runat="server" Width="95%" ToolTip="Net Payable"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                            </td>
                                                            <td class="styleFieldLabel" width="15%">
                                                                <asp:Label runat="server" ID="lblInstrumentNo" Text="Instrument Number"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" width="20%">
                                                                <asp:TextBox ID="txtInstrumentNo" runat="server" Width="95%" ToolTip="Instrument Number"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" OnClientClick="return fnCheckPageValidators('Save',false);"
                                        CssClass="styleSubmitButton" />
                                    <asp:Button ID="btnClear" runat="server" Text="Clear_FA" OnClick="btnClear_Click" CssClass="styleSubmitButton" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
                                        CssClass="styleSubmitButton" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ValidationSummary ID="VSbtnSave" runat="server" ValidationGroup="Save" CssClass="styleMandatoryLabel"
                                        HeaderText="Correct the following validation(s):" ShowSummary="true" />
                                    <asp:CustomValidator ID="CV_NCDClosure" runat="server" CssClass="styleMandatoryLabel"
                                        Enabled="true" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
