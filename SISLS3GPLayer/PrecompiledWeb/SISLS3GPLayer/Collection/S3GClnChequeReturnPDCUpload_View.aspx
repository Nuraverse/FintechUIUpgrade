<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="Collection_S3GClnChequeReturnPDCUpload_View, App_Web_4kkykzxm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<%@ Register Src="../UserControls/FAAddressDetail.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>--%>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top" class="stylePageHeading">
                        <asp:Label runat="server" Text="PDC Upload View" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel GroupingText="Upload Details" ID="pnlUploadDetails" runat="server"
                            CssClass="stylePanel">
                            <table width="100%">
                                <tr>
                                    <td class="styleFieldLabel" width="15%" valign="top">
                                        <asp:Label ID="lblBranch" runat="server" Text="Account No"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%" valign="top">
                                        <uc:Suggest ID="ddlBranch" ToolTip="Location" runat="server" ServiceMethod="GetFA_CHQOTRANSCD_AGT"
                                            ValidationGroup="Go" ErrorMessage="Select a Account No" IsMandatory="true" ItemToValidate="Value"
                                            WatermarkText="--Select--" />
                                        <%-- <asp:RequiredFieldValidator ID="rfvBranch" runat="server" Display="None" InitialValue="0"
                                        ValidationGroup="Go" ErrorMessage="Select the Location" ControlToValidate="ddlBranch"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                    </td>
                                    <td class="styleFieldLabel" width="15%" valign="top">
                                        <asp:Label ID="lblPostingDate" runat="server" Text="Posting Date"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%" valign="top">
                                        <asp:TextBox runat="server" ID="txtPostingDate" Width="80px"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CECalenderExtender" runat="server" OnClientDateSelectionChanged="checkDate_NextSystemDate" Enabled="True" Format="DD/MM/YYYY"
                                            PopupButtonID="imgPostingDate"
                                            TargetControlID="txtPostingDate">
                                        </cc1:CalendarExtender>
                                        <asp:Image ID="imgPostingDate" runat="server" ImageUrl="~/Images/calendaer.gif" />

                                    </td>

                                </tr>
                                <tr>
                                    <td></td>
                                    <td align="center">

                                        <asp:Button ID="btnGo1" CssClass="styleSubmitShortButton" ValidationGroup="Go" runat="server" Text="View"
                                         ToolTip="View, Alt+V"  AccessKey="V" OnClick="btnGo_Click" />
                                        <asp:Button ID="btnCreate1" runat="server" CausesValidation="false" CssClass="styleSubmitButton"
                                          ToolTip="Create, Alt+C"  AccessKey="C" OnClick="btnCreate_Click" Text="Create" />
                                    </td>
                                    <td  style="width: 25%;">
                                        <asp:ImageButton ID="hyplnkView" OnClick="ExportToExcel" ImageUrl="~/Images/Excel.png"
                                            Width="40px" Height="40px" runat="server" ToolTip="Uploaded File,Alt + E" AccessKey="E" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right"></td>
                                    <td align="left">
                                        <asp:Label ID="lblActualPath" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="lblCurrentPath" runat="server" Visible="false" Text="" />
                                        <asp:HiddenField ID="hdnSelectedPath" runat="server" />
                                        <asp:Label runat="server" ID="lblPath" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="lblExcelCurrentPath" runat="server" Visible="true" Text="" ForeColor="Red" />
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align="center">

                        <asp:Panel ID="pnlLaoding" runat="server" GroupingText="Details" CssClass="stylePanel">
                            <div id="divInterest" runat="server" style="overflow: auto; height: 200px;">
                                <asp:GridView ID="gvProcessedData" runat="server" AutoGenerateColumns="true" Width="90%"></asp:GridView>
                            </div>
                        </asp:Panel>

                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ValidationSummary ID="vsUTPA" runat="server" ValidationGroup="Go" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):" ShowSummary="true" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:CustomValidator ID="cvChequeReturn" runat="server" CssClass="styleMandatoryLabel" Enabled="true" Width="98%" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" CausesValidation="false" CssClass="styleSubmitButton" Style="display: none;" Text="Print" />
                    </td>
                </tr>
            </table>
            
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger  ControlID="hyplnkView" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
