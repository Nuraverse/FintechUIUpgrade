<%@ Page Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="S3GSysTransactionHistory.aspx.cs" Inherits="System_Admin_S3GSysTransactionHistory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagName="PageNavigator" TagPrefix="uc1" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagName="PageTransNavigator" TagPrefix="uc2" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../App_Themes/S3GTheme_Blue/AutoSuggestBox.css" rel="Stylesheet" type="text/css" />

    <asp:UpdatePanel ID="Up" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExportToExcel" />

        </Triggers>
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="Audit Trail" ID="lblHeading"> </asp:Label>
                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="PnlInputCriteria0" GroupingText="Input Criteria" runat="server" CssClass="stylePanel">
                            <div class="row">

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <uc2:Suggest ID="txtUserName" runat="server" OnItem_Selected="txtUserName_Item_Selected" AutoPostBack="true" ServiceMethod="GetUserName" IsMandatory="false" class="md-form-control form-control" />
                                        <asp:HiddenField ID="hdnUserId" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <span>User Id/User Name</span>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <uc2:Suggest ID="txtProgramName" runat="server" OnItem_Selected="txtProgramName_Item_Selected" AutoPostBack="true" ServiceMethod="GetProgramName" IsMandatory="false" class="md-form-control form-control" />
                                        <asp:HiddenField ID="hdnProgram" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <span>Program Name</span>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtFromDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="txtFromDate">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                ControlToValidate="txtFromDate" ValidationGroup="GO" runat="server" ErrorMessage="Enter the Date From"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Date From" ID="lblDate" CssClass="styleReqFieldLabel"
                                                ToolTip="Date From"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtToDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:CalendarExtender ID="txtToDate_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="txtToDate">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtToDate" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                ValidationGroup="GO" runat="server" ErrorMessage="Enter the Date To"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Date To" ID="lblDateTo" CssClass="styleReqFieldLabel"
                                                ToolTip="Date To"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                            </div>

                            <div class="row" align="right">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" runat="server" onclick="if(fnCheckPageValidators('GO',true))"
                                        type="button" accesskey="G" title="Go[Alt+G]" causesvalidation="false">
                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                    </button>
                                </div>
                            </div>

                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlTransacDetails" Visible="false" GroupingText="Transaction History Details" runat="server" CssClass="stylePanel">
                            <div class="grid">
                                <asp:GridView ID="gvTransactionDetails" runat="server" EmptyDataText="No Records Found!..." Width="100%"
                                    AutoGenerateColumns="false" OnRowCommand="GrdUsers_RowCommand" OnRowDataBound="GrdUsers_RowDataBound" class="gird_details">
                                    <RowStyle HorizontalAlign="Left" />
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <Columns>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="styleGridHeader">
                                            <HeaderTemplate>
                                                <span>S.No</span>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblSNO" runat="server" Text='<%#Bind("SNO") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <span>User Id/User Name</span>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserName" runat="server" Text='<%#Bind("Username") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <span>Program Name</span>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserName" runat="server" Text='<%#Bind("PROGRAMNAME") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <span>Document Code</span>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserName" runat="server" Text='<%#Bind("DOCUMENTCODE") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <span>Document Date</span>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserName" runat="server" Text='<%#Bind("DOCUMENTDATE") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <span>Date and Time</span>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserName" runat="server" Text='<%#Bind("C_DATE") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <span>IP Address</span>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserName" runat="server" Text='<%#Bind("Ip_Address") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <span>Machine Name</span>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblSystemName" runat="server" Text='<%#Bind("MACHINE_NAME") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <span>Report Sequence</span>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblRptSeq" runat="server" Text='<%#Bind("Report_Sequence") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <span>Action</span>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserName" runat="server" Text='<%#Bind("ACTION") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                            <%--  <div class="row">
                                <div class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                </div>
                            </div>--%>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="Panel2export" GroupingText="Export" runat="server" CssClass="stylePanel">
                            <div class="row" style="float: right; margin-top: 5px;">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <button class="css_btn_enabled" id="btnExportToExcel" onserverclick="btnExcel_Click" runat="server" onclick="if(fnCheckPageValidators('GO',true))"
                                        type="button" accesskey="C" title="Excel[Alt+C]" causesvalidation="false">
                                        <i class="fa fa-file-excel-o btn_i" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                                    </button>

                                </div>
                            </div>
                            <div class="row">
                                <div class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:GridView ID="GrdTransHistory" runat="server" AutoGenerateColumns="false" class="gird_details">
                                        <Columns>
                                            <asp:BoundField HeaderText="S.No" DataField="ROWNUM" HeaderStyle-CssClass="styleGridHeader"
                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField HeaderText="User Id/User Name" DataField="USERNAME" HeaderStyle-CssClass="styleGridHeader"
                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField HeaderText="Program Name" DataField="PROGRAMNAME" HeaderStyle-CssClass="styleGridHeader"
                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField HeaderText="Document Code" DataField="DOCUMENTCODE" HeaderStyle-CssClass="styleGridHeader"
                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField HeaderText="Document Date" DataField="DOCUMENTDATE" DataFormatString="{0:dd-MM-yyyy}"
                                                HeaderStyle-CssClass="styleGridHeader" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField HeaderText="Date And Time" DataField="C_DATE" DataFormatString="{0:dd-MM-yyyy hh:mm:ss tt}"
                                                HeaderStyle-CssClass="styleGridHeader" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField HeaderText="IP Address" DataField="Ip_Address" HeaderStyle-CssClass="styleGridHeader"
                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                                                HeaderStyle-HorizontalAlign="Center">
                                                <HeaderTemplate>
                                                    <span>Machine Name</span>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSystemName" runat="server" Text='<%#Bind("MACHINE_NAME") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Report Sequence No" DataField="RPT_SEQ_NUMBER" HeaderStyle-CssClass="styleGridHeader"
                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField HeaderText="Action" DataField="ACTION" HeaderStyle-CssClass="styleGridHeader"
                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:BoundField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <%--   <div class="row" style="display: none;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsApplicationProcessing" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" Width="98%" ShowMessageBox="false" ShowSummary="false" ValidationGroup="GO"
                            HeaderText="Correct the following validation(s):  " />
                    </div>

                </div>--%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
