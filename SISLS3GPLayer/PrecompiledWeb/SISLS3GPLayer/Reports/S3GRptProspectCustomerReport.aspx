<%@ page title="Prospect/Customer Track Report" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptProspectCustomerReport, App_Web_qvacefhr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    <%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
    <%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>

    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Prospect/Customer Track Report">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlInput" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                    Width="100%">
                    <table width="100%">
                        <tr>
                            <td class="styleFieldLabel">
                                <asp:Label ID="lblProspect" runat="server" Text="Prospect/Customer" CssClass="styleDisplayLabel"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <uc2:Suggest ID="ddlProspect" runat="server" ServiceMethod="GetProspectList" Width="200px" AutoPostBack="true"
                                    ErrorMessage="Enter the Customer Name" ValidationGroup="RFVDTransLander" WatermarkText="--All--" />
                            </td>
                            <td class="styleFieldLabel">
                                <asp:Label ID="lblLocation" runat="server" CssClass="StyleDisplaylabel" Text="Location"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <uc2:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" WatermarkText="--All--"
                                    Width="200px" IsMandatory="true" ValidationGroup="Save" ErrorMessage="Enter Location" />
                            </td>
                            <td>
                                <asp:Button runat="server" ID="btnGo" CssClass="styleSubmitButton" OnClientClick="return fnCheckPageValidators('Go',false);" Text="Go" CausesValidation="true"
                                ValidationGroup="Go" ToolTip="Go" OnClick="btnGo_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td height="8px"></td>
                        </tr>
                        <tr>
                            <td class="styleFieldAlign">
                                <asp:Label ID="lblStartDateSearch" runat="server" CssClass="styleDisplayLabel" Text="From" ToolTip="From date" />
                                <span class="styleMandatory">*</span>
                            </td>
                            <td class="styleFieldAlign">
                                <input id="hidDate" runat="server" type="hidden" />
                                <asp:TextBox ID="txtStartDateSearch" runat="server" AutoPostBack="true" Width="80px"
                                    ToolTip="From date" OnTextChanged="txtStartDateSearch_TextChanged"></asp:TextBox>
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
                            <td class="styleFieldAlign">
                                <asp:Label ID="lblEndDateSearch" runat="server" CssClass="styleDisplayLabel" Text="To" ToolTip="To date" />
                                <span class="styleMandatory">*</span>
                            </td>
                            <td class="styleFieldAlign">
                                <asp:TextBox ID="txtEndDateSearch" runat="server" AutoPostBack="true" Width="80px"
                                    ToolTip="To date" OnTextChanged="txtEndDateSearch_TextChanged"></asp:TextBox>
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
                            <td>
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
            <td class="styleFieldAlign" colspan="4">
                <asp:Panel ID="PnlAbstract" runat="server" CssClass="stylePanel" GroupingText="Prospect/Customer Track">
                    <div id="divAbstract" runat="server" style="overflow: scroll;">
                        <asp:GridView ID="grvAbstract" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                            CssClass="styleInfoLabel" Style="margin-bottom: 0px" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSNo" runat="server" Text='<%# Bind("SLNO") %>' ToolTip="S.No"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Lead Date" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server" Text='<%# Bind("DATE") %>' ToolTip="Lead Date"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Lead Number" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLeadNo" runat="server" Text='<%# Bind("LEAD_NO") %>' ToolTip="Lead Number"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Prospect/Customer Name" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDocNm" runat="server" Text='<%# Bind("PROSP_CUST_NAME") %>' ToolTip="Prospect/Customer Name"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Originator" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOriginator" runat="server" Text='<%# Bind("ORIGINATOR") %>' ToolTip="Originator"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDesc" runat="server" Text='<%# Bind("DESCRIPTION") %>'  width="200px" Style="word-wrap: normal; word-break: break-all;"  ToolTip="Description"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Lead Remarks" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("REMARKS") %>' ToolTip="Lead Remarks"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Task Type" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTskTyp" runat="server" Text='<%# Bind("TASK_TYPE") %>' ToolTip="Task Type"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action Date" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFldNm" runat="server" Text='<%# Bind("ACTION_DATE") %>' ToolTip="Action Date"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ticket Number" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTicketNo" runat="server" Text='<%# Bind("TICKET_NO") %>' ToolTip="Ticket Number"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Account Number" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAcctNo" runat="server" Text='<%# Bind("ACCT_NO") %>' ToolTip="Account Number"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Account Date" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAcctDt" runat="server" Text='<%# Bind("ACCT_DATE") %>' ToolTip="Acct Date"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Lead Finance Amount" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFinAmt" runat="server" Text='<%# Bind("FIN_AMT") %>' ToolTip="Lead Finance Amount"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Current Status" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCurrStat" runat="server" Text='<%# Bind("ACCT_STATUS") %>' ToolTip="Current Status"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server" Visible="true"></uc1:PageNavigator>
                    </div>
                </asp:Panel>
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

