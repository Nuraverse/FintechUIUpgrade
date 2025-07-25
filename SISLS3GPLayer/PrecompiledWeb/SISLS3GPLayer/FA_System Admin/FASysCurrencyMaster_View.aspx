<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="FASysCurrencyMaster_View, App_Web_tfexpijv" title="Untitled Page" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tbMain" runat="server">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleInfoLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <asp:GridView runat="server" ID="grvCurrencyMaster" OnRowDataBound="grvCurrencyMaster_RowDataBound"
                                OnRowCommand="grvCurrencyMaster_RowCommand" Width="100%" AutoGenerateColumns="false"
                                RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="gird_details">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <HeaderTemplate>
                                            <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                CommandArgument='<%# Bind("Currency_Map_ID") %>' CommandName="Query" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="8%">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                                CommandArgument='<%# Bind("Currency_Map_ID") %>' CommandName="Modify" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Currency Code" ItemStyle-HorizontalAlign="Left" SortExpression="Currency_Code"
                                        HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="15%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrencyCode" runat="server" Text='<%# Bind("Currency_Code") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <thead>
                                                    <tr align="center">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <asp:LinkButton ID="lnkbtnCurrencyCode" OnClick="FunProSortingColumn"
                                                                runat="server" ToolTip="Sort By Code" Text="Currency Code"></asp:LinkButton>
                                                            <asp:Button ID="imgbtnCurrencyCode" runat="server" CssClass="styleImageSortingAsc"
                                                                ImageAlign="Middle" />
                                                        </th>
                                                    </tr>
                                                    <tr align="left">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" MaxLength="3" runat="server"
                                                                    class="md-form-control form-control login_form_content_input" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>

                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtHeaderSearch1"
                                                                    FilterType="UppercaseLetters, LowercaseLetters" Enabled="True">
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
                                    <asp:TemplateField HeaderText="Currency Name" ItemStyle-HorizontalAlign="Left" SortExpression="Currency_Name"
                                        HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="40%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrencyName" runat="server" Text='<%# Bind("Currency_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <thead>
                                                    <tr align="center">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <asp:LinkButton ID="lnkbtnCurrencyName" OnClick="FunProSortingColumn" ToolTip="Sort By Name"
                                                                runat="server" Text="Currency Name"></asp:LinkButton>
                                                            <asp:Button ID="imgbtnCurrencyName" CssClass="styleImageSortingAsc" runat="server"
                                                                ImageAlign="Middle" />
                                                        </th>
                                                    </tr>
                                                    <tr align="left">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" onkeypress="fnCheckSpecialChars(true);"
                                                                    MaxLength="40" runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"
                                                                    class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtHeaderSearch2"
                                                                    FilterType="UppercaseLetters, LowercaseLetters,Custom" ValidChars=" " Enabled="True">
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
                                    <asp:TemplateField HeaderText="Precision" HeaderStyle-CssClass="styleGridHeader"
                                        ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="8%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrecision" runat="server" Text='<%# Bind("Precision") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <thead>
                                                    <tr align="center">
                                                        <td>Precision
                                                        <th style="padding: 0px !important; background: none !important;" title="Precision">

                                                            <asp:LinkButton ID="lnkbtnPrecision" Visible="false"
                                                                runat="server" Text="Precision"></asp:LinkButton>
                                                            <asp:Button ID="imgbtnSortPrecision" Visible="false" runat="server" AlternateText="Sort By Precision"
                                                                ImageAlign="Middle" ImageUrl="~/Images/ArrowUp.gif" />
                                                        </th>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox AutoCompleteType="None" Visible="false" ID="txtHeaderPrecision" MaxLength="1"
                                                                    runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"
                                                                    class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtHeaderPrecision"
                                                                    FilterType="Numbers">
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
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Active" HeaderStyle-CssClass="styleGridHeader"
                                        HeaderStyle-Width="8%">
                                        <ItemTemplate>
                                            <asp:CheckBox Enabled="false" runat="server" ID="chkActive" />
                                            <asp:Label ID="lblActive" Visible="false" runat="server" Text='<%#Eval("Is_Active")%>'></asp:Label>
                                            <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%#Eval("User_ID")%>'></asp:Label>
                                            <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%#Eval("User_ID")%>'></asp:Label>
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
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <span runat="server" id="lblErrorMessage" class="styleMandatoryLabel"></span>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnCreate" title="Create,Alt+C" onserverclick="btnCreate_Click" runat="server"
                        type="button" accesskey="C">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>
                    <button class="css_btn_enabled" id="btnShowAll" onserverclick="btnShowAll_Click" title="Show All, Alt+H" runat="server"
                        type="button" accesskey="H">
                        <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary CssClass="styleSummaryStyle" runat="server" ID="vsCurrency"
                            HeaderText="Please correct the following validation(s):  " ShowSummary="true"
                            ShowMessageBox="false" />
                        <asp:CustomValidator ID="cvCurrency" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>
                    </div>
                </div>
                <input type="hidden" id="hdnSortDirection" runat="server" />
                <input type="hidden" id="hdnSortExpression" runat="server" />
                <input type="hidden" id="hdnSearch" runat="server" />
                <input type="hidden" id="hdnOrderBy" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
