<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="Origination_S3GORGTransLander, App_Web_xfeo3ymh" %>

<%--Ajax Control Toolkit--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--Grid User Control--%>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/S3GMultiSelect.ascx" TagName="MultiSelect" TagPrefix="ucms" %>
<%@ Register Src="~/UserControls/S3GDynamicLOV.ascx" TagName="FLOV" TagPrefix="uc" %>
<%@ Register TagPrefix="uc3" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%--Content--%>
<asp:Content ID="ContentTransLander" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../App_Themes/S3GTheme_Blue/AutoSuggestBox.css" rel="Stylesheet" type="text/css" />
    <%--Design Started--%>

    <script type="text/javascript" language="javascript">
        function fnCloseDiv() {
            document.getElementById('<%=divShow.ClientID%>').style.display = "none";
        }
    </script>

    <style type="text/css">
        .modal {
            width: 700px;
            position: absolute;
            top: 30%;
            left: 20%;
            z-index: 1020;
            background-color: #FFF;
            border-radius: 6px;
            border: 5px solid #F2F2F2;
            display: none;
            height: 300px;
            overflow-y: scroll;
            overflow-x: auto;
        }
    </style>
    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
        <ContentTemplate>
            <table width="100%" cellpadding="0" cellspacing="2px" border="0">
                <tr>
                    <td class="stylePageHeading">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lblHeading" EnableViewState="false" CssClass="styleInfoLabel">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" cellpadding="0" cellspacing="2px" border="0">
                            <%--Row -1 with 1 columns--%>
                            <tr width="100%">
                                <%--Spacer--%>
                                <td width="100%" colspan="4" align="center">&nbsp;
                                </td>
                            </tr>
                            <%--Row 1 with 4 columns--%>
                            <tr width="100%">
                                <%--Line of Business--%>
                                <td class="styleFieldLabel">
                                    <asp:Label runat="server" Text="Line of Business" ID="lblLOBSearch" CssClass="styleDisplayLabel" />
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:DropDownList ID="ddlLOB" runat="server"></asp:DropDownList>
                                </td>
                                <%--Branch--%>
                                <td class="styleFieldLabel">
                                    <asp:Label Text="Location" runat="server" ID="lblBranchSearch" CssClass="styleDisplayLabel" />
                                </td>
                                <td class="styleFieldAlign">
                                    <uc3:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" />
                                </td>
                                <%--Start Date--%>
                                <td class="styleFieldLabel" width="80PX">
                                    <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" Width="80px" />
                                </td>

                                <td class="styleFieldAlign">
                                    <input id="hidDate" type="hidden" runat="server" />
                                    <asp:TextBox ID="txtStartDateSearch" runat="server" Width="100px"></asp:TextBox>
                                    <asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <cc1:CalendarExtender ID="ceStartate" runat="server" Enabled="True"
                                        PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                    </cc1:CalendarExtender>
                                </td>
                                <%--End Date--%>
                                <td class="styleFieldLabel">
                                    <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleDisplayLabel" Width="100px" />
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:TextBox ID="txtEndDateSearch" runat="server" Width="100px"></asp:TextBox>
                                    <asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <cc1:CalendarExtender ID="ceEndDate" runat="server" Enabled="true"
                                        PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                            <%--Row 2 with 4 columns--%>
                            <tr width="100%">
                                <td class="styleFieldLabel">
                                    <asp:Label ID="lblItem" runat="server" Text="Item View *" CssClass="styleDisplayLabel" Width="80PX"></asp:Label>
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:DropDownList ID="ddlItemView" runat="server" OnSelectedIndexChanged="ddlItemView_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvItemView" runat="server" Enabled="true" Display="None"
                                        ErrorMessage="Select Item View" ControlToValidate="ddlItemView" InitialValue="0" ValidationGroup="RFVDTransLander">
                                    </asp:RequiredFieldValidator>
                                </td>
                                <td class="styleFieldLabel">
                                    <asp:Label ID="lblProspect" runat="server" Text="Prospect/Customer" CssClass="styleDisplayLabel"></asp:Label>
                                </td>
                                <td class="styleFieldAlign" colspan="3">
                                    <uc3:Suggest ID="ddlProspect" runat="server" ServiceMethod="GetProspectList" Width="250px" AutoPostBack="true"
                                        ErrorMessage="Enter the Customer Name" ValidationGroup="RFVDTransLander" />
                                </td>
                                <td class="styleFieldLabel">
                                    <asp:Label ID="lblLead" runat="server" Text="Lead/Panum" CssClass="styleDisplayLabel"></asp:Label>
                                </td>
                                <td class="styleFieldAlign">
                                    <uc3:Suggest ID="ddlLead" runat="server" ServiceMethod="GetLeadPanumList" />
                                </td>
                            </tr>
                            <%--Row 3 with 4 columns--%>
                            <tr width="100%">
                                <td class="styleFieldLabel">
                                    <asp:Label ID="lblFromUser" runat="server" Text="From User" CssClass="styleDisplayLabel"></asp:Label>
                                </td>
                                <td class="styleFieldAlign">
                                    <uc3:Suggest ID="ddlFromUser" runat="server" ServiceMethod="GetUserList" />
                                </td>
                                <td class="styleFieldLabel">
                                    <asp:Label ID="lblToUser" runat="server" Text="To User" CssClass="styleDisplayLabel"></asp:Label>
                                </td>
                                <td class="styleFieldAlign">
                                    <uc3:Suggest ID="ddlToUser" runat="server" ServiceMethod="GetUserList" />
                                </td>
                                <td class="styleFieldLabel" width="80PX">
                                    <asp:Label ID="lblQuery" runat="server" Text="Query" CssClass="styleDisplayLabel" Width="80PX"></asp:Label>
                                </td>
                                <td>
                                    <ucms:MultiSelect runat="server" ID="ddlQueryType" Width="120px" />
                                </td>
                                <td class="styleFieldLabel">
                                    <asp:Label ID="lblStatus" runat="server" Text="Ticket Status" CssClass="styleDisplayLabel"></asp:Label>
                                </td>
                                <td>
                                    <ucms:MultiSelect runat="server" ID="ddlTaskStatus" Width="100px" />
                                </td>
                            </tr>
                            <%--Row 4 with 1 columns--%>
                            <tr width="100%">
                                <%--Spacer--%>
                                <td width="100%" colspan="4" align="center">&nbsp;
                                </td>
                            </tr>
                            <%--Row 5 with 1 columns--%>
                            <tr width="100%">
                                <%--Search Records--%>
                                <td width="100%" colspan="8" align="center">
                                    <asp:Button Text="Search" ValidationGroup="RFVDTransLander" ID="btnSearch" runat="server"
                                        CssClass="styleSubmitButton" UseSubmitBehavior="true" OnClick="btnSearch_Click" />
                                    <asp:Button Text="Create" ID="btnCreate" runat="server" CssClass="styleSubmitButton"
                                        UseSubmitBehavior="true" OnClick="btnCreate_Click" />
                                    <asp:Button Text="Clear" ID="btnClear" runat="server" CssClass="styleSubmitButton"
                                        UseSubmitBehavior="true" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />
                                    <asp:Button Text="Sales Campaign" ID="btnsalescreate" runat="server" CssClass="styleSubmitButton"
                                        UseSubmitBehavior="true" OnClick="btnSalesCreate_Click" Visible="false" />
                                </td>
                            </tr>
                            <%--Row 6 with 1 columns--%>
                            <tr width="100%">
                                <%--Spacer--%>
                                <td width="100%" colspan="4" align="center">&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%--Row 7 with 1 columns--%>
                <tr width="100%">
                    <%--Grid--%>
                    <td width="100%" align="center">
                        <asp:GridView runat="server" ID="grvTransLander" Width="100%" AutoGenerateColumns="true"
                            HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Left">
                        </asp:GridView>
                    </td>
                </tr>
                <tr width="100%">
                    <td>
                        <asp:GridView ID="gvTrackDtl" runat="server" Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="Ticket No">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkgdTrackNo" runat="server" Text='<%# Eval("Ticket_No")%>' OnClick="lnkgdTrackNo_Click"
                                            ToolTip="View Ticket Followup Details">
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Follow Up Detail ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblgdTrackID" runat="server" Text='<%# Eval("Track_ID")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Date" DataField="Ticket_Date" />
                                <asp:BoundField HeaderText="Prospect/Customer" DataField="Prospect" />
                                <asp:BoundField HeaderText="Lead/Panum" DataField="Lead_Panum" />
                                <asp:BoundField HeaderText="Lead Info" DataField="Lead_Info" />
                                <asp:BoundField HeaderText="Status" DataField="Track_Status" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr width="100%">
                    <td>
                        <asp:GridView ID="gvDocumentDtl" runat="server" Width="100%" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField HeaderText="Prospect/Customer" DataField="Prospect_Name" />
                                <asp:BoundField HeaderText="Document Type" DataField="Documet_Type" />
                                <asp:BoundField HeaderText="Document Name" DataField="Document_Name" />
                                <asp:BoundField HeaderText="Collected By" DataField="Collected_By" />
                                <asp:BoundField HeaderText="Collected Date" DataField="Collected_Date" />
                                <asp:BoundField HeaderText="Scanned By" DataField="Scanned_By" />
                                <asp:BoundField HeaderText="Scanned Date" DataField="Scanned_Date" />
                                <asp:BoundField HeaderText="Remarks" DataField="Remarks" />
                                <asp:TemplateField HeaderText="Download">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="hyplnkView" CommandArgument='<%# Bind("Doc_Scan_Path") %>'
                                            OnClick="hyplnkView_Click" ImageUrl="~/Images/downarrow_03.png" CssClass="styleGridEditDisabled"
                                            runat="server" Enabled='<%# Eval("IS_Scan").ToString() == "1" ? true : false %>' ToolTip="Download Document" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <%--Row 8 with 1 columns--%>
                <tr width="100%">
                    <%--Grid--%>
                    <td width="100%" align="center">
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="divShow" runat="server" class="modal">
                            <table style="width: 100%; table-layout: fixed">
                                <tr>
                                    <td class="stylePageHeading">
                                        <asp:Label ID="lblTicketHdr" runat="server" Text="Ticket Followup Details" EnableViewState="false" CssClass="styleInfoLabel">
                                        </asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <div id="divhtml" runat="server">
                            </div>
                            <center>
                                <asp:Button ID="btnTrackClose" runat="server" Text="Close" UseSubmitBehavior="false" CssClass="styleGridShortButton"
                                    OnClientClick="return fnCloseDiv();" />
                            </center>
                        </div>
                    </td>
                </tr>
                <%--Row 9 with 1 columns--%>
                <tr width="100%">
                    <%--Spacer--%>
                    <td width="100%" align="center">&nbsp;
                    </td>
                </tr>
                <%--Row 10 with 1 columns--%>
                <%-- <tr width="100%">--%>
                <%--Search Records--%>
                <%-- <td width="100%" colspan="4" align="center">
                        <asp:Button Text="Show All" ID="btnShowAll" runat="server" CssClass="styleSubmitButton"
                            UseSubmitBehavior="true" OnClick="btnShowAll_Click" />
                    </td>
                </tr>--%>
                <%--Row 11 with 1 columns--%>
                <tr width="100%">
                    <%--Error Message--%>
                    <td width="100%" align="center">
                        <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
                    </td>
                </tr>
                <%--Row 12 with 1 columns--%>
                <tr>
                    <td>
                        <%--Hidden fields for grid usage--%>
                        <input type="hidden" id="hdnSortDirection" runat="server" />
                        <input type="hidden" id="hdnSortExpression" runat="server" />
                        <input type="hidden" id="hdnSearch" runat="server" />
                        <input type="hidden" id="hdnOrderBy" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ValidationSummary ValidationGroup="RFVDTransLander" ID="vsTransLander" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                            ShowSummary="true" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
