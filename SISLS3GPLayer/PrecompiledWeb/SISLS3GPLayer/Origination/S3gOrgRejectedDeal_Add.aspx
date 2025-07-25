<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3gOrgRejectedDeal_Add, App_Web_jfqvryns" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="updCust" runat="server">
        <ContentTemplate>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:Panel ID="pnlHeader" ToolTip="Header Details"
                            Width="99%" runat="server" GroupingText="Header Information"
                            CssClass="stylePanel">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblApplicationNo" runat="server" CssClass="styleReqFieldLabel" Text="Application No."></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtDocNo" runat="server" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblApplicationDate" runat="server" CssClass="styleReqFieldLabel" Text="Application Date"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtApplicationDate" runat="server"></asp:TextBox><cc1:FilteredTextBoxExtender
                                            ID="ftxtApplicationDate" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                            TargetControlID="txtApplicationDate" ValidChars="/-">
                                        </cc1:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business" ToolTip="Line of Business"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlLob" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLob_SelectedIndexChanged" />

                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblBranch" runat="server" CssClass="styleReqFieldLabel" Text="Branch" ToolTip="Branch"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlBranch" ToolTip="Branch"
                                            runat="server">
                                        </asp:DropDownList>
                                        <%-- <uc:Suggest ID="ddlBranch" ToolTip="Branch" runat="server" AutoPostBack="True"
                                            ServiceMethod="GetBranchList"
                                            IsMandatory="true" ValidationGroup="Submit" ErrorMessage="Select a Branch"
                                            WatermarkText="--Select--" />--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblProduct" runat="server" Text="Product" ToolTip="Product" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlProduct" Width="125px" runat="server" ToolTip="Product">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblCustomerType" runat="server" Text="Customer Type" ToolTip="Customer Type" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlCustomerType" Width="125px" runat="server" ToolTip="Customer Type">
                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="New"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Existing"></asp:ListItem>
                                        </asp:DropDownList>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblRejectedDate" runat="server" CssClass="styleReqFieldLabel" Text="Rejected Date" ToolTip="Rejected Date"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtRejectedDate" runat="server"></asp:TextBox><cc1:FilteredTextBoxExtender
                                            ID="fRejectedDate" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                            TargetControlID="txtRejectedDate" ValidChars="/-">
                                        </cc1:FilteredTextBoxExtender>
                                        <cc1:CalendarExtender ID="calRejectedDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                            PopupButtonID="imgRejectedDate" TargetControlID="txtRejectedDate">
                                        </cc1:CalendarExtender>
                                        <asp:Image ID="imgRejectedDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                    </td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlRetailDetail" ToolTip="Retail Details"
                            Width="99%" runat="server" GroupingText="Retail Details"
                            CssClass="stylePanel">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblCreditPurpose" runat="server" Text="Credit Purpose" ToolTip="Credit Purpose"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlCreditPurpose" Width="125px" runat="server" ToolTip="Customer Type">                                           
                                        </asp:DropDownList>
                                        <%--<uc:Suggest ID="aucCreditPurpose" ToolTip="Branch" runat="server" AutoPostBack="True"
                                            ServiceMethod="GetBranchList"
                                            IsMandatory="true" ValidationGroup="Submit" ErrorMessage="Select a Branch"
                                            WatermarkText="--Select--" />--%>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblLeadSourceType" runat="server" Text="Lead Source Type" ToolTip="Lead Source Type"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <uc:Suggest ID="aceLeadSourceType" ToolTip="Lead Source Type" runat="server"
                                            ServiceMethod="GetBranchList" IsMandatory="false" WatermarkText="--Select--" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblLeadSourceName" runat="server" Text="Lead Source Name" ToolTip="Lead Source Name"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtLeadSourceName" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblBussinessSource" runat="server" Text="Bussiness Source" ToolTip="Bussiness Source"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtBussinessSource" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblRCustomerName" runat="server" Text="Customer Name" ToolTip="Customer Name"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblRCustomerNID" runat="server" Text="Customer N.ID." ToolTip="Customer N.ID."></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtRCustomerNID" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblRDealerName" runat="server" Text="Dealer Name" ToolTip="Dealer Name"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtRDealerName" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblAssetDesc" runat="server" Text="Asset Desc" ToolTip="Asset Desc"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtRAssetDesc" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblAssetType" runat="server" Text="Asset Type" ToolTip="Asset Type" Visible="false"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <uc:Suggest ID="aceAssetType" ToolTip="Location" runat="server" AutoPostBack="True"
                                            ServiceMethod="GetBranchList" Visible="false"
                                            IsMandatory="true" ValidationGroup="Submit" ErrorMessage="Select a Location"
                                            WatermarkText="--Select--" />
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblYield" runat="server" Text="Yield" ToolTip="Yield" Visible="false"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtYield" runat="server" Visible="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblTransactionValue" runat="server" Text="Tenor" ToolTip="Tenor" Visible="false"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtTransactionValue" runat="server" Visible="false"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblRejectedBy" runat="server" Text="Rejected By" ToolTip="Rejected By" Visible="false"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtRejectedBy" runat="server" Visible="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblNewFollowup" runat="server" Text="New Follow-up" ToolTip="New Follow-up" Visible="false"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtNewFollowup" runat="server" Visible="false"></asp:TextBox>
                                        <asp:Image ID="imgInstrumentDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:FilteredTextBoxExtender
                                            ID="ftxtNewFollowup" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                            TargetControlID="txtNewFollowup" ValidChars="/-">
                                        </cc1:FilteredTextBoxExtender>
                                        <cc1:CalendarExtender ID="calNewFollowup" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                            PopupButtonID="imgInstrumentDate"
                                            TargetControlID="txtNewFollowup">
                                        </cc1:CalendarExtender>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblMarketingOfficer" runat="server" Text="Marketing Officer" ToolTip="Marketing Officer" Visible="false"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtMarketingOfficer" runat="server" Visible="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblRemarks" runat="server" Text="Remarks" ToolTip="Remarks"></asp:Label></td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtRemarks" TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" Width="45%" runat="server"
                                            ToolTip="Remarks"></asp:TextBox></td>
                                    <td class="styleFieldLabel"></td>
                                    <td class="styleFieldAlign"></td>

                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" align="center">
                            <tr>
                                <td align="center">&nbsp;&nbsp;<asp:Button ID="btnSave" runat="server" CausesValidation="true" CssClass="styleSubmitButton"
                                    Text="Save" ValidationGroup="Submit" OnClientClick="return fnCheckPageValidators('Reject')"
                                    ToolTip="Save the Details, Alt+S" AccessKey="S" Enabled="false" />
                                    &nbsp;<asp:Button ID="btnClear" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                                        Text="Clear" ToolTip="Clear the Details, Alt+L" AccessKey="L" OnClientClick="return fnConfirmClear();" />
                                    &nbsp;<asp:Button ID="btnExit" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                                        Text="Exit" ToolTip="Exit the Details, Alt+X" OnClick="btnExit_OnClick" AccessKey="X" OnClientClick="return fnConfirmExit();" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

