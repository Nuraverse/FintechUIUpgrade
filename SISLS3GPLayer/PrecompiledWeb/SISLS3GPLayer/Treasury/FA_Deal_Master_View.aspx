<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FA_Deal_Master_View, App_Web_insjbia3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading">
                    </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row" style="margin-top: 10px; align-content: center">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="gird ">
                    <asp:GridView ID="grvPaging" runat="server" AutoGenerateColumns="False"
                        OnRowDataBound="grvPaging_RowDataBound" OnRowCommand="grvPaging_RowCommand" class="gird_details">
                        <Columns>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderStyle CssClass="styleGridHeader" />
                                <HeaderTemplate>
                                    <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                        CommandArgument='<%# Bind("DEAL_ID") %>' CommandName="Query" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Modify">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnEdit" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                        AlternateText="Modify" CommandArgument='<%# Bind("DEAL_ID") %>' runat="server"
                                        CommandName="Modify" />
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <asp:Label ID="lblModify" runat="server" Text="Modify" CssClass="styleGridHeader"></asp:Label>
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Deal Number">
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="Deal Number" ToolTip="Sort Deal Number"
                                                        OnClick="FunProSortingColumn" Style="text-decoration: none;"> </asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" AutoPostBack="true"
                                                            onmouseover="txt_MouseoverTooltip(this)" OnTextChanged="FunProHeaderSearch"
                                                            CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftxtDealCode" ValidChars="/-() ." TargetControlID="txtHeaderSearch1"
                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                            Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbldealcode" runat="server" Text='<%# Bind("Deal_No") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--  for Funder Code--%>
                            <asp:TemplateField HeaderText="Funder Code">
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="Funder Code" ToolTip="Sort Funder Code"
                                                        OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server" AutoPostBack="true"
                                                            onmouseover="txt_MouseoverTooltip(this)" OnTextChanged="FunProHeaderSearch"
                                                            CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftxtFunderCode" ValidChars="/-() ." TargetControlID="txtHeaderSearch2"
                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                            Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblFunderCode" runat="server" Text='<%# Bind("Funder_Code") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--  for Funder Name--%>
                            <asp:TemplateField HeaderText="Funder Name">
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort3" runat="server" Text="Funder Name" ToolTip="Sort Funder Name"
                                                        OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort3" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" runat="server" AutoPostBack="true"
                                                            onmouseover="txt_MouseoverTooltip(this)" OnTextChanged="FunProHeaderSearch"
                                                            CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftxtFunderName" ValidChars="/-() ." TargetControlID="txtHeaderSearch3"
                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                            Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblFunderName" runat="server" Text='<%# Bind("Funder_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--  for Location--%>
                            <asp:TemplateField HeaderText="Location">
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort4" runat="server" Text="Location" ToolTip="Sort By Location"
                                                        OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort4" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch4" runat="server" AutoPostBack="true"
                                                            onmouseover="txt_MouseoverTooltip(this)" OnTextChanged="FunProHeaderSearch"
                                                            CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftxtLocation" ValidChars="/-() ." TargetControlID="txtHeaderSearch4"
                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                            Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%#Eval("Created_By")%>'></asp:Label>
                                    <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%#Eval("User_Level_ID")%>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
            </div>
        </div>


        <div class="btn_height"></div>
        <div align="right" class="fixed_btn">
            <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server"
                type="button" accesskey="C" title="Create,Alt+C">
                <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
            </button>
            <button class="css_btn_enabled" id="btnShowAll" onserverclick="btnShowAll_Click" runat="server"
                type="button" accesskey="H" title="Show All,Alt+H">
                <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
            </button>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <span runat="server" id="lblErrorMessage" style="color: Red; font-size: medium"></span>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdnSortDirection" runat="server" />
    <input type="hidden" id="hdnSortExpression" runat="server" />
    <input type="hidden" id="hdnSearch" runat="server" />
    <input type="hidden" id="hdnOrderBy" runat="server" />

</asp:Content>





