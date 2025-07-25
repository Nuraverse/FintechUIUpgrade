<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3G_Cln_PDCUploadView, App_Web_la20gqab" %>

<%@ Register Src="../UserControls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">

                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading"> </asp:Label>
                            </h6>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <asp:GridView ID="grvPaging" runat="server" AutoGenerateColumns="False" OnRowDataBound="grvPaging_RowDataBound" OnRowCommand="grvPaging_RowCommand"
                                    Width="100%">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderStyle CssClass="styleGridHeader" />
                                            <HeaderTemplate>
                                                <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                    CommandArgument='<%# Bind("Upload_ID") %>' CommandName="Query" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Modify">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnEdit" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                                    AlternateText="Modify" CommandArgument='<%# Bind("Upload_ID") %>' runat="server"
                                                    CommandName="Modify" />
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <asp:Label ID="lblModify" runat="server" Text="Modify"></asp:Label>
                                            </HeaderTemplate>
                                        </asp:TemplateField>
                                        <%--  for Location--%>
                                        <asp:TemplateField HeaderText="PDC Nature">
                                            <HeaderTemplate>
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <thead>
                                                        <tr align="center">
                                                            <th style="padding: 0px !important; background: none !important;">
                                                                <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="PDC Nature"
                                                                    OnClick="FunProSortingColumn" ToolTip="Sort by Branch"> </asp:LinkButton>
                                                                <asp:Button ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" Enabled="false" />
                                                            </th>
                                                        </tr>
                                                        <tr align="left">
                                                            <th style="padding: 0px !important; background: none !important;">
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server"
                                                                        AutoPostBack="true" class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                </table>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("PDC_Nature") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%-- LOB --%>
                                        <asp:TemplateField HeaderText="File Name">
                                            <HeaderTemplate>
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <thead>
                                                        <tr align="center">
                                                            <th style="padding: 0px !important; background: none !important;">
                                                                <asp:LinkButton ID="lnkbtnSort2" runat="server" Text="File Name" ToolTip="Sort by Line of Business"
                                                                    OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                                <asp:Button ID="imgbtnSort2" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" Enabled="false" />
                                                            </th>
                                                        </tr>
                                                        <tr align="left">
                                                            <th style="padding: 0px !important; background: none !important;">
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server"
                                                                        AutoPostBack="true" class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                </table>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblLOB" runat="server" Text='<%# Bind("File_Name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%-- Status --%>
                                        <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFileStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                                <asp:Label ID="lblFileStatusID" runat="server" Text='<%# Bind("Status_ID") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <asp:Label ID="lblhdrFileStatus" runat="server" Text="Status"></asp:Label>
                                            </HeaderTemplate>
                                        </asp:TemplateField>

                                        <%-- Uploaded Date --%>
                                        <asp:TemplateField HeaderText="Uploaded Date" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUploadedDate" runat="server" Text='<%# Bind("Uploaded_Date") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <asp:Label ID="lblhdrUploadedDate" runat="server" Text="Upload Date"></asp:Label>
                                            </HeaderTemplate>
                                        </asp:TemplateField>


                                        <%-- Created By --%>
                                        <asp:TemplateField HeaderText="Uploaded By" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("Created_Name") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <asp:Label ID="lblhdrUserName" runat="server" Text="Uploaded By"></asp:Label>
                                            </HeaderTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="styleGridHeader">
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
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div>
                                <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div>
                                <span runat="server" id="lblErrorMessage" style="color: Red; font-size: medium"></span>
                            </div>
                        </div>
                    </div>
                    <div class="btn_height"></div>
                    <div align="right" class="fixed_btn">
                        <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server" title="Create[Alt+C]"
                            type="button" accesskey="C" tooltip="Create the Details, Alt+C">
                            <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>C</u>reate
                        </button>
                        <button class="css_btn_enabled" id="btnShowAll" onserverclick="btnShowAll_Click" runat="server" title="Show All[Alt+H]"
                            type="button" accesskey="H" tooltip="Show all the Details, Alt+H">
                            <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
                        </button>
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

