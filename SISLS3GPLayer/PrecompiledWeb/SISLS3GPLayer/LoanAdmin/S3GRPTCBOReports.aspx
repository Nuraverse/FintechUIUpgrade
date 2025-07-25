<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRPTCBOReports, App_Web_nqjy25qa" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" class="stylePageHeading">
                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table width="99%">
                    <tr>
                        <td width="100%" valign="top">
                            <asp:Panel ID="Panel1" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                                Width="99%">
                                <table>
                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label ID="lblLocation" runat="server" CssClass="styleReqFieldLabel" Text="Location"></asp:Label></td>
                                        <td class="styleFieldAlign">
                                            <uc2:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true"
                                                OnItem_Selected="ddlBranch_SelectedIndexChanged" IsMandatory="true" ValidationGroup="Save" ErrorMessage="Enter Location" />
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label ID="lblStartDate" runat="server" CssClass="styleReqFieldLabel" Text="Start Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtStartDate" runat="server" Width="125px"></asp:TextBox>
                                            <cc1:CalendarExtender ID="calStartDate" runat="server" Enabled="True" TargetControlID="txtStartDate"
                                                PopupButtonID="imgStartDate">
                                            </cc1:CalendarExtender>
                                            <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtStartDate"
                                                Display="None" ErrorMessage="Select a Start Date" ValidationGroup="Go"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label ID="lblEndDate" runat="server" CssClass="styleReqFieldLabel" Text="End Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign" colspan="2">
                                            <asp:TextBox ID="txtEndDate" runat="server" Width="125px"></asp:TextBox>
                                            <cc1:CalendarExtender ID="calEndDate" runat="server" Enabled="True" TargetControlID="txtEndDate"
                                                PopupButtonID="imgEndDate">
                                            </cc1:CalendarExtender>
                                            <asp:Image ID="imgEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ControlToValidate="txtEndDate"
                                                Display="None" ErrorMessage="Select a End Date" ValidationGroup="Go"></asp:RequiredFieldValidator>
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
                <table>
                    <tr>
                        <td>
                            <asp:Panel ID="panSchedule" runat="server" GroupingText="Schedule Details" CssClass="stylePanel"
                                Width="99%">
                                <table width="100%" border="0">
                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:RadioButtonList ID="rbtnSchedule" runat="server" AutoPostBack="True" AppendDataBoundItems="True"
                                                RepeatDirection="Horizontal" OnSelectedIndexChanged="rbtnSchedule_SelectedIndexChanged">
                                                <asp:ListItem Text="Schedule Now" Value="1"></asp:ListItem>
                                                <asp:ListItem Selected="True" Text="Schedule At :" Value="0"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                         <td class="styleFieldLabel">
                                            <asp:Label ID="lblScheduleDate" runat="server" Text="Date"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="txtScheduleDate" runat="server" Width="90px"></asp:TextBox>
                                            <cc1:CalendarExtender ID="calScheduleDate" runat="server" Enabled="True" TargetControlID="txtScheduleDate"
                                                PopupButtonID="imgScheduleDate">
                                            </cc1:CalendarExtender>
                                            <asp:Image ID="imgScheduleDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label ID="lblScheduleTime" runat="server" Text="Time (HH:MM AM)"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtScheduleTime" runat="server" Width="100px"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="REVScheduleTime" ValidationGroup="btnSave" runat="server"
                                                Display="None" ErrorMessage="Schedule Time Should be HH:MM AM Fomat(12 Hours)"
                                                ControlToValidate="txtScheduleTime" SetFocusOnError="True" ValidationExpression="^([0]?[1-9]|1[0-2])(:)[0-5][0-9]((:)[0-5][0-9])?( )?(AM|am|aM|Am|PM|pm|pM|Pm)$"></asp:RegularExpressionValidator>
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
            <td class="styleFieldLabel" align="center">
                <asp:Button ID="btnSave" runat="server" CausesValidation="true" CssClass="styleSubmitButton"
                    Text="Save" ValidationGroup="btnSave" OnClick="btnSave_OnClick" OnClientClick="return fnCheckPageValidators();" />
                <asp:Button ID="btnClear" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                    OnClientClick="return fnConfirmClear();" Text="Clear" OnClick="btnClear_OnClick" />
                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                    Text="Cancel" OnClick="btnCancel_Click" />
            </td>
        </tr>
        <tr>
            <td class="styleFieldAlign">
                <asp:ValidationSummary ID="vsBilling" runat="server" CssClass="styleMandatoryLabel"
                    ValidationGroup="btnSave" HeaderText="Please correct the following validation(s):" />
            </td>
        </tr>
    </table>
</asp:Content>

