<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_FA_NCDSTP, App_Web_zogfwrp2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td class="stylePageHeading">
                                    <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%">
                                        <tr>
                                            <td colspan="2">
                                                <table>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="50%">
                                                            <asp:Label runat="server" ID="lblDealNumber" CssClass="styleReqFieldLabel" Text="Deal Number"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" width="50%">
                                                            <asp:DropDownList ID="ddlDealNumber" runat="server" ToolTip="Deal Number" Width="170px"
                                                                OnSelectedIndexChanged="ddlDealNumber_SelectedIndexChanged" AutoPostBack="true">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RFVddlDealNumber" runat="server" ControlToValidate="ddlDealNumber"
                                                                InitialValue="0" ErrorMessage="Select Deal Number" Display="None" SetFocusOnError="True"
                                                                ValidationGroup="Main" />
                                                            <asp:RequiredFieldValidator ID="RFVddlDealNumber1" runat="server" ControlToValidate="ddlDealNumber"
                                                                InitialValue="0" ErrorMessage="Select Deal Number" Display="None" SetFocusOnError="True"
                                                                ValidationGroup="Go" />
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
                                                            <asp:RequiredFieldValidator ID="RFVddlTrancheRefNo" runat="server" ControlToValidate="ddlTrancheRefNo"
                                                                InitialValue="0" ErrorMessage="Select Tranche Ref No" Display="None" SetFocusOnError="True"
                                                                ValidationGroup="Main" />
                                                            <asp:RequiredFieldValidator ID="RFVddlTrancheRefNo1" runat="server" ControlToValidate="ddlTrancheRefNo"
                                                                InitialValue="0" ErrorMessage="Select Tranche Ref No" Display="None" SetFocusOnError="True"
                                                                ValidationGroup="Go" />
                                                            <asp:RequiredFieldValidator ID="RFVddlTrancheRefNo2" runat="server" ControlToValidate="ddlTrancheRefNo"
                                                                ErrorMessage="Select Tranche Ref No" Display="None" SetFocusOnError="True" ValidationGroup="Go" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="25%">
                                                            <asp:Label runat="server" ID="lblFunderTranNo" Text="Funder Transaction Number"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" width="25%">
                                                            <asp:DropDownList ID="ddlFundTranNo" OnSelectedIndexChanged="ddlFundTranNo_SelectedIndexChanged"
                                                                AutoPostBack="true" runat="server" ToolTip="Tranche Ref No" Width="170px">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RFVddlFundTranNo" runat="server" ControlToValidate="ddlFundTranNo"
                                                                InitialValue="0" ErrorMessage="Select Funder Transaction Number" Display="None"
                                                                SetFocusOnError="True" ValidationGroup="Main" />
                                                            <asp:RequiredFieldValidator ID="RFVddlFundTranNo1" runat="server" ControlToValidate="ddlFundTranNo"
                                                                InitialValue="0" ErrorMessage="Select Funder Transaction Number" Display="None"
                                                                SetFocusOnError="True" ValidationGroup="Go" />
                                                            <asp:RequiredFieldValidator ID="RFVddlFundTranNo2" runat="server" ControlToValidate="ddlFundTranNo"
                                                                ErrorMessage="Select Funder Transaction Number" Display="None" SetFocusOnError="True"
                                                                ValidationGroup="Go" />
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
                                                            <asp:DropDownList ID="ddlNatureofFund" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                Enabled="false">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="25%">
                                                            <asp:Label runat="server" ID="lblSanctionRefNo" Text="Sanction Ref Number"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" width="25%">
                                                            <asp:TextBox ID="txtSanctionRefNo" Width="165px" runat="server" ToolTip="Sanction Ref Number"
                                                                onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="25%">
                                                            <asp:Label runat="server" ID="lblTransAmt" Text="Transaction Amount"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" width="25%">
                                                            <asp:TextBox ID="txtTransAmt" runat="server" Width="165px" ToolTip="Transaction Amount"
                                                                onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td colspan="2">
                                                <table>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="50%">
                                                            <asp:Label runat="server" ID="lblFunderName" CssClass="styleReqFieldLabel" Text="Funder Name"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" width="50%">
                                                            <asp:TextBox ID="txtFunderName" Width="165px" runat="server" ToolTip="Funder Name"
                                                                onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="25%">
                                                            <asp:Label runat="server" ID="lblCurrency" CssClass="styleReqFieldLabel" Text="Currency"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" width="75%">
                                                            <asp:TextBox ID="txtCurrency" Width="165px" runat="server" ToolTip="Currency" onmouseover="txt_MouseoverTooltip(this)"
                                                                ReadOnly="true" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <table>
                                                                <tr>
                                                                    <td class="styleFieldLabel">
                                                                        <asp:Label runat="server" ID="lblBaseRate" CssClass="styleReqFieldLabel" Text="Base Rate"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblSpreadRate" CssClass="styleReqFieldLabel" Text="Spread Rate"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblTotalRate" CssClass="styleReqFieldLabel" Text="Total Rate"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:TextBox ID="txtBaseRate" Width="100px" runat="server" ToolTip="Base Rate" onmouseover="txt_MouseoverTooltip(this)"
                                                                            ReadOnly="true" Style="text-align: right;" />
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:TextBox ID="txtSpreadRate" Width="100px" runat="server" ToolTip="Spread Rate"
                                                                            onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                                    </td>
                                                                    <td class="styleFieldAlign">
                                                                        <asp:TextBox ID="txtTotalRate" Width="100px" runat="server" ToolTip="Total Rate"
                                                                            onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="25%">
                                                            <asp:Label runat="server" ID="lblDateofAvailment" Text="Date of Availment"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" width="25%">
                                                            <asp:TextBox ID="txtDateofAvailment" Width="165px" runat="server" ToolTip="Date of Availment"
                                                                onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="25%">
                                                            <asp:Label runat="server" ID="lblAvailmentAmount" Text="Availment Amount"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" width="25%">
                                                            <asp:TextBox ID="txtAvailmentAmount" runat="server" Width="165px" ToolTip="Availment Amount"
                                                                onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:Button ID="btnGo" CssClass="styleGridShortButton" runat="server" Text="Go" ToolTip="Go"
                                                                OnClick="btnGo_Click" OnClientClick="return fnCheckPageValidators('Go',false);" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="grvNCDDetails" runat="server" AutoGenerateColumns="False" ToolTip="NCD Details"
                                        Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Transaction Number">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTranNum" runat="server" Text='<%#Eval("Tran_Num")%>'> </asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Transaction Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTranDate" runat="server" Text='<%#Eval("Tran_Date")%>'> </asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Buyer">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBuyer" runat="server" Text='<%#Eval("Buyer")%>'> </asp:Label>
                                                    <asp:Label ID="lblBuyerCode" runat="server" Text='<%#Eval("Buyer_Code")%>' Visible="false"> </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Seller">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSeller" runat="server" Text='<%#Eval("Seller")%>'> </asp:Label></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Transaction Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTran_Amt" runat="server" Text='<%#Eval("Tran_Amt")%>'> </asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Address">
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgbtnAddress" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                        runat="server" OnClick="imgbtnAddress_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                        <tr align="center">
                                            <td>
                                                <asp:Button ID="btnSave" CssClass="styleSubmitButton" runat="server" OnClientClick="return fnCheckPageValidators('Main',false);"
                                                    Text="Save" OnClick="btnSave_Click" CausesValidation="false" />
                                                <asp:Button ID="btnClear" CssClass="styleSubmitButton" runat="server" Text="Clear_FA"
                                                    OnClientClick="return fnConfirmClear();" CausesValidation="False" OnClick="btnClear_Click" />
                                                <asp:Button ID="btnCancel" CssClass="styleSubmitButton" runat="server" CausesValidation="False"
                                                    Text="Cancel" OnClick="btnCancel_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ValidationSummary runat="server" ID="Vgsave" HeaderText="Correct the following validation(s):"
                                        CssClass="styleMandatoryLabel" ValidationGroup="Main" Width="500px" ShowMessageBox="false"
                                        ShowSummary="true" />
                                    <asp:ValidationSummary runat="server" ID="ValidationSummary1" HeaderText="Correct the following validation(s):"
                                        CssClass="styleMandatoryLabel" ValidationGroup="Go" Width="500px" ShowMessageBox="false"
                                        ShowSummary="true" />
                                    <asp:CustomValidator ID="CVNCDSTP" runat="server" CssClass="styleMandatoryLabel"
                                        Enabled="true" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnPopup" CssClass="styleSubmitButton" runat="server" Text="Save"
                                        CausesValidation="false" style="display:none"/>
                                    <cc1:ModalPopupExtender ID="MPopUp" runat="server" TargetControlID="btnPopup" PopupControlID="Panel3"
                                        BackgroundCssClass="modalBackground" DropShadow="true" CancelControlID="btnClose">
                                    </cc1:ModalPopupExtender>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Panel ID="Panel3" runat="server" Style="display: none" BackColor="White" BorderStyle="Solid"
                                        BorderWidth="1px" BorderColor="Black" Width="65%">
                                        <table width="100%">
                                            <tr>
                                                <td class="stylePageHeading" colspan="4" align="left" width="100%">
                                                    <asp:Label runat="server" Text="Buyer Address" ID="Label1" CssClass="styleDisplayLabel"> </asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblBuyer" CssClass="styleReqFieldLabel" Text="Buyer"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" colspan="2">
                                                    <asp:TextBox ID="txtBuyer" runat="server" Width="90%" ToolTip="Buyer" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblAddress1" CssClass="styleReqFieldLabel" Text="Address 1"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtAddress1" runat="server" ToolTip="Address1" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="true" />
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblAddress2" CssClass="styleReqFieldLabel" Text="Address 2"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtAddress2" runat="server" ToolTip="Address1" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblCity" CssClass="styleReqFieldLabel" Text="City"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtcity" runat="server" ToolTip="City" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="true" />
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblState" CssClass="styleReqFieldLabel" Text="State"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtState" runat="server" ToolTip="State" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblCountry" CssClass="styleReqFieldLabel" Text="Country"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtCountry" runat="server" ToolTip="Country" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="true" />
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblPIN" CssClass="styleReqFieldLabel" Text="PIN"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtPIN" runat="server" ToolTip="PIN" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblTelephone" CssClass="styleReqFieldLabel" Text="Telephone"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtTelephone" runat="server" ToolTip="Telephone" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="true" />
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblMobile" CssClass="styleReqFieldLabel" Text="Mobile"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtMobile" runat="server" ToolTip="Mobile" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblEMail" CssClass="styleReqFieldLabel" Text="EMail"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtEMail" runat="server" ToolTip="EMail" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="true" />
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblBank" CssClass="styleReqFieldLabel" Text="Bank Name"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtBank" runat="server" ToolTip="Bank Name" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblIFSC" CssClass="styleReqFieldLabel" Text="IFSC Code"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtIFSCCode" runat="server" ToolTip="IFSC Code" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="true" />
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblAccountType" CssClass="styleReqFieldLabel" Text="Account Type"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtAccountType" runat="server" ToolTip="Account Type" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="true" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label runat="server" ID="lblAccountNumber" CssClass="styleReqFieldLabel" Text="Account Number"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtAccountNumber" runat="server" ToolTip="Account Number" onmouseover="txt_MouseoverTooltip(this)"
                                                        ReadOnly="true" />
                                                </td>
                                                <td class="styleFieldLabel">
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:Button ID="btnClose" CssClass="styleGridShortButton" runat="server" Text="Close"
                                                        ToolTip="Close"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
