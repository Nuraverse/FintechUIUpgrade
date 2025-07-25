<%@ Page Title="" Language="C#" MasterPageFile="~/Common/MasterPage.master" AutoEventWireup="true" CodeFile="GetAccountSearch.aspx.cs" Inherits="Common_GetAccountSearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ACT" %>
<%@ Register Src="~/UserControls/LOVPageNavigator.ascx" TagName="LOVPageNavigator"
    TagPrefix="LOVPN" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/LOVPageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function popup(strVal, strVal2, strControl, strControl3) {
            //alert(strVal);
            //alert(strVal2);
            //alert(strControl);
            //alert(strControl3);
            opener.window.document.getElementById(strControl).value = strVal;
            opener.window.document.getElementById(strControl3).value = strVal2;
            //opener.window.document.getElementById(strControl4).value = strVal;
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
                <div class="col">
                    <asp:Label ID="lblHeaderText" runat="server"></asp:Label>
                    <%-- <asp:TextBox ID="FocusCtrl" Width="0px" runat="server" ></asp:TextBox>--%>
                </div>
                <div class="col">
                    <asp:HiddenField ID="hdnQuery" runat="server" />
                    <input type="hidden" id="hdnSearch" runat="server" />
                    <input type="hidden" id="hdnOrderBy" runat="server" />
                    <input type="hidden" id="hdnSortDirection" runat="server" />
                    <input type="hidden" id="hdnSortExpression" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <asp:Panel ID="pnlcustomerhdr" runat="server">
                        <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="row" style="padding: 5px !important;">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAccountNumber" MaxLength="20" runat="server" ToolTip="Account No" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblAccountNumber" runat="server" ToolTip="Account No." Text="Account No."></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtBranchName" MaxLength="20" runat="server" ToolTip="Branch Name" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBranchName" runat="server" ToolTip="Branch Name" Text="Branch Name"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCustomerCode" MaxLength="20" runat="server" ToolTip="Customer Code" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblCustomerCode" runat="server" ToolTip="Customer Code" Text="Customer Code"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtcustomerName" MaxLength="20" runat="server" ToolTip="Customer Name" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblCustomerName" runat="server" ToolTip="Customer Name" Text="Customer Name"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtApplicationNo" MaxLength="20" runat="server" ToolTip="Application No" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblAppNo" runat="server" ToolTip="Application No." Text="Application No."></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtRegNumber" MaxLength="20" runat="server" ToolTip="Reg. Number" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblRegNumber" runat="server" ToolTip="Reg. Number" Text="Reg. Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtEngNo" MaxLength="20" runat="server" ToolTip="Engine No" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblEngNo" runat="server" ToolTip="Engine No." Text="Engine No."></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtChassisNo" MaxLength="20" runat="server" ToolTip="Chassis No" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblChassis" runat="server" ToolTip="Chassis No." Text="Chassis No."></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div align="right">
                            <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" runat="server"
                                type="button" causesvalidation="false" accesskey="G" title="Go,Alt+G">
                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                            </button>
                            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" causesvalidation="false" runat="server"
                                onserverclick="btnClear_Click"
                                type="button" accesskey="L">
                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                            </button>
                            <button class="css_btn_enabled" id="btnExit" title="Exit[Alt+X]" onclick="ScreenClose();" causesvalidation="false" runat="server"
                                type="button" accesskey="X">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                    <div class="gird">
                        <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="false" Width="100%" class="gird_details"
                            HeaderStyle-CssClass="styleGridHeader" OnRowDataBound="gvList_RowDataBound" ShowHeader="true">
                            <Columns>
                                <asp:TemplateField HeaderText="Code" ItemStyle-Width="20%">
                                    <HeaderTemplate>
                                        <asp:LinkButton ID="lnkbtnSort1" runat="server" Enabled="false" Text="Customer Code" ToolTip="Sort By Customer Code"
                                            OnClick="FunProSortingColumn"> </asp:LinkButton>
                                        <%-- <asp:ImageButton ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<% # Bind("ID")%>' Visible="false"></asp:Label>
                                        <asp:LinkButton ID="lbId" runat="server" Text='<% # Bind("Code")%>' CommandName="Select"
                                            CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name" ItemStyle-Width="40%">
                                    <HeaderTemplate>
                                        <asp:LinkButton ID="lnkbtnSort2" runat="server" Enabled="false" Text="Customer Name" ToolTip="Sort By Customer Name"
                                            OnClick="FunProSortingColumn"> </asp:LinkButton>
                                        <%--  <asp:ImageButton ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbName" runat="server" Text='<% # Bind("Name")%>' CommandName="Select"
                                            CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Account Number" ItemStyle-Width="20%">
                                    <HeaderTemplate>
                                        <asp:LinkButton ID="lnkbtnSort3" runat="server" Enabled="false" Text="Account No." ToolTip="Sort By Account Number"
                                            OnClick="FunProSortingColumn"> </asp:LinkButton>
                                        <%-- <asp:ImageButton ID="imgbtnSort3" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbAccName" runat="server" Text='<% # Bind("panum")%>' CommandName="Select"
                                            CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Reg. Number" ItemStyle-Width="20%">
                                    <HeaderTemplate>
                                        <asp:LinkButton ID="lnkbtnSort4" runat="server" Enabled="false" Text="Branch" ToolTip="Sort By Branch"
                                            OnClick="FunProSortingColumn"> </asp:LinkButton>
                                        <%--<asp:ImageButton ID="imgbtnSort4" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbBranch" runat="server" Text='<% # Bind("Branch")%>' CommandName="Select"
                                            CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <SelectedRowStyle BackColor="AliceBlue" />
                            <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" />
                            <HeaderStyle CssClass="styleGridHeader" />
                        </asp:GridView>
                    </div>
                    <uc1:PageNavigator ID="ucLOVPageNavigater" width="100%" runat="server" Visible="false" />
                </div>
            </div>
        </div>
</asp:Content>
