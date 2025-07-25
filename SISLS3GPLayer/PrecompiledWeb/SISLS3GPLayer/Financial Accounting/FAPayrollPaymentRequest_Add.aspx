<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAPayrollPaymentRequest_Add, App_Web_mv5fp02i" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/FALOVMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Payeroll Payment Process" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="styleFieldLabel">
                            <asp:Label runat="server" ToolTip="Document Number" Text="Document Number"
                                ID="lblPaymentRequestNo" CssClass="styleDisplayLabel"></asp:Label>
                        </td>
                        <td class="styleFieldAlign">
                            <asp:TextBox ID="txtPaymentRequestNo" onmouseover="txt_MouseoverTooltip(this)"
                                ReadOnly="true" runat="server"></asp:TextBox>
                        </td>
                        <td class="styleFieldLabel">
                            <asp:Label runat="server" Text="Document Date" ToolTip="Document Date" ID="lblPaymentRequestDate"
                                CssClass="styleDisplayLabel"></asp:Label>
                        </td>
                        <td class="styleFieldAlign">
                            <asp:TextBox ID="txtPaymentRequestDate" onmouseover="txt_MouseoverTooltip(this)"
                                runat="server" ></asp:TextBox>
                            <asp:Image ID="imgPaymentRequestDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                            <cc1:CalendarExtender ID="CEPaymentRequestDate" runat="server" PopupButtonID="imgPaymentRequestDate"
                                OnClientDateSelectionChanged="checkDate_NextSystemDate_Request" TargetControlID="txtPaymentRequestDate">
                            </cc1:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="styleFieldLabel">
                            <asp:Label runat="server" Text="From Date" ToolTip="From Date" ID="lblFromDate"
                                CssClass="styleDisplayLabel"></asp:Label>
                        </td>
                        <td class="styleFieldAlign">
                            <asp:TextBox ID="txtFromDate" onmouseover="txt_MouseoverTooltip(this)"
                                runat="server"></asp:TextBox>
                            <asp:Image ID="imgFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                            <cc1:CalendarExtender ID="calFromDate" runat="server" PopupButtonID="imgFromDate"
                                OnClientDateSelectionChanged="checkDate_NextSystemDate_Request" TargetControlID="txtFromDate">
                            </cc1:CalendarExtender>
                        </td>
                        <td class="styleFieldLabel">
                            <asp:Label runat="server" Text="To Date" ToolTip="From Date" ID="lblToDate"
                                CssClass="styleDisplayLabel"></asp:Label>
                        </td>
                        <td class="styleFieldAlign">
                            <asp:TextBox ID="txtToDate" onmouseover="txt_MouseoverTooltip(this)"
                                runat="server"></asp:TextBox>
                            <asp:Image ID="imgToDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                            <cc1:CalendarExtender ID="calToDate" runat="server" PopupButtonID="imgToDate"
                                OnClientDateSelectionChanged="checkDate_NextSystemDate_Request" TargetControlID="txtToDate">
                            </cc1:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <asp:Button ID="btnGo" OnClick="btnGo_Click" runat="server" Text="Go"
                                AccessKey="G" ToolTip="Go to the details,Alt+G" CssClass="styleSubmitShortButton" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel GroupingText="Document Details" ID="pnldocumentDts" runat="server"
                    CssClass="stylePanel" Visible="false">
                    <asp:GridView ID="grvDocument" runat="server" AutoGenerateColumns="False"
                        BorderWidth="2">
                        <Columns>
                            <asp:TemplateField HeaderText="Sl.No." ItemStyle-Width="2%">
                                <ItemTemplate>
                                    <asp:Label ID="lblSNO" runat="server" Text="<%#Container.DataItemIndex+1%>" ToolTip="SI.NO"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Location" ItemStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location")%>' ToolTip="Account No"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Document Number" ItemStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <asp:Label ID="lblDocument_Number" runat="server" Text='<%#Eval("Document_Number")%>' ToolTip="Sub Account No"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Document Amount" ItemStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <asp:Label ID="lblDocument_Amount" runat="server" Text='<%#Eval("Document_Amount")%>' ToolTip="Account Status"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Debit" ItemStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <asp:Label ID="lblDebit" runat="server" Text='<%#Eval("Debit")%>' ToolTip="Account Status"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Credit" ItemStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <asp:Label ID="lblCredit" runat="server" Text='<%#Eval("Credit")%>' ToolTip="Account Status"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("Description")%>' ToolTip="Account Status"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server"  ToolTip="Select"></asp:CheckBox>
                                </ItemTemplate>                                
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button runat="server" ID="btnSave" Text="Process" ToolTip="Process the Payroll Payment,Alt+S"
                    CssClass="styleSubmitButton" OnClientClick="return fnCheckPageValidators('Save')"
                    ValidationGroup="Process" OnClick="btnSave_Click" AccessKey="S" />
                &nbsp;
                        <asp:Button runat="server" ID="btnRevoke" OnClick="btnRevoke_Click"
                            ToolTip="Cancel Payment,Alt+P" Text="Revoke" CausesValidation="false" CssClass="styleSubmitButton"
                            OnClientClick="return confirm('Are you sure want to Revoke this record?');" AccessKey="P" Enabled="false" />
                &nbsp;
                        <asp:Button runat="server" ID="btnCancel" Text="Exit" ToolTip="Cancel,Alt+X" CausesValidation="false"
                            CssClass="styleSubmitButton" OnClick="btnCancel_Click" AccessKey="X" />
            </td>
        </tr>
    </table>
</asp:Content>

