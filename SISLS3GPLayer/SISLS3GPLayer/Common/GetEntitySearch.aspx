<%@ Page Title="" Language="C#" MasterPageFile="~/Common/MasterPage.master" AutoEventWireup="true" CodeFile="GetEntitySearch.aspx.cs" Inherits="Common_GetEntitySearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ACT" %>
<%@ Register Src="~/UserControls/LOVPageNavigator.ascx" TagName="LOVPageNavigator"
    TagPrefix="LOVPN" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/LOVPageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function popup(strVal, strVal2, strControl, strControl3) {
            opener.window.document.getElementById(strControl).value = strVal;
            opener.window.document.getElementById(strControl3).value = strVal2;
            opener.window.document.getElementById(strControl).focus();
            window.close();
        }
        function ScreenClose() {
            window.close();
        }
    </script>
    <div>
        <div>
            <div class="row">
                <asp:Label ID="lblHeaderText" CssClass="styleDisplayLabel" runat="server"></asp:Label>
                <%-- <asp:TextBox ID="FocusCtrl" Width="0px" runat="server" ></asp:TextBox>--%>
            </div>
            <div class="row">
                <asp:HiddenField ID="hdnQuery" runat="server" />
                <input type="hidden" id="hdnSearch" runat="server" />
                <input type="hidden" id="hdnOrderBy" runat="server" />
                <input type="hidden" id="hdnSortDirection" runat="server" />
                <input type="hidden" id="hdnSortExpression" runat="server" />
            </div>
        </div>
        <div class="row">
            <asp:Panel ID="pnlcustomerhdr" runat="server">
                <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="row" style="padding: 5px !important;">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input lmd-input">
                                    <asp:TextBox ID="txtName" MaxLength="20" runat="server" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblName" runat="server" ToolTip="Name" Text="Name"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtSupplierCode" MaxLength="20" runat="server" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblSupplierCode" runat="server" ToolTip="Supplier Code" Text="Supplier Code"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtSupplierGroupCode" MaxLength="20" runat="server" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblSupplierGroupCode" runat="server" ToolTip="Supplier Group Code" Text="Supplier Group Code"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" id="dvSupplierAbbreviation">
                                <div class="md-input">
                                    <asp:TextBox ID="txtSupplierAbbreviation" MaxLength="20" runat="server" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblSupplierAbb" runat="server" ToolTip="Supplier Abbreviation" Text="Supplier Abbreviation"></asp:Label>

                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" id="dvBranch">
                                <div class="md-input">
                                    <asp:TextBox ID="txtBranch" MaxLength="20" runat="server" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblBranch" runat="server" ToolTip="Branch Name" Text="Branch Name"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
        <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="row" style="float: right; margin-top: 5px;">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <button id="btnGo" runat="server" accesskey="G" causesvalidation="false" class="css_btn_enabled" onserverclick="btnGo_Click" title="Go[Alt+G]" type="button">
                                <i aria-hidden="true" class="fa fa-arrow-circle-right"></i>&#8195;<u>G</u>o
                            </button>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                                type="button" accesskey="L">
                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                            </button>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <button class="css_btn_enabled" id="btnExit" title="Exit[Alt+X]" onclick="ScreenClose();" causesvalidation="false" runat="server"
                                type="button" accesskey="X">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="gird">
                    <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="false" Style="height: auto; width: 100%;" EmptyDataText="No Records Found"
                        OnRowDataBound="gvList_RowDataBound" ShowHeader="true" class="gird_details">
                        <Columns>
                            <asp:TemplateField HeaderText="Code" ItemStyle-Width="20%" Visible="false">
                                <HeaderTemplate>
                                    <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="Entity Code" ToolTip="Sort By Entity Code"
                                        OnClick="FunProSortingColumn" Enabled="false"> </asp:LinkButton>
                                    <%--<asp:ImageButton ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblID" runat="server" Text='<% # Bind("ENTITY_CODE")%>' Visible="false"></asp:Label>
                                    <asp:LinkButton ID="lbId" runat="server" Text='<% # Bind("ID")%>' CommandName="Select"
                                        CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black" Visible="false"> </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" ItemStyle-Width="40%">
                                <HeaderTemplate>
                                    <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="Entity Code and Name" ToolTip="Sort By Entity Name"
                                        OnClick="FunProSortingColumn" Enabled="false"> </asp:LinkButton>
                                    <%--<asp:ImageButton ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbName" runat="server" Text='<% # Bind("Name")%>' CommandName="Select"
                                        CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Branch" ItemStyle-Width="20%">
                                <%--  <HeaderTemplate>--%>
                                <%--           <asp:LinkButton ID="lnkbtnSort3" runat="server" Text="Account No." ToolTip="Sort By Account Number"
                                        OnClick="FunProSortingColumn"> </asp:LinkButton>--%>
                                <%--<asp:ImageButton ID="imgbtnSort3" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                <%--</HeaderTemplate>--%>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbAccName" runat="server" Text='<% # Bind("Branch")%>' CommandName="Select"
                                        CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Group" ItemStyle-Width="20%">
                                <HeaderTemplate>
                                    <asp:LinkButton ID="lnkbtnSort4" runat="server" Text="Group" ToolTip="Sort By Group"
                                        OnClick="FunProSortingColumn" Enabled="false"> </asp:LinkButton>
                                    <%--<asp:ImageButton ID="imgbtnSort4" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbRegisNo" runat="server" Text='<% # Bind("DEALER_GROUP")%>' CommandName="Select"
                                        CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Supplier Abbr." ItemStyle-Width="20%">
                                <HeaderTemplate>
                                    <asp:LinkButton ID="lnkbtnSort5" runat="server" Text="Supplier Abbr." ToolTip="Sort By Supplier Abbr."
                                        OnClick="FunProSortingColumn" Enabled="false"> </asp:LinkButton>
                                    <%--<asp:ImageButton ID="imgbtnSort5" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbEntityAbb" runat="server" Text='<% # Bind("ENTITY_ABBR")%>' CommandName="Select"
                                        CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle BackColor="AliceBlue" />
                        <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" />
                        <HeaderStyle CssClass="styleGridHeader" />
                    </asp:GridView>
                </div>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <uc1:PageNavigator ID="ucLOVPageNavigater" runat="server" Visible="false" />
            </div>
        </div>
    </div>
</asp:Content>
