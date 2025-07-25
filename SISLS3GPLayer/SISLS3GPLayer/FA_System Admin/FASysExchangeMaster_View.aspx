<%@ Page Language="C#" MasterPageFile="~/Common/FAMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="FASysExchangeMaster_View.aspx.cs" Inherits="Sysadm_FASysExchangeMaster_View"
    Title="Untitled Page" %>

<%@ Register Src="../UserControls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                        <asp:GridView ID="grvPaging" runat="server" AutoGenerateColumns="False" Width="100%"
                            OnRowDataBound="grvPaging_RowDataBound" OnRowCommand="grvPaging_RowCommand">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                            CommandArgument='<%# Bind("Exchange_Rate_ID") %>' CommandName="Query" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Modify" Visible="false">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnEdit" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                            AlternateText="Modify" CommandArgument='<%# Bind("Exchange_Rate_ID") %>' runat="server"
                                            CommandName="Modify" />
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        <asp:Label ID="lblModify" runat="server" Text="Modify" CssClass="styleGridHeader"></asp:Label>
                                    </HeaderTemplate>
                                </asp:TemplateField>
                                <%--  for Base Currency--%>
                                <asp:TemplateField HeaderText="Base Currency">
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="Base Currency" ToolTip="Sort By Base Currency"
                                                            OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                        <asp:Button ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" AutoPostBack="true"
                                                                onmouseover="txt_MouseoverTooltip(this)" MaxLength="60" OnTextChanged="FunProHeaderSearch"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblBaseCurrency" runat="server" Text='<%# Bind("Base_Cur_Code") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--  for Base Currency Value--%>
                                <asp:TemplateField HeaderText="Base Currency Value">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBaseCurrencyVal" runat="server" Text='<%# Bind("BCC_Def_Value") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                </asp:TemplateField>
                                <%--  for Location--%>
                                <asp:TemplateField HeaderText="Branch">
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="Branch" ToolTip="Sort By Branch"
                                                            OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                        <asp:Button ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server" AutoPostBack="true"
                                                                onmouseover="txt_MouseoverTooltip(this)" MaxLength="60"
                                                                OnTextChanged="FunProHeaderSearch"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblgvLocation" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--  for Exchange Currency--%>
                                <asp:TemplateField HeaderText="Exchange Currency">
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnSort3" runat="server" Text="Exchange Currency" ToolTip="Sort By Exchange Currency"
                                                            OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                        <asp:Button ID="imgbtnSort3" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" runat="server" AutoPostBack="true"
                                                                onmouseover="txt_MouseoverTooltip(this)" MaxLength="60" OnTextChanged="FunProHeaderSearch"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblExcCurr" runat="server" Text='<%# Bind("Exch_Cur_Code") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--  for Exchange Currency Value--%>
                                <asp:TemplateField HeaderText="Exchange Currency Value">
                                    <ItemTemplate>
                                        <asp:Label ID="lblExcCurrVal" runat="server" Text='<%# Bind("EXC_Def_Value") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                </asp:TemplateField>
                                <%-- Reference Date --%>
                                <asp:TemplateField HeaderText="Reference Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRefDate" runat="server" Text='<%#Eval("Recorded_Date")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%-- Reference Time --%>
                                <asp:TemplateField HeaderText="Reference Time">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRefTime" runat="server" Text='<%#Eval("Recorded_Time")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%-- Active Status --%>
                                <%--<asp:TemplateField HeaderText="Active">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkIsActive" Enabled = "false" runat  ="server" Checked ='<%# Bind("Is_Active") %>' />
                                        <asp:Label ID="lblActive" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>--%>
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
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <span runat="server" id="lblErrorMessage" style="color: Red; font-size: medium"></span>
                        <%--<asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatory"></asp:Label--%>
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
                <%-- <div class="row" style="float: right; margin-top: 5px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnCreate" OnClick="btnCreate_Click" CssClass="save_btn fa fa-floppy-o" AccessKey="C" ToolTip="Create,Alt+C"
                            CausesValidation="false" Text="Create" runat="server"></asp:Button>

                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnShowAll" OnClick="btnShowAll_Click" runat="server" Text="Show All" AccessKey="H" ToolTip="Show All,Alt+H"
                            CssClass="save_btn fa fa-floppy-o" />
                    </div>
                </div>--%>
                <input type="hidden" id="hdnSortDirection" runat="server" />
                <input type="hidden" id="hdnSortExpression" runat="server" />
                <input type="hidden" id="hdnSearch" runat="server" />
                <input type="hidden" id="hdnOrderBy" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
