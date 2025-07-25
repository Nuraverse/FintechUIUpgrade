<%@ page title="" language="C#" masterpagefile="~/Common/MasterPage.master" autoeventwireup="true" inherits="Common_GetAccountSearch, App_Web_hgsxbb2o" %>

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
                                <div class="md-input">
                                    <asp:TextBox ID="txtApplicationNo" MaxLength="20" CssClass="md-form-control form-control login_form_content_input requires_false" runat="server"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblApplicationNo" runat="server" ToolTip="Application No" Text="Application No"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtCustomerCode" MaxLength="20" CssClass="md-form-control form-control login_form_content_input requires_false" runat="server"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblCustomerCode" runat="server" ToolTip="Customer Code" Text="Customer Code"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtcustomerName" MaxLength="20" CssClass="md-form-control form-control login_form_content_input requires_false" runat="server"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblCustomerName" runat="server" ToolTip="Customer Name" Text="Customer Name"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <%-- <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtEmployeerCode" MaxLength="20" CssClass="md-form-control form-control login_form_content_input requires_false" runat="server"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblEmployeerCode" runat="server" ToolTip="Employeer Code" Text="Employeer Code"></asp:Label>
                                    </label>
                                </div>
                            </div>--%>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtAccountNumber" MaxLength="20" CssClass="md-form-control form-control login_form_content_input requires_false" runat="server"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblAccountNumber" runat="server" ToolTip="Account No." Text="Account No."></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtNIDCRNo" MaxLength="20" CssClass="md-form-control form-control login_form_content_input requires_false" runat="server"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblnidcrno" runat="server" ToolTip="NID/CR No." Text="NID/CR No."></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <%-- <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtRegNumber" MaxLength="20" CssClass="md-form-control form-control login_form_content_input requires_false" runat="server"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblRegNumber" runat="server" ToolTip="Reg. Number" Text="Reg. Number"></asp:Label>
                                    </label>
                                </div>
                            </div>--%>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtBranchName" MaxLength="20" CssClass="md-form-control form-control login_form_content_input requires_false" runat="server"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblBranchName" runat="server" ToolTip="Branch Name" Text="Branch Name"></asp:Label>
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
                            <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                            <asp:Button ID="btnGo" runat="server" ToolTip="Go,Alt+G" AccessKey="G" Text="Go" OnClick="btnGo_Click"
                                CssClass="save_btn fa fa-floppy-o" />
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                            <asp:Button ID="btnClear" runat="server" ToolTip="Clear,Alt+L" AccessKey="L" Text="Clear" OnClick="btnClear_Click" CssClass="save_btn fa fa-floppy-o" />
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                            <asp:Button ID="btnExit" runat="server" Text="Exit" AccessKey="E" ToolTip="Exit,Alt+E" OnClientClick="ScreenClose();"
                                CssClass="save_btn fa fa-floppy-o" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="false" class="gird_details"
                    HeaderStyle-CssClass="styleGridHeader" OnRowDataBound="gvList_RowDataBound" ShowHeader="true">
                    <Columns>
                        <asp:TemplateField HeaderText="Code" ItemStyle-Width="20%">
                            <HeaderTemplate>
                                <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="Customer Code" ToolTip="Sort By Customer Code"
                                    CssClass="styleGridHeader" OnClientClick="FunProSortingColumn"> </asp:LinkButton>
                              <%--  <asp:ImageButton ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<% # Bind("ID")%>' Visible="false"></asp:Label>
                                <asp:LinkButton ID="lbId" runat="server" Text='<% # Bind("Code")%>' CommandName="Select"
                                    CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" ItemStyle-Width="40%">
                            <HeaderTemplate>
                                <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="Customer Name" ToolTip="Sort By Customer Name"
                                    CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                               <%-- <asp:ImageButton ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbName" runat="server" Text='<% # Bind("Name")%>' CommandName="Select"
                                    CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Proposal No" ItemStyle-Width="20%">
                            <HeaderTemplate>
                                <asp:LinkButton ID="lnkbtnSort4" runat="server" Text="Proposal No" ToolTip="Sort By Proposal No"
                                    CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                               <%-- <asp:ImageButton ID="imgbtnSort4" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lblProposalNo" runat="server" Text='<% # Bind("APPLICATION_NUMBER")%>' CommandName="Select"
                                    CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Account Number" ItemStyle-Width="20%">
                            <HeaderTemplate>
                                <asp:LinkButton ID="lnkbtnSort3" runat="server" Text="Account No." ToolTip="Sort By Account Number"
                                    CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                             <%--   <asp:ImageButton ID="imgbtnSort3" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbAccName" runat="server" Text='<% # Bind("panum")%>' CommandName="Select"
                                    CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <SelectedRowStyle BackColor="AliceBlue" />
                    <PagerStyle HorizontalAlign="Center" VerticalAlign="Bottom" />
                    <HeaderStyle CssClass="styleGridHeader" />
                </asp:GridView>

            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <uc1:PageNavigator ID="ucLOVPageNavigater" runat="server" Visible="false" />
            </div>
        </div>
    </div>
</asp:Content>
