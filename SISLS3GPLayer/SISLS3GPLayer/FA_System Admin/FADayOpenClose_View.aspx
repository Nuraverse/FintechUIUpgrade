<%@ Page Title="" Language="C#" MasterPageFile="~/Common/FAMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="FADayOpenClose_View.aspx.cs" Inherits="FA_Reports_FADayOpenClose_View" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="tab-pane fade in active show" runat="server" id="tab1">
                <div class="row">
                    <div class="col">
                        <div class="row title_header">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleInfoLabel"
                                    ForeColor="Black" Text="Day Open/Close- View">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <asp:GridView runat="server" ID="grvDayOpenCloseView" Width="100%" AutoGenerateColumns="false"
                                HeaderStyle-CssClass="styleGridHeader" class="gird_details" EmptyDataText="No Records found"
                                RowStyle-HorizontalAlign="Left" ShowHeaderWhenEmpty="true" OnRowCommand="grvViewBudgetMaster_RowCommand">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                                      
                                        <HeaderTemplate>
                                            <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnQuery" ToolTip="Query" ImageUrl="~/Images/spacer.gif"
                                                CssClass="styleGridQuery" CommandArgument='<%#Eval("ID") %>'
                                                CommandName="Query" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" Visible="false" ItemStyle-HorizontalAlign="center" HeaderStyle-Width="8%">
                                       
                                        <HeaderTemplate>
                                            <asp:Label ID="lblModify" runat="server" Text="Modify"></asp:Label>
                                        </HeaderTemplate>

                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ToolTip="Modify"
                                                Enabled='<%# Eval("STATUS").ToString() == "Open" ? true : false %>' ImageUrl="~/Images/spacer.gif" CommandArgument='<%#Eval("ID") %>'
                                                CommandName="Modify" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="Left"
                                        SortExpression="Branch" HeaderStyle-CssClass="stylegridheader" HeaderStyle-Width="20%">

                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblItemHeader" Text='<%#Eval("Branch") %>'></asp:Label>&nbsp;
                                        </ItemTemplate>

                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <thead>
                                           <%--         <tr align="center">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <asp:LinkButton ID="lnkbtnCurrencyName" OnClick="FunProSortingColumn" ToolTip="Sort By Name"
                                                                runat="server" Text="Branch"></asp:LinkButton>
                                                            <asp:Button ID="imgbtnCurrencyName" CssClass="styleImageSortingAsc" runat="server"
                                                                ImageAlign="Middle" />
                                                        </th>
                                                    </tr>--%>

                                           <tr align="center">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <asp:LinkButton ID="lnkbtnItemHeader" OnClick="FunProSortingColumn" CssClass="styleGridHeaderLinkBtn"
                                                                runat="server" ToolTip="Sort By Branch" Text="Branch"></asp:LinkButton>
                                                            <%-- <asp:ImageButton ID="imgbtnItemHeader" runat="server" CssClass="styleImageSortingAsc"
                                                            ImageAlign="Middle" />--%>
                                                        </th>
                                                    </tr>

                                              


                                                    <tr align="left">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch" onkeypress="fnCheckSpecialChars(true);"
                                                                    MaxLength="40" runat="server" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"
                                                                    class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender" runat="server" TargetControlID="txtHeaderSearch"
                                                                    FilterType="UppercaseLetters, LowercaseLetters,Custom" ValidChars=" " Enabled="True">
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


                                    <asp:TemplateField HeaderText="Document Date" HeaderStyle-CssClass="stylegridheader">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblDocdate" Text='<%#Eval("Doc_Date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Opening Balance" ItemStyle-HorizontalAlign="right" HeaderStyle-CssClass="stylegridheader">

                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblOplBal" Text='<%#Eval("OPENING_BALANCE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Closing Balance" ItemStyle-HorizontalAlign="right" HeaderStyle-CssClass="stylegridheader">

                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblClBal" Text='<%#Eval("CLOSING_BALANCE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Cash Receipt No" HeaderStyle-CssClass="stylegridheader">

                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblRecpNo" Text='<%#Eval("CASH_RECEIPT_NO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="stylegridheader" ItemStyle-HorizontalAlign="center">

                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblStatus" Text='<%#Eval("STATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>

                            <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                        </div>
                    </div>

                </div>

                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnShow" onserverclick="btnShow_Click" runat="server"
                        type="button" accesskey="H" title="Show All,Alt+H">

                        <i class="fa fa-eye"></i>&emsp;S<u>h</u>ow All
                    </button>

                    <button class="css_btn_enabled" id="btnCreate"
                        onserverclick="btnCreate_ServerClick" runat="server"
                        type="button" causesvalidation="false" accesskey="C" title="Create,Alt+C">
                        <i class="fa fa-arrow-circle-right"></i>&emsp;<u>C</u>reate
                    </button>
                </div>


                <input type="hidden" id="hdnSortDirection" runat="server" />
                <input type="hidden" id="hdnSortExpression" runat="server" />
                <input type="hidden" id="hdnSearch" runat="server" />
                <input type="hidden" id="hdnOrderBy" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>





