<%@ Page Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true" EnableEventValidation="false"
    CodeFile="S3GSysAdminProductMaster_View.aspx.cs" Inherits="S3GSysAdminProductMaster_View" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                    <asp:GridView runat="server" ID="grvProductMaster" OnDataBound="grvProductMaster_DataBound"
                        AutoGenerateColumns="false" OnRowDataBound="grvProductMaster_RowDataBound"
                        OnRowCommand="grvProductMaster_RowCommand" class="gird_details">
                        <Columns>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderStyle CssClass="styleGridHeader" />
                                <HeaderTemplate>
                                    <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                        CommandArgument='<%# Bind("Product_LOB_Mapping_ID") %>' CommandName="Query" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%">
                                <HeaderStyle CssClass="styleGridHeader" />
                                <HeaderTemplate>
                                    <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" CommandName="Modify" CommandArgument='<%# Bind("Product_LOB_Mapping_ID") %>'
                                        ImageUrl="~/Images/spacer.gif" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Scheme Code" SortExpression="Product_Code" HeaderStyle-CssClass="styleGridHeader"
                                HeaderStyle-Width="20%">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductCode" runat="server" Text='<%# Bind("Product_Code") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnProductCode" OnClick="FunProSortingColumn" ToolTip="Sort By Scheme Code"
                                                        runat="server" Text="Scheme Code"></asp:LinkButton>
                                                    <asp:Button ID="imgbtnProductCode" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderProductCode" runat="server" AutoPostBack="true" class="md-form-control form-control login_form_content_input"
                                                            OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Scheme Name" SortExpression="Product_Name" HeaderStyle-CssClass="styleGridHeader"
                                HeaderStyle-Width="50%">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Bind("Product_Name") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnProductName" OnClick="FunProSortingColumn" ToolTip="Sort By Scheme Name"
                                                        runat="server" Text="Scheme Name"></asp:LinkButton>
                                                    <asp:Button ID="imgbtnProductName" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderProductName" runat="server" AutoPostBack="true" class="md-form-control form-control login_form_content_input"
                                                            OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="LOB Name" SortExpression="LOB_Name" HeaderStyle-CssClass="styleGridHeader"
                                HeaderStyle-Width="30%">
                                <ItemTemplate>
                                    <asp:Label ID="lblLOBName" runat="server" Text='<%# Bind("LOB_Name") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnLobCode" OnClick="FunProSortingColumn" runat="server" ToolTip="Sort By Line of Business"
                                                        Text="Line of Business"></asp:LinkButton>
                                                    <asp:Button ID="imgbtnLobCode" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderLOBName" runat="server" AutoPostBack="true" class="md-form-control form-control login_form_content_input"
                                                            OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Active" HeaderStyle-Width="10%"
                                HeaderStyle-CssClass="styleGridHeader">
                                <ItemTemplate>
                                    <asp:CheckBox Enabled="false" runat="server" ID="chkActive" />
                                    <asp:Label ID="lblActive" Visible="false" runat="server" Text='<%#Eval("Is_Active")%>'></asp:Label>
                                </ItemTemplate>
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
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
            </div>
        </div>

        <div class="btn_height"></div>
        <div align="right" class="fixed_btn">
            <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server"
                type="button" accesskey="C" title="Create,Alt+C">
                <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
            </button>

            <button class="css_btn_enabled" id="btnShow" onserverclick="btnShow_Click" runat="server"
                type="button" accesskey="H" title="Show All,Alt+H">
                <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
            </button>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <span runat="server" id="lblErrorMessage" class="styleMandatoryLabel"></span>
            </div>
        </div>
        <%--  <div class="row" style="float: right; margin-top: 5px;">

            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="margin-left: 10px;">
                <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                <asp:Button ID="btnCreate" OnClick="btnCreate_Click" CssClass="save_btn fa fa-floppy-o" AccessKey="C" ToolTip="Create,Alt+C"
                    Text="Create" runat="server"></asp:Button>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="margin-left: 10px;">
                <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                <asp:Button ID="btnShow" OnClick="btnShow_Click" CssClass="save_btn fa fa-floppy-o" Text="Show All" AccessKey="H" ToolTip="Show All,Alt+H"
                    runat="server"></asp:Button>
            </div>
        </div>--%>
    </div>
    <input type="hidden" id="hdnSortDirection" runat="server" />
    <input type="hidden" id="hdnSortExpression" runat="server" />
    <input type="hidden" id="hdnSearch" runat="server" />
    <input type="hidden" id="hdnOrderBy" runat="server" />
</asp:Content>
