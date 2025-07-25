<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GLoanAdFactoringInvoiceLoading, App_Web_razugfam" title="Factoring Invoice Loading" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register TagPrefix="uc5" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="ICM" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function fnLoadCustomer() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }

        function fnTrashCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=ucAccountLov.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=ucAccountLov.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=ucAccountLov.ClientID %>').value = "";

                }
            }
        }

        function fnTrashCommonSuggestCust(e) {
            //Sathish R--13-11-2018
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
            }
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                //alert('test1');
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=ucCustomerCodeLovPro.ClientID %>').value = "";

            }
            if (document.getElementById(e + '_TxtName').value == "") {
                //alert('test2');
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=ucCustomerCodeLovPro.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {
                //alert('test3');
                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    //alert('test4');
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + 'ucCustomerCodeLovPro').value = "0";
                    document.getElementById('<%=ucCustomerCodeLovPro.ClientID %>').value = "";
                }
            }
        }

        function fnTrashSuggest(e) {


            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_txtItemName').value = "";
            }
            if (document.getElementById(e + '_txtItemName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_txtItemName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                }
            }
        }

    </script>
    <style type="text/css">
        .btn_5_disabled
        {
            width: 27px !important;
            height: 27px !important;
            border-radius: 0px;
            box-shadow: none !important;
            border: none !important;
            line-height: 14px !important;
            background-color: #D7D7D7 !important;
            color: white !important;
            background-image: none !important;
        }
    </style>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div id="tab-content" class="tab-content">
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
                        <asp:Panel ID="pnlFactoringDetails" runat="server" CssClass="stylePanel" GroupingText="Factoring Invoice Followup Entry"
                            Width="99%">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" class="md-form-control form-control" ToolTip="Line of Business">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="rfvLineofBusiness" runat="server" ControlToValidate="ddlLOB" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the Line of Business" InitialValue="-1" SetFocusOnError="True" ValidationGroup="Header"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" Width="200px"
                                            strLOV_Code="ACC_ACCFIFE" ServiceMethod="GetAccountList" OnItem_Selected="ucAccountLov_Item_Selected" />
                                        <asp:Button ID="btnLoadAccount" runat="server" Text="Account number" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                            Style="display: none" />
                                        <asp:TextBox ID="TextBox2" runat="server" Visible="false"></asp:TextBox>
                                        <asp:TextBox ID="txtCustomerID" runat="server" Visible="false"></asp:TextBox>
                                        <asp:HiddenField ID="hdnCustId" runat="server" />
                                        <asp:HiddenField ID="hdnAccountID" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Account number" ID="lblprimeaccno" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <uc4:ICM ID="ucCustomerCodeLovPro" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" Enabled="false" AutoPostBack="true" DispalyContent="Both" class="md-form-control form-control"
                                            strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" />
                                        <asp:Button ID="btnLoadCust" runat="server" Text="Load Client Name" CausesValidation="false" UseSubmitBehavior="false" Visible="false"
                                            Style="display: none" />
                                        <asp:TextBox runat="server" ID="txtCustomerName" ToolTip="Client Name" Visible="false"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:HiddenField ID="hdnCustomerCode" runat="server" />
                                        <asp:HiddenField ID="hdnCustomerId" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblCustomerName" CssClass="styleReqFieldLabel" Text="Client Name"></asp:Label>
                                        </label>
                                        <input type="hidden" id="hdnSortDirection" runat="server" />
                                        <input type="hidden" id="hdnSortExpression" runat="server" />
                                        <input type="hidden" id="hdnSearch" runat="server" />
                                        <input type="hidden" id="hdnOrderBy" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <uc4:ICM ID="ucEntityCode" class="md-form-control form-control" HoverMenuExtenderBottom="true" runat="server" ServiceMethod="GetClientCodeList" OnItem_Selected="ucEntityCode_Item_Selected" AutoPostBack="true"
                                            WatermarkText="--Select--" />
                                        <%--<uc3:ICM ID="ucEntityCode" runat="server" HoverMenuExtenderLeft="true" DispalyContent="Both" class="md-form-control form-control" onblur="return fnLoadEntity;" strLOV_Code="IPRO" />
                                        <asp:Button ID="btnEntity" runat="server" Text="Entity"
                                            Style="display: none" /><input id="Hidden1" type="hidden" runat="server" />--%>
                                        <asp:HiddenField ID="hdnClientCode" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Customer Name" ID="lblClientName" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <uc2:Suggest ID="ddlInvoiceNo" runat="server"
                                            ServiceMethod="GetInvoiceList" ToolTip="Invoice Number" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Invoice Number" ID="lblInvoiceNumber" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <uc2:Suggest ID="ddlDcName" runat="server"
                                            ServiceMethod="GetDCNameList" ToolTip="Debt Collector Name" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Debt Collector Name" ID="lblDebtDCName" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div align="right" style="margin-top: 15px;">
                                <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Go" runat="server"
                                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                </button>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlInvDtl" runat="server" CssClass="stylePanel" GroupingText="Invoice Details" Visible="false"
                            Width="99%">
                            <div class="gird">
                                <%--<div style="overflow-x: hidden; overflow-y: auto; height: 225px;">--%>
                                <asp:GridView runat="server" ID="grvInvoice" AutoGenerateColumns="False" ShowFooter="true" EmptyDataText="No Records Found"
                                    OnRowCommand="grvInvoice_RowCommand" OnRowDataBound="grvInvoice_RowDataBound"
                                    OnRowDeleting="grvInvoice_RowDeleting" class="gird_details">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSlno" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Invoice No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInvoiceNO" runat="server" Text='<%# Bind("Invoiceno")%>' ToolTip="Invoice No"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Invoice Date">
                                            <ItemTemplate>
                                                <asp:Label ID="txtInvoiceDate" runat="server" Text='<%# Bind("InvoiceDate")%>' ToolTip="Invoice No"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Invoice Due Date">
                                            <ItemTemplate>
                                                <asp:Label ID="txtMaturityDate" runat="server" Text='<%# Bind("MaturityDate")%>' ToolTip="Invoice Due Date"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Invoice Value">
                                            <ItemTemplate>
                                                <asp:Label ID="txtInvoiceAmount" runat="server" Style="text-align: right;" Text='<%# Bind("InvoiceAmount")%>' ToolTip="Invoice Value"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DC Name" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDC_NAME" runat="server" Style="text-align: right;" Text='<%# Bind("DC_NAME")%>' ToolTip="DC Name"></asp:Label>
                                                 <asp:Label ID="lblDCID" runat="server" Visible="false" Text='<%# Bind("DEBTCOLLECTOR_ID")%>' ToolTip="DC Name"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Factoring_Inv_Load_Details_ID"
                                            Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblID" runat="server" Text='<%# Bind("Factoring_Inv_Load_Details_ID")%>'
                                                    Visible="false" ToolTip="SI No."></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                    </Columns>
                                    <%--       <HeaderStyle CssClass="styleGridHeader" />
                                    <RowStyle HorizontalAlign="Center" />--%>
                                </asp:GridView>
                                <%--</div>--%>
                            </div>
                            <%--Total--%>
                        </asp:Panel>
                    </div>
                     <uc5:PageNavigator ID="PageNavInvoiceDetails" runat="server" Visible="false"></uc5:PageNavigator>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Panel ID="pnlHistoryDetails" runat="server" CssClass="stylePanel" GroupingText="History Details" Visible="false"
                            Width="100%">
                            <div>
                                <div class="row">
                                    <div class="gird">
                                        <asp:GridView runat="server" ID="gvHistoryDetails" AutoGenerateColumns="False" Width="100%" ShowFooter="false" EmptyDataText="No Records Found"
                                            ToolTip="History Details" class="gird_details">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSlno" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Invoice No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvoiceNO" runat="server" Text='<%# Bind("Invoiceno")%>' ToolTip="Invoice No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Visit Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtInvoiceDate" runat="server" Text='<%# Bind("InvoiceDate")%>' ToolTip="Invoice No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Next Follow Up Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtMaturityDate" runat="server" Text='<%# Bind("MaturityDate")%>' ToolTip="Invoice Due Date"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Visit By">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtInvoiceAmount" runat="server" Style="text-align: right;" Text='<%# Bind("USER_NAME")%>' ToolTip="Invoice Value"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="styleGridHeader" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </div>
                                    <uc5:PageNavigator ID="ucCustomPaging" runat="server"></uc5:PageNavigator>
                                    <asp:Button ID="btnHidden" runat="server" Text="Button" Style="Display: none;" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <tr class="styleButtonArea" style="display: none">
                    <td>
                        <asp:CustomValidator ID="cvCustomerMaster" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" Width="98%" />
                    </td>
                </tr>

                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                        <div class="md-input">
                            <asp:TextBox ID="txtVisitBy" runat="server" MaxLength="50" ReadOnly="false" Enabled="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <label>
                                <asp:Label runat="server" Text="Visit By" ID="lblVisitBy" CssClass="styleReqFieldLabel"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                        <div class="md-input">
                            <asp:TextBox ID="txtVisitDate" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtendertxtVisitDate" runat="server" Enabled="True"
                                TargetControlID="txtVisitDate">
                            </cc1:CalendarExtender>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <div class="validation_msg_box" style="top: 25px !important;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="txtVisitDate"
                                    Display="Dynamic" ErrorMessage="Enter the Visit Date" SetFocusOnError="True"
                                    ValidationGroup="Save"></asp:RequiredFieldValidator>
                            </div>
                            <label>
                                <asp:Label runat="server" Text="Visit Date" ID="lblVisitDate" CssClass="styleReqFieldLabel"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                        <div class="md-input">
                            <asp:TextBox ID="txtNextFollowUpDate" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtendertxtNextFollowUpDate" runat="server" Enabled="True"
                                TargetControlID="txtNextFollowUpDate">
                            </cc1:CalendarExtender>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <div class="validation_msg_box" style="top: 25px !important;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="txtNextFollowUpDate"
                                    Display="Dynamic" ErrorMessage="Enter the Next Follow Up Date" SetFocusOnError="True"
                                    ValidationGroup="Save"></asp:RequiredFieldValidator>
                            </div>
                            <label>
                                <asp:Label runat="server" Text="Next Follow Up Date" ID="lblNextFollowUpDate" CssClass="styleReqFieldLabel"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                        <div class="md-input">
                            <asp:TextBox ID="txtRemarks" runat="server" MaxLength="200" onkeyup="maxlengthfortxt(200)" TextMode="MultiLine" Height="75px" class="md-form-control form-control login_form_content_input lowercase" ToolTip="Remarks"> </asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <div class="validation_msg_box" style="top: 75px !important; text-align: right;">
                                <asp:RequiredFieldValidator ID="rfvtxtRemarks" CssClass="validation_msg_box_sapn" runat="server" Width="550px" ControlToValidate="txtRemarks"
                                    Display="Dynamic" ErrorMessage="Enter the Remarks" SetFocusOnError="True"
                                    ValidationGroup="Save"></asp:RequiredFieldValidator>
                            </div>
                            <label>
                                <asp:Label ID="lblReason" runat="server" CssClass="styleReqFieldLabel" Text="Remarks"></asp:Label>
                            </label>
                        </div>
                    </div>
                </div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" validationgroup="Save" runat="server" onserverclick="btnSave_Click"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                        onserverclick="btnClear_Click"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                    <%--<button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]"  onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>--%>
                </div>

                <%--                <tr align="center" valign="bottom">
                    <td>
                        <br />
                        <asp:Button runat="server" ID="btnSave" OnClientClick="return fnCheckPageValidators('VGFIL');"
                            CssClass="styleSubmitButton" Text="Save" OnClick="btnSave_Click" ValidationGroup="VGFIL"
                            ToolTip="Save,Alt+S" AccessKey="S" />
                        <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton"
                            Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click"
                            ToolTip="Clear,Alt+L" AccessKey="L" />
                        <asp:Button runat="server" ID="btnCancel" Text="Exit" ValidationGroup="PRDDC" CausesValidation="false"
                            CssClass="styleSubmitButton" OnClick="btnCancel_Click" ToolTip="Exit,Alt+X" AccessKey="X" />
                    </td>
                </tr>--%>
                <%-- <tr>
                    <td style="padding-left: 24px">
                        <br />
                        <asp:CustomValidator ID="cvFactoring" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" Visible="false" Width="98%" ValidationGroup="VGFIL" />
                        <asp:ValidationSummary runat="server" ID="vsFactoringInvoiceLoadinf" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" Width="98%" ShowMessageBox="false" ShowSummary="true"
                            ValidationGroup="VGFIL" />
                        <asp:ValidationSummary runat="server" ID="vsFactoringInvoiceLoadinfAdd" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" Width="98%" ShowMessageBox="false" ShowSummary="true"
                            ValidationGroup="VGFILAdd" />
                        <asp:ValidationSummary runat="server" ID="ValidationSummary1" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" Width="98%" ShowMessageBox="false" ShowSummary="true"
                            ValidationGroup="vgGridAdd" />
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </td>
                </tr>--%>
            </div>
        </ContentTemplate>
        <%--<Triggers>--%>
        <%--<asp:PostBackTrigger ControlID="btnGo" />
            <asp:PostBackTrigger ControlID="imgErrorFileExcel" />--%>
        <%--</Triggers>--%>
    </asp:UpdatePanel>

    <%--    <cc1:ModalPopupExtender ID="ModalPopupExtenderApprover" runat="server" TargetControlID="btnModal"
        PopupControlID="PnlApprover" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>--%>
    <%--    <asp:Panel ID="PnlApprover" Style="display: none; vertical-align: middle" runat="server"
        BorderStyle="Solid" BackColor="White" Width="600px">
        <asp:UpdatePanel ID="upPass" runat="server">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td width="100%">
                            <table width="100%">
                                <tr>
                                    <asp:Label ID="lblTotalInvoiceAmount" runat="server" Text="Total Invoice Amount:" CssClass="styleDisplayLabel"></asp:Label>
                                    <asp:Label ID="lblAmount" runat="server" Font-Bold="true"></asp:Label>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="div2" class="container" runat="server" style="height: 350px">
                                            <asp:GridView ID="grvApprover" runat="server" AutoGenerateColumns="false" Height="50px" Width="100%"
                                                ShowFooter="true" OnRowDataBound="grvApprover_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSNo" Text='<% #Bind("IDCOLUMN")%>' Visible="false" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSelect" runat="server" Visible="false" Text='<% #Bind("IS_SELECT")%>'></asp:Label>
                                                            <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="true" />
                                                            <%--OnCheckedChanged="chkSelect_CheckedChanged"
                                                        </ItemTemplate>
                                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Remove" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRemove" runat="server" Visible="false" Text='<% #Bind("IS_REMOVE")%>'></asp:Label>
                                                            <asp:CheckBox ID="chkRemove" runat="server" AutoPostBack="true" OnCheckedChanged="chkRemove_CheckedChanged" />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Party Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPartyName" runat="server" Text='<% #Bind("Party_Name")%>'>
                                                            </asp:Label>
                                                            <asp:Label ID="lblPartyID" runat="server" Visible="false" Text='<% #Bind("Party_ID")%>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="30%" HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Invoice No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInvoiceNo" runat="server" Text='<% #Bind("Invoice_No")%>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Invoice Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInvoiceAmount" runat="server" Text='<% #Bind("Invoice_Amount")%>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Invoice Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInvoiceDate" runat="server" Text='<% #Bind("Date")%>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="20%" HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <%--<asp:Button ID="btnMove" runat="server" Text="Move" ToolTip="Move" class="styleSubmitButton" />--%>
    <%--    <asp:Button ID="btnClose" runat="server" Text="Exit" OnClick="btnClose_Click"
                                            ToolTip="Exit,Alt+X" class="styleSubmitButton" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ValidationSummary ID="vsPopUp" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                                            HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Button ID="btnModal" Style="display: none" runat="server" />--%>



  <%--  <cc1:ModalPopupExtender ID="ModalPreviousInvoices" runat="server" TargetControlID="btnInvoiceModal"
        PopupControlID="pnlPreviousInvoices" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlPreviousInvoices" Style="display: none; vertical-align: middle" runat="server"
        BorderStyle="Solid" BackColor="White" Width="550px">
        <asp:UpdatePanel ID="updPreviousInvoices" runat="server">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td width="100%">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <div id="div1" class="container" runat="server" style="height: 300px">
                                            <asp:GridView ID="grvPreviousInvoices" runat="server" AutoGenerateColumns="false" Height="50px"
                                                ShowFooter="true" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Party Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPartyName" runat="server" Text='<% #Bind("Party_Name")%>'>
                                                            </asp:Label>
                                                            <asp:Label ID="lblPartyID" runat="server" Visible="false" Text='<% #Bind("Party_ID")%>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="30%" HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Invoice No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInvoiceNo" runat="server" Text='<% #Bind("Invoice_No")%>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Invoice Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInvoiceAmount" runat="server" Text='<% #Bind("Invoice_Amount")%>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Invoice Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInvoiceDate" runat="server" Text='<% #Bind("Date")%>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="20%" HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <uc5:PageNavigator ID="PageNavigatorPreviousInvoice" runat="server" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="btnClosePreviousInvoice" runat="server" Text="Exit"
                                            ToolTip="Exit,Alt+X" AccessKey="V" class="styleSubmitButton" OnClick="btnClosePreviousInvoice_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>--%>

    <%--<asp:Button ID="btnInvoiceModal" Style="display: none" runat="server" />--%>
</asp:Content>
