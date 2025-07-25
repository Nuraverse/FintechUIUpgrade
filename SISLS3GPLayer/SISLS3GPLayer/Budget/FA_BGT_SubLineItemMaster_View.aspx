<%@ Page Title="" Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true" CodeFile="FA_BGT_SubLineItemMaster_View.aspx.cs" Inherits="Budget_FA_BGT_SubLineItemMaster_View" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="PnlViewSubLineItem" runat="server">
        <ContentTemplate>
            <div class="tab-pane fade in active show" id="tab1">
                <div class="row">
                    <div class="col">
                        <div class="row title_header">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleInfoLabel"
                                   ForeColor="Black"  Text = "Budget Sub Line Item Master - View">
                                </asp:Label> 
                            </h6>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <asp:GridView runat="server" ID="grvViewLineItems" Width="100%" AutoGenerateColumns="false"
                                HeaderStyle-CssClass="styleGridHeader" class="gird_details" EmptyDataText="No Records found"
                                RowStyle-HorizontalAlign="Left" ShowHeaderWhenEmpty="true">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <HeaderTemplate>
                                            <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnQuery" ToolTip="Query" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                CommandName="Query" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="8%">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ToolTip="Modify" ImageUrl="~/Images/spacer.gif"
                                                CommandName="Modify" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Item Header">
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr align="center">
                                                    <td>

                                                        <asp:LinkButton ID="lnkbtnItemHeader" OnClick="FunProSortingColumn" CssClass="styleGridHeaderLinkBtn"
                                                            runat="server" ToolTip="Sort By ItemHeader" Text="ItemHeader"></asp:LinkButton>
                                                        <asp:ImageButton ID="imgbtnItemHeader" runat="server" CssClass="styleImageSortingAsc"
                                                            ImageAlign="Middle" />
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td>
                                                        <asp:TextBox AutoCompleteType="none" ID="txtheadersearch" MaxLength="50" onkeypress="fncheckspecialchars(true);"
                                                            runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"
                                                            CssClass="stylesearchbox"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="filteredtextboxextender" runat="server" TargetControlID="txtheadersearch"
                                                            FilterType="uppercaseletters, lowercaseletters,custom,numbers" ValidChars=" " Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </td>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblItemHeader" Text='<%#Eval("ItemHeader") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Account Nature">
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr align="center">
                                                    <td>
                                                        <asp:LinkButton ID="lnkbtnAccNature" OnClick="FunProSortingColumn" CssClass="styleGridHeaderLinkBtn"
                                                            runat="server" ToolTip="Sort By Account Nature" Text="AccNature"></asp:LinkButton>
                                                        <asp:ImageButton ID="imgbtnAccNature" runat="server" CssClass="styleImageSortingAsc"
                                                            ImageAlign="Middle" />
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td>
                                                        <asp:TextBox AutoCompleteType="none" ID="txtheadersearch1" MaxLength="50" onkeypress="fncheckspecialchars(true);"
                                                            runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"
                                                            CssClass="stylesearchbox"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="filteredtextboxextender1" runat="server" TargetControlID="txtheadersearch1"
                                                            FilterType="uppercaseletters, lowercaseletters,custom,numbers" ValidChars=" " Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </td>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblAccNature" Text='<%#Eval("AccNature") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Line Item">
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr align="center">
                                                    <td>
                                                        <asp:LinkButton ID="lnkbtnLineItem" OnClick="FunProSortingColumn" CssClass="styleGridHeaderLinkBtn"
                                                            runat="server" ToolTip="Sort By Line Item" Text="LineItem"></asp:LinkButton>
                                                        <asp:ImageButton ID="imgbtnLineItem" runat="server" CssClass="styleImageSortingAsc"
                                                            ImageAlign="Middle" />
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td>
                                                        <asp:TextBox AutoCompleteType="none" ID="txtheadersearch2" MaxLength="50" onkeypress="fncheckspecialchars(true);"
                                                            runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"
                                                            CssClass="stylesearchbox"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="filteredtextboxextender2" runat="server" TargetControlID="txtheadersearch2"
                                                            FilterType="uppercaseletters, lowercaseletters,custom,numbers" ValidChars=" " Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </td>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblLineItem" Text='<%#Eval("LineItem") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>

                            <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                        </div>
                    </div>

                </div>
                <div align="right" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <button class="css_btn_enabled" id="btnSearch"
                        onserverclick="btnSearch_ServerClick" runat="server"
                        type="button" causesvalidation="false" accesskey="G" title="Go,Alt+G">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                    <button class="css_btn_enabled" id="btnCreate"
                        onserverclick="btnCreate_ServerClick" runat="server"
                        type="button" causesvalidation="false" accesskey="C" title="Go,Alt+C">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>

                    <%--onclick="if(fnConfirmClear())"--%>
                </div>

            </div>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

