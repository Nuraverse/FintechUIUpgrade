<%@ page title="FA - User Management" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_FAUserManagement_View, App_Web_tfexpijv" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="User Management - Details" ID="lblHeading" CssClass="styleInfoLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <asp:GridView runat="server" ID="grvUserManagement" OnRowCommand="grvUserManagement_RowCommand"
                                OnRowDataBound="grvUserManagement_RowDataBound" Width="100%" AutoGenerateColumns="false"
                                RowStyle-HorizontalAlign="left" HeaderStyle-CssClass="styleGridHeader">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <HeaderTemplate>
                                            <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                CommandArgument='<%# Bind("User_ID") %>' CommandName="Query" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                                CommandArgument='<%# Bind("User_ID") %>' CommandName="Modify" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserCode" runat="server" Text='<%# Bind("User_Code") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr align="center">

                                                    <asp:LinkButton ID="lnkbtnUserCode" OnClick="FunProSortingColumn"
                                                        runat="server" ToolTip="Sort By User Code" Text="User Code"></asp:LinkButton>
                                                    <asp:Button ID="imgbtnUserCode" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />

                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" class="md-form-control form-control login_form_content_input"
                                                                runat="server" MaxLength="6" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("User_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr align="center">

                                                    <asp:LinkButton ID="lnkbtnUserName" ToolTip="Sort By User Name"
                                                        runat="server" OnClick="FunProSortingColumn" Text="User Name"></asp:LinkButton>
                                                    <asp:Button ID="imgbtnUserName" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />

                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" class="md-form-control form-control login_form_content_input"
                                                                onkeypress="fnCheckSpecialChars(true);" MaxLength="50" runat="server" AutoPostBack="true"
                                                                OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="EMailId" HeaderStyle-CssClass="styleGridHeader">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEMailId" runat="server" Text='<%# Bind("EMail_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr align="center">

                                                    <asp:LinkButton ID="lnkbtnEMailId" runat="server"
                                                        OnClick="FunProSortingColumn" ToolTip="Sort By EMailId" Text="EMailId"></asp:LinkButton>
                                                    <asp:Button ID="imgbtnEMailId" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />

                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" class="md-form-control form-control login_form_content_input"
                                                                runat="server" AutoPostBack="true" MaxLength="60" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Designation" HeaderStyle-CssClass="styleGridHeader">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr align="center">

                                                    <asp:LinkButton ID="lnkbtnDesignation" runat="server"
                                                        OnClick="FunProSortingColumn" ToolTip="Sort By Designation" Text="Designation"></asp:LinkButton>
                                                    <asp:Button ID="imgbtnDesignation" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />

                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch4" class="md-form-control form-control login_form_content_input"
                                                                MaxLength="40" runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="User_Level_Desc" HeaderStyle-CssClass="styleGridHeader"
                                        HeaderText="User Level" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Active" HeaderStyle-CssClass="styleGridHeader">
                                        <ItemTemplate>
                                            <asp:CheckBox Enabled="false" runat="server" ID="chkActive" />
                                            <asp:Label ID="lblActive" Visible="false" runat="server" Text='<%#Eval("Is_Active")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
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
                <tr>
                    <td align="center" valign="top">
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 5px; padding-left: 5px;" align="Center">
                        <span runat="server" id="lblErrorMessage" class="styleMandatoryLabel"></span>
                    </td>
                </tr>
                <div align="right" class="fixed_btn">
                    <button id="btnCreate" runat="server" class="css_btn_enabled" onserverclick="btnCreate_Click" causesvalidation="false" accesskey="C" title="Create[Alt+C]"
                        type="button"  visible="false">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>
                    <button id="btnShowAll" runat="server" class="css_btn_enabled" type="button" accesskey="H" title="Show All[Alt+H]"
                        onserverclick="btnShowAll_Click">
                        <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                    </button>
                </div>
                <input type="hidden" id="hdnSortDirection" runat="server" />
                <input type="hidden" id="hdnSortExpression" runat="server" />
                <input type="hidden" id="hdnSearch" runat="server" />
                <input type="hidden" id="hdnOrderBy" runat="server" />
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
