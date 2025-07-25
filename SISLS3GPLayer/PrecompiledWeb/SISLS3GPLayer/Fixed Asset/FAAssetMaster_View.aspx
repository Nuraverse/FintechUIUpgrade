<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="FAAssetMaster_View, App_Web_skbf4x1n" title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row title_header">
                   
                                                <h6 class="title_name" style="margin:0px;">
                            <asp:Label runat="server" ID="lblHeading" Text="" >
                            </asp:Label>
                        </h6>
                    
                </div>
                <div class="row">

                </div>
                </div>
            <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                        <asp:GridView ID="grvPaging" runat="server" AutoGenerateColumns="False" 
                            OnRowDataBound="grvPaging_RowDataBound" OnRowCommand="grvPaging_RowCommand" CssClass="gird_details">
                            <Columns>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif"  CssClass="styleGridQuery"
                                            CommandArgument='<%# Bind("ID") %>' CommandName="Query" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Modify" >
                                     <HeaderStyle CssClass="styleGridHeader" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnEdit" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                            AlternateText="Modify" CommandArgument='<%# Bind("ID") %>' runat="server"
                                            CommandName="Modify" />
                                    </ItemTemplate>
                                    <HeaderTemplate>
                                        <asp:Label ID="lblModify" runat="server" Text="Modify" ></asp:Label>
                                    </HeaderTemplate>
                                </asp:TemplateField>
                                <%--  for Asset Group Code--%>
                                <asp:TemplateField HeaderText="Asset Group code">
                                     
                                    <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" border="0">
                                              <thead>
                                            <tr align="center">
                                                 <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="Asset Group code" ToolTip="Sort Asset Group code"
                                                         Style="text-decoration: none;"  OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                                  </thead>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                      <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input"
                                                    onmouseover="txt_MouseoverTooltip(this)"   MaxLength ="70"  OnTextChanged="FunProHeaderSearch" ></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftxtRefNumber" ValidChars="/-() ." TargetControlID="txtHeaderSearch1"
                                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                        Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                          <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblRefNumber" runat="server" Text='<%# Bind("Asset_Group_code") %>'></asp:Label>
                                    </ItemTemplate>
                                    
                                </asp:TemplateField>
                                <%--  for Asset Group Description--%>
                                   <asp:TemplateField HeaderText="Asset Group description">
                                        <HeaderStyle CssClass="styleGridHeader" />
                                    <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" border="0">
                                             <thead>
                                            <tr align="center">
                                               <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="Asset Group description" ToolTip="Sort Asset Group description"
                                                        Style="text-decoration: none;" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                     <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server" AutoPostBack="true"
                                                       onmouseover="txt_MouseoverTooltip(this)" MaxLength ="120"   OnTextChanged="FunProHeaderSearch" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                      <cc1:FilteredTextBoxExtender ID="ftxtTemplateName" ValidChars="/-() ." TargetControlID="txtHeaderSearch2"
                                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                        Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                          <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                         </div>
                                                    </th>
                                                
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblTemplateName" runat="server" Text='<%# Bind("Asset_Group_desc") %>'></asp:Label>
                                    </ItemTemplate>
                                        
                                </asp:TemplateField>
                          
                                <%-- Active Status --%>
                                <asp:TemplateField HeaderText="Active" Visible="false">
                                     <HeaderStyle CssClass="styleGridHeader" />
                                    <ItemTemplate>
                                    <%--Modified By Chandrasekar K On 24-Sep-2012--%>
                                    <%--<asp:CheckBox ID="chkIsActive" Enabled = "false" runat="server" Checked ='<%# Bind("Is_Active") %>' />--%>
                                    <asp:CheckBox ID="chkIsActive" Enabled = "false" runat="server" Checked='<%#DataBinder.Eval(Container.DataItem, "Is_Active").ToString().ToUpper() == "TRUE"%>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%#Eval("Created_By")%>'></asp:Label>
                                        <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%#Eval("User_Level_ID")%>'></asp:Label>
                                    </ItemTemplate>
                                  
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                             
                   </div>
                               <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
                            </div>
                </div>
                
               <div>
                        <span runat="server" id="lblErrorMessage" style="color: Red; font-size: medium">
                        </span>
                        <%--<asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatory"></asp:Label--%>
                  </div>
              <div class="btn_height" ></div>
               <div align="right" class="fixed_btn">
                      <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server"
                        type="button" accesskey="C" title="Alt+C">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>
                   <button class="css_btn_enabled" id="btnShowAll" onserverclick="btnShowAll_Click" runat="server"
                        type="button" accesskey="H" title="Alt+H">
                        <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                    </button>
                        
                    </div>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

