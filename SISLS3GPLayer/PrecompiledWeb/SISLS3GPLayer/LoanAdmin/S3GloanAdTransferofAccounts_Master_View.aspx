<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="LoanAdmin_S3GloanAdTransferofAccounts_Master_View, App_Web_razugfam" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="tbMain" runat="server">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <asp:GridView Width="100%" ID="gvDNC" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="id" OnRowDataBound="gvDNC_RowDataBound"
                                PageSize="100" OnRowCommand="gvDNC_RowCommand" class="grid_details">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <HeaderTemplate>
                                            <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                CommandArgument='<%# Bind("id") %>' CommandName="Query" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Created Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreatedDate" runat="server" Text='<%# (Eval("Created_On"))%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="styleGridHeader" Width="8%"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Effective Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEffectiveDate" runat="server" Text='<%#(Eval("Effective_Date"))%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="styleGridHeader" Width="8%"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="From Branch" SortExpression="FromLocation">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFromLocation" runat="server" Text='<%# Bind("FromLocation") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <thead>
                                                    <tr align="center">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <asp:LinkButton ID="lnkbtnSortCode" runat="server" Text="From Branch" ToolTip="Sort By From Branch"
                                                                OnClick="FunProSortingColumn" Style="text-decoration: none;">
                                                            </asp:LinkButton>
                                                            <asp:Button ID="imgbtnSortCode" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                        </th>
                                                    </tr>
                                                    <tr align="left">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" AutoPostBack="true" ToolTip="From Branch"
                                                                    class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch" MaxLength="15"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtHeaderSearch1"
                                                                    FilterType="Custom, UppercaseLetters, LowercaseLetters, Numbers" Enabled="True" ValidChars=" ">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                        </th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="To Branch" SortExpression="ToLocation">
                                        <ItemTemplate>
                                            <asp:Label ID="lblToLocation" runat="server" Text='<%# Bind("ToLocation") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <thead>
                                                    <tr align="center">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <asp:LinkButton ID="lnkbtnUserGroupName" OnClick="FunProSortingColumn"
                                                                runat="server" ToolTip="Sort By To Branch" Text="To Branch" Style="text-decoration: none;"></asp:LinkButton>
                                                            <asp:Button ID="imgbtnUserGroupName" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                        </th>
                                                    </tr>
                                                    <tr align="left">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server" AutoPostBack="true" ToolTip="To Branch"
                                                                    class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch" MaxLength="15"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtHeaderSearch2"
                                                                    FilterType="UppercaseLetters, LowercaseLetters, Numbers" Enabled="True" ValidChars=" ">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                        </th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By")%>'></asp:Label>
                                            <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                            </asp:GridView>
                            <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <span runat="server" id="lblErrorMessage" class="styleMandatoryLabel"></span>
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnCreate" title="Create the Details,Alt+C" onserverclick="btnCreate_Click" runat="server"
                        type="button" accesskey="C">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>
                    <button class="css_btn_enabled" id="btnShowAll" onserverclick="btnShowAll_Click" title="Show the Details, Alt+S" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                    </button>
                </div>
                <%--<div class="row" style="float: right; margin-top: 5px;">
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="margin-left: 10px;">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>
                        <asp:Button ID="btnCreate" runat="server" CausesValidation="False" CssClass="save_btn fa fa-floppy-o"
                            Text="Create" OnClick="btnCreate_Click" ToolTip="Create the Details, Alt+C" AccessKey="C" />
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="margin-left: 10px;">
                        <i class="fa-list" aria-hidden="true"></i>
                        <asp:Button ID="btnShowAll" runat="server" Text="Show All" CssClass="save_btn fa fa-floppy-o"
                            OnClick="btnShowAll_Click" ToolTip="Show the Details, Alt+S" AccessKey="S" />
                    </div>
                </div>--%>
            </div>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
