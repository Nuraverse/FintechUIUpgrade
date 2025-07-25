<%@ page title="" language="C#" masterpagefile="~/Common/MasterPage.master" autoeventwireup="true" inherits="Common_GetCustomerSearch, App_Web_3y5trygh" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ACT" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/LOVPageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function popup(strVal, strVal2, strControl, strControl3) {
            //window.opener.document.body.disabled = false;

            //var coll = window.opener.document.forms[0].elements; for (var i = 0; i < coll.length; i++) {

            //    coll[i].disabled = false;
            //}

            opener.window.document.getElementById(strControl).value = strVal;
            opener.window.document.getElementById(strControl3).value = strVal2;
            opener.window.document.getElementById(strControl).focus();

            window.close();

        }
        function ScreenClose() {
            window.close();
        }

        window.onload = function () {
            //window.opener.document.body.disabled = true;

            //var coll = window.opener.document.forms[0].elements;
            //for (var i = 0; i < coll.length; i++) {

            //    coll[i].disabled = true;
            //}

        }


        window.onunload = function () {
            //window.opener.document.body.disabled = false;

            //var coll = window.opener.document.forms[0].elements; for (var i = 0; i < coll.length; i++) {

            //    coll[i].disabled = false;
            //}
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
                                    <asp:TextBox ID="txtCustomerCode" MaxLength="20" CssClass="md-form-control form-control login_form_content_input requires_false" runat="server"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
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
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtEmployeerCode" MaxLength="20" CssClass="md-form-control form-control login_form_content_input requires_false" runat="server"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblEmployeerCode" runat="server" ToolTip="Employer Code" Text="Employer Code"></asp:Label>
                                    </label>
                                </div>
                            </div>
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
                                        <asp:Label ID="lblnidcrno" runat="server" ToolTip="NID/CR/RID No." Text="NID/CR/RID No."></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtRegNumber" MaxLength="20" CssClass="md-form-control form-control login_form_content_input requires_false" runat="server"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblRegNumber" runat="server" ToolTip="Reg. Number" Text="Reg. Number"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="styleRecordCount">
                                    <div>
                                        <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                                    </div>
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
                    <div align="right">

                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" runat="server"
                            type="button" causesvalidation="false" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                            onserverclick="btnClear_Click"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnExit" title="Exit[Alt+X]" onserverclick="btnExit_ServerClick" causesvalidation="false"
                            onclick="if(fnConfirmExit())" runat="server" type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="gird">
                    <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="false" class="gird_details"
                        HeaderStyle-CssClass="styleGridHeader" OnRowDataBound="gvList_RowDataBound" ShowHeader="true">
                        <Columns>
                            <asp:TemplateField HeaderText="Code" ItemStyle-Width="20%">
                                <HeaderTemplate>
                                    <asp:LinkButton ID="lnkbtnSort1" Enabled="false" runat="server" Text="Customer Code" ToolTip="Sort By Customer Code"
                                        CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
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
                                    <asp:LinkButton ID="lnkbtnSort2" Enabled="false" runat="server" Text="Customer Name" ToolTip="Sort By Customer Name"
                                        CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                    <%-- <asp:ImageButton ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbName" runat="server" Text='<% # Bind("Name")%>' CommandName="Select"
                                        CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Account Number" ItemStyle-Width="20%">
                                <HeaderTemplate>
                                    <asp:LinkButton ID="lnkbtnSort3" Enabled="false" runat="server" Text="Account No." ToolTip="Sort By Account Number"
                                        CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                    <%-- <asp:ImageButton ID="imgbtnSort3" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbAccName" runat="server" Text='<% # Bind("panum")%>' CommandName="Select"
                                        CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Reg. Number" ItemStyle-Width="20%">
                                <HeaderTemplate>
                                    <asp:LinkButton ID="lnkbtnSort4" Enabled="false" runat="server" Text="Reg. Number" ToolTip="Sort By Registration Number"
                                        CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                    <%--<asp:ImageButton ID="imgbtnSort4" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbRegisNo" runat="server" Text='<% # Bind("Registrationno")%>' CommandName="Select"
                                        CommandArgument='<% # Bind("ID")%>' Font-Underline="false" ForeColor="Black"> </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NID/CR/RID Number" ItemStyle-Width="20%">
                                <HeaderTemplate>
                                    <asp:LinkButton ID="lnkbtnSort5" Enabled="false" runat="server" Text="NID/CR/RID Number" ToolTip="NID/CR/RID Number"
                                        CssClass="styleGridHeader" OnClick="FunProSortingColumn"> </asp:LinkButton>
                                    <%--<asp:ImageButton ID="imgbtnSort4" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />--%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbCRNNo" runat="server" Text='<% # Bind("CRNUMBER")%>' CommandName="Select"
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

    <%--    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="row">
                
            </div>

        </div>
    </div>--%>
</asp:Content>
