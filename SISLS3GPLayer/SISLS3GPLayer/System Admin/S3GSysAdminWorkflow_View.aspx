<%@ Page Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="S3GSysAdminWorkflow_View.aspx.cs" Inherits="S3GSysAdminWorkflow_View" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
          
                     <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading">
                    </asp:Label>
                </h6>
            </div>
        </div>

                <div class="row">
                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <div class="gird ">
                       <asp:GridView ID="grvPaging" runat="server" Width="100%" AutoGenerateColumns="false"
                            OnRowCommand="grvPaging_RowCommand" OnRowDataBound="grvPaging_RowDataBound" RowStyle-HorizontalAlign="Left" CssClass="gird_details">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                            CommandArgument='<%# Bind("Workflow_ID") %>' CommandName="Query" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                            CommandArgument='<%# Bind("Workflow_ID") %>' CommandName="Modify" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField SortExpression="LOB_Name">
                                    <HeaderTemplate>
                                       <table>
                                            <thead>
                                            <tr align="center">
                                                 <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort1" Style="text-decoration: none;" runat="server"
                                                        OnClick="FunProSortingColumn" ToolTip="Sort By Line of Business" Text="Line of Business"></asp:LinkButton>
                                                    <asp:ImageButton ID="imgbtnSort1" CssClass="styleImageSortingAsc" runat="server"
                                                        OnClientClick="return false;" ImageAlign="Middle" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                               <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" MaxLength="30" runat="server" class="md-form-control form-control login_form_content_input"
                                                         AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                    <cc1:filteredtextboxextender id="FilteredTextBoxExtender1" runat="server" targetcontrolid="txtHeaderSearch1"
                                                        filtertype="UppercaseLetters,LowercaseLetters,Custom" validchars="- " enabled="True">
                                                    </cc1:filteredtextboxextender>
                                                 <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblLOBName" runat="server" Text='<%# Bind("LOB_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                       <table>
                                            <thead>
                                            <tr align="center">
                                                 <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort2" Style="text-decoration: none;"  runat="server"
                                                        OnClick="FunProSortingColumn" ToolTip="Sort By Product" Text="Product"></asp:LinkButton>
                                                    <asp:ImageButton ID="imgbtnSort2" CssClass="styleImageSortingAsc" runat="server"
                                                        OnClientClick="return false;" ImageAlign="Middle" />
                                                     </th>
                                                </tr>
                                                
                                           
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" MaxLength="40" runat="server"
                                                        AutoPostBack="true" OnTextChanged="FunProHeaderSearch" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                    <cc1:filteredtextboxextender id="FilteredTextBoxExtender2" runat="server" targetcontrolid="txtHeaderSearch2"
                                                        filtertype="UppercaseLetters,LowercaseLetters,Numbers,Custom" validchars="- "
                                                        enabled="True">
                                                    </cc1:filteredtextboxextender>
                                                <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblProductName" runat="server" Text='<%# Bind("Product_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                         <table>
                                            <thead>
                                            <tr align="center">
                                                 <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort3" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                        OnClick="FunProSortingColumn" ToolTip="Sort By Workflow Sequence" Text="Workflow Sequence"></asp:LinkButton>
                                                    <asp:ImageButton ID="imgbtnSort3" CssClass="styleImageSortingAsc" runat="server"
                                                        OnClientClick="return false;" ImageAlign="Middle" />
                                                 </th>
                                                </tr>
                                                
                                             <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                        <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" MaxLength="40" runat="server" class="md-form-control form-control login_form_content_input"
                                                        AutoPostBack="true" OnTextChanged="FunProHeaderSearch" ></asp:TextBox>
                                                    <cc1:filteredtextboxextender id="FilteredTextBoxExtender3" runat="server" targetcontrolid="txtHeaderSearch3"
                                                        filtertype="UppercaseLetters,LowercaseLetters,Numbers" enabled="True">
                                                    </cc1:filteredtextboxextender>
                                                 <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblWorkflow_Sequnce" runat="server" Text='<%# Bind("Workflow_Sequnce_ID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" />
                                </asp:TemplateField>
                                <%--<asp:TemplateField>
                                    <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                    <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" border="0">
                                            <tr align="center">
                                                <td>
                                                    <asp:LinkButton ID="lnkbtnSort4" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                        OnClick="FunProSortingColumn" ToolTip="Sort By Program" Text="Program"></asp:LinkButton>
                                                    <asp:ImageButton ID="imgbtnSort4" CssClass="styleImageSortingAsc" runat="server"
                                                        ImageAlign="Middle" />
                                                </td>
                                            </tr>
                                            <tr align="left">
                                                <td>
                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch4" MaxLength="40" runat="server"
                                                        AutoPostBack="true" OnTextChanged="FunProHeaderSearch" CssClass="styleSearchBox"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblProgramName" runat="server" Text='<%# Bind("Program_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Active">
                                    <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                    <ItemTemplate>
                                        <asp:CheckBox Enabled="false" ID="chkActive" runat="server" Checked='<%# FunPriCheckBool(Eval("Is_Active").ToString()) %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
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
                     </div>
                    </div>
               
                     <div class="row">
                             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                     <//div>
                         </div>

                         <div>
                               <span runat="server" id="lblErrorMessage" class="styleMandatoryLabel"></span>
                         </div>
                    
                  <div class="btn_height"></div>
                   <div align="right" class="fixed_btn">
                         <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server"
                type="button" accesskey="C" title="Create,Alt+C">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                       </button>
                       <button class="css_btn_enabled" id="btnShowAll" onserverclick="btnShowAll_Click" runat="server"
                         type="button" accesskey="H" title="Show All,Alt+H">
                <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
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
