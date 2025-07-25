<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3g_OrgAssetMaster_View, App_Web_w304vrwx" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <div>
                <div id="tab-content" class="tab-content">
                    <div class="tab-pane fade in active show" id="tab1">
                         <h6 class="title_name">
                                        <asp:Label runat="server" Text="" ID="lblHeading"> </asp:Label>
                                    </h6>
                            
            
           <%-- <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>--%>



                <%--  </div>
                                <div class="col-sm-1" align="right" style="padding-top: 13px;">
                                </div>--%>


               
                <div class="row">
                    <cc1:TabContainer ID="tcAsset" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                        Width="100%" ScrollBars="None" TabStripPlacement="top" AutoPostBack="True" OnActiveTabChanged="tcAsset_ActiveTabChanged">
                        <cc1:TabPanel runat="server" HeaderText="Category Code" ID="tbCategory" CssClass="tabpan"
                            BackColor="Red">
                            <HeaderTemplate>
                                Asset Definition &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel21" runat="server">
                                    <ContentTemplate>
                                        <cc1:TabContainer ID="tccategoryCodes" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                                            Width="100%" ScrollBars="Auto" OnActiveTabChanged="tccategoryCodes_ActiveTabChanged"
                                            AutoPostBack="True">
                                            <cc1:TabPanel runat="server" HeaderText="Class" ID="tpAssetclass" CssClass="tabpan"
                                                BackColor="Red">
                                                <HeaderTemplate>
                                                    Class Codes
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel runat="server" HeaderText="Make" ID="tpAssetMake" CssClass="tabpan"
                                                BackColor="Red">
                                                <HeaderTemplate>
                                                    Make Codes
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel runat="server" HeaderText="Type" ID="tpAssetType" CssClass="tabpan"
                                                BackColor="Red">
                                                <HeaderTemplate>
                                                    Type Codes
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel runat="server" HeaderText="Model" ID="tpAssetModel" CssClass="tabpan"
                                                BackColor="Red">
                                                <HeaderTemplate>
                                                    Model Codes
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                        </cc1:TabContainer>
                                        <div class="gird">
                                            <asp:GridView ID="grvAssetCategoryCodes" runat="server" AutoGenerateColumns="False" class="gird_details"
                                                Width="100%" OnRowCommand="grvAssetClassCodes_RowCommand"
                                                OnRowDataBound="grvAssetCategoryCodes_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                                AlternateText="Query" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Asset_Category_ID") %>'
                                                                runat="server" CommandName="Query" ToolTip="Query" />
                                                            <%--<i class="fa fa-trash-o"></i>--%>
                                                        </ItemTemplate>
                                                        <HeaderTemplate>
                                                            <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Modify" SortExpression="ID">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgbtnEdit" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                                                AlternateText="Modify" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Asset_Category_ID")%>'
                                                                runat="server" CommandName="Modify" ToolTip="Modify" />
                                                        </ItemTemplate>
                                                        <HeaderTemplate>
                                                            <asp:Label ID="lblModify" runat="server" Text="Modify"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Class Code" SortExpression="Category_Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblClassCode" runat="server" Text='<%# Bind("Category_Code") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderTemplate>
                                                            <table cellpadding="0" cellspacing="0" border="0">
                                                                <thead>
                                                                    <tr align="center">
                                                                        <th style="padding: 0px !important; background: none !important;">
                                                                            <asp:LinkButton ID="lnkbtnSort1" runat="server" ToolTip="Sort By Code" Text="Code"
                                                                                OnClick="FunProSortingColumn" Style="text-decoration: none;">
                                                                            </asp:LinkButton>
                                                                            <asp:Button ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />

                                                                        </th>
                                                                    </tr>
                                                                    <tr align="left">
                                                                        <th style="padding: 0px !important; background: none !important;">
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" AutoPostBack="true" ToolTip="Asset Code"
                                                                                    class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch" MaxLength="4"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtHeaderSearch1"
                                                                                    FilterType="UppercaseLetters, LowercaseLetters, Numbers" Enabled="True" ValidChars=" ">
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
                                                    <asp:TemplateField HeaderText="Description" SortExpression="Category_Description">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblClassDesc" runat="server" Text='<%# Bind("Category_Description") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderTemplate>
                                                            <table cellpadding="0" cellspacing="0" border="0">
                                                                <thead>
                                                                    <tr align="center">
                                                                        <th style="padding: 0px !important; background: none !important;">
                                                                            <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="Category Description" ToolTip="Sort By Description"
                                                                                OnClick="FunProSortingColumn" Style="text-decoration: none;">
                                                                            </asp:LinkButton>
                                                                            <asp:Button ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                        </th>
                                                                    </tr>
                                                                    <tr align="left">
                                                                        <th style="padding: 0px !important; background: none !important;">
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server" AutoPostBack="true" ToolTip="Asset Code Description"
                                                                                    class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch" MaxLength="50"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtHeaderSearch2"
                                                                                    FilterType="Custom, UppercaseLetters, LowercaseLetters, Numbers" Enabled="True" ValidChars=" ">
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
                                                    <asp:TemplateField Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUserID" runat="server" Text='<%#Eval("Created_By")%>'></asp:Label>
                                                            <asp:Label ID="lblUserLevelID" runat="server" Text='<%#Eval("User_Level_ID")%>'></asp:Label>
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
                        <cc1:TabPanel runat="server" HeaderText="Asset Code" ID="tpAssetCode" CssClass="tabpan"
                            BackColor="Red">
                            <HeaderTemplate>
                                Asset Mapping &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="gird">
                                            <asp:GridView ID="grvAssetMaster" runat="server" AutoGenerateColumns="False" Width="100%"
                                                OnRowCommand="grvAssetMaster_RowCommand" OnRowDataBound="grvAssetCategoryCodes_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                        <HeaderTemplate>
                                                            <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                                AlternateText="Query" CommandArgument='<%# FuncProConactFiledsStr(DataBinder.Eval(Container.DataItem,"Asset_ID").ToString(),DataBinder.Eval(Container.DataItem,"AssetType_ID").ToString()) %>'
                                                                runat="server" CommandName="Query" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Modify" SortExpression="ID">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="lblModify" runat="server" Text="Modify"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgbtnEdit" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                                                AlternateText="Modify" CommandArgument='<%# FuncProConactFiledsStr(DataBinder.Eval(Container.DataItem,"Asset_ID").ToString(),DataBinder.Eval(Container.DataItem,"AssetType_ID").ToString()) %>'
                                                                runat="server" CommandName="Modify" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asset Code" SortExpression="Asset_Code">
                                                        <HeaderTemplate>
                                                            <table cellpadding="0" cellspacing="0" border="0">
                                                                <thead>
                                                                    <tr align="center">
                                                                        <th style="padding: 0px !important; background: none !important;">
                                                                            <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="Asset Code"
                                                                                OnClick="FunProSortingColumn" ToolTip="Sort By Code"> </asp:LinkButton>
                                                                            <asp:Button ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                        </th>
                                                                    </tr>
                                                                    <tr align="left">
                                                                        <th style="padding: 0px !important; background: none !important;">
                                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" AutoPostBack="true"
                                                                                OnTextChanged="FunProHeaderSearch" CssClass="styleSearchBox" MaxLength="15"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender21" runat="server" TargetControlID="txtHeaderSearch1"
                                                                                FilterType="Custom, UppercaseLetters, LowercaseLetters, Numbers" Enabled="True">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAssetCode" runat="server" Text='<%# Bind("Asset_Code") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asset Description" SortExpression="Asset_Description">
                                                        <HeaderTemplate>
                                                            <table cellpadding="0" cellspacing="0" border="0">
                                                                <thead>
                                                                    <tr align="center">
                                                                        <th style="padding: 0px !important; background: none !important;">
                                                                            <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="Asset Description" ToolTip="Sort By Description"
                                                                                CssClass="styleGridHeaderLinkBtn" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                                            <asp:Button ID="imgbtnSort2" runat="server" CssClass="styleImageSortingAsc" />
                                                                        </th>
                                                                    </tr>
                                                                    <tr align="left">
                                                                        <th style="padding: 0px !important; background: none !important;">
                                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server" AutoPostBack="true"
                                                                                OnTextChanged="FunProHeaderSearch" CssClass="styleSearchBox" MaxLength="60"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender22" runat="server" TargetControlID="txtHeaderSearch2"
                                                                                FilterType="Custom, UppercaseLetters, LowercaseLetters, Numbers" Enabled="True" ValidChars=" ">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAssetDesc" runat="server" Text='<%# Bind("Asset_Description") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asset Type" SortExpression="NAME">
                                                        <HeaderTemplate>
                                                            <table cellpadding="0" cellspacing="0" border="0">
                                                                <thead>
                                                                    <tr align="center">
                                                                        <th style="padding: 0px !important; background: none !important;">
                                                                            <asp:LinkButton ID="lnkbtnSort3" runat="server" Text="Asset Type" CssClass="styleGridHeaderLinkBtn"
                                                                                ToolTip="Sort By Type" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                                            <asp:Button ID="imgbtnSort3" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                                        </th>
                                                                    </tr>
                                                                    <tr align="left">
                                                                        <th style="padding: 0px !important; background: none !important;">
                                                                            <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" runat="server" AutoPostBack="true"
                                                                                OnTextChanged="FunProHeaderSearch" CssClass="styleSearchBox" MaxLength="50"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender23" runat="server" TargetControlID="txtHeaderSearch3"
                                                                                FilterType="Custom, UppercaseLetters, LowercaseLetters, Numbers" Enabled="True" ValidChars=" -">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAssetType" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Active">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="lblActve" runat="server" Text="Active"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkActive" Checked='<%# DataBinder.Eval(Container.DataItem,"IS_Active").ToString().ToUpper() == "TRUE" %>' runat="server" Enabled="false" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="False">
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
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </div>
                <div class="row" style="text-align: center;">
                    <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
                </div>
                <div class="row" style="text-align: center;">
                    <span runat="server" id="lblErrorMessage" style="color: Red; font-size: medium"></span>
                </div>
                <%--  <div class="row" style="float: right; margin-top: 5px;">
                                
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">                                   
                                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                        <asp:Button ID="btnCreate" AccessKey="C"   OnClick="btnCreate_Click" CausesValidation="false" CssClass="save_btn fa fa-floppy-o" runat="server" Visible="true" Text=></asp:Button>                                  
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                    <asp:Button ID="btnShowAll" runat="server" AccessKe="H" Text="Show All" CssClass="save_btn fa fa-floppy-o"
                                        OnClick="btnShowAll_Click" Visible="true" />
                                </div>
                            </div>--%>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">

                    <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server"
                        type="button" accesskey="C">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>
                    <button class="css_btn_enabled" id="btnShowAll" onserverclick="btnShowAll_Click" runat="server"
                        type="button" accesskey="H">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                    </button>

                </div>
            </div>
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
