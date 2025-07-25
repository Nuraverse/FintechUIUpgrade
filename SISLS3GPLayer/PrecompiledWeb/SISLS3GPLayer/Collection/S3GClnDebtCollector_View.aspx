<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnDebtCollector_View, App_Web_x5tdsxrh" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleInfoLabel"> </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="gird">
                    <asp:GridView ID="grvDebtCollectorPaging" runat="server" AutoGenerateColumns="False"
                        Width="100%" OnRowCommand="grvDebtCollectorPaging_RowCommand" OnRowDataBound="grvDebtCollectorPaging_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Query" SortExpression="ID" Visible="true" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                        AlternateText="Query" CommandArgument='<%# Bind("ID") %>' runat="server" CommandName="Query" />
                                </ItemTemplate>

                                <HeaderTemplate>
                                    <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Modify" SortExpression="ID" Visible="true" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnEdit" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                        AlternateText="Modify" CommandArgument='<%# Bind("ID") %>' runat="server" CommandName="Modify" />
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <asp:Label ID="lblModify" runat="server" Text="Modify"></asp:Label>
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Line of Business">
                                <ItemTemplate>
                                    <asp:Label ID="lblLOB" runat="server" Text='<%# Bind("LOB") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" align="center">
                                        <tr align="center">
                                            <%--<th style="padding: 0px !important; background: none !important;">--%>
                                            <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="Line of Business" ToolTip="Sort By Line of Business"
                                                OnClick="FunProSortingColumn"> </asp:LinkButton>
                                            <asp:Button ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                            <%--</th>--%>
                                        </tr>
                                        <tr align="left">
                                            <th style="padding: 0px !important; background: none !important;">
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server" AutoPostBack="true"
                                                        OnTextChanged="FunProHeaderSearch" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="filterLOB" runat="server" TargetControlID="txtHeaderSearch2"
                                                        FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True" ValidChars="- " />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </th>
                                        </tr>
                                    </table>
                                </HeaderTemplate>
                                <HeaderStyle Width="20%" />
                                <ItemStyle Width="20%" />
                            </asp:TemplateField>
                            <%-- <asp:TemplateField HeaderText="Region">
                            <ItemTemplate>
                                <asp:Label ID="lblRegion" runat="server" Text='<%# Bind("Region") %>'></asp:Label>
                            </ItemTemplate>
                               <HeaderTemplate>
                                <table cellpadding="0" cellspacing="0" border="0">
                                    <tr align="center">
                                        <td>
                                            <asp:LinkButton ID="lnkbtnSort3" runat="server" Text="Region" ToolTip="Sort By Region"
                                                CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                            <asp:ImageButton ID="imgbtnSort3" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" runat="server" AutoPostBack="true"
                                                OnTextChanged="FunProHeaderSearch" CssClass="styleSearchBox"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="filterRegion" runat="server" TargetControlID="txtHeaderSearch3"
                                                   FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True" ValidChars="- " />
                                        </td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            
                        </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Branch">
                                <ItemTemplate>
                                    <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                </ItemTemplate>

                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" align="center">
                                      <%--  <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort3" OnClick="FunProSortingColumn"
                                                        runat="server" ToolTip="Sort By Branch" Text="Branch" Style="text-decoration: none;"></asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort3" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" runat="server" AutoPostBack="true" ToolTip="Branch"
                                                            class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch" MaxLength="4"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtHeaderSearch3"
                                                            FilterType="UppercaseLetters, LowercaseLetters, Numbers" Enabled="True" ValidChars=" ">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>--%>
                                         <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort3" runat="server" Text="Branch" ToolTip="Sort By Branch"
                                                        OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort3" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                   <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" runat="server" AutoPostBack="true"
                                                            OnTextChanged="FunProHeaderSearch" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="filterBranch" runat="server" TargetControlID="txtHeaderSearch3"
                                                            FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True" ValidChars="- " />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <HeaderStyle Width="20%" />
                                <ItemStyle Width="20%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Debt Collector Code">
                                <ItemTemplate>
                                    <asp:Label ID="lblDCCode" runat="server" Text='<%# Bind("DebtCollector_Code") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" align="center">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="Debt Collector Code" ToolTip="Sort By DebtCollector Code"
                                                        OnClick="FunProSortingColumn" Style="text-decoration: none;">
                                                    </asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>

                                                <%--  <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="Debt Collector Code" ToolTip="Sort By DebtCollector Code"
                                                        CssClass="" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>--%>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" AutoPostBack="true"
                                                            OnTextChanged="FunProHeaderSearch"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="filterDCCode" runat="server" TargetControlID="txtHeaderSearch1"
                                                            FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True" ValidChars="/- " />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <HeaderStyle Width="20%" />
                                <ItemStyle Width="20%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Debt Collector Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblDCName" runat="server" Text='<%# Bind("DCName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20%" />
                                <ItemStyle Width="20%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Debt Collector Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblDCType" runat="server" Text='<%# Bind("EmpTp") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20%" />
                                <ItemStyle Width="20%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkIsActive" Enabled="false" runat="server" />
                                    <asp:Label ID="lblActive" runat="server" Visible="false" Text='<%# Eval("Is_Active") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
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
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:CustomValidator ID="cvErrormsg" runat="server">
                
                </asp:CustomValidator>
                <%--<asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatory"></asp:Label--%>
            </div>
        </div>
        <div align="right">
            <button id="btnCreate" runat="server" class="css_btn_enabled" onserverclick="btnCreate_Click" causesvalidation="false" accesskey="C" title="Create[Alt+C]"
                type="button">
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
</asp:Content>
