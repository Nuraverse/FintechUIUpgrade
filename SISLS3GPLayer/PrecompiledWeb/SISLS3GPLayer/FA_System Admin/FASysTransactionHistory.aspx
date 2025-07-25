<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_FASysTransactionHistory, App_Web_mr11ufc2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagName="PageNavigator" TagPrefix="uc1" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagName="PageTransNavigator" TagPrefix="uc2" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../App_Themes/S3GTheme_Blue/AutoSuggestBox.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        function Location_ItemSelected(sender, e) {
            var hdnLocationID = $get('<%= hdnUserId.ClientID %>');
            hdnLocationID.value = e.get_value();
        }
        function Location_ItemPopulated(sender, e) {
            var hdnLocationID = $get('<%= hdnUserId.ClientID %>');
            hdnLocationID.value = '';
        }
        function Program_ItemSelected(sender, e) {
            var hdnLocationID = $get('<%= hdnProgram.ClientID %>');
            hdnLocationID.value = e.get_value();
        }
        function Program_ItemPopulated(sender, e) {
            var hdnLocationID = $get('<%= hdnProgram.ClientID %>');
            hdnLocationID.value = '';
        }
    </script>

    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" Text="Audit Trial" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:UpdatePanel ID="Up" runat="server">
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btnExportToExcel" />
                        </Triggers>

                        <ContentTemplate>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel ID="PnlInputCriteria0" GroupingText="Input Criteria" runat="server" CssClass="stylePanel">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtUserName" runat="server" OnTextChanged="txtUserName_TextChanged"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>
                                                    <cc1:AutoCompleteExtender ID="autoUserName" MinimumPrefixLength="1" OnClientPopulated="Location_ItemPopulated"
                                                        OnClientItemSelected="Location_ItemSelected" runat="server" TargetControlID="txtUserName"
                                                        ServiceMethod="GetUserName" Enabled="True" ServicePath="" CompletionSetCount="5"
                                                        CompletionListCssClass="CompletionList" DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
                                                        CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                                        ShowOnlyCurrentWordInCompletionListItem="true">
                                                    </cc1:AutoCompleteExtender>
                                                    <cc1:TextBoxWatermarkExtender ID="txtBranchExtender" runat="server" TargetControlID="txtUserName"
                                                        WatermarkText="--Select--">
                                                    </cc1:TextBoxWatermarkExtender>
                                                    <asp:HiddenField ID="hdnUserId" runat="server" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="lblUserCode" runat="server" Text="User Code"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtProgramName" runat="server" OnTextChanged="txtProgramName_TextChanged"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>
                                                    <cc1:AutoCompleteExtender ID="AutoProgramNameSearch" MinimumPrefixLength="1" OnClientPopulated="Program_ItemPopulated"
                                                        OnClientItemSelected="Program_ItemSelected" runat="server" TargetControlID="txtProgramName"
                                                        ServiceMethod="GetProgramName" Enabled="True" ServicePath="" CompletionSetCount="5"
                                                        CompletionListCssClass="CompletionList" DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
                                                        CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                                        ShowOnlyCurrentWordInCompletionListItem="true">
                                                    </cc1:AutoCompleteExtender>
                                                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtProgramName"
                                                        WatermarkText="--Select--">
                                                    </cc1:TextBoxWatermarkExtender>
                                                    <asp:HiddenField ID="hdnProgram" runat="server" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="lblProgramName" runat="server" Text="Program Name"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFromDate" AutoPostBack="true" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>
                                                    <cc1:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" Enabled="True"
                                                        TargetControlID="txtFromDate" Format="dd/MM/yyyy">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" SetFocusOnError="True"
                                                            ControlToValidate="txtFromDate" ValidationGroup="GO" runat="server" ErrorMessage="Enter Date From"
                                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label runat="server" Text="Date From" ID="lblDate" CssClass="styleReqFieldLabel"
                                                            ToolTip="Date From"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtToDate" AutoPostBack="true" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>
                                                    <cc1:CalendarExtender ID="txtToDate_CalendarExtender" runat="server" Enabled="True"
                                                        TargetControlID="txtToDate" Format="dd/MM/yyyy">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtToDate"
                                                            SetFocusOnError="True" ValidationGroup="GO" runat="server" ErrorMessage="Enter Date To"
                                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label runat="server" Text="Date To" ID="lblDateTo" CssClass="styleReqFieldLabel"
                                                            ToolTip="Date To"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div align="right">
                                            <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="GO" runat="server"
                                                type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                            </button>
                                        </div>










                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel ID="Panel1" GroupingText="Transaction History Deatils" runat="server"
                                        CssClass="stylePanel">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="gird">
                                                    <asp:GridView ID="gvTransactionDetails" runat="server" EmptyDataText="No Disbursal Details Found!..."
                                                        AutoGenerateColumns="false" OnRowCommand="GrdUsers_RowCommand" OnRowDataBound="GrdUsers_RowDataBound"
                                                        Width="100%">
                                                        <RowStyle HorizontalAlign="Left" />
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderStyle-CssClass="styleGridHeader" ItemStyle-HorizontalAlign="Left"
                                                                HeaderStyle-HorizontalAlign="Center">
                                                                <HeaderTemplate>
                                                                    <span>User Name</span>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblUserName" runat="server" Text='<%#Bind("USERNAME") %>'></asp:Label>
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
                                            </div>
                                        </div>
                                        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                                        <asp:ValidationSummary ID="vsApplicationProcessing" runat="server" CssClass="styleMandatoryLabel"
                                            Enabled="true" Width="98%" ShowMessageBox="true" ShowSummary="false" ValidationGroup="GO"
                                            HeaderText="Correct the following validation(s):  " />
                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel ID="Panel2export" GroupingText="Export" runat="server" CssClass="stylePanel">
                                        <div align="right">
                                            <button class="css_btn_enabled" id="btnExportToExcel" onserverclick="btnExcel_Click" runat="server"
                                                type="button" causesvalidation="true" accesskey="E" title="Excel,Alt+E">
                                                <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                                            </button>
                                        </div>


                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display: none;">
                                                <div class="gird">
                                                    <asp:GridView ID="GrdTransHistory" runat="server" AutoGenerateColumns="false" Width="100%">
                                                        <Columns>
                                                            <asp:BoundField HeaderText="USER NAME" DataField="USERNAME" HeaderStyle-CssClass="styleGridHeader"
                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="PROGRAM NAME" DataField="PROGRAMNAME" HeaderStyle-CssClass="styleGridHeader"
                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="DOCUMENT CODE" DataField="DOCUMENTCODE" HeaderStyle-CssClass="styleGridHeader"
                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="DOCUMENT DATE" DataField="DOCUMENTDATE" DataFormatString="{0:dd-MM-yyyy}"
                                                                HeaderStyle-CssClass="styleGridHeader" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="DATE AND TIME" DataField="C_DATE" DataFormatString="{0:dd-MM-yyyy hh:mm:ss tt}"
                                                                HeaderStyle-CssClass="styleGridHeader" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="IP ADDRESS" DataField="Ip_Address" HeaderStyle-CssClass="styleGridHeader"
                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="ACTION" DataField="ACTION" HeaderStyle-CssClass="styleGridHeader"
                                                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                <HeaderStyle HorizontalAlign="Left" CssClass="styleGridHeader"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                            </asp:BoundField>

                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
