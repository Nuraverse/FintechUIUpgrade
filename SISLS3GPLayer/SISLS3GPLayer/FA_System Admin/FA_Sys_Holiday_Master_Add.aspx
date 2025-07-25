<%@ Page Title="" Language="C#" MasterPageFile="~/Common/FAMasterPageCollapse.master"
    AutoEventWireup="true" CodeFile="FA_Sys_Holiday_Master_Add.aspx.cs" Inherits="System_Admin_FA_Sys_Holiday_Master_Add" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Holiday Master" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlGen" runat="server" CssClass="stylePanel" GroupingText="Header Details">
                    <table width="100%">
                        <tr>
                            <%--Location--%>
                            <td class="styleDisplayLabel">
                                <asp:Label ID="lblLocation" runat="server" Text="Location" />
                            </td>
                            <td class="styleDisplayLabel">
                                <asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location" AutoPostBack="true"
                                    Width="165px" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None"
                                    InitialValue="0" ValidationGroup="btnSave" ControlToValidate="ddlLocation" ErrorMessage="Select Location"
                                    SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </td>
                            <%--Recorded Date--%>
                            <td class="styleDisplayLabel">
                                <asp:Label ID="lblDate" runat="server" Text="Entry Date" />
                            </td>
                            <td class="styleDisplayLabel">
                                <asp:TextBox ID="txtDate" runat="server" ToolTip="Date" Width="160px" onmouseover="txt_MouseoverTooltip(this)" />
                                <%--AutoPostBack ="true"  OnTextChanged ="txtDate_TextChanged"--%>
                                <%--<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <%-- <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate"
                                    OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="Image1"
                                    ID="CalExchangeDate" Enabled="True">
                                </cc1:CalendarExtender>--%>
                                <asp:RequiredFieldValidator ID="rfvtxtDate" runat="server" Display="None" ValidationGroup="btnSave"
                                    ControlToValidate="txtDate" ErrorMessage="Enter Date" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate"
                                    PopupButtonID="txtDate" ID="CalReceivedDate" Enabled="True">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" GroupingText="Weekend">
                    <table width="50%" align="center">
                        <%--  <tr>
                     <td>
                         <asp:RadioButton ID="rdooption" Text="Weekend" runat="server" />
                        </td>
                    </tr>--%>
                        <tr>
                            <td align="center">
                                <asp:GridView ID="grvHolidayMaster" runat="server" AutoGenerateColumns="false" OnRowDataBound="grvHolidayMaster_RowDataBound"
                                    FooterStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center"
                                    ShowFooter="false" Width="100%">
                                    <RowStyle HorizontalAlign="Center" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Days">
                                            <ItemTemplate>
                                                <asp:Label ID="lbldays" runat="server" Text='<%# Bind("Days") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="80%" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkCategory" runat="server" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="5%" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle CssClass="styleGridHeader" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnldetails" runat="server" CssClass="stylePanel" GroupingText="Holiday">
                    <table width="50%" align="center">
                        <%-- <tr>
                     <td>
                         <asp:RadioButton ID="RadioButton1" Text="Option 2" runat="server" />
                        </td>
                    </tr>--%>
                        <tr>
                            <td align="center">
                                <asp:GridView ID="Grvdetails" runat="server" AutoGenerateColumns="false" FooterStyle-HorizontalAlign="Center"
                                    HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" Width="100%"
                                    ShowFooter="true" OnRowCommand="Grvdetails_RowCommand" OnRowDataBound="Grvdetails_RowDataBound">
                                    <RowStyle HorizontalAlign="Center" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblReceivedDate" runat="server" Text='<%#Eval("Date") %>' ToolTip="Due Date" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtDate" Width="100px" Text='<%#Eval("Date") %>' runat="server"
                                                    onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true" ToolTip="Date" />
                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate"
                                                    OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="txtReceivedDate"
                                                    ID="CalReceivedDate" Enabled="True">
                                                </cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="rfvReceivedDate" runat="server" ControlToValidate="txtReceivedDate"
                                                    ErrorMessage="Enter Due Date" Display="None" SetFocusOnError="True" ValidationGroup="vgUpdate" />
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtReceivedDate" onmouseover="txt_MouseoverTooltip(this)" Width="100px"
                                                    runat="server" ToolTip="Due Date" />
                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtReceivedDate"
                                                    PopupButtonID="txtReceivedDate" ID="CalReceivedDate" Enabled="True">
                                                </cc1:CalendarExtender>
                                                <%-- <asp:RequiredFieldValidator ID="rfvReceivedDate" runat="server" ControlToValidate="txtReceivedDate"
                                                                            ErrorMessage="Enter Due Date" Display="None" SetFocusOnError="True" ValidationGroup="vgAdd" />--%>
                                            </FooterTemplate>
                                            <ItemStyle Width="12%" HorizontalAlign="Left" />
                                            <FooterStyle Width="12%" HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="left" HeaderText="Description">
                                            <ItemTemplate>
                                                <asp:Label ID="lblNarration" ToolTip="Narration" Width="100%" runat="server" Text='<%#Eval("days")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtDescription" onmouseover="txt_MouseoverTooltip(this)" Text='<%#Bind("days")%>'
                                                    runat="server" MaxLength="100" Style="text-align: left;" ToolTip="Description"
                                                    onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="txtFooterDescription" ToolTip="Narration" onmouseover="txt_MouseoverTooltip(this)"
                                                    runat="server" MaxLength="100" Style="text-align: left"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="rfvtxtFooterNarration" runat="server" ControlToValidate="txtFooterDescription"
                                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="vgAdd"
                                                                            ErrorMessage="Enter the Description"></asp:RequiredFieldValidator>--%>
                                                <headerstyle cssclass="styleGridHeader" />
                                                <itemstyle horizontalalign="Left" />
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" ToolTip="Delete" CommandName="Delete"
                                                    OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <br></br>
                                                <asp:LinkButton ID="lnkAdd" Width="100%" ToolTip="Add to the grid" CommandName="Add"
                                                    ValidationGroup="vgAdd" runat="server" Text="Add"></asp:LinkButton></FooterTemplate>
                                            <HeaderStyle CssClass="styleGridHeader" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle CssClass="styleGridHeader" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr class="styleButtonArea" style="padding-left: 4px; margin-top: 10px;" align="center">
            <td colspan="4">
                <%--<asp:UpdatePanel ID="upButton" runat="server">
                    <ContentTemplate>--%>
                <asp:Button runat="server" ID="btnSave" OnClientClick="return fnCheckPageValidators();"
                    CssClass="styleSubmitButton" Text="Save" ToolTip="Save" OnClick="btnSave_Click"
                    ValidationGroup="BtnSave" />
                <asp:Button runat="server" ID="btnClear" CssClass="styleSubmitButton" CausesValidation="false"
                    Text="Clear_FA" ToolTip="Clear_FA" />
                <cc1:ConfirmButtonExtender ID="btnClear_ConfirmButtonExtender" runat="server" ConfirmText="Are you sure you want to Clear_FA?"
                    Enabled="True" TargetControlID="btnClear">
                </cc1:ConfirmButtonExtender>
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false"
                    OnClick="btnCancel_Click" CssClass="styleSubmitButton" ToolTip="Cancel" />
                <%-- </ContentTemplate>
                </asp:UpdatePanel>--%>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:ValidationSummary CssClass="styleMandatoryLabel" runat="server" ID="vsholiday"
                    ValidationGroup="BtnSave" HeaderText="Correct the following validation(s):  "
                    ShowSummary="true" ShowMessageBox="false" />
                <asp:CustomValidator ID="cvholiday" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true"></asp:CustomValidator>
            </td>
        </tr>
    </table>
</asp:Content>
