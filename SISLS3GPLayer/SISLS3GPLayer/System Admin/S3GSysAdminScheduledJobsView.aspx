<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Common/S3GMasterPageCollapse.master"
    CodeFile="S3GSysAdminScheduledJobsView.aspx.cs" Inherits="S3GSysAdminScheduledJobsView" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 grid">
                <asp:GridView ID="grvScheduledJobs" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="grid_details"
                    OnRowCommand="grvScheduledJobs_RowCommand" OnRowDataBound="grvScheduledJobs_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Query" SortExpression="ID" Visible="true" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                    AlternateText="Query" CommandArgument='<%# Bind("ID") %>' runat="server" CommandName="Query" />
                            </ItemTemplate>
                            <HeaderTemplate>
                                <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                            </HeaderTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Modify" SortExpression="ID" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgbtnEdit" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                    AlternateText="Modify" CommandArgument='<%# Bind("ID") %>' runat="server" CommandName="Modify" />
                            </ItemTemplate>
                            <HeaderTemplate>
                                <asp:Label ID="lblModify" runat="server" Text="Modify"></asp:Label>
                            </HeaderTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Job Description">
                            <ItemTemplate>
                                <asp:Label ID="lblJOB" runat="server" Text='<%# Bind("JobDescription") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderTemplate>
                                <table>
                                    <thead>
                                        <tr align="center">
                                            <th style="padding: 0px !important; background: none !important;">
                                                <asp:LinkButton ID="lnkbtnSort1" runat="server" Text="Job Description" ToolTip="Sort By Job Description"
                                                    OnClick="FunProSortingColumn"> </asp:LinkButton>
                                                <asp:Button ID="imgbtnSort1" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" />
                                            </th>
                                        </tr>
                                        <tr align="left">
                                            <th style="padding: 0px !important; background: none !important;">
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" AutoPostBack="true"
                                                        class="md-form-control form-control login_form_content_input"
                                                        OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="filterLOB" runat="server" TargetControlID="txtHeaderSearch1"
                                                        FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                        ValidChars="- " />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </th>
                                        </tr>
                                    </thead>
                                </table>
                            </HeaderTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Job Nature">
                            <HeaderTemplate>
                                <asp:Label ID="lblHJobNature" runat="server" Text="Job Nature"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblJobNature" runat="server" Text='<%# Bind("JobNature") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="20%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Frequency">
                            <HeaderTemplate>
                                <asp:Label ID="lblHFrequency" runat="server" Text="Frequency"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFrequency" runat="server" Text='<%# Bind("Frequency") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="20%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Start Date">
                            <HeaderTemplate>
                                <asp:Label ID="lblHStartDate" runat="server" Text="Start Date"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStartDate" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Start Time">
                            <HeaderTemplate>
                                <asp:Label ID="lblHStartTime" runat="server" Text="Start Time"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStartTime" runat="server" Text='<%# Bind("StartTime") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Active">
                            <HeaderTemplate>
                                <asp:Label ID="lblHActive" runat="server" Text="Active"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkIsActive" Enabled="false" runat="server" />
                                <asp:Label ID="lblActive" Visible="false" runat="server" Text='<%#Eval("Is_Active")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader">
                            <ItemTemplate>
                                <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%#Eval("Created_By")%>'></asp:Label>
                                <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%#Eval("User_Level_ID")%>'></asp:Label>
                            </ItemTemplate>
                            <%--<HeaderStyle CssClass="styleGridHeader"></HeaderStyle>--%>
                            <%--<ItemStyle HorizontalAlign="Center"></ItemStyle>--%>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:CustomValidator ID="cvErrormsg" runat="server">
                
                </asp:CustomValidator>
                <%--<asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatory"></asp:Label--%>
            </div>
        </div>
        <div align="right" class="fixed_btn">
            <button class="css_btn_enabled" id="btnCreate" title="Schedule[Alt+S]" causesvalidation="false"
                onserverclick="btnCreate_Click" runat="server"
                type="button" accesskey="S">
                <i class="fa fa-clock-o" aria-hidden="true"></i>&emsp;<u>S</u>chedule
            </button>
            <button class="css_btn_enabled" id="btnShowAll" title="Show All[Alt+H]" causesvalidation="false"
                onserverclick="btnShowAll_Click" runat="server"
                type="button" accesskey="L">
                <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow All
            </button>
            <button class="css_btn_enabled" id="btnMonitor" visible="false" title="Schedule Monitor[Alt+M]" causesvalidation="false" onserverclick="btnMonitor_Click" runat="server"
                type="button" accesskey="M">
                <i class="fa fa-calendar" aria-hidden="true"></i>&emsp;Schedule <u>M</u>onitor
            </button>
        </div>
        <%--<div class="row" style="float: right; margin-top: 5px;">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                <asp:Button ID="btnCreate" OnClick="btnCreate_Click" CssClass="save_btn fa fa-floppy-o" AccessKey="C" ToolTip="Create,Alt+C"
                    CausesValidation="false" Text="Schedule" runat="server"></asp:Button>
                <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                <asp:Button ID="btnShowAll" OnClick="btnShowAll_Click" runat="server" Text="Show All" AccessKey="H" ToolTip="Show All,Alt+H"
                    CssClass="save_btn fa fa-floppy-o" />
                <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                <asp:Button ID="btnMonitor" runat="server" Text="Schedule Monitor" ToolTip="Schedule Monitor,Alt+M" CssClass="save_btn fa fa-floppy-o"
                    OnClick="btnMonitor_Click" AccessKey="M" />
            </div>
        </div>--%>
    </div>
    <input type="hidden" id="hdnSortDirection" runat="server" />
    <input type="hidden" id="hdnSortExpression" runat="server" />
    <input type="hidden" id="hdnSearch" runat="server" />
    <input type="hidden" id="hdnOrderBy" runat="server" />
</asp:Content>
