<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_ReportScheduler, App_Web_zznul5le" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagName="PageNavigator" TagPrefix="uc1" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagName="PageTransNavigator" TagPrefix="uc2" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../App_Themes/S3GTheme_Blue/AutoSuggestBox.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        function Location_ItemSelected(sender, e) {
            var hdnLocationID = $get('<%= hdnLocationID.ClientID %>');
            hdnLocationID.value = e.get_value();
        }
        function Location_ItemPopulated(sender, e) {
            var hdnLocationID = $get('<%= hdnLocationID.ClientID %>');
            hdnLocationID.value = '';
        }

    </script>
    <%-- <table width="100%">
        <tr>
            <td valign="top" class="stylePageHeading">
                <asp:Label runat="server" Text="Report Scheduler" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
            </td>
        </tr>
    </table>--%>

    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" Text="Report Scheduler" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                </h6>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <asp:Panel ID="PnlInputCriteria0" GroupingText="Input Criteria" runat="server" CssClass="stylePanel">


                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:TextBox ID="txtFromDate" class="md-form-control form-control" ValidationGroup="btngo" AutoPostBack="true" runat="server"></asp:TextBox>
                            <cc1:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="txtFromDate" Format="dd/MM/yyyy">
                            </cc1:CalendarExtender>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" Text="From Date" ID="lblFromDate" CssClass="styleDisplayLabel" ToolTip="From Date">
                                </asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:TextBox ID="txtToDate" class="md-form-control form-control" AutoPostBack="true" runat="server"></asp:TextBox>
                            <cc1:CalendarExtender ID="txtToDate_CalendarExtender" runat="server" Enabled="True"
                                TargetControlID="txtToDate" Format="dd/MM/yyyy">
                            </cc1:CalendarExtender>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" Text="To Date" ID="lblDateTo" CssClass="styleDisplayLabel" ToolTip="To Date">
                                </asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:TextBox ID="txtUserName" class="md-form-control form-control" runat="server" AutoPostBack="true" OnTextChanged="txtUserName_TextChanged"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True"
                                TargetControlID="txtToDate" Format="dd/MM/yyyy">
                            </cc1:CalendarExtender>
                            <cc1:AutoCompleteExtender ID="autoUserName" MinimumPrefixLength="1" EnableCaching="false" OnClientPopulated="Location_ItemPopulated"
                                OnClientItemSelected="Location_ItemSelected" runat="server" TargetControlID="txtUserName"
                                ServiceMethod="GetUserName" Enabled="True" ServicePath="" CompletionSetCount="5"
                                CompletionListCssClass="CompletionList" DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
                                CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                ShowOnlyCurrentWordInCompletionListItem="true">
                            </cc1:AutoCompleteExtender>
                            <cc1:TextBoxWatermarkExtender ID="txtBranchExtender" runat="server" TargetControlID="txtUserName"
                                WatermarkText="--Select--">
                            </cc1:TextBoxWatermarkExtender>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" Text="Requester" ID="lblDate"
                                    ToolTip="Requester"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:DropDownList ID="ddlprogramName" class="md-form-control form-control" runat="server"></asp:DropDownList>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" Text="Requester" ID="lblReportName"
                                    ToolTip="Report Name"></asp:Label>
                            </label>
                        </div>
                    </div>
                </div>
            </asp:Panel>

        </div>
    </div>


    <div align="right">
        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Ok" runat="server"
            type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
        </button>
        <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click1" validationgroup="Ok" runat="server"
            type="button" causesvalidation="true" accesskey="L" title="Go,Alt+L">
            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u></u>Clear
        </button>
        <button class="css_btn_enabled" id="btnAddSchedule" onserverclick="btn_Schedule_Onclick" validationgroup="Ok" runat="server"
            type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
            <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>A</u>ddSchedule
        </button>
    </div>

    <asp:Panel ID="Panel1" GroupingText="Report Schedule Details" runat="server"
        CssClass="stylePanel">
        <asp:GridView ID="gvScheduleDetails" runat="server" EmptyDataText="No Disbursal Details Found!..."
            AutoGenerateColumns="false" OnRowCommand="GrdUsers_RowCommand" OnRowDataBound="GrdUsers_RowDataBound"
            Width="100%">
            <RowStyle HorizontalAlign="Left" />
            <HeaderStyle HorizontalAlign="Left" />
            <Columns>
                <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                    HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        <span>RequesterId</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="ReqIdhyplnkView" runat="server" Text='<%#Bind("RequesterId") %>' OnClick="LnkReqIdView_Click">DownLoad</asp:LinkButton>
                        <asp:Label ID="lblReport_Id" runat="server" Text='<%#Bind("REPORT_ID") %>' Visible="false"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                    HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        <span>Requester Name</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblRequesterName" runat="server" Text='<%#Bind("Requester_Name") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                    HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        <span>Date</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDate" runat="server" Text='<%#Bind("C_Date") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                    HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        <span>Schedule At</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSchedule" runat="server" Text='<%#Bind("ShceduleAt") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                    HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        <span>Status</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%#Bind("Status") %>'></asp:Label>
                        <asp:Label ID="statusId" Visible="false" runat="server" Text='<%#Bind("Status_Id") %>'></asp:Label>

                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                    HeaderStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        <span>Download Link</span>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbldownload" Visible="false" runat="server" Text='<%#Bind("DownLoad") %>'></asp:Label>
                        <asp:LinkButton ID="ImghyplnkView" runat="server" OnClick="ImghyplnkView_Click">Download</asp:LinkButton>

                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
        <asp:ValidationSummary ID="vsApplicationProcessing" runat="server" CssClass="styleMandatoryLabel"
            Enabled="true" Width="98%" ShowMessageBox="true" ShowSummary="false" ValidationGroup="btngo"
            HeaderText="Correct the following validation(s):  " />
        <asp:HiddenField ID="hdnLocationID" runat="server" />
    </asp:Panel>
</asp:Content>
