<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAActualInterest, App_Web_4hds5vgj" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/FALOVMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
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
                                            <td width="25%">
                                                <asp:Label ID="lblFunderName" runat="server" CssClass="styleDisplayLabel" Text="Funder Name" />
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="txtCode" ToolTip="Funder Code" runat="server" Style="display: none;"
                                                    MaxLength="50" Width="65%" ></asp:TextBox>
                                                <uc2:LOV ID="ucLov" onblur="fnLoadEntity()" runat="server" DispalyContent="Code"
                                                    TextWidth="65%" />
                                                <asp:Button ID="btnCreateCustomer" runat="server" UseSubmitBehavior="true" Text="Create"
                                                    Style="display: none;" OnClick="btnCreateCustomer_Click" CssClass="styleSubmitShortButton"
                                                    CausesValidation="false" />
                                                <%-- <asp:RequiredFieldValidator ID="RFVFunderCode" ControlToValidate="txtCode" runat="server"
                                                    CssClass="styleMandatoryLabel" ErrorMessage="Select Funder Code" ValidationGroup="btnGo"
                                                    Display="None" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                            </td>
                                            <td width="25%">
                                                <asp:Label ID="lblFunderReference" runat="server" CssClass="styleDisplayLabel" Text="Funder Reference" />
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="txtFunderReference" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="25%">
                                                <asp:Label ID="lblDealNo" runat="server" CssClass="styleDisplayLabel" Text="Deal No" />
                                            </td>
                                            <td width="25%">
                                                <asp:DropDownList ID="ddlDealNumber" OnSelectedIndexChanged="ddlDealNumber_SelectedIndexChanged"
                                                    AutoPostBack="true" runat="server" CssClass="styleReqFieldLabel" />
                                            </td>
                                            <td width="25%">
                                                <asp:Label ID="lblTrancheNumber" runat="server" CssClass="styleDisplayLabel" Text="Tranche Number" />
                                            </td>
                                            <td width="25%">
                                                <asp:DropDownList ID="ddlTrancheRefNo" runat="server" CssClass="styleReqFieldLabel" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="25%">
                                                <asp:Label ID="lblInterestFrom" runat="server" Text="Interest From" CssClass="styleDisplayLabel" />
                                            </td>
                                            <td width="20%">
                                                <asp:TextBox ID="txtInterestFrom" runat="server" />
                                                <cc1:CalendarExtender ID="cldrFromDate" runat="server" PopupButtonID="txtInterestFrom"
                                                    TargetControlID="txtInterestFrom" />
                                                <asp:RequiredFieldValidator ID="RFVtxtInterestFrom" ControlToValidate="txtInterestFrom"
                                                    runat="server" CssClass="styleMandatoryLabel" ErrorMessage="Enter Interest From"
                                                    ValidationGroup="btnGo" Display="None" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </td>
                                            <td width="20%">
                                                <asp:Label ID="lblInterestTo" runat="server" Text="Interest to" CssClass="styleDisplayLabel" />
                                            </td>
                                            <td width="20%">
                                                <asp:TextBox ID="txtInterestTo" runat="server" />
                                                <cc1:CalendarExtender ID="cldrToDate" runat="server" PopupButtonID="txtInterestTo"
                                                    TargetControlID="txtInterestTo" />
                                                <asp:RequiredFieldValidator ID="RFVtxtInterestTo" ControlToValidate="txtInterestTo"
                                                    runat="server" CssClass="styleMandatoryLabel" ErrorMessage="Enter Interest To"
                                                    ValidationGroup="btnGo" Display="None" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" align="center">
                                                <asp:Button ID="btnGo" ValidationGroup="btnGo" runat="server" Text="Go" OnClick="btnGo_Click"
                                                    CssClass="styleSubmitButton" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <%--<div id="divInterest" runat="server" style="overflow: auto; height: 400px; display: none">--%>
                                                <asp:GridView ID="grvInterestCost" runat="server" AutoGenerateColumns="false" Width="100%"
                                                    ShowFooter="true" OnRowDataBound="grvInterestCost_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Tran Int Id" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTranIntId" runat="server" Text='<%#Eval("TranIntId")%>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Funder Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFunderName" runat="server" Text='<%#Eval("FunderName")%>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Deal No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDealNo" runat="server" Text='<%#Eval("DealNo")%>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Tranche No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTrancheNo" runat="server" Text='<%#Eval("TrancheNo")%>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Transaction No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbltransactionNo" runat="server" Text='<%#Eval("TransactionNo")%>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Interest Due Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInterestDueDate" runat="server" Text='<%#Eval("InterestDueDate")%>' />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Text="Total" />
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Provisional Interest" FooterStyle-HorizontalAlign="Center"
                                                            ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblProvisionalInterest" runat="server" Text='<%#Eval("ProvisionalInterest")%>'
                                                                    Style="text-align: right;" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalProvlInterest" runat="server" />
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Actual Interest" FooterStyle-HorizontalAlign="Center"
                                                            ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="TxtActualInterest" runat="server" Text='<%#Eval("ActualInterest")%>'
                                                                    Style="text-align: right;"/>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalActInterest" runat="server" Text="" />
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Interest Journal">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInterestJournal" runat="server" Text='<%#Eval("InterestJournal")%>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                           <%-- </div>--%>
                                        </td>
                                    </tr>
                                </table>
                            </tr>
                            <tr>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td align="center">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_OnClick"  CssClass="styleSubmitButton" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear_FA" OnClick="btnClear_OnClick"  CssClass="styleSubmitButton" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel"  OnClick="btnCancel_OnClick" CssClass="styleSubmitButton" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary ID="VSbtnGo" runat="server" ValidationGroup="btnGo" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ShowSummary="true" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript" language="javascript">
        function fnLoadEntity() {
            document.getElementById('<%=btnCreateCustomer.ClientID %>').click();
        }
  
    </script>

</asp:Content>
