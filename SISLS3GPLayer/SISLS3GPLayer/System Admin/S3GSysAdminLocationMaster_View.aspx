<%@ Page Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="S3GSysAdminLocationMaster_View.aspx.cs" Inherits="System_Admin_S3GSysAdminLocationMaster_View"
    Title="S3G - Location Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="upLocationMaster" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="" ID="lblHeading"> </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <cc1:TabContainer ID="tcLocation" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                            Width="100%" ScrollBars="None" TabStripPlacement="top" AutoPostBack="True" OnActiveTabChanged="tcLocation_ActiveTabChanged">
                            <%-- --%>
                            <cc1:TabPanel runat="server" ID="tpLocationDef" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Branch Definition &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <%--<asp:UpdatePanel ID="upLocationDef" runat="server">
                                            <ContentTemplate>--%>
                                    <cc1:TabContainer ID="tcLocationDef" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                                        ScrollBars="Auto" AutoPostBack="True" OnActiveTabChanged="tcLocationDef_ActiveTabChanged">
                                    </cc1:TabContainer>
                                    <div class="gird">
                                        <asp:GridView ID="gvLocationDef" runat="server" AutoGenerateColumns="False" ToolTip="Branch Definition"
                                            Width="100%" OnRowCommand="gvLocationDef_RowCommand" OnRowDataBound="gvLocationDef_RowDataBound" class="gird_details">
                                            <%--OnRowDataBound="grvAssetCategoryCodes_RowDataBound"--%>
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                            AlternateText="Query" runat="server" CommandName="Query" CommandArgument='<%# Bind("Location_Category_ID") %>' />
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                                    </HeaderTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Modify" SortExpression="Location_Category_ID">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgbtnEdit" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                                            AlternateText="Modify" runat="server" CommandName="Modify" CommandArgument='<%# Bind("Location_Category_ID") %>' />
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblModify" runat="server" Text="Modify"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Branch Code" SortExpression="Location_Code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocationCode" runat="server" Text='<%# Bind("Location_Code") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        <table cellpadding="0" cellspacing="0" border="0">
                                                            <thead>
                                                                <tr align="center">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <asp:LinkButton ID="lnkbtnSort1" runat="server" ToolTip="Sort By Branch Code" Text="Branch Code"
                                                                            OnClick="FunProSortingColumn">
                                                                        </asp:LinkButton>
                                                                        <asp:Button ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                    </th>
                                                                </tr>
                                                                <tr align="left">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" AutoPostBack="true"
                                                                                class="md-form-control form-control login_form_content_input" MaxLength="50" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtHeaderSearch1"
                                                                                FilterType="Custom, UppercaseLetters, LowercaseLetters, Numbers" Enabled="True"
                                                                                ValidChars=" ">
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
                                                <asp:TemplateField HeaderText="Branch Description" SortExpression="LocationCat_Description">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocationDesc" runat="server" Text='<%# Bind("LocationCat_Description") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        <table cellpadding="0" cellspacing="0" border="0">
                                                            <thead>
                                                                <tr align="center">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="Branch Description" ToolTip="Sort By Branch Description"
                                                                            OnClick="FunProSortingColumn">
                                                                        </asp:LinkButton>
                                                                        <asp:Button ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                    </th>
                                                                </tr>
                                                                <tr align="left">
                                                                    <th style="padding: 0px !important; background: none !important;">
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server" AutoPostBack="true"
                                                                                class="md-form-control form-control login_form_content_input" MaxLength="50" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtHeaderSearch2"
                                                                                FilterType="Custom, UppercaseLetters, LowercaseLetters, Numbers" ValidChars=" "
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
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Hierarchy Description" SortExpression="Location_Description">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblHierarchyDesc" runat="server" Text="Hierarchy Description"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblHierarchyDescription" runat="server" Text='<%# Bind("Location_Description") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Active">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblActive" runat="server" Text="Active"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <%--<asp:CheckBox ID="lblIsActive" runat="server" Text='<%# Bind("Is_Active") %>' />--%>
                                                        <asp:CheckBox ID="chkActive" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Is_Active")))%>' runat="server" Enabled="false" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--<asp:CheckBoxField HeaderText="Active" DataField="Is_Active" />--%>

                                                <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By")%>'></asp:Label>
                                                        <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                    <%-- </ContentTemplate>
                                        </asp:UpdatePanel>--%>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="tpLocationMap" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Branch Mapping &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="upLocationMap" runat="server">
                                        <ContentTemplate>
                                            <div class="gird">
                                                <asp:GridView ID="gvLocationMapping" runat="server" AutoGenerateColumns="False" Width="100%"
                                                    OnRowCommand="gvLocationMapping_RowCommand" OnRowDataBound="gvLocationDef_RowDataBound" class="gird_details">
                                                    <%-- OnRowDataBound="grvAssetCategoryCodes_RowDataBound"--%>
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                                    AlternateText="Query" runat="server" CommandName="Query" CommandArgument='<%# Bind("Location_ID") %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Modify" SortExpression="Location_ID">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lblModify" runat="server" Text="Modify"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imgbtnEdit" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                                                    AlternateText="Modify" runat="server" CommandName="Modify" CommandArgument='<%# Bind("Location_ID") %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Branch Code" SortExpression="Location_Code">
                                                            <HeaderTemplate>
                                                                <table cellpadding="0" cellspacing="0" border="0">
                                                                    <thead>
                                                                        <tr align="center">
                                                                            <th style="padding: 0px !important; background: none !important;">
                                                                                <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="Branch Code"
                                                                                    ToolTip="Sort By Branch Code" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                                                <asp:Button ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                            </th>
                                                                        </tr>
                                                                        <tr align="left">
                                                                            <th style="padding: 0px !important; background: none !important;">
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" OnTextChanged="FunProHeaderSearch"
                                                                                        runat="server" AutoPostBack="true" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="txtExtHeaderSearch1" runat="server" TargetControlID="txtHeaderSearch1"
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
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLocationCode" runat="server" Text='<%# Bind("Location_Code") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Branch Description" SortExpression="Location">
                                                            <HeaderTemplate>
                                                                <table cellpadding="0" cellspacing="0" border="0">
                                                                    <thead>
                                                                        <tr align="center">
                                                                            <th style="padding: 0px !important; background: none !important;">
                                                                                <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="Branch Description"
                                                                                    ToolTip="Sort By Branch Description" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                                                <asp:Button ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                            </th>
                                                                        </tr>
                                                                        <tr align="left">
                                                                            <th style="padding: 0px !important; background: none !important;">
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" OnTextChanged="FunProHeaderSearch"
                                                                                        runat="server" AutoPostBack="true" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="txtExtHeaderSearch2" runat="server" TargetControlID="txtHeaderSearch2"
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
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Active">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lblActve" runat="server" Text="Active"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkActive" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Is_Active")))%>' runat="server" Enabled="false" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <%--Code added by saran on 13-Jan-2012 for Operational Location start--%>
                                                        <asp:TemplateField HeaderText="Operational">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lblIs_Operational" runat="server" Text="Operational"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkIs_Operational" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Is_Operational")))%>' runat="server"
                                                                    Enabled="false" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <%--Code added by saran on 13-Jan-2012 for Operational Location end--%>
                                                        <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By")%>'></asp:Label>
                                                                <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
                    </div>
                </div>

                <%--<div class="row" style="float: right; margin-top: 5px;">

                    <div class="row">
                        <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12">
                            <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                            <asp:Button ID="btnCreate" CausesValidation="false" OnClick="btnCreate_Click" CssClass="save_btn fa fa-floppy-o"
                                Text="Create" runat="server" Visible="true" ToolTip="Create, Alt+C" AccessKey="C"></asp:Button>
                        </div>
                        <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12">
                            <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                            <asp:Button ID="btnShowAll" runat="server" Text="Show All" OnClick="btnShowAll_Click" ToolTip="Show All, Alt+H" AccessKey="H"
                                CssClass="save_btn fa fa-floppy-o" Visible="true" />
                        </div>
                    </div>
                </div>--%>

                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server"
                        type="button" accesskey="C" title="Create, Alt+C">
                        <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>
                    <button class="css_btn_enabled" id="btnShowAll" onserverclick="btnShowAll_Click" runat="server"
                        type="button" accesskey="H" title="Show All, Alt+H">
                        <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                    </button>

                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:CustomValidator ID="cvLocation" runat="server"></asp:CustomValidator>
                        <input type="hidden" id="hdnSortDirection" runat="server" />
                        <input type="hidden" id="hdnSortExpression" runat="server" />
                        <input type="hidden" id="hdnSearch" runat="server" />
                        <input type="hidden" id="hdnOrderBy" runat="server" />
                        <input type="hidden" id="hdnHierarc" runat="server" />
                    </div>
                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
