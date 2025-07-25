<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="Collection_S3GClnDraweeBankMaster_View, App_Web_la20gqab" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>

<asp:Content ID="ContentTransLander" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../App_Themes/S3GTheme_Blue/AutoSuggestBox.css" rel="Stylesheet" type="text/css" />
    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
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
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:TextBox ID="txtBankCode" runat="server" MaxLength="15" ToolTip="Branch Code" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label ID="lblBankCode" runat="server" CssClass="styleDisplayLabel" Text="Bank Code" ToolTip="Bank Code" />
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:TextBox ID="txtBankName" runat="server" MaxLength="80" ToolTip="Bank Name" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label ID="lblBankName" runat="server" CssClass="styleDisplayLabel" Text="Bank Name" ToolTip="Bank Name" />
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:TextBox ID="txtEffectiveFromDate" runat="server" ToolTip="Effective From Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtenderEffectiveFromDate" runat="server" Enabled="True"
                                TargetControlID="txtEffectiveFromDate">
                            </cc1:CalendarExtender>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label ID="lblEffectiveFrom" runat="server" CssClass="styleDisplayLabel" Text="Effective From Date" ToolTip="Effective From Date" />
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:TextBox ID="txtEffectiveToDate" runat="server" ToolTip="Effective To Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtenderEffectiveToDate" runat="server" Enabled="True" TargetControlID="txtEffectiveToDate">
                            </cc1:CalendarExtender>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label ID="lblEffectiveTo" runat="server" CssClass="styleDisplayLabel" Text="Effective To Date" ToolTip="Effective To Date" />
                            </label>
                        </div>
                    </div>
                </div>
                
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:GridView ID="grvTransLander" runat="server" AutoGenerateColumns="false" HeaderStyle-CssClass="styleGridHeader"
                            OnRowCommand="grvTransLander_RowCommand" OnRowDataBound="grvTransLander_RowDataBound" RowStyle-HorizontalAlign="Left" Width="100%">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnQuery" runat="server" CommandArgument='<%# Bind("ID") %>' CommandName="Query" CssClass="styleGridQuery" ImageUrl="~/Images/spacer.gif" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnEdit" runat="server" CommandArgument='<%# Bind("ID") %>' CommandName="Modify" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Left">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblHTBankCode" runat="server" Text="Bank Code"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblITBankCode" runat="server" Text='<%# Bind("BANKCODE") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Left">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblHTBankName" runat="server" Text="Bank Name"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblITBankName" runat="server" Text='<%# Bind("BANKNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Left">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblHTEffectiveFrom" runat="server" Text="Effective From Date"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblITEffectiveFrom" runat="server" Text='<%# Bind("Effective_From") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Left">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblHTEffectiveTo" runat="server" Text="Effective To Date"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblITEffectiveTo" runat="server" Text='<%# Bind("Effective_To") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Left">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblHTCreatedBy" runat="server" Text="Created By"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblCreatedBy" runat="server" Text='<%# Bind("Created_By") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Left">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblHTStatus" runat="server" Text="Status"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By") %>'></asp:Label>
                                        <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_ID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                    </div>
                </div>
                <div class="row" style="margin-top: 0px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
                    </div>
                </div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSearch" title="Search[Alt+S]" causesvalidation="false" onserverclick="btnSearch_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
                    </button>
                    <%--   <i class="fas fa-search"></i>--%>
                    <button class="css_btn_enabled" id="btnCreate" title="Create[Alt+C]" causesvalidation="false" onserverclick="btnCreate_Click" runat="server"
                        type="button" accesskey="C">
                        <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                </div>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <%--Hidden fields for grid usage--%>
                        <input type="hidden" id="hdnSortDirection" runat="server" />
                        <input type="hidden" id="hdnSortExpression" runat="server" />
                        <input type="hidden" id="hdnSearch" runat="server" />
                        <input type="hidden" id="hdnOrderBy" runat="server" />
                    </div>
                </div>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ValidationGroup="RFVDTransLander" ID="vsTransLander" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                            ShowSummary="true" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
