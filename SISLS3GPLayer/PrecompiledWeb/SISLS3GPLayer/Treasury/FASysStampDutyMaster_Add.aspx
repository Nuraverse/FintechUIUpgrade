<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_FASysStampDutyMaster_Add, App_Web_ezlcepmc" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="pnl1" runat="server">
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
                                        <asp:Panel ID="pnl" CssClass="stylePanel" Width="100%" runat="server" GroupingText="STAMP DUTY MASTER">
                                            <table>
                                                <tr>
                                                    <td class="styleFieldLabel" width="10%">
                                                        <asp:Label ID="lblLocation" runat="server" CssClass="styleDisplaylabel" Text="Location" />
                                                    </td>
                                                    <td class="styleFieldAlign" width="30%">
                                                        <%--<cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                            AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
                                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                        </cc1:ComboBox>--%>
                                                              <UC:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" OnItem_Selected="ddlLocation_SelectedIndexChanged" AutoPostBack ="true"  ItemToValidate ="Value" ValidationGroup="Main" IsMandatory="true" ErrorMessage="Select Location" />
                                                      <%--  <asp:RequiredFieldValidator Display="None" ID="rfvddlLocation" CssClass="styleMandatoryLabel"
                                                            SetFocusOnError="True" runat="server" ControlToValidate="ddlLocation" InitialValue="--Select--"
                                                            ErrorMessage="Select Location" ValidationGroup="Main"></asp:RequiredFieldValidator>--%>
                                                    </td>
                                                    <td class="styleFieldLabel" width="10%">
                                                        <asp:Label ID="lblFundType" runat="server" CssClass="styleDisplayLabel" Text="Fund Type" />
                                                    </td>
                                                    <td class="styleFieldAlign" width="30%">
                                                        <asp:DropDownList ID="ddlFundType" runat="server" OnSelectedIndexChanged="ddlFundType_SelectedIndexChanged" />
                                                        <asp:RequiredFieldValidator ID="rfvddlFundType" runat="server" Display="None" ControlToValidate="ddlFundType"
                                                            ValidationGroup="Main" InitialValue="0" ErrorMessage="Select Fund Type" CssClass="styleMandatoryLabel"
                                                            Enabled="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td class="styleFieldLabel" width="10%">
                                                        <asp:Label ID="lblActive" runat="server" Text="Active" CssClass="styleDisplayLabel" />
                                                    </td>
                                                    <td class="styleFieldAlign" width="10%">
                                                        <asp:CheckBox ID="cbxActive" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel" width="10%">
                                                        <asp:Label ID="lblGLAccount" Text="GL Account" runat="server" CssClass="styleDisplayLabel" />
                                                    </td>
                                                    <td class="styleFieldAlign" width="30%">
                                                        <cc1:ComboBox ID="ddlGLAccount" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                            AutoPostBack="true" OnSelectedIndexChanged="ddlGLAccount_SelectedIndexChanged1"
                                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                        </cc1:ComboBox>
                                                    </td>
                                                    <td class="styleFieldLabel" width="10%">
                                                        <asp:Label ID="lblSLAccount" runat="server" CssClass="styleDisplayLabel" Text="SL Account" />
                                                    </td>
                                                    <td class="styleFieldAlign" width="30%">
                                                        <cc1:ComboBox ID="ddlSLAccount" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                            AutoPostBack="true" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                        </cc1:ComboBox>
                                                    </td>
                                                    <td width="20%" colspan="2">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="pnlStampDutyMaster"  runat="server" CssClass="stylePanel" Width="100%"
                                            GroupingText="Stamp Duty details">
                                            <%--<table width="100%">
                                                <tr>
                                                    <td>--%>
                                                        <asp:GridView ID="grvStampDuty" runat="server" AutoGenerateColumns="False" Width="98%"
                                                            ShowFooter="true" OnRowCommand="grvStampDuty_RowCommand" OnRowDataBound="grvStampDuty_RowDataBound"
                                                            OnRowDeleting="grvStampDuty_RowDeleting">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sl No" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSNo" runat="server" Text=' <%# Container.DataItemIndex + 1 %> ' />
                                                                        <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Stamp_DTL_Id") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Start Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblStartDate" runat="server" Text=' <%# Bind("StartDate") %> ' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="txtStartDate" runat="server" />
                                                                        <cc1:CalendarExtender ID="cldrStartDate" runat="server" PopupButtonID="txtStartDate"
                                                                            TargetControlID="txtStartDate" />
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="End Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblEndDate" runat="server" Text=' <%# Bind("EndDate") %> ' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="txtEndDate" runat="server" />
                                                                        <cc1:CalendarExtender ID="cldrEndDate" runat="server" PopupButtonID="txtEndDate"
                                                                            TargetControlID="txtEndDate" />
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Start Range" ItemStyle-HorizontalAlign="Right"> 
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblStartRange" runat="server" Text=' <%# Bind("StartRange") %> ' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="txtStartRange" runat="server" Style="text-align:right;"/>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="End Range" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblEndRange" runat="server" Text=' <%# Bind("EndRange") %> ' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="txtEndRange" runat="server" Style="text-align:right;"/>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAmount" runat="server" Text=' <%# Bind("Amount") %> ' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="txtAmount" runat="server" Style="text-align:right;"/>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Action">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"
                                                                            OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false" />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" CommandName="Insert" />
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    <%--</td>
                                                </tr>
                                            </table>--%></asp:Panel>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td>
                                        <asp:Button ID="btnSave" CssClass="styleSubmitButton" runat="server" Text="Save"
                                            OnClick="btnSave_Click" CausesValidation="true" OnClientClick="return fnCheckPageValidators('Main')"
                                            ValidationGroup="Main" />
                                        <asp:Button ID="btnClear" CssClass="styleSubmitButton" runat="server" Text="Clear_FA"
                                            OnClientClick="return fnConfirmClear();" CausesValidation="False" OnClick="btnClear_Click" />
                                        <asp:Button ID="btnCancel" CssClass="styleSubmitButton" runat="server" CausesValidation="False"
                                            Text="Cancel" OnClick="btnCancel_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ValidationSummary ID="vsStampDuty" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                            ValidationGroup="Main" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <%--<tr>
                <td style="display: none">
                    <asp:Button runat="server" ID="btnPrintNew" BackColor="White" Height="0px" CausesValidation="false"
                        OnClick="btnPrint_Click" />
                </td>
            </tr>--%>
        </table>
    </asp:Panel>
</asp:Content>
