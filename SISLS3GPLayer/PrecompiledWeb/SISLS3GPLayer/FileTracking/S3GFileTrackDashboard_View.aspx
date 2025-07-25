<%@ page title="File Track Dashboard Entry View" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="FileTracking_S3GFileTrackDashboard_View, App_Web_ke4311yt" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" runat="server" id="dvShow">
                        <asp:Panel ID="pnlDashboardDetails" Width="100%" GroupingText="Dashboard Details" CssClass="stylePanel"
                            runat="server">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartDateSearch" runat="server" ValidationGroup="GO" autocomplete="off"
                                            OnTextChanged="txtStartDateSearch_TextChanged" AutoPostBack="True"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgStartDateSearch" runat="server"
                                            ImageUrl="~/Images/calendaer.gif" ToolTip="Start Date" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                            PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                            <%--OnClientDateSelectionChanged="checkDate_NextSystemDate"--%>
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="btngo" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                                                ErrorMessage="Enter the Request From Date" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Request From Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvEndDateSearch" runat="server">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEndDateSearch" runat="server" ValidationGroup="GO"
                                            OnTextChanged="txtEndDateSearch_TextChanged" AutoPostBack="True"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgEndDateSearch" runat="server"
                                            ImageUrl="~/Images/calendaer.gif" ToolTip="End Date" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                            PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="btngo" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True" ErrorMessage="Enter the Request To Date"
                                                Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblEndDateSearch" Text="Request To Date" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="Div1" runat="server">
                                    <div class="md-input">
                                        <button id="btnGo" runat="server" accesskey="G" causesvalidation="true" validationgroup="btngo" class="css_btn_enabled" onserverclick="btnGo_Click" title="Go[Alt+G]" type="button">
                                            <i aria-hidden="true" class="fa fa-arrow-circle-right"></i>&#8195;<u>G</u>o
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                                    <div class="gird">
                                        <asp:GridView runat="server" ID="grvDashboardView" OnRowCommand="grvDashboardView_RowCommand"
                                            OnRowDataBound="grvDashboardView_RowDataBound" Width="100%" AutoGenerateColumns="false"
                                            RowStyle-HorizontalAlign="left" HeaderStyle-CssClass="styleGridHeader" class="gird_details">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Proposal No" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblProposalNo" runat="server" Text='<%# Bind("PROPOSAL_NO") %>'></asp:Label>
                                                        <asp:Label ID="lblREQUEST_ID" runat="server" Text='<%# Bind("REQUEST_ID") %>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        <table cellpadding="0" cellspacing="0" border="0">
                                                            <thead>
                                                                <tr align="center">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <asp:LinkButton ID="lnkbtnSort1" OnClick="FunProSortingColumn" CssClass="styleGridHeaderLinkBtn"
                                                                            runat="server" ToolTip="Sort By Proposal No" Text="Proposal No"></asp:LinkButton>
                                                                        <asp:Button ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                    </th>
                                                                </tr>
                                                                <tr align="left">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" class="md-form-control form-control login_form_content_input" onpaste="return false;"
                                                                                Width="100px" runat="server" MaxLength="6" AutoPostBack="true"
                                                                                OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FtxtHeaderSearch1" runat="server" TargetControlID="txtHeaderSearch1"
                                                                                FilterType="Custom,Numbers,UppercaseLetters,LowercaseLetters" FilterMode="ValidChars" ValidChars="@." Enabled="True">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Account No" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAccountNo" runat="server" Text='<%# Bind("ACCOUNT_NO") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        <table cellpadding="0" cellspacing="0" border="0">
                                                            <thead>
                                                                <tr align="center">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <asp:LinkButton ID="lnkbtnSort2" CssClass="styleGridHeaderLinkBtn" ToolTip="Sort By Account No"
                                                                            runat="server" OnClick="FunProSortingColumn" Text="Account No"></asp:LinkButton>
                                                                        <asp:Button ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                    </th>
                                                                </tr>
                                                                <tr align="left">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" class="md-form-control form-control login_form_content_input" onpaste="return false;"
                                                                            onkeypress="fnCheckSpecialChars(true);" MaxLength="50" runat="server" AutoPostBack="true"
                                                                            OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Branch" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("BRANCH") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        <table cellpadding="0" cellspacing="0" border="0">
                                                            <thead>
                                                                <tr align="center">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <asp:LinkButton ID="lnkbtnSort3" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                                            OnClick="FunProSortingColumn" ToolTip="Sort By Branch" Text="Branch"></asp:LinkButton>
                                                                        <asp:Button ID="imgbtnSort3" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                    </th>
                                                                </tr>
                                                                <tr align="left">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" class="md-form-control form-control login_form_content_input" onpaste="return false;"
                                                                            runat="server" AutoPostBack="true" MaxLength="60" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FtxtHeaderSearch3" runat="server" TargetControlID="txtHeaderSearch3"
                                                                            FilterType="Custom,Numbers,UppercaseLetters,LowercaseLetters" FilterMode="ValidChars" ValidChars="@." Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Requested By" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRequestedBy" runat="server" Text='<%# Bind("REQUESTED_BY") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        <table cellpadding="0" cellspacing="0" border="0">
                                                            <thead>
                                                                <tr align="center">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <asp:LinkButton ID="lnkbtnSort4" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                                            OnClick="FunProSortingColumn" ToolTip="Sort By Requested By" Text="Requested By"></asp:LinkButton>
                                                                        <asp:Button ID="imgbtnSort4" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                    </th>
                                                                </tr>
                                                                <tr align="left">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch4" class="md-form-control form-control login_form_content_input" onpaste="return false;"
                                                                            Width="130px" MaxLength="40" runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FtxtHeaderSearch4" runat="server" TargetControlID="txtHeaderSearch4"
                                                                            FilterType="Custom,Numbers,UppercaseLetters,LowercaseLetters" FilterMode="ValidChars" ValidChars="@." Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Department" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDepartment" runat="server" Text='<%# Bind("DEPARTMENT") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        <table cellpadding="0" cellspacing="0" border="0">
                                                            <thead>
                                                                <tr align="center">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <asp:LinkButton ID="lnkbtnSort5" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                                            OnClick="FunProSortingColumn" ToolTip="Sort By Department" Text="Department"></asp:LinkButton>
                                                                        <asp:Button ID="imgbtnSort5" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                    </th>
                                                                </tr>
                                                                <tr align="left">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch5" class="md-form-control form-control login_form_content_input" onpaste="return false;"
                                                                            Width="130px" MaxLength="40" runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FtxtHeaderSearch5" runat="server" TargetControlID="txtHeaderSearch5"
                                                                            FilterType="Custom,Numbers,UppercaseLetters,LowercaseLetters" FilterMode="ValidChars" ValidChars="@." Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="File Type" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFileType" runat="server" Text='<%# Bind("FILE_TYPE") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        <table cellpadding="0" cellspacing="0" border="0">
                                                            <thead>
                                                                <tr align="center">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <asp:LinkButton ID="lnkbtnSort6" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                                            OnClick="FunProSortingColumn" ToolTip="Sort By File Type" Text="File Type"></asp:LinkButton>
                                                                        <asp:Button ID="imgbtnSort6" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                    </th>
                                                                </tr>
                                                                <tr align="left">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch6" class="md-form-control form-control login_form_content_input" onpaste="return false;"
                                                                            Width="130px" MaxLength="40" runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FtxtHeaderSearch6" runat="server" TargetControlID="txtHeaderSearch6"
                                                                            FilterType="Custom,Numbers,UppercaseLetters,LowercaseLetters" FilterMode="ValidChars" ValidChars="@." Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Reason" HeaderStyle-CssClass="styleGridHeader"
                                                    HeaderText="Reason" />
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Requested Date" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRequestedDate" runat="server" Text='<%#Eval("Requested_Date")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Select">
                                                    <HeaderTemplate>
                                                        <table>
                                                            <thead>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged" />
                                                                    </td>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" AutoPostBack="true" OnCheckedChanged="chkSelected_OnCheckedChanged" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="13%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <%--<div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                        </div>
                    </div>--%>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <span runat="server" id="lblErrorMessage" class="styleMandatoryLabel"></span>
                                </div>
                            </div>
                            <div class="row" style="float: right; margin-top: 5px;">
                                <button class="css_btn_enabled" id="btnShowAll" title="Show All[Alt+H]" causesvalidation="false" onserverclick="btnShowAll_Click" runat="server"
                                    type="button" accesskey="H">
                                    <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                                </button>
                                <button class="css_btn_enabled" id="btnIssued" title="Issued[Alt+I]" causesvalidation="false" onserverclick="btnIssued_Click" runat="server"
                                    type="button" accesskey="I">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>I</u>ssued
                                </button>
                                <button class="css_btn_enabled" id="btnQuery" title="Query[Alt+Q]" causesvalidation="false" onserverclick="btnQuery_Click" runat="server"
                                    type="button" accesskey="Q">
                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>Q</u>uery
                                </button>
                                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+C]" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                                    type="button" accesskey="C">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u>C</u>lear
                                </button>
                            </div>
                        </asp:Panel>
                    </div>
                    <input type="hidden" id="hdnSortDirection" runat="server" />
                    <input type="hidden" id="hdnSortExpression" runat="server" />
                    <input type="hidden" id="hdnSearch" runat="server" />
                    <input type="hidden" id="hdnOrderBy" runat="server" />
                </div>
            </div>
        </ContentTemplate>         
    </asp:UpdatePanel>
</asp:Content>

