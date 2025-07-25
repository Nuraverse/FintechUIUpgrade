<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="Reports_S3GRptOverDueStatus, App_Web_r4rfxxex" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagName="PageNavigator" TagPrefix="uc1" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc3" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript">
        function fnLoadCustomer() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCustomer').click();
        }

        function Common_ItemSelected(sender, e) {
            var hdnCommonID = $get('<%= hdnCommonID.ClientID %>');
            hdnCommonID.value = e.get_value();
        }
        function Common_ItemPopulated(sender, e) {
            var hdnCommonID = $get('<%= hdnCommonID.ClientID %>');
            hdnCommonID.value = '';
        }

        function fnTrashCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustomerCodeLease.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustomerCodeLease.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustomerCodeLease.ClientID %>').value = "";


                }
            }
        }

    </script>
    <asp:UpdatePanel ID="updCheqRetRpt" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label ID="lblHeading" runat="server" CssClass="styleDisplayLabel" Text="Overdue Status Report"></asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlChequeReturnReport" runat="server" CssClass="stylePanel" Width="97%" GroupingText="Overdue Status Report">
                            <div class="row">
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLineofBusiness" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLineofBusiness_SelectedIndexChanged" ToolTip="Line of Business"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvLineofBusiness" runat="server" ControlToValidate="ddlLineofBusiness" Display="Dynamic"
                                                InitialValue="-1" ValidationGroup="btnGo" ErrorMessage="Select Line of Business"
                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLineofBusiness" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business" ToolTip="Line of Business"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLocation1" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlLocation1_SelectedIndexChanged" ToolTip="Branch"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLocation1" runat="server" CssClass="styleDisplayLabel" Text="Branch" ToolTip="Branch"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <span class="highlight"></span>
                                        <asp:TextBox ID="txtCustomerCodeLease" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            Style="display: none;" MaxLength="100"></asp:TextBox>
                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" ToolTip="Customer Name" HoverMenuExtenderLeft="true" runat="server" ShowHideAddressImageButton="false"
                                            AutoPostBack="true" DispalyContent="Both" strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                        <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_OnClick"
                                            Style="display: none" />
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" id="DivAccountNo">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtDocumentNumberSearch" runat="server" MaxLength="50" OnTextChanged="txtDocumentNumberSearch_OnTextChanged"
                                            AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:AutoCompleteExtender ID="aceCommonCon" MinimumPrefixLength="3" OnClientPopulated="Common_ItemPopulated"
                                            OnClientItemSelected="Common_ItemSelected"
                                            runat="server" TargetControlID="txtDocumentNumberSearch" ServiceMethod="GetAccountList"
                                            CompletionSetCount="5" Enabled="True" ServicePath="" CompletionListCssClass="CompletionList"
                                            DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass"
                                            CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                            ShowOnlyCurrentWordInCompletionListItem="true">
                                        </cc1:AutoCompleteExtender>
                                        <cc1:TextBoxWatermarkExtender ID="txtWatermarkExtender" runat="server" TargetControlID="txtDocumentNumberSearch"
                                            WatermarkText="--Select--">
                                        </cc1:TextBoxWatermarkExtender>
                                        <asp:HiddenField ID="hdnCommonID" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblAccountNumber" CssClass="styleDisplayLabel" Text="Account Number" ToolTip="Account Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" style="display: none">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLocation2" runat="server" Enabled="false" ToolTip="Sub Branch" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlLocation2_SelectedIndexChanged"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLocation2" runat="server" CssClass="styleDisplayLabel" Text="Sub Branch" ToolTip="Sub Branch"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtDateFrom" runat="server" ToolTip="Agreement Date From"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <%--<div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvDateFrom" runat="server" ControlToValidate="txtDateFrom" ErrorMessage="Select Agreement Date From"
                                                Display="Dynamic" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>--%>
                                        <asp:Image ID="imgDateFrom" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Agreement Date From" Visible="false" />
                                        <cc1:CalendarExtender ID="CEDateFrom" runat="server" TargetControlID="txtDateFrom" PopupButtonID="imgDateFrom"
                                            OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupPosition="BottomLeft">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblDateFrom" runat="server" CssClass="styleFieldLabel" Text="Agreement Date From"
                                                ToolTip="Agreement Date From"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtDateTo" runat="server"
                                            OnTextChanged="txtDateTo_TextChanged" AutoPostBack="true" ToolTip="Agreement Date To"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <%--<div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvDateTo" runat="server" ControlToValidate="txtDateTo" ErrorMessage="Select Agreement Date To"
                                                Display="Dynamic" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>--%>
                                        <asp:Image ID="imgDateTo" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Agreement Date To" Visible="false" />
                                        <cc1:CalendarExtender ID="CEDateTo" runat="server" TargetControlID="txtDateTo" PopupButtonID="imgDateTo"
                                            OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupPosition="BottomLeft">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblDateTo" runat="server" CssClass="styleFieldLabel" Text="Agreement Date To"
                                                ToolTip="Agreement Date To"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="Txt_Chq_Rtn_datefrom" runat="server" ToolTip="Cutoff Date"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                ControlToValidate="Txt_Chq_Rtn_datefrom" ErrorMessage="Select Cutoff Date"
                                                Display="Dynamic" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Cutoff Date" Visible="false" />
                                        <cc1:CalendarExtender ID="CECRDFrom" runat="server" TargetControlID="Txt_Chq_Rtn_datefrom" PopupButtonID="imgDateFrom"
                                            OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupPosition="BottomLeft">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="Label1" runat="server" CssClass="styleReqFieldLabel" Text="Cutoff Date" ToolTip="Cutoff Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" style="display: none">
                                    <div class="md-input">
                                        <asp:TextBox ID="Txt_Chq_Rtn_dateTo" runat="server" ToolTip="Cheque Return To"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Txt_Chq_Rtn_dateTo"
                                                ErrorMessage="Select Cheque Return Date To" Enabled="false"
                                                Display="Dynamic" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Cheque Return To" Visible="false" />
                                        <cc1:CalendarExtender ID="CECRDTo" runat="server" TargetControlID="Txt_Chq_Rtn_dateTo" PopupButtonID="imgDateTo"
                                            OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupPosition="BottomLeft">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="Label2" runat="server" CssClass="styleReqFieldLabel" Text="Cheque Return To" ToolTip="Cheque Return To"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" style="display: none">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlDepositBank" ToolTip="Deposit Bank" runat="server" AutoPostBack="true"
                                            CssClass="md-form-control form-control"
                                            onmouseover="ddl_itemchanged(this);">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Deposit Bank" ID="lblDepositBank" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkAccountLevel" runat="server" ToolTip="With Collection" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <asp:Label ID="lblAccountLevel" runat="server" CssClass="styleDisplayLabel"
                                            Text="With Collection" ToolTip="With Collection"></asp:Label>

                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlDenomination" runat="server" ToolTip="Denomination"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblDenomination" runat="server" CssClass="styleDisplayLabel" Text="Denomination" ToolTip="Denomination"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" id="DivFirstChqRtn" style="display: none">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkFirstChqRtn" AutoPostBack="true" OnCheckedChanged="chkAccountLevel_CheckedChanged" runat="server" ToolTip="Account Level" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <asp:Label ID="LblFirstChqRtn" runat="server" CssClass="styleDisplayLabel" Text="First Time Cheque Return" ToolTip="First Time Cheque Return"></asp:Label>

                                    </div>
                                </div>

                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <uc2:Suggest id="ucDebtCollectorName" runat="server" servicemethod="GetDCList" tooltip="Debt Collector Name" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Debt Collector Name" ID="lblDebCollectorName" CssClass="styleDisplayLabel" ToolTip="Debt Collector Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                        </asp:Panel>
                    </div>
                </div>

                <div align="right">
                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="btnGo" runat="server"
                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnExport" title="Export Report Details[Alt+P]" causesvalidation="false" onserverclick="btnExport_Click"
                        runat="server" type="button" accesskey="P">
                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Ex<u>p</u>ort
                    </button>
                </div>
            </div>

            <div class="row">

                <div id="trLocationCustLevel" runat="server" class="col-lg-12 col-md-12 col-sm-12 col-xs-12" visible="false">


                    <asp:Panel ID="PnlLocationCustLevel" runat="server" CssClass="stylePanel" Width="99%" GroupingText="Cheque Return Report Details - Branch / Customer Level">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <asp:GridView ID="GrdLocationCustLevel" runat="server" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("S_No") %>' ToolTip="S.No"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Branch">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocation_dsp" runat="server" Text='<%#Bind("Location") %>' ToolTip="Branch"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer Name">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomerName" runat="server" Text='<%#Bind("[Customer Name]") %>' ToolTip="Customer Name"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count of Cheques Banked">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCountofChequesBanked" runat="server" Text='<%#Bind("[Count of Cheques Banked]") %>' ToolTip="Count of Cheques Banked"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count of Bounces">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCountofBounces" runat="server" Text='<%#Bind("[Count of Bounces]") %>' ToolTip="Count of Bounces"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="% of Bounces">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBouncesPer" runat="server" Text='<%#Bind("[% of Bounces]") %>' ToolTip="% of Bounces"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div class="row">
                <div id="trAccountLevel" runat="server" class="col-lg-12 col-md-12 col-sm-12 col-xs-12" visible="false">
                    <asp:Panel ID="PnlAccountLevel" runat="server" CssClass="stylePanel" Width="97%" GroupingText="Overdue Status Report Details">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <div id="dvAccountLevel" runat="server" style="overflow-x: scroll; overflow-y: scroll">

                                        <asp:GridView runat="server" ID="GrdAccountLevel" Width="100%" AutoGenerateColumns="true"
                                            HeaderStyle-CssClass="styleGridHeader"
                                            RowStyle-HorizontalAlign="Left">
                                        </asp:GridView>

                                        <%-- <asp:GridView ID="GrdAccountLevel" runat="server" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Bind("S_No") %>' ToolTip="S.No"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="LOB">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLob" runat="server" Width="90px" Text='<%#Bind("Product") %>' ToolTip="LOB"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Branch">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation_G1" runat="server" Width="90px" Text='<%#Bind("[Branch Name]") %>' ToolTip="Branch"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Customer Name">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustomerName" runat="server" Width="130px" Text='<%#Bind("[Customer Name]") %>' ToolTip="Customer Name"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Account No">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAccountNo" runat="server" Width="80px" Text='<%#Bind("[Account Number]") %>' ToolTip="Account No"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>

                                        <%--<asp:TemplateField HeaderText="Receipt Number">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblReceiptNumber" runat="server" Text='<%#Bind("[RECEIPT_NO]") %>' ToolTip="Receipt Number" Width="100px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Receipt Date">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblReceiptDate" runat="server" Text='<%#Bind("[Receipt Date]") %>' ToolTip="Receipt Date" Width="100px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Receipt Amount">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblReceiptAmount" runat="server" Text='<%#Bind("[Receipt Amount]") %>' ToolTip="Receipt Amount"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Instrument No">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstrumentNo" runat="server" Width="80px" Text='<%#Bind("[Instrument No]") %>' ToolTip="Instrument No"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Instrument Date">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstrumentDate" runat="server" Text='<%#Bind("[Instrument Date]") %>' ToolTip="Instrument Date"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Mode">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMode" runat="server" Text='<%#Bind("Mode") %>' ToolTip="Mode"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Drawee Bank Name">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDraweeBankName" runat="server" Width="100px" Text='<%#Bind("[Drawee Bank Name]") %>' ToolTip="Drawee Bank Name"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Cheque Return Number">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblChqRtnNo" runat="server" Width="130px" Text='<%#Bind("[CHEQUE_RETURN_NO]") %>' ToolTip="Cheque Return Number"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Bounce Date">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBounceDate" runat="server" Text='<%#Bind("[Bounce Date]") %>' ToolTip="Bounce Date" Width="100px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Deposit Bank">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDepostBankName" runat="server" Width="100px" Text='<%#Bind("[DEPOSIT_BANK_NAME]") %>' ToolTip="Deposit Bank"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Bounce Reason">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBounceReason" runat="server" Width="100px" Text='<%#Bind("[Bounce_Reason]") %>' ToolTip="Bounce Reason"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Installment No">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstallmentNo" runat="server" Width="100px" Text='<%#Bind("INSTALLMENT_NO") %>' ToolTip="Installment No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Arrears" Visible="false">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblArrears" runat="server" Width="80px" Text='<%#Bind("Arrears") %>' ToolTip="Arrears"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Over Due">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOverDue" runat="server" Width="100px" Text='<%#Bind("OVER_DUE") %>' ToolTip="Over Due"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Marketing Officer">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMarkettingOfficer" runat="server" Width="100px" Text='<%#Bind("MARKETTING_OFFICER") %>' ToolTip="Marketing Officer"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Debt collector">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDebtcollector" runat="server" Width="100px" Text='<%#Bind("DEBT_COL_NAME") %>' ToolTip="Debt collector"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Paid Date">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPaid_Date" runat="server" Width="100px" Text='<%#Bind("PAID_DATE") %>' ToolTip="Paid Date"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Remarks">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRemarks" runat="server" Width="100px" Text='<%#Bind("REMARKS") %>'
                                                            ToolTip="Remarks" Style="text-wrap: inherit;"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>

                                        <%--                                            </Columns>
                                        </asp:GridView>--%>
                                        <uc1:PageNavigator ID="ucCustomPagingAccLevel" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="vsChequeRetRpt" runat="server" Visible="false" ValidationGroup="btnGo" ShowSummary="false" />
                </div>
            </div>

            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExport" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
