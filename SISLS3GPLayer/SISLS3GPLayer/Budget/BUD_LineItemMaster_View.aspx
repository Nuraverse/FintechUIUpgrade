<%@ Page Title="" Language="C#" MasterPageFile="~/Common/FAMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="BUD_LineItemMaster_View.aspx.cs" Inherits="Budget_BUD_LineItemMaster_View" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="PnlViewLineItem" runat="server">
        <ContentTemplate>
            <div class="tab-pane fade in active show" id="tab1">
                <div class="row">
                    <div class="col">
                        <div class="row title_header">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleInfoLabel"
                                    ForeColor="Black" Text="Budget Line Item Master - View">
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
                                RowStyle-HorizontalAlign="Left" ShowHeaderWhenEmpty="true" OnRowCommand="grvViewLineItems_RowCommand"
                                OnRowDataBound="grvViewLineItems_RowDataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <HeaderTemplate>
                                            <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnQuery" ToolTip="Query" ImageUrl="~/Images/spacer.gif"
                                                CssClass="styleGridQuery" CommandArgument='<%#Eval("LINEITEM_MSTRID") %>'
                                                CommandName="Query" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="8%">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ToolTip="Modify"
                                                ImageUrl="~/Images/spacer.gif" CommandArgument='<%#Eval("LINEITEM_MSTRID") %>'
                                                CommandName="Modify" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Item Header" 
                                        SortExpression="ItemHeader" HeaderStyle-CssClass="stylegridheader" HeaderStyle-Width="30%">
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <thead>
                                                    <tr align="center">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <asp:LinkButton ID="lnkbtnItemHeader" OnClick="FunProSortingColumn" CssClass="styleGridHeaderLinkBtn"
                                                                runat="server" ToolTip="Sort By ItemHeader" Text="ItemHeader"></asp:LinkButton>
                                                            <%-- <asp:ImageButton ID="imgbtnItemHeader" runat="server" CssClass="styleImageSortingAsc"
                                                            ImageAlign="Middle" />--%>
                                                        </th>
                                                    </tr>

                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch" MaxLength="50" runat="server"
                                                                CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="filteredtextboxextender" runat="server" TargetControlID="txtheadersearch"
                                                                FilterType="uppercaseletters, lowercaseletters,custom,numbers" ValidChars=" " Enabled="true">
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
                                            <asp:Label runat="server" ID="lblItemHeader" Text='<%#Eval("ItemHeader") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Account Nature" HeaderStyle-CssClass="stylegridheader">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblAccNature" Text='<%#Eval("AccNature") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="stylegridheader">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblStatus" Text='<%#Eval("Status") %>' Visible="false"></asp:Label>
                                            <asp:CheckBox runat="server" ID="chkbxStatus" Enabled="false" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Created By" HeaderStyle-CssClass="stylegridheader">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblCreatedBy" Text='<%#Eval("Created_By") %>'></asp:Label>
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
                        type="button" causesvalidation="false" accesskey="A" title="Show All,Alt+A">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;Show <u>A</u>ll
                    </button>
                    <button class="css_btn_enabled" id="btnCreate"
                        onserverclick="btnCreate_ServerClick" runat="server"
                        type="button" causesvalidation="false" accesskey="C" title="Create,Alt+C">
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

