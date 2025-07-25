<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="S3GSysAdminScheduleMonitor, App_Web_xht0hlsp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" ToolTip="Holiday Master">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel ID="pnlGen" runat="server" CssClass="stylePanel" GroupingText="Scheduled Jobs Monitor">
                                            <div class="row">
                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true"
                                                            class="md-form-control form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                                            <asp:ListItem Text="All" Value="0" Selected="True">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Completed" Value="C"></asp:ListItem>
                                                            <asp:ListItem Text="In Progress" Value="WIP"></asp:ListItem>
                                                            <asp:ListItem Text="Pending" Value="O"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblStatus" runat="server" CssClass="styleDisplayLabel" Text="Status"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 grid">
                                                    <asp:GridView ID="grvJobs" runat="server" AutoGenerateColumns="false" Width="100%" CssClass="gird_details"
                                                        OnRowDataBound="grvJobs_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Sl. No.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSl" runat="server" Text='<%# Bind("RowNumber") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Location" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblLocation" Style="padding-left: 3px" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Job" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblJob" Style="padding-left: 3px" runat="server" Text='<%# Bind("Job") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Start Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStartDate" Style="padding-left: 3px" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="End Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEndDate" Style="padding-left: 3px" runat="server" Text='<%# Bind("EndDate") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Status" ItemStyle-Width="50px">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="imgStatus" runat="server" ImageUrl="~/Images/animation_processing.gif"
                                                                        Height="15px" Width="15px" />
                                                                    <asp:Label ID="lblProcess" Style="padding-left: 2px" runat="server" Text='<%# Bind("Process") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                                                </div>
                                            </div>
                                            <div class="row" id="trNoRecord" runat="server">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Label ID="lblNoRecord" runat="server" CssClass="styleDisplayLabel" Text="-- No Records found to show --"></asp:Label>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <span runat="server" id="lblErrorMessage" class="styleMandatoryLabel"></span>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick"></asp:AsyncPostBackTrigger>
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:Timer ID="Timer1" runat="server" Interval="7000" Enabled="false" OnTick="Timer1_Tick">
                        </asp:Timer>

                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:CustomValidator ID="cvScheduledJobs" runat="server" CssClass="styleReqFieldLabel"
                                    Enabled="true" />
                            </div>
                        </div>
                        <input type="hidden" id="hdnSortDirection" runat="server" />
                        <input type="hidden" id="hdnSortExpression" runat="server" />
                        <input type="hidden" id="hdnSearch" runat="server" />
                        <input type="hidden" id="hdnOrderBy" runat="server" />
                    </div>
                </div>
                  <div class="row" style="float: right; margin-top: 5px;">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <%--  <i class="fa fa-share btn_i"></i>
                <asp:Button ID="btnCancel" Text="Exit" runat="server" OnClick="btnCancel_Click"
                    CssClass="save_btn fa fa-share-o" ToolTip="Exit,Alt+X" />--%>
            <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                type="button" accesskey="X">
                <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
            </button>
        </div>
    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>

  
</asp:Content>
