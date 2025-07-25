<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GCln_Marketing_Slab_View, App_Web_ru52obyl" %>

<%@ Register Src="../UserControls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">

                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading"> </asp:Label>
                            </h6>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <asp:GridView ID="grvPaging" runat="server" AutoGenerateColumns="False" OnRowDataBound="grvPaging_RowDataBound" OnRowCommand="grvPaging_RowCommand">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle CssClass="styleGridHeader" />
                                            <HeaderTemplate>
                                                <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                    CommandArgument='<%# Bind("SlabMaster_ID") %>' CommandName="Query" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Modify">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnEdit" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                                    AlternateText="Modify" CommandArgument='<%# Bind("SlabMaster_ID") %>' runat="server"
                                                    CommandName="Modify" />
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <asp:Label ID="lblModify" runat="server" Text="Modify" ></asp:Label>
                                            </HeaderTemplate>
                                        </asp:TemplateField>
                                        <%--  for Location--%>
                                        <asp:TemplateField HeaderText="Branch">
                                            <HeaderTemplate>
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <thead>
                                                        <tr align="center">
                                                            <th style="padding: 0px !important; background: none !important;">
                                                                <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="Branch"
                                                                    OnClick="FunProSortingColumn" ToolTip="Sort by Branch"> </asp:LinkButton>
                                                                <asp:Button ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                            </th>
                                                        </tr>
                                                        <tr align="left">
                                                            <th style="padding: 0px !important; background: none !important;">
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server"
                                                                        AutoPostBack="true" class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                </table>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%-- LOB --%>
                                        <asp:TemplateField HeaderText="Line of Business">
                                            <HeaderTemplate>
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <thead>
                                                        <tr align="center">
                                                            <th style="padding: 0px !important; background: none !important;">
                                                                <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="Line of Business" ToolTip="Sort by Line of Business"
                                                                    OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                                <asp:Button ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                            </th>
                                                        </tr>
                                                        <tr align="left">
                                                            <th style="padding: 0px !important; background: none !important;">
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server"
                                                                        AutoPostBack="true" class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                </table>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblLOB" runat="server" Text='<%# Bind("LOB") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%-- Active Status --%>
                                        <asp:TemplateField HeaderText="Active">
                                            <ItemTemplate>
                                                <%--Modified By Chandrasekar K On 24-Sep-2012--%>
                                                <%--<asp:CheckBox ID="chkIsActive" Enabled = "false" runat="server" Checked ='<%# Bind("Is_Active") %>' />--%>
                                                <asp:CheckBox ID="chkIsActive" Enabled="false" runat="server" Checked='<%# Eval("Is_Active").ToString() == "1" ?  true:false %>' />
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <asp:Label ID="lblActive" runat="server" Text="Active" ></asp:Label>
                                            </HeaderTemplate>
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
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
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div>
                                <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div>
                                <span runat="server" id="lblErrorMessage" style="color: Red; font-size: medium"></span>
                            </div>
                        </div>
                    </div>

                    <div align="right" class="fixed_btn">
                        <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server" title="Create[Alt+C]"
                            type="button" accesskey="C" tooltip="Create the Details, Alt+C">
                            <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>C</u>reate
                        </button>
                        <button class="css_btn_enabled" id="btnShowAll" onserverclick="btnShowAll_Click" runat="server" title="Show All[Alt+H]"
                            type="button" accesskey="H" tooltip="Show all the Details, Alt+H">
                            <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                        </button>
                    </div>

                </div>
            </div>

            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

