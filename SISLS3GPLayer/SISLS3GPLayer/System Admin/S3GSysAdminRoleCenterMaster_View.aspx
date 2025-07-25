<%@ Page Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="S3GSysAdminRoleCenterMaster_View.aspx.cs" Inherits="System_Admin_S3GSysAdminRoleCenterMaster_View" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
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
                        <asp:GridView runat="server" ID="grvRoleCenterMaster" AutoGenerateColumns="false"
                            HeaderStyle-CssClass="styleGridHeader" OnDataBound="grvRoleCenterMaster_DataBound"
                            OnRowDataBound="grvRoleCenterMaster_RowDataBound" OnRowCommand="grvRoleCenterMaster_RowCommand" class="gird_details">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                            CommandArgument='<%# Bind("Role_Code_ID") %>' CommandName="Query" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader"
                                    HeaderStyle-Width="10%">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                            CommandArgument='<%# Bind("Role_Code_ID") %>' CommandName="modify" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Role Center" SortExpression="ROLE_CENTER_NAME" HeaderStyle-CssClass="styleGridHeader"
                                    HeaderStyle-Width="30%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRoleCenterCode" runat="server" Text='<%# Bind("ROLE_CENTER_NAME") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnRoleCenterCode" OnClick="FunProSortingColumn" ToolTip="Sort By Role Center Name" Style="text-decoration: none;"
                                                            runat="server" Text="Role Center Name"></asp:LinkButton>
                                                        <asp:Button ID="imgbtnRoleCenterCode" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderRoleCenterCode" runat="server"
                                                                AutoPostBack="true" class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </HeaderTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Role Code" SortExpression="Role_Code" HeaderStyle-CssClass="styleGridHeader"
                                    HeaderStyle-Width="15%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRoleCode" runat="server" Text='<%# Bind("Role_Code") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnRoleCode" OnClick="FunProSortingColumn" ToolTip="Sort By Role Code"
                                                            runat="server" Text="Role Code"></asp:LinkButton>
                                                        <asp:Button ID="imgbtnRoleCode" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderRoleCode" runat="server" AutoPostBack="true"
                                                            class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </HeaderTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Module Code" SortExpression="Module_Name" HeaderStyle-CssClass="styleGridHeader"
                                    HeaderStyle-Width="30%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblModuleCode" runat="server" Text='<%# Bind("Module_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnModuleCode" OnClick="FunProSortingColumn" ToolTip="Sort By Module Name"
                                                            runat="server" Text="Module Name"></asp:LinkButton>
                                                        <asp:Button ID="imgbtnModuleCode" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderModuleCode" runat="server" AutoPostBack="true"
                                                            class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </HeaderTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Program Code" SortExpression="Program_Name" HeaderStyle-CssClass="styleGridHeader"
                                    HeaderStyle-Width="30%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProgramCode" runat="server" Text='<%# Bind("Program_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnProgramCode" runat="server" ToolTip="Sort By Program Name"
                                                            OnClick="FunProSortingColumn" Text="Program Name"></asp:LinkButton>
                                                        <asp:Button ID="imgbtnProgramCode" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderProgramCode" runat="server" AutoPostBack="true"
                                                            class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </HeaderTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Active" HeaderStyle-Width="5%"
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
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="right">
                        <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server"
                            type="button" accesskey="C" title="Create,Alt+C">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>C</u>reate
                        </button>
                        <button class="css_btn_enabled" id="btnShow" onserverclick="btnShow_Click" runat="server"
                            type="button" accesskey="H" title="Show All,Alt+H">
                            <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                        </button>
                    </div>
                </div>
                <%-- <div class="row" style="float: right; margin-top: 5px;">

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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
