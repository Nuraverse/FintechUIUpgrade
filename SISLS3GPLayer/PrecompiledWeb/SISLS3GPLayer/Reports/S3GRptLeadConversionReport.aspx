<%@ page title="Lead Conversion Report" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptLeadConversionReport, App_Web_dy5ultuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    <%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
    <%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>

    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Lead Conversion Report">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlInput" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                    Width="100%">
                    <table width="100%">
                        <tr>
                            <td class="styleFieldLabel" width="6%">
                                <asp:Label ID="lblLocation" runat="server" CssClass="StyleDisplaylabel" Text="Location"></asp:Label>
                            </td>
                            <td class="styleFieldAlign" width="10%">
                                <uc2:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" WatermarkText="--All--"
                                    Width="200px" IsMandatory="true" ValidationGroup="Save" ErrorMessage="Enter Location" />
                            </td>
                            <td class="styleFieldAlign" width="6%">
                                <asp:Label ID="lblStartDateSearch" runat="server" CssClass="styleDisplayLabel" Text="From" ToolTip="From date" />
                                <span class="styleMandatory">*</span>
                            </td>
                            <td class="styleFieldAlign" width="10%">
                                <input id="hidDate" runat="server" type="hidden" />
                                <asp:TextBox ID="txtStartDateSearch" runat="server" AutoPostBack="true" Width="80px" OnTextChanged="txtStartDateSearch_TextChanged"
                                    ToolTip="From date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" Display="None" ControlToValidate="txtStartDateSearch"
                                    ValidationGroup="Go" CssClass="styleMandatoryLabel" ErrorMessage="Select From date"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                <asp:ImageButton ID="btnPrevious1" runat="server" Enabled="true" CommandName="Prev"
                                 ImageUrl="../Images/blue-jelly-icon2.png" CausesValidation="false" OnCommand="btnPrevious1_Command" />
                                <asp:ImageButton ID="btnNext1" runat="server" Enabled="true" CommandName="Next" 
                                 ImageUrl="../Images/blue-jelly-icon1.png" CausesValidation="false" OnCommand="btnNext1_Command" />
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                </cc1:CalendarExtender>
                            </td>
                            <td class="styleFieldAlign" width="6%">
                                <asp:Label ID="lblEndDateSearch" runat="server" CssClass="styleDisplayLabel" Text="To" ToolTip="To date" />
                                <span class="styleMandatory">*</span>
                            </td>
                            <td class="styleFieldAlign" width="10%">
                                <asp:TextBox ID="txtEndDateSearch" runat="server" AutoPostBack="true" Width="80px" OnTextChanged="txtEndDateSearch_TextChanged"
                                    ToolTip="To date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" Display="None" ControlToValidate="txtEndDateSearch"
                                    ValidationGroup="Go" CssClass="styleMandatoryLabel" ErrorMessage="Select To date"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                <asp:ImageButton ID="btnPrevious2" runat="server" Enabled="true" CommandName="Prev"
                                 ImageUrl="../Images/blue-jelly-icon2.png" CausesValidation="false" OnCommand="btnPrevious2_Command" />
                                <asp:ImageButton ID="btnNext2" runat="server" Enabled="true" CommandName="Next" 
                                 ImageUrl="../Images/blue-jelly-icon1.png" CausesValidation="false" OnCommand="btnNext2_Command" />
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td height="8px"></td>
                        </tr>
                        <tr>
                            <td class="styleFieldAlign" width="6%">
                                <asp:Label ID="lblAcctStartDate" runat="server" CssClass="styleDisplayLabel" Text="Account Start Date" ToolTip="Account Start Date" />
                            </td>
                            <td class="styleFieldAlign" width="10%">
                                <input id="Hidden1" runat="server" type="hidden" />
                                <asp:TextBox ID="txtAcctStartDate" runat="server" AutoPostBack="true" Width="80px" OnTextChanged="txtAcctStartDate_TextChanged"
                                    ToolTip="Account Start Date"></asp:TextBox>
                                <asp:Image ID="imgAcctStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                <asp:ImageButton ID="btnPrevious3" runat="server" Enabled="true" CommandName="Prev"
                                 ImageUrl="../Images/blue-jelly-icon2.png" CausesValidation="false" OnCommand="btnPrevious3_Command" />
                                <asp:ImageButton ID="btnNext3" runat="server" Enabled="true" CommandName="Next" 
                                 ImageUrl="../Images/blue-jelly-icon1.png" CausesValidation="false" OnCommand="btnNext3_Command" />
                                <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="imgAcctStartDate" TargetControlID="txtAcctStartDate">
                                </cc1:CalendarExtender>
                            </td>
                            <td class="styleFieldAlign" width="6%">
                                <asp:Label ID="lblAcctEndDate" runat="server" CssClass="styleDisplayLabel" Text="Account End Date" ToolTip="Account End Date" />
                            </td>
                            <td class="styleFieldAlign" width="10%">
                                <asp:TextBox ID="txtAcctEndDate" runat="server" AutoPostBack="true" Width="80px" OnTextChanged="txtAcctEndDate_TextChanged"
                                    ToolTip="Account End Date"></asp:TextBox>
                                <asp:Image ID="imgAcctEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                <asp:ImageButton ID="btnPrevious4" runat="server" Enabled="true" CommandName="Prev"
                                 ImageUrl="../Images/blue-jelly-icon2.png" CausesValidation="false" OnCommand="btnPrevious4_Command" />
                                <asp:ImageButton ID="btnNext4" runat="server" Enabled="true" CommandName="Next" 
                                 ImageUrl="../Images/blue-jelly-icon1.png" CausesValidation="false" OnCommand="btnNext4_Command" />
                                <cc1:CalendarExtender ID="CalendarExtender4" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="imgAcctEndDate" TargetControlID="txtAcctEndDate">
                                </cc1:CalendarExtender>
                            </td>
                            <td width="6%">
                                <asp:Button runat="server" ID="btnGo" CssClass="styleSubmitButton" OnClientClick="return fnCheckPageValidators('Go',false);" Text="Go" 
                                    CausesValidation="true" ValidationGroup="Go" ToolTip="Go" OnClick="btnGo_Click" />
                            </td>
                            <td width="8%">
                                <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton"
                                Text="Clear" OnClientClick="return fnConfirmClear();" ToolTip="Clear" OnClick="btnClear_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td height="8px"></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="styleFieldLabel" colspan="4" height="8px"></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                
                
            </td>
        </tr>
        <tr>
            <td class="styleFieldAlign" colspan="4">
                <asp:Panel ID="PnlAbstract" runat="server" CssClass="stylePanel" GroupingText="Lead Conversion">
                    <div id="divAbstract" runat="server" style="overflow: scroll;">
                        <asp:GridView ID="grvAbstract" runat="server" AutoGenerateColumns="False" BorderWidth="2" CssClass="styleInfoLabel" Style="margin-bottom: 0px" 
                            Width="100%" OnRowCreated="grvAbstract_RowCreated" CellPadding="16" OnRowDataBound="grvAbstract_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="LEADNO" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="LEADDATE" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="LEADASSGNTO" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="PROSPCUST" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="ACCOUNTNO" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="ACCOUNTDATE" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="FINAMT" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="COMPIRR" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="ASSETDESC" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="AGEING15DAYS" HeaderText="0-15 days" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="AGEING30DAYS" HeaderText="16-30 days" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="AGEING45DAYS" HeaderText="31-45 days" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="AGEING60DAYS" HeaderText="46-60 days" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="AGEINGABV60DAYS" HeaderText=">60 days" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="TICKETDATE" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="TICKETNO" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                            </Columns>
                        </asp:GridView>
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server" Visible="true"></uc1:PageNavigator>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="styleFieldAlign" colspan="4">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderWidth="2" CssClass="styleInfoLabel" Style="margin-bottom: 0px" 
                            Width="100%" OnRowCreated="GridView1_RowCreated" CellPadding="16" OnRowDataBound="GridView1_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="LEADNO" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="LEADDATE" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="LEADASSGNTO" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="PROSPCUST" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="ACCOUNTNO" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="ACCOUNTDATE" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="FINAMT" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="COMPIRR" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="ASSETDESC" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="AGEING15DAYS" HeaderText="0-15 days" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="AGEING30DAYS" HeaderText="16-30 days" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="AGEING45DAYS" HeaderText="31-45 days" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="AGEING60DAYS" HeaderText="46-60 days" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="AGEINGABV60DAYS" HeaderText=">60 days" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="TICKETDATE" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center"/>
                                <asp:BoundField DataField="TICKETNO" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Center"/>
                            </Columns>
                        </asp:GridView>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <asp:Button ID="btnExport" CssClass="styleSubmitButton" runat="server" Text="Export" OnClick="btnExport_Click" ToolTip="Export" Visible="false" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:ValidationSummary ID="VSUsrTrgt" runat="server" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):"
                    ShowSummary="true" ValidationGroup="Go" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:CustomValidator ID="CVUsrTrgt" runat="server" Display="None" ValidationGroup="Go"></asp:CustomValidator>
            </td>
        </tr>
    </table>
</asp:Content>

