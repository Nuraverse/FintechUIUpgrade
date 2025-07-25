<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="FA_Budget_File_Upload_View, App_Web_rj0nx3uf" %>

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
                                    ForeColor="Black" Text="Budget File Upload - View">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <asp:GridView runat="server" ID="grvBudgetFileUploadView" Width="100%" AutoGenerateColumns="false"
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
                                  
                                    <asp:TemplateField HeaderText="Financial Year" ItemStyle-HorizontalAlign="Left"
                                        SortExpression="FinancialYear" HeaderStyle-CssClass="stylegridheader" HeaderStyle-Width="20%">
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <thead>
                                                    <tr align="center">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <asp:LinkButton ID="lnkbtnItemHeader" OnClick="FunProSortingColumn" CssClass="styleGridHeaderLinkBtn"
                                                                runat="server" ToolTip="Sort By Financial Year" Text="Financial Year"></asp:LinkButton>
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
                                           
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Item Header" HeaderStyle-HorizontalAlign="Left" HeaderStyle-CssClass="">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblAccNature" Text='<%#Eval("ITEM_HEADER") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Account Nature" HeaderStyle-CssClass="stylegridheader" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblStatus" Text='<%#Eval("ACCOUNT_NATURE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Activity" HeaderStyle-CssClass="stylegridheader">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblGlAccount" Text='<%#Eval("ACTIVITY") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                               <%--     <asp:TemplateField HeaderText="Upload Status" HeaderStyle-CssClass="stylegridheader">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblpattern" Text='<%#Eval("UPLOAD_STATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>

                                </Columns>
                            </asp:GridView>

                            <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                        </div>
                    </div>

                </div>

                <div align="right" class="fixed_btn">

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

            </div>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


