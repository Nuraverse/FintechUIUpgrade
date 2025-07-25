<%@ page title="" language="C#" masterpagefile="~/Common/MasterPage.master" autoeventwireup="true" inherits="Treasury_FA_Additional_Limits, App_Web_zogfwrp2" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="up" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <asp:Label runat="server" Text="Additional Limits" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Additional Limits">
                            <table width="100%">
                                <tr>
                                    <%--Col1--%>
                                    <td width="50%">
                                        <%--table for Location and Funder Code --%>
                                        <table width="100%" cellpadding="2 px">
                                            <%--Row for Funder Code --%>
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label ID="lblBankName" runat="server" Text="Additional limit:" CssClass="styleReqFieldLabel"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtAddLimit" runat="server" ToolTip="Additional limit" MaxLength="15"
                                                        AutoPostBack="false">
                                                    </asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="rfvBankName" runat="server" ControlToValidate="txtAddLimit"
                                                        ErrorMessage="Please enter Additional limit" Display="None" ValidationGroup="INVDetails"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label ID="lblBankRole" runat="server" Text="Total Limit:" CssClass="styleReqFieldLabel"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtTotalLimit" runat="server" ReadOnly="true" ToolTip="Total Limit" AutoPostBack="false">
                                                    </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label ID="lblSupp" runat="server" Text="Supp.Agmnt.Date :" />
                                                </td>
                                                <td class="styleFieldAlign" align="right">
                                                    <asp:TextBox ID="txtSupp" Width="165px" ToolTip="Supplementary agreement Date" AutoPostBack="false"
                                                        runat="server"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtSupp"
                                                        PopupButtonID="Image2" Enabled="True">
                                                    </cc1:CalendarExtender>
                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="25%">
                                                    <asp:Label ID="Label1" runat="server" Text="Start Date:" />
                                                </td>
                                                <td class="styleFieldAlign" align="right">
                                                    <asp:TextBox ID="txtStart" Width="165px" ToolTip="Start Date" AutoPostBack="false"
                                                        runat="server"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtStart"
                                                        PopupButtonID="Image3" Enabled="True">
                                                    </cc1:CalendarExtender>
                                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="50%">
                                                    <asp:Label ID="lblSecType" runat="server" CssClass="styleReqFieldLabel" Text="Security Type :"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:DropDownList ID="ddlSecType" OnSelectedIndexChanged="ddlBorrow_SelectedIndexChange"
                                                        runat="server" Width="169px" AutoPostBack="true">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                        <asp:ListItem Value="1">Secured</asp:ListItem>
                                                        <asp:ListItem Value="2">Unsecured</asp:ListItem>
                                                        <asp:ListItem Value="3">Partially Secured</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvBor" InitialValue="0" runat="server" Display="None"
                                                        ControlToValidate="ddlSecType" ValidationGroup="INVDetails" ErrorMessage="Select the Security Name"></asp:RequiredFieldValidator></td>
                                            </tr>

                                            <tr>
                                                <td class="styleFieldLabel" width="50%">
                                                    <asp:Label ID="lblSecName" runat="server" CssClass="styleReqFieldLabel" Text="Security Name :"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:DropDownList ID="ddlSecName" runat="server" Width="269px" AutoPostBack="true">
                                                        <%--      <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="1">Secured</asp:ListItem>
                                               <asp:ListItem Value="2">Unsecured</asp:ListItem>
                                                <asp:ListItem Value="3">Partially Secured</asp:ListItem>--%>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" runat="server"
                                                        Display="None" ControlToValidate="ddlSecName" ValidationGroup="INVDetails" ErrorMessage="Select the borrowing term"></asp:RequiredFieldValidator>
                                            </tr>


                                        </table>
                                        <table width="50%">
                                        </table>
                                    </td>
                                    <td width="50%">
                                        <table width="100%" cellspacing="4px">
                                            <tr>
                                                <td width="100%">
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label ID="lblSecMar" runat="server" Text="Security Margin:">
                                                                </asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" align="right">
                                                                <asp:TextBox ID="txtSecMar" runat="server" Width="165px" OnTextChanged="txtSecMargin_Change" AutoPostBack="true" ToolTip="Security Margin"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                    Display="None" ControlToValidate="txtSecMar" ValidationGroup="INVDetails" ErrorMessage="Select the Security Margin"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label ID="lblTotSec" runat="server" Text="Total Security:">
                                                                </asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" align="right">
                                                                <asp:TextBox ID="TxtTotSec" runat="server" Width="165px" ToolTip="Total Security"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server"
                                                                    Display="None" ControlToValidate="TxtTotSec" ValidationGroup="INVDetails" ErrorMessage="Select the borrowing term"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="25%">
                                                                <asp:Label ID="lblEndDate" runat="server" Text="End Date:">
                                
                                                                </asp:Label>
                                                            </td>
                                                            <td class="styleFieldAlign" align="right">
                                                                <asp:TextBox ID="txtEndDate" Width="165px" ToolTip="End Date" AutoPostBack="false"
                                                                    runat="server"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEndDate"
                                                                    PopupButtonID="Image1" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <%--<tr>
                                    <td>
                                        <asp:ValidationSummary ID="valSum" ValidationGroup="INVSum" runat="server" CssClass="styleMandatoryLabel"
                                            ShowMessageBox="false" ShowSummary="true" HeaderText="Correct the following validation(s):  " />
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td colspan="2" align="center">
                                        <table>
                                            <tr align="left">

                                                <td class="styleFieldAlign" align="left">
                                                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" CssClass="styleSubmitButton"
                                                        Text="Add" CausesValidation="true" ValidationGroup="INVDetails" />
                                                    <asp:Button ID="btnEdit" Visible="false" OnClick="Edit_Click" runat="server" CssClass="styleSubmitButton"
                                                        Text="Edit" />
                                                    <asp:Button ID="btnCancel" Visible="false" OnClick="btnCancel_Click" runat="server" CssClass="styleSubmitButton"
                                                        Text="Cancel" />
                                                    <%--<asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" Text="Cancel" />--%>
                                                    <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" Text="Clear_FA" />
                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ValidationSummary ValidationGroup="INVDetails" ID="vsSummary" runat="server"
                                            CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" HeaderText="Correct the following validation(s):  " />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <table width="750">
                <tr align="center">
                    <td align="center">
                        <asp:GridView ID="grvAdd" AlternatingRowStyle-Width="1000" Visible="true" RowStyle-HorizontalAlign="Center"
                            runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="SlNo" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSllno" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="" Visible="true">
                                    <ItemTemplate>
                                        <asp:RadioButton ID="rbtnMem" OnCheckedChanged="rbtnCons_CheckedChanged" AutoPostBack="true" Visible="true" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Additional Limit">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBankName" runat="server" Text='<%# Eval("Add_Limit") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Limit">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTotalLimit" runat="server" Text='<%# Eval("Tot_Limit") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Security Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSctype" runat="server" Text='<%# Eval("Sec_Type") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Security Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSecNamee" runat="server" Text='<%# Eval("Sec_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Start Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblstdate" runat="server" Text='<%# Eval("Start_Date") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="End Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblenddate" runat="server" Text='<%# Eval("End_Date") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Security Margin">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMargin" runat="server" Text='<%# Eval("Sec_Margin") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Agmt.Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblagmntDate" runat="server" Text='<%# Eval("Agmt_Date") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Security">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTotSecurity" runat="server" Text='<%# Eval("Tot_Sec") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%--<asp:TemplateField HeaderText="Additional Limit">
                                    <ItemTemplate>
                                        <asp:Button ID="imgAdd" runat="server" Text="Additional Limit" CssClass="styleSubmitButton" />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                        <%--<table>
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnSave" Visible="false" runat="server" CssClass="styleSubmitButton"
                                Text="Save" OnClick="btnSave_Click" />
                        </td>
                    </tr>--%>
                        <tr>
                            <td>
                                <asp:Label ID="lblSlNo" runat="server" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <%-- </table>--%>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
