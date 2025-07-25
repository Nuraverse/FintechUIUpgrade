<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_S3G_SysAdminDocumentNumberControl_View, App_Web_xht0hlsp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading"></asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="gird">

                    <asp:GridView ID="gvDNC" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="Doc_Number_Seq_ID" OnDataBound="gvDNC_DataBound" OnRowDataBound="gvDNC_RowDataBound"
                        OnRowCommand="gvDNC_RowCommand" class="gird_details">
                        <Columns>
                            <asp:TemplateField Visible="False" HeaderStyle-CssClass="styleGridHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblDNCID" runat="server" Text='<%# Eval("Doc_Number_Seq_ID") %>' />
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleGridHeader" />
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderStyle CssClass="styleGridHeader" />
                                <HeaderTemplate>
                                    <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                        CommandArgument='<%# Bind("Doc_Number_Seq_ID") %>' CommandName="Query" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Modify">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnModify" runat="server" ImageUrl="~/Images/spacer.gif"
                                        CssClass="styleGridEdit" CommandArgument='<%# Bind("Doc_Number_Seq_ID") %>' CommandName="Modify" />
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <asp:Label ID="lblModify" runat="server" Text="Modify"></asp:Label>
                                </HeaderTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Line Of Business" SortExpression="LOB">
                                <ItemTemplate>
                                    <asp:Label ID="lblLOB" runat="server" Text='<%# Bind("LOB") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnLOB" OnClick="FunProSortingColumn" runat="server" Text="LOB"></asp:LinkButton>
                                                    <asp:Button ID="imgbtnLOB" runat="server" CssClass="styleImageSortingAsc"
                                                        ImageAlign="Middle" />
                                                </th>
                                            </tr>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" AutoPostBack="true" class="md-form-control form-control login_form_content_input"
                                                            OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftetxtHeaderSearch1" runat="server" TargetControlID="txtHeaderSearch1"
                                                            ValidChars="- " FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                                            Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Location" SortExpression="Location">
                                <ItemTemplate>
                                    <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton OnClick="FunProSortingColumn" ID="lnkbtnRegionCode" runat="server"
                                                        Text="Location"></asp:LinkButton>
                                                    <asp:Button ID="imgbtnRegionCode" CssClass="styleImageSortingAsc" runat="server"
                                                        ImageAlign="Middle" />
                                                </th>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox ID="txtHeaderSearch2" runat="server" AutoCompleteType="None" AutoPostBack="true" class="md-form-control form-control login_form_content_input"
                                                                OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtHeaderSearch2" runat="server" TargetControlID="txtHeaderSearch2"
                                                                ValidChars="" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom" Enabled="True">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Document" SortExpression="LOB">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescs" runat="server" Text='<%# Bind("DESCS") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnUser" OnClick="FunProSortingColumn" runat="server" Text="Document"
                                                        CssClass="styleGridHeaderLinkBtn"></asp:LinkButton>
                                                    <asp:Button CssClass="styleImageSortingAsc" ID="imgbtnUser" runat="server"
                                                        ImageAlign="Middle" />
                                                </th>
                                                <tr align="left">
                                                    <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:TextBox ID="txtHeaderSearch3" runat="server" AutoCompleteType="None" AutoPostBack="true" class="md-form-control form-control login_form_content_input"
                                                                OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtHeaderSearch3" runat="server" TargetControlID="txtHeaderSearch3"
                                                                ValidChars="- " FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom" Enabled="True">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Financial Year">
                                <ItemTemplate>
                                    <asp:Label ID="lblFinYear" runat="server" Text='<%# Bind("Fin_Year") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Batch">
                                <ItemTemplate>
                                    <asp:Label ID="lblBatch" runat="server" Text='<%# Bind("Batch") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Level">
                                <ItemTemplate>
                                    <asp:Label ID="lblLevel" runat="server" Text='<%# Bind("Level") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="From Number">
                                <ItemTemplate>
                                    <asp:Label ID="lblFromNo" runat="server" Text='<%# Bind("From_Number") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="To Number">
                                <ItemTemplate>
                                    <asp:Label ID="lblToNo" runat="server" Text='<%# Bind("To_Number") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Used Number">
                                <ItemTemplate>
                                    <asp:Label ID="lblLastUsedNo" runat="server" Text='<%# Bind("Last_Used_Number") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active" HeaderStyle-CssClass="styleGridHeader">
                                <ItemTemplate>
                                    <asp:CheckBox Enabled="false" runat="server" ID="CbxDNCActive"  />
                                    <asp:Label ID="lblDNCActive" Visible="false" runat="server" Text='<%# Bind("Is_Active")%>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By")%>'></asp:Label>
                                    <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID")%>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>

                    <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                </div>

                <%--     <div class="row" style="float: right; margin-top: 5px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnCreate" runat="server" CausesValidation="False" CssClass="save_btn fa fa-floppy-o" ToolTip="Create, Alt+C" AccessKey="C"
                            Text="Create" OnClick="btnCreate_Click" />

                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnShowAll" runat="server" Text="Show All" CssClass="save_btn fa fa-floppy-o" ToolTip="Show All, Alt+H" AccessKey="H"
                            OnClick="btnShowAll_Click" />
                    </div>
                </div>--%>

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
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel" Style="color: Red; font-size: medium"></asp:Label>

                        <input type="hidden" id="hdnSortDirection" runat="server" />
                        <input type="hidden" id="hdnSortExpression" runat="server" />
                        <input type="hidden" id="hdnSearch" runat="server" />
                        <input type="hidden" id="hdnOrderBy" runat="server" />
                    </div>
                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
