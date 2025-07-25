<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collateral_S3GCLTCollateralMaster_View, App_Web_hnyhdk4t" title="Untitled Page" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label ID="lblHeading" runat="server"></asp:Label></h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                        <asp:GridView ID="grvPaging" OnRowCommand="grvPaging_RowCommand" OnRowDataBound="grvPaging_RowDataBound"
                            runat="server" AutoGenerateColumns="false" CssClass="gird_details">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                            CommandArgument='<%# Bind("Collateral_ID") %>' CommandName="Query"
                                            runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label ID="lblModify" runat="server" Text="Modify"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                            CommandArgument='<%# Bind("Collateral_ID") %>' CommandName="Modify"
                                            runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnSort1" runat="server"
                                                            OnClick="FunProSortingColumn" ToolTip="Sort By Collateral Ref No" Text="Collateral Ref No"></asp:LinkButton>
                                                        <asp:Button ID="imgbtnSort1" CssClass="styleImageSortingAsc" runat="server"
                                                            OnClientClick="return false;" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox ID="txtHeaderSearch1" Width="100%" runat="server" AutoCompleteType="None" AutoPostBack="true"
                                                                OnTextChanged="FunProHeaderSearch" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="filtertxtHeaderSearch1" runat="server" TargetControlID="txtHeaderSearch1"
                                                                FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                ValidChars="- /" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblCollateralRefNo" Style="text-align: center" runat="server" Text='<% #Bind("Collateral_Ref_No")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnSort2" runat="server"
                                                            OnClick="FunProSortingColumn" ToolTip="Sort By Line of Business" Text="Line of Business"></asp:LinkButton>
                                                        <asp:Button ID="imgbtnSort2" CssClass="styleImageSortingAsc" runat="server"
                                                            ImageAlign="Middle" OnClientClick="return false;" />
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server" AutoPostBack="true"
                                                                class="md-form-control form-control login_form_content_input" MaxLength="40" OnTextChanged="FunProHeaderSearch">
                                                            </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="filtertxtHeaderSearch2" runat="server" TargetControlID="txtHeaderSearch2"
                                                                FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                ValidChars="- ">
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
                                        <asp:Label ID="lblLineOfBusiness" runat="server" Text='<% #Bind("LOB")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" Width="20%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnSort3" runat="server"
                                                            OnClick="FunProSortingColumn" ToolTip="Sort By Scheme" Text="Scheme"></asp:LinkButton>
                                                        <asp:Button ID="imgbtnSort3" CssClass="styleImageSortingAsc" runat="server"
                                                            ImageAlign="Middle" OnClientClick="return false;" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" runat="server" AutoPostBack="true"
                                                                class="md-form-control form-control login_form_content_input" MaxLength="40" OnTextChanged="FunProHeaderSearch">
                                                            </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="filtertxtHeaderSearch3" runat="server" TargetControlID="txtHeaderSearch3"
                                                                FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                ValidChars="- ">
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
                                        <asp:Label ID="lblProduct" runat="server" Text='<% #Bind("Product")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" Width="20%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnSort4" runat="server"
                                                            OnClick="FunProSortingColumn" ToolTip="Sort By Constitution" Text="Constitution"></asp:LinkButton>
                                                        <asp:Button ID="imgbtnSort4" CssClass="styleImageSortingAsc" runat="server"
                                                            ImageAlign="Middle" /></th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch4" runat="server" AutoPostBack="true"
                                                                class="md-form-control form-control login_form_content_input" MaxLength="40" OnTextChanged="FunProHeaderSearch">
                                                            </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="filtertxtHeaderSearch4" runat="server" TargetControlID="txtHeaderSearch4"
                                                                FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                ValidChars="- ">
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
                                        <asp:Label ID="lblConstitution" Text='<% #Bind("Constitution")%>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" Width="20%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        Active
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkActive" runat="server" AutoPostBack="true" align="center" Enabled="false" />
                                        <asp:Label ID="lblActive" Visible="false" runat="server" Text='<%#Eval("Active")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By")%>'></asp:Label>
                                        <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button id="btnCreate" runat="server" onserverclick="btnCreate_Click"
                        title="Create[Alt+C]" accesskey="C" class="css_btn_enabled" type="button">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>
                    <button id="btnShowAll" runat="server" onserverclick="btnShowAll_Click"
                        accesskey="H" title="Show All[Alt+H]" class="css_btn_enabled" type="button">
                        <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                    </button>
                </div>
            </div>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

