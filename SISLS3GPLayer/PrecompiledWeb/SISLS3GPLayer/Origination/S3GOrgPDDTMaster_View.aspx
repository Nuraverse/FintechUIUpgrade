<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3GOrgPDDTMaster_View, App_Web_iftlmgmy" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading"></asp:Label>
                        </h6>
                    </div>
                </div>
                <br />
                <%--<div class="row">--%>
                <div class="gird">
                    <asp:GridView ID="grvPaging" runat="server" class="gird_details" AutoGenerateColumns="False"
                        DataKeyNames="PreDisbursement_Doc_Tran_ID"
                        OnRowCommand="grvPaging_RowCommand" OnRowDataBound="grvPaging_RowDataBound">
                        <Columns>
                            <asp:TemplateField Visible="False" HeaderStyle-CssClass="styleGridHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblCashflowId" runat="server" Text='<%# Eval("PreDisbursement_Doc_Tran_ID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderStyle CssClass="styleGridHeader" />
                                <HeaderTemplate>
                                    <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                        CommandArgument='<%# Bind("PreDisbursement_Doc_Tran_ID") %>' CommandName="Query"
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <HeaderStyle CssClass="styleGridHeader" />
                                <HeaderTemplate>
                                    <asp:Label ID="lblModify" runat="server" Text="Modify"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnModify" runat="server" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif" CommandArgument='<%# Bind("PreDisbursement_Doc_Tran_ID") %>'
                                        CommandName="Modify" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="LOB" SortExpression="LOB">
                                <ItemTemplate>
                                    <asp:Label ID="lblALOB" runat="server" Text='<%# Bind("LOB") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort1" runat="server"
                                                        OnClick="FunProSortingColumn" ToolTip="Sort By LOB" Text="Line of Business"></asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort1" CssClass="styleImageSortingAsc" runat="server"
                                                        ImageAlign="Middle" />
                                                </th>
                                            </tr>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" MaxLength="50" runat="server"
                                                            CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" 
                                                            OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtHeaderSearch1"
                                                            FilterType="UppercaseLetters,LowercaseLetters,Numbers" Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                                <ItemStyle Wrap="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Constitution Name" SortExpression="Constitution_Name"
                                HeaderStyle-CssClass="styleGridHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblConstitutionName" runat="server" Text='<%# Bind("Constitution_Name") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr align="center">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:LinkButton ID="lnkbtnSort2" CssClass="styleGridHeaderLinkBtn" runat="server"
                                                        OnClick="FunProSortingColumn" ToolTip="Sort By Constitution" Text="Constitution"></asp:LinkButton>
                                                    <asp:Button ID="imgbtnSort2" CssClass="styleImageSortingAsc" runat="server"
                                                        ImageAlign="Middle" />
                                                </th>
                                            </tr>
                                            <tr align="left">
                                                <th style="padding: 0px !important; background: none !important;">
                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" MaxLength="50" runat="server"
                                                        CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtHeaderSearch2"
                                                        FilterType="UppercaseLetters,LowercaseLetters,Numbers" Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </HeaderTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Enquiry_No" HeaderText="Enquiry Number" HeaderStyle-CssClass="styleGridHeader"></asp:BoundField>
                            <asp:BoundField DataField="PRDDC_Number" HeaderText="PRDDC Number" HeaderStyle-CssClass="styleGridHeader"></asp:BoundField>
                            <asp:BoundField DataField="StatusName" HeaderText="Status" HeaderStyle-CssClass="styleGridHeader"></asp:BoundField>
                            <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                                <ItemTemplate>
                                    <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%#Eval("Created_By")%>'></asp:Label>
                                    <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%#Eval("User_Level_ID")%>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <%--</div>--%>
                    <%--<div class="row" style="text-align: center;">--%>
                    <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                    <%--</div>--%>
                </div>

                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button id="btnCreate" runat="server" causesvalidation="False" class="css_btn_enabled"
                        type="button" onserverclick="btnCreate_Click" accesskey="C">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>
                    <button id="btnShowAll" runat="server" class="css_btn_enabled"
                        onserverclick="btnShowAll_Click" type="button" accesskey="H">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                    </button>
                </div>



                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <span runat="server" id="lblErrorMessage" cssclass="styleMandatoryLabel" style="color: Red; font-size: medium"></span>

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
