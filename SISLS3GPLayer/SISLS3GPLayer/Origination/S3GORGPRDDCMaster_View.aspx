<%@ Page Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master"
    AutoEventWireup="true" CodeFile="S3GORGPRDDCMaster_View.aspx.cs" Inherits="S3GORGPRDDCMaster_View" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                        <asp:GridView runat="server" ID="grvPaging" OnRowCommand="grvPaging_RowCommand"
                            OnRowDataBound="grvPaging_RowDataBound" AutoGenerateColumns="false" CssClass="gird_details">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                            CommandArgument='<%# Bind("PRDDC_ID") %>' CommandName="Query" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle CssClass="styleGridHeader" Width="10%" />
                                    <ItemStyle HorizontalAlign="Center" />

                                    <HeaderTemplate>
                                        <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                            CommandArgument='<%# Bind("PRDDC_ID") %>' CommandName="Modify"
                                            runat="server" />
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField SortExpression="LOB">
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnSort1" runat="server"
                                                            OnClick="FunProSortingColumn" ToolTip="Sort By Line of Business" Text="Line of Business"></asp:LinkButton>
                                                        <asp:Button ID="imgbtnSort1" CssClass="styleImageSortingAsc" OnClientClick="return false;"
                                                            runat="server" ImageAlign="Middle" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" MaxLength="45" runat="server"
                                                                class="md-form-control form-control login_form_content_input" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="txtExtHeaderSearch1" runat="server" TargetControlID="txtHeaderSearch1"
                                                                ValidChars="- " FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
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
                                        <asp:Label ID="lblLOBName" runat="server" Text='<%# Bind("LOB_Code") %>'></asp:Label>
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
                                                        <asp:LinkButton ID="lnkbtnSort2" runat="server"
                                                            OnClick="FunProSortingColumn" ToolTip="Sort By Scheme"
                                                            Text="Scheme"></asp:LinkButton>
                                                        <asp:Button ID="imgbtnSort2" CssClass="styleImageSortingAsc" runat="server"
                                                            ImageAlign="Middle" OnClientClick="return false;" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2"
                                                                MaxLength="46" runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"
                                                                class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="txtExtHeaderSearch2" runat="server" TargetControlID="txtHeaderSearch2"
                                                                FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom" ValidChars=" "
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
                                        <asp:Label ID="lblProductName" runat="server" Text='<%# Bind("Product_Code") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnSort3" runat="server"
                                                            OnClick="FunProSortingColumn" ToolTip="Sort By Constitution"
                                                            Text="Constitution"></asp:LinkButton>
                                                        <asp:Button ID="imgbtnSort3" CssClass="styleImageSortingAsc" runat="server"
                                                            ImageAlign="Middle" OnClientClick="return false;" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3"
                                                                MaxLength="45" runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"
                                                                class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="txtExtHeaderSearch3" runat="server" TargetControlID="txtHeaderSearch3"
                                                                FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom" ValidChars=" "
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
                                        <asp:Label ID="lblConstitutionName" runat="server" Text='<%# Bind("Constitution_Code") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left" />
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
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <span runat="server" id="lblErrorMessage" class="styleMandatoryLabel"></span>
                    </div>
                </div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server" title="Create,Alt+C"
                        type="button" accesskey="C">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>
                    <button class="css_btn_enabled" id="btnShowAll" onserverclick="btnShowAll_Click" runat="server" title="Show All,Alt+H"
                        type="button" accesskey="H">
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
