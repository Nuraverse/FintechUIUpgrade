<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" enableeventvalidation="false" autoeventwireup="true" inherits="Origination_S3GOrgEntityMaster_View, App_Web_hirsyic0" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="" ID="lblHeading"> </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="gird">
                    <asp:GridView ID="grvPaging" runat="server" AutoGenerateColumns="False" Width="100%" class="gird_details"
                        OnRowCommand="grvEntityMaster_RowCommand" OnRowDataBound="grvPaging_RowDataBound">
                        <Columns>
                            <asp:TemplateField SortExpression="ID" Visible="true" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                        AlternateText="Query" CommandArgument='<%# Bind("Entity_ID") %>' runat="server"
                                        CommandName="Query" />
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                </HeaderTemplate>
                                <HeaderStyle CssClass="styleGridHeader" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Modify" SortExpression="ID" Visible="true" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnEdit" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                        AlternateText="Modify" CommandArgument='<%# Bind("Entity_ID") %>' runat="server"
                                        CommandName="Modify" />
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <asp:Label ID="lblModify" runat="server" Text="Modify"></asp:Label>
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Entity Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblEntityType" runat="server" Text='<%# Bind("Entity_Type_Name") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="Entity Type" ToolTip="Sort By Entity type"
                                                        OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort1" runat="server" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" AutoPostBack="true" class="md-form-control form-control login_form_content_input"
                                                            OnTextChanged="FunProHeaderSearch" MaxLength="50"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtHeaderSearch1" ValidChars=" "
                                                            FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom" Enabled="True">
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
                            <asp:TemplateField HeaderText="Entity Code">
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="Entity Code" ToolTip="Sort By Entity code"
                                                        OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server" AutoPostBack="true" class="md-form-control form-control login_form_content_input"
                                                            OnTextChanged="FunProHeaderSearch" MaxLength="12"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>

                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEntityCode" runat="server" Text='<%# Bind("Entity_Code") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Entity Name">
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort3" runat="server" Text="Entity Name" ToolTip="Sort By Entity name"
                                                        OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort3" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" runat="server" AutoPostBack="true" class="md-form-control form-control login_form_content_input"
                                                            OnTextChanged="FunProHeaderSearch" MaxLength="90"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEntityName" runat="server" Text='<%# Bind("Entity_Name") %>'></asp:Label>
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
                            <asp:TemplateField HeaderText="NID/RID/NRID/CR Number">
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort4" runat="server" Text="NID/RID/NRID/CR Number" ToolTip="Sort By CR Number"
                                                        OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort4" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch4" runat="server" AutoPostBack="true" class="md-form-control form-control login_form_content_input"
                                                            OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCR_Number" runat="server" Text='<%# Bind("CR_NUMBER") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="row">
                    <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
                </div>

                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">

                    <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server"
                        type="button" accesskey="C" title="Create, Alt+C">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>
                    <button class="css_btn_enabled" id="btnShowAll" onserverclick="btnShowAll_Click" runat="server"
                        type="button" accesskey="H" title="Show All, Alt+H">
                        <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                    </button>
                </div>

                <div class="row">
                    <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                </div>
            </div>


            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
