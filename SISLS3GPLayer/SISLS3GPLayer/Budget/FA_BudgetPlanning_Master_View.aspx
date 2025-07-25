<%@ Page Title="" Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="FA_BudgetPlanning_Master_View.aspx.cs" Inherits="FA_BudgetPlanning_Master_View" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="PnlDimensionmaster" runat="server">
        <ContentTemplate>
            <div class="tab-pane fade in active show" id="tab1">
                <div class="row">
                    <div class="col">
                        <div class="row title_header">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleInfoLabel"
                                    ForeColor="Black" Text="Budget Planning Master - View">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <asp:GridView runat="server" ID="grvBudgetPlanningMasterView" Width="100%" AutoGenerateColumns="false"
                                HeaderStyle-CssClass="styleGridHeader" class="gird_details" EmptyDataText="No Records found"
                                RowStyle-HorizontalAlign="Left" ShowHeaderWhenEmpty="true" OnRowCommand="grvViewBudgetMaster_RowCommand">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <HeaderTemplate>
                                            <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnQuery" ToolTip="Query" ImageUrl="~/Images/spacer.gif"
                                                CssClass="styleGridQuery" CommandArgument='<%#Eval("ID") %>'
                                                CommandName="Query" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="center" HeaderStyle-Width="8%">
                                        <HeaderTemplate>
                                            <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ToolTip="Modify"
                                                Enabled='<%# Eval("IS_LOCK").ToString() == "0" ? true : false %>' ImageUrl="~/Images/spacer.gif" CommandArgument='<%#Eval("ID") %>'
                                                CommandName="Modify" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Financial Year" ItemStyle-HorizontalAlign="Left"
                                        SortExpression="FinancialYear" HeaderStyle-CssClass="stylegridheader" HeaderStyle-Width="20%">
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <thead>
                                                    <tr align="center">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <asp:LinkButton ID="lnkbtnItemHeader" OnClick="FunProSortingColumn" CssClass="styleGridHeaderLinkBtn"
                                                                runat="server" ToolTip="Sort By Financial Year" Text="Financial Year"></asp:LinkButton>
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
                                            <asp:Label runat="server" ID="lblItemHeader" Text='<%#Eval("FIN_YEAR") %>'></asp:Label>&nbsp;
                                            <i class="fa fa-lock" runat="server" visible='<%# Eval("IS_LOCK").ToString() == "1" ? true : false %>' aria-hidden="true"></i>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Gl Account" HeaderStyle-CssClass="stylegridheader">
                                        <HeaderTemplate>
                                            <label>GL Account</label>
                                            <div class="md-input" style="margin: 0px;margin-top: 2px; max-width:250px;">
                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderGLSearch" MaxLength="50"  Max-Width="250px" runat="server"
                                                    CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                            
                                                 <cc1:FilteredTextBoxExtender ID="filteredtextboxextender1" runat="server" TargetControlID="txtHeaderGLSearch"
                                                                FilterType="uppercaseletters, lowercaseletters,custom,numbers" ValidChars=" " Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblGlAccount" Text='<%#Eval("GL_ACCOUNT") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Activity" HeaderStyle-CssClass="stylegridheader">
                                         <HeaderTemplate>
                                            <label>Activity</label>
                                            <div class="md-input" style="margin: 0px; margin-top: 2px; max-width:250px;">
                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderActivitySearch" MaxLength="50" runat="server"
                                                    CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblpattern" Text='<%#Eval("Activity") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="stylegridheader" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>

                                            <h6><i class="fa fa-toggle-on text-success" runat="server" visible='<%# Eval("STATUS").ToString() == "1" ? true : false %>' aria-hidden="true"></i></h6>
                                            <h6><i class="fa fa-toggle-off text-success" runat="server" visible='<%# Eval("STATUS").ToString() == "0" ? true : false %>' aria-hidden="true"></i></h6>
                                            <%--<asp:Label runat="server" ID="lblStatus" Text='<%#Eval("BUDGET") %>' ></asp:Label>--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>

                            <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                        </div>
                    </div>

                </div>


                <%--                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                    </div>
                </div>--%>
                <div align="right" class="fixed_btn">

                    <%--  <button class="css_btn_enabled" runat="server" id="btnCreate" AutoPostBack="true" onserverclick="onCreateNew" 
                        type="button" accesskey="C">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>--%>
                    <button class="css_btn_enabled" id="btnShow" onserverclick="btnShow_Click" runat="server"
                        type="button" accesskey="H" title="Show All,Alt+H">

                        <i class="fa fa-eye" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                    </button>

                    <button class="css_btn_enabled" id="btnCreate"
                        onserverclick="btnCreate_ServerClick" runat="server"
                        type="button" causesvalidation="false" accesskey="C" title="Create,Alt+C">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>C</u>reate
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
            </div>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


