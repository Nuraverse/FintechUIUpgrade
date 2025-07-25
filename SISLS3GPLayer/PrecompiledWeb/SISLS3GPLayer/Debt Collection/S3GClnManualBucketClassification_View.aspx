<%@ page language="C#" autoeventwireup="true" inherits="Collection_S3GClnManualBucketClassification_View, App_Web_r4rfxxex" masterpagefile="~/Common/S3GMasterPageCollapse.master" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="Panel1" runat="server" GroupingText="Manual Bucket Classification"
                                CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLineofBusiness" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlLineofBusiness_SelectedIndexChanged" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblLineOfBusiness" runat="server" Text="Line of Business"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <uc:Suggest ID="ddlBranch" ToolTip="Location" runat="server" AutoPostBack="True"
                                                OnItem_Selected="ddlBranch_SelectedIndexChanged" ServiceMethod="GetBranchList"
                                                WatermarkText="--Select--" />

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBranch" runat="server" Text="Location"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDemandMonth" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlDemandMonth_SelectedIndexChanged" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDemandMonth" runat="server" Text="Demand Month"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDebtCollector" runat="server" Visible="false"
                                                OnSelectedIndexChanged="ddlDemandMonth_SelectedIndexChanged" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDebtCollector" runat="server" Text="Debt Collector" Visible="false"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <asp:GridView ID="grvPaging" runat="server" Width="100%" AutoGenerateColumns="false"
                                    OnRowDataBound="grvPaging_RowDataBound" OnRowCommand="grvPaging_RowCommand">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                    CommandArgument='<%# Bind("ID") %>' CommandName="Query" runat="server" />
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="true">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnEdit" runat="server" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                                    CommandArgument='<%# Bind("ID") %>' CommandName="Modify" />
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="styleGridHeader" Width="10%" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Debt Collector Code" SortExpression="DebtCollector Code" Visible="false">
                                            <ItemTemplate>
                                                <%--<asp:Label ID="lblDebtCollectorCode" runat="server" Text='<%# Bind("DebtCollector_Code") %>'></asp:Label>--%>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Demand Month" SortExpression="Demand_Month">
                                            <ItemTemplate>
                                                <asp:Label ID="lblROIRulenumber" runat="server" Text='<%# Bind("Demand_Month") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Line of Business" SortExpression="LOB">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLOBCode" runat="server" Text='<%# Bind("LOB") %>'></asp:Label>
                                                <asp:Label ID="lblCode" Visible="false" runat="server" Text='<%# Bind("LOBCode") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="styleGridHeader" Width="20%"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField HeaderText="Branch" SortExpression="Branch">
                                  <ItemTemplate>
                                        <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Branch") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" Width="20%"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Location" ItemStyle-Width="50%" SortExpression="Location">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="styleGridHeader" Width="20%"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%#Eval("Created_By")%>'></asp:Label>
                                                <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%#Eval("User_Level_ID")%>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="styleGridHeader"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblActive" Visible="false" runat="server" Text='<%#Bind("Active")%>'></asp:Label>
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
                        </div>
                    </div>
                     <div align="right" >
                        <button id="btnSearch" runat="server" title="Search[Alt+S]" accesskey="S"
                            class="css_btn_enabled" onserverclick="btnSearch_Click" type="button">
                            <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
                        </button>
                        <button id="btnCreate" runat="server" type="button" class="css_btn_enabled" title="Create[Alt+C]" accesskey="C"
                            onserverclick="btnCreate_Click">
                            <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                        </button>
                        <button id="btnclear" runat="server" type="button" class="css_btn_enabled" title="Clear[Alt+L]" accesskey="L"
                            onclick="if(fnConfirmClear())" onserverclick="btnclear_Click" causesvalidation="false">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                            <asp:CustomValidator ID="CVBucketClassificationView" runat="server" Display="None"></asp:CustomValidator>
                        </div>
                    </div>
                    <input type="hidden" id="hdnSortDirection" runat="server" />
                    <input type="hidden" id="hdnSortExpression" runat="server" />
                    <input type="hidden" id="hdnSearch" runat="server" />
                    <input type="hidden" id="hdnOrderBy" runat="server" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
