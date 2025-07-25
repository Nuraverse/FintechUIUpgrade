<%@ Page Title="" Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true" CodeFile="BUD_FormulaMaster_View.aspx.cs" Inherits="Budget_BUD_FormulaMaster_View" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="PnlDimensionmaster" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" ToolTip="Formula Master" Text="Formula Master">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                        <asp:GridView runat="server" ID="grvFormulaMaster" OnRowDataBound="grvFormulaMaster_RowDataBound"
                            Width="100%" AutoGenerateColumns="false" CssClass="gird_details" OnRowCommand="grvFormulaMaster_RowCommand"
                            RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnQuery" ToolTip="Query" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                            CommandArgument='<%# Bind("FORMULAMASTER_ID") %>' CommandName="Query" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="8%">
                                    <HeaderTemplate>
                                        <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ToolTip="Modify" ImageUrl="~/Images/spacer.gif"
                                            CommandArgument='<%# Bind("FORMULAMASTER_ID") %>' CommandName="Modify" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Item Header" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="10%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblItemHeader" runat="server" ToolTip="Item Header" Text='<%# Bind("ItemHeader") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Account Nature" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="10%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAccNature" runat="server" ToolTip="Account Nature" Text='<%# Bind("AccountNature") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Formula Type" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-CssClass="styleGridHeader" HeaderStyle-Width="10%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFormulaType" runat="server" ToolTip="Formula Type" Text='<%# Bind("FORMULA_TYPE") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Subline Item" ItemStyle-HorizontalAlign="left"
                                    SortExpression="SUBLINEITEM" HeaderStyle-CssClass="stylegridheader" HeaderStyle-Width="20%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSublineItem" runat="server" ToolTip="Subline Item" Text='<%# Bind("SUBLINEITEM") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="stylegridheader"></HeaderStyle>
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr align="center">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <asp:LinkButton ID="lnkbtnSubline" OnClick="FunProSortingColumn" CssClass="styleGridHeaderLinkBtn"
                                                            runat="server" ToolTip="Sort By Branch" Text="Subline Item"></asp:LinkButton>
                                                        <asp:Button ID="imgbtnSubline" runat="server" CssClass="styleImageSortingAsc"
                                                            ImageAlign="Middle" />
                                                    </th>
                                                </tr>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox AutoCompleteType="none" ID="txtheadersearch" MaxLength="50" onkeypress="fncheckspecialchars(true);"
                                                                runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"
                                                                class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="filteredtextboxextender1" runat="server" TargetControlID="txtheadersearch"
                                                                FilterType="uppercaseletters, lowercaseletters,custom,numbers" ValidChars=" " Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </HeaderTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="stylegridheader">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblStatus" Text='<%#Eval("STATUS") %>' ToolTip="Status" Visible="false"></asp:Label>
                                        <asp:CheckBox runat="server" ID="chkbxStatus" Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Created By" HeaderStyle-CssClass="stylegridheader">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblCreatedBy" Text='<%#Eval("CREATED_BY") %>' ToolTip="Created By"></asp:Label>
                                    </ItemTemplate>
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
                <div align="right" class="fixed_btn">

                    <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_ServerClick" runat="server"
                        type="button" accesskey="C" title="Create,Alt+C">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>
                    <button class="css_btn_enabled" id="btnShow" onserverclick="btnShow_Click" runat="server"
                        type="button" accesskey="H" title="Show All,Alt+H">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                    </button>
                </div>
                <%-- <div class="row" style="float: right; margin-top: 5px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnCreate" OnClick="btnSave_Click" CssClass="save_btn fa fa-floppy-o" AccessKey="C" ToolTip="Create,Alt+C"
                            CausesValidation="false" Text="Create" runat="server"></asp:Button>

                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnShow" OnClick="btnShow_Click" runat="server" Text="Show All" AccessKey="H" ToolTip="Show All,Alt+H"
                            CssClass="save_btn fa fa-floppy-o" />
                    </div>
            </div>--%>
                <input type="hidden" id="hdnSortDirection" runat="server" />
                <input type="hidden" id="hdnSortExpression" runat="server" />
                <input type="hidden" id="hdnSearch" runat="server" />
                <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

