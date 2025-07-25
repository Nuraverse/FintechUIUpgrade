<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_S3GSysAdminDocPath_View, App_Web_vcipatnp" %>

<%@ Register Src="../UserControls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" ToolTip="Document Path Setup" Text="Document Path Setup">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                        <asp:GridView runat="server" ID="grvDocPathMaster" AutoGenerateColumns="False" Width="100%"
                            OnRowCommand="grvDocPathMaster_RowCommand" OnRowDataBound="grvDocPathMaster_RowDataBound" CssClass="gird_details">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                            AlternateText="Query" CommandArgument='<%# Bind("Document_Path_ID") %>' runat="server"
                                            CommandName="Query" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader"
                                    HeaderStyle-Width="10%">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnEdit" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                            AlternateText="Modify" CommandArgument='<%# Bind("Document_Path_ID") %>' runat="server"
                                            CommandName="Modify" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Line of Business" SortExpression="LOB_Name" HeaderStyle-Width="15%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLob" runat="server" Text='<%# Bind("LOB_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnSortLOB" runat="server" ToolTip="Sort By Line of Business"
                                                            Text="Line of Business" OnClick="FunProSortingColumn">
                                                        </asp:LinkButton>
                                                        <asp:Button ID="imgbtnSortLOB" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" AutoPostBack="true"
                                                                class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch" MaxLength="40"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtHeaderSearch1"
                                                                FilterType="Custom,UppercaseLetters, LowercaseLetters" Enabled="True" ValidChars=" ">
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
                                <asp:TemplateField HeaderText="Role Code" SortExpression="Role_Code" HeaderStyle-Width="15%"><%--SortExpression="Role_Code + ' - ' + Program_Name"--%>
                                    <ItemTemplate>
                                        <asp:Label ID="lblRoleCode" runat="server" Text='<%# Bind("Role_Code") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnSortRole" runat="server" Text="Role Description" ToolTip="Sort By Role code"
                                                            OnClick="FunProSortingColumn">
                                                        </asp:LinkButton>
                                                        <asp:Button ID="imgbtnSortRole" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server" AutoPostBack="true"
                                                                class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch" MaxLength="50"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtHeaderSearch2"
                                                                FilterType="UppercaseLetters, LowercaseLetters,custom" ValidChars=" " Enabled="True">
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
                                <%--<asp:TemplateField HeaderText="Document Flag" SortExpression="PM.Document_Flag"
                                    HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="25%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFlagDesc" runat="server" Text='<%# Bind("Document_Flag_Desc") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" border="0">
                                            <tr align="center">
                                                <td>
                                                    <asp:LinkButton ID="lnkbtnSortFlagDesc" runat="server" ToolTip="Sort By Document flag"
                                                        Text="Document Flag Desc" CssClass="styleGridHeaderLinkBtn" OnClick="FunProSortingColumn"></asp:LinkButton>
                                                    <asp:ImageButton ID="imgbtnSortFlagDesc" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </td>
                                            </tr>
                                            <tr align="left">
                                                <td>
                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" runat="server" AutoPostBack="true"
                                                        CssClass="styleSearchBox" OnTextChanged="FunProHeaderSearch" MaxLength="50"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtHeaderSearch3"
                                                        FilterType="Custom,UppercaseLetters, LowercaseLetters" Enabled="True" ValidChars=" ">
                                                    </cc1:FilteredTextBoxExtender>
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Document Path" SortExpression="Document_Path" HeaderStyle-CssClass="styleGridHeader">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDocPath" runat="server" Text='<%# Bind("Document_Path") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <%-- <HeaderTemplate>
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <tr align="center">
                                        <td>
                                            <asp:LinkButton ID="lnkbtnDocPath" runat="server" Text="Document Path" CssClass="styleGridHeader"></asp:LinkButton>
                                            <asp:ImageButton ID="imgbtnSortPath" runat="server" AlternateText="Sort By Path"
                                                OnClick="FunProSortingColumn" ImageAlign="Middle" ImageUrl="~/Images/ArrowUp.gif" />
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderDocpath" runat="server" AutoPostBack="true"
                                                OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </HeaderTemplate>--%>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Active" HeaderStyle-CssClass="styleGridHeader"
                                    HeaderStyle-Width="10%">
                                    <ItemTemplate>
                                        <asp:CheckBox Enabled="false" runat="server" ID="chkActive" Checked='<%# DataBinder.Eval(Container.DataItem,"Is_Active").ToString().ToUpper() == "TRUE"  %>' />
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
                            <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
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
                        <span runat="server" id="lblErrorMessage" style="color: Red; font-size: medium"></span>
                        <%--<asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatory"></asp:Label--%>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server"
                        type="button" accesskey="C" title="Create,Alt+C">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>
                    <button class="css_btn_enabled" id="btnShowAll" onserverclick="btnShowAll_Click" runat="server"
                        type="button" accesskey="H" title="Show All,Alt+H">
                        <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                    </button>

                </div>
                <%-- <div class="row" style="float: right; margin-top: 5px;">
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="margin-left: 10px;">
                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnCreate" OnClick="btnCreate_Click" CssClass="save_btn fa fa-floppy-o" AccessKey="C" ToolTip="Create,Alt+C"
                            CausesValidation="false" Text="Create" runat="server"></asp:Button>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="margin-left: 10px;">
                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnShowAll" OnClick="btnShowAll_Click" runat="server" Text="Show All" AccessKey="H" ToolTip="Show All,Alt+H"
                            CssClass="save_btn fa fa-floppy-o" />
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
