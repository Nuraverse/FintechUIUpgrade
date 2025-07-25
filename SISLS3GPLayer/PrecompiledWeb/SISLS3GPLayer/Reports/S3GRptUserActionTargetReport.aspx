<%@ page title="Things To Do Report" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptUserActionTargetReport, App_Web_dy5ultuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    <%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
    <%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>

    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Things To Do Report">
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
                                <asp:Label ID="lblTargetUser" runat="server" CssClass="StyleDisplaylabel" Text="Target User"></asp:Label></td>
                            <td class="styleFieldAlign" width="10%">
                                <uc2:Suggest ID="ddlTargetUser" runat="server" ServiceMethod="GetUserList" AutoPostBack="true" WatermarkText="--All--"
                                    IsMandatory="true" Width="220px" ValidationGroup="Save" ErrorMessage="Enter Target User" />
                            </td>
                            <td class="styleFieldLabel" width="5%">
                                <asp:Label ID="lblLocation" runat="server" CssClass="StyleDisplaylabel" Text="Location"></asp:Label>
                            </td>
                            <td class="styleFieldAlign" width="10%">
                                <uc2:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" WatermarkText="--All--"
                                    IsMandatory="true" ValidationGroup="Save" ErrorMessage="Enter Location" />
                            </td>
                            <td width="8%">
                                <asp:Button runat="server" ID="btnGo" CssClass="styleSubmitButton" OnClientClick="return fnCheckPageValidators('Go',false);" Text="Go"
                                    CausesValidation="true" ValidationGroup="Go" ToolTip="Go" OnClick="btnGo_Click" />
                            </td>
                        </tr>

                        <tr>
                            <td height="8px"></td>
                        </tr>

                        <tr>
                            <td class="styleFieldAlign" width="6%">
                                <asp:Label ID="lblStartDateSearch" runat="server" CssClass="styleDisplayLabel" Text="From" ToolTip="From" />
                                <span class="styleMandatory">*</span>
                            </td>
                            <td class="styleFieldAlign" width="10%">
                                <input id="hidDate" runat="server" type="hidden" />
                                <asp:TextBox ID="txtStartDateSearch" runat="server" AutoPostBack="true"
                                    ToolTip="From date" Width="80px" OnTextChanged="txtStartDateSearch_TextChanged"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" Display="None" ControlToValidate="txtStartDateSearch"
                                    ValidationGroup="Go" CssClass="styleMandatoryLabel" ErrorMessage="Select From date"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                <asp:ImageButton ID="btnPrevious1" runat="server" Enabled="true" CommandName="Prev"
                                    ImageUrl="../Images/blue-jelly-icon2.png" CausesValidation="false" OnCommand="btnPrevious1_Command" />
                                <asp:ImageButton ID="btnNext1" runat="server" Enabled="true" CommandName="Next"
                                    ImageUrl="../Images/blue-jelly-icon1.png" CausesValidation="false" OnCommand="btnNext1_Command" />
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True"
                                    PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                </cc1:CalendarExtender>
                            </td>
                            <td class="styleFieldAlign" width="6%">
                                <asp:Label ID="lblEndDateSearch" runat="server" CssClass="styleDisplayLabel" Text="To" ToolTip="To date" />
                                <span class="styleMandatory">*</span>
                            </td>
                            <td class="styleFieldAlign" width="10%">
                                <asp:TextBox ID="txtEndDateSearch" runat="server" AutoPostBack="true"
                                    ToolTip="To date" Width="80px" OnTextChanged="txtEndDateSearch_TextChanged1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" Display="None" ControlToValidate="txtEndDateSearch"
                                    ValidationGroup="Go" CssClass="styleMandatoryLabel" ErrorMessage="Select To date"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                <asp:ImageButton ID="btnPrevious2" runat="server" Enabled="true" CommandName="Prev"
                                    ImageUrl="../Images/blue-jelly-icon2.png" CausesValidation="false" OnCommand="btnPrevious2_Command" />
                                <asp:ImageButton ID="btnNext2" runat="server" Enabled="true" CommandName="Next"
                                    ImageUrl="../Images/blue-jelly-icon1.png" CausesValidation="false" OnCommand="btnNext2_Command" />
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True"
                                    PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                </cc1:CalendarExtender>
                            </td>
                            <td width="5%">
                                <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton"
                                    Text="Clear" OnClientClick="return fnConfirmClear();" ToolTip="Clear" OnClick="btnClear_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="styleFieldAlign" width="6%">
                                <asp:Label ID="lblCustomerStatus" runat="server" CssClass="styleDisplayLabel" Text="Customer Status" ToolTip="Customer Status" />
                                <span class="styleMandatory">*</span>
                            </td>
                            <td class="styleFieldAlign">
                                <asp:DropDownList ID="ddlCustomerStatus" CssClass="WindowsStyle" runat="server"></asp:DropDownList>
                            </td>
                            <td class="styleFieldAlign" width="6%">
                                <asp:Label ID="lblExposureType" runat="server" CssClass="styleDisplayLabel" Text="Exposure Type" ToolTip="Exposure Type" />
                                <span class="styleMandatory">*</span>
                            </td>
                            <td class="styleFieldAlign">
                                <asp:DropDownList ID="ddlExposureType" CssClass="WindowsStyle" runat="server"></asp:DropDownList>
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
        <%--<tr>
            <td colspan="4" align="center">
                <asp:Button runat="server" ID="btnGo" CssClass="styleSubmitButton" OnClientClick="return fnCheckPageValidators('Go',false);" Text="Go" CausesValidation="true"
                    ValidationGroup="Go" ToolTip="Go" OnClick="btnGo_Click" />
                &nbsp;<asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton"
                    Text="Clear" OnClientClick="return fnConfirmClear();" ToolTip="Clear" OnClick="btnClear_Click" />
            </td>
        </tr>--%>
        <tr>
            <td class="styleFieldAlign" colspan="4">
                <asp:Panel ID="PnlAbstract" runat="server" CssClass="stylePanel" GroupingText="Things To Do">
                    <div id="divAbstract" runat="server" style="overflow: scroll;">
                        <asp:GridView ID="grvAbstract" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                            CssClass="styleInfoLabel" Style="margin-bottom: 0px" Width="99%">
                            <Columns>
                                <%--<asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSNo" runat="server" Text='<%# Bind("SLNO") %>' ToolTip="S.No"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Target Date" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFldNm" runat="server" Text='<%# Bind("ACTION_DATE") %>' ToolTip="Target Date"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Informer" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFrom" runat="server" Text='<%# Bind("ORIGINATOR") %>' ToolTip="Informer"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Assignee" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTo" runat="server" Text='<%# Bind("ASSIGNEE") %>' ToolTip="Assignee"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action Desc" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDesc" runat="server" Text='<%# Bind("DESCRIPTION") %>' Width="200px" Style="word-wrap: normal; word-break: break-all;" ToolTip="Action Desc"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Prosp/Cust Name" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDocNm" runat="server" Text='<%# Bind("PROSP_CUST_NAME") %>' ToolTip="Prosp/Cust Name"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Lead No" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLeadNo" runat="server" Text='<%# Bind("LEAD_NO") %>' ToolTip="Lead No"></asp:Label>
                                        <asp:Label ID="lblLeadId" runat="server" Text='<%# Bind("LEAD_ID") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblCRMID" runat="server" Text='<%# Bind("CRM_ID") %>' Visible="false"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Lead Date" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" runat="server" Text='<%# Bind("DATE") %>' ToolTip="Lead Date"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkLeadView" runat="server" Text="View" OnClick="lnkLeadView_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                </asp:TemplateField>
                                <%--<asp:TemplateField HeaderText="Lead Remarks" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("REMARKS") %>' ToolTip="Lead Remarks"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>--%>
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
