<%@ page title="File Track - Dashboard Query" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="FileTracking_S3GFileTrackDashboard_Entry, App_Web_ke4311yt" enableeventvalidation="false" %>

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
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlFileType" runat="server" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="View By" ID="lblFileType" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                        <%-- <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvJob" runat="server" Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn"
                                        ValidationGroup="btnSave" ErrorMessage="Select a RFID Type" ControlToValidate="ddlFileType"></asp:RequiredFieldValidator>
                                </div>--%>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartDateSearch" runat="server" autocomplete="off"
                                            OnTextChanged="txtStartDateSearch_TextChanged" AutoPostBack="True"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgStartDateSearch" runat="server"
                                            ImageUrl="~/Images/calendaer.gif" ToolTip="Start Date" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                            PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                            <%--OnClientDateSelectionChanged="checkDate_NextSystemDate"--%>
                                        </cc1:CalendarExtender>
                                        <%--<div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="btngo" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                                                ErrorMessage="Enter the Request From Date" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Request From Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEndDateSearch" runat="server"
                                            OnTextChanged="txtEndDateSearch_TextChanged" AutoPostBack="True"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgEndDateSearch" runat="server"
                                            ImageUrl="~/Images/calendaer.gif" ToolTip="End Date" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                            PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                        </cc1:CalendarExtender>
                                        <%--<div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="btngo" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True" ErrorMessage="Enter the Request To Date"
                                                Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" ID="lblEndDateSearch" Text="Request To Date" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <uc2:Suggest ID="txtProposalNumber" AutoPostBack="true" runat="server" ServiceMethod="GeProposalList"
                                            CssClass="md-form-control form-control login_form_content_input" IsMandatory="false" class="md-form-control form-control" OnItem_Selected="txtProposalNumber_Item_Selected" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Proposal Number" ID="lblJobDescription" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <button id="btnGo" runat="server" accesskey="G" causesvalidation="false" validationgroup="btngo" class="css_btn_enabled"
                                            onserverclick="btnGo_Click" title="Go[Alt+G]" type="button">
                                            <i aria-hidden="true" class="fa fa-arrow-circle-right"></i>&#8195;<u>G</u>o
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                                    <asp:GridView runat="server" ID="grvDashboardView"
                                        Width="100%" AutoGenerateColumns="false"
                                        RowStyle-HorizontalAlign="left" HeaderStyle-CssClass="styleGridHeader" class="gird_details">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Request No" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRequest_No" runat="server" Text='<%# Bind("Request_No") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Proposal No" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblProposalNo" runat="server" Text='<%# Bind("PROPOSAL_NO") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Account No" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAccountNo" runat="server" Text='<%# Bind("Account_No") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Branch" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Branch") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Requested By" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRequestedBy" runat="server" Text='<%# Bind("Requested_By") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Department" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDepartment" runat="server" Text='<%# Bind("Department") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="RFID Type" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRequestedBy" runat="server" Text='<%# Bind("FILE_TYPE") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Reason" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReason" runat="server" Text='<%# Bind("Reason") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Issued Date" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIssued_Date" runat="server" Text='<%#Eval("Issued_Date")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Issued Time" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIssued_Time" runat="server" Text='<%#Eval("Issued_Time")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Issued by" HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIssued_By" runat="server" Text='<%#Eval("Issued_By")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                                </div>
                            </div>
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
                                <button class="css_btn_enabled" id="btnExcel" title="Excel[Alt+E]" causesvalidation="false" onserverclick="btnExcel_Click" runat="server"
                                    type="button" accesskey="E">
                                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                                </button>
                                <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                    type="button" accesskey="X">
                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

