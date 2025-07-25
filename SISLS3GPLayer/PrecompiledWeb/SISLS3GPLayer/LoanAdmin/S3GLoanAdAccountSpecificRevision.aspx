<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="LoanAdmin_S3GLoanAdAccountSpecificRevision, App_Web_ccy20lsg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<asp:Content ID="ContentPlaceHolder1" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="Server">
    <script type="text/javascript">
        function checkDate_ApplicationDate(sender, args) {
            var varApplicationDate = new Date();
            var varapplndate = Date.parseInvariant(varApplicationDate.format(sender._format), sender._format);
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 0;
            if (varapplndate < selectedDate) {
                alert('Account Revision Date should be less than or equal to System Date');
                document.getElementById('<%=txtDate.ClientID %>').value = vartoday.format(sender._format);
            }
            else {
                document.getElementById('<%=txtDate.ClientID %>').value = selectedDate.format(sender._format);
                intValid = 1;
            }
        }

        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }

    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblAccountSpecificRevision" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>



                                    <cc1:TabContainer ID="tcSpecificRevision" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                                        Width="100%" TabStripPlacement="top" OnActiveTabChanged="tcSpecificRevision_ActiveTabChanged">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <cc1:TabPanel runat="server" HeaderText="General" ID="tbgeneral" CssClass="tabpan"
                                                    BackColor="Red">
                                                    <HeaderTemplate>
                                                        Revision Header
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <asp:UpdatePanel ID="upd12" runat="server">
                                                            <ContentTemplate>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <asp:Panel ID="pnlHeaderInfo" GroupingText="Revision Header Information" CssClass="stylePanel"
                                                                            runat="server">
                                                                            <div class="row">
                                                                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                                                            ToolTip="Line of Business" class="md-form-control form-control" />
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="RFVddlLOB" runat="server" ControlToValidate="ddlLOB"
                                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlBranchMain" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBranchMain_SelectedIndexChanged"
                                                                                            ToolTip="Branch" class="md-form-control form-control">
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label ID="lblBranchMain" runat="server" CssClass="styleReqFieldLabel" Text="Branch"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                                            strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" />
                                                                                        <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                                                            Style="display: none" />
                                                                                        <asp:TextBox runat="server" ID="txtCustomerName" ReadOnly="True" ToolTip="Customer Name" Visible="false"
                                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <asp:HiddenField ID="hdnCustomerCode" runat="server" />
                                                                                        <asp:HiddenField ID="hidcuscode" runat="server" />
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" ID="lblCustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" 
                                                                                            ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ddlMLA_SelectedIndexChanged"
                                                                                            strLOV_Code="ACC_NOC" ServiceMethod="GetAccuntNoList" />
                                                                                        <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                                                            Style="display: none" />
                                                                                        <asp:TextBox ID="txtCustomerCode" runat="server" ReadOnly="True" Visible="false"></asp:TextBox>
                                                                                        <asp:TextBox ID="txtCustomerID" runat="server" ReadOnly="True" Visible="false"></asp:TextBox>
                                                                                        <asp:HiddenField ID="hdnCustId" runat="server" />
                                                                                        <asp:HiddenField ID="hdnAccountNumber" runat="server" />
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label CssClass="styleReqFieldLabel" runat="server" Text="Account Number" ID="lblMLA"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtNumber" ToolTip="Account Revision No." Enabled="False" runat="server"
                                                                                            MaxLength="15" class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Account Revision No." ID="lblNumber" CssClass="styleDisplayLabel"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtDate" ToolTip="Account Revision Date" AutoPostBack="True" OnTextChanged="txtDate_TextChanged"
                                                                                            Enabled="True" runat="server" class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate"
                                                                                            PopupButtonID="Image1" ID="CalendarExtender2" Enabled="True" OnClientDateSelectionChanged="checkDate_ApplicationDate">
                                                                                        </cc1:CalendarExtender>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvSpeRevDate" runat="server" Display="Dynamic"
                                                                                                ControlToValidate="txtDate" ErrorMessage="Enter the Specific Revision Date"
                                                                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Account Revision Date" ID="lblDate" CssClass="styleDisplayLabel"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">


                                                                                        <asp:TextBox ID="txtEffectiveFrom" Visible="False" runat="server" ContentEditable="False"
                                                                                            AutoPostBack="True" OnTextChanged="txtEffectiveFrom_TextChanged" class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                                        <asp:DropDownList ToolTip="Effective From" ID="ddlEffectiveFrom" CausesValidation="false"
                                                                                            runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlEffectiveFrom_SelectedIndexChanged"
                                                                                            class="md-form-control form-control">
                                                                                        </asp:DropDownList>

                                                                                        <cc1:CalendarExtender ID="CalendarExtenderToDate" runat="server"
                                                                                            Enabled="True" PopupButtonID="imgEffectiveFrom" TargetControlID="txtEffectiveFrom">
                                                                                        </cc1:CalendarExtender>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator SetFocusOnError="True" Display="Dynamic" ID="RequiredFieldValidator4"
                                                                                                CssClass="validation_msg_box_sapn" runat="server" InitialValue="" ControlToValidate="ddlEffectiveFrom"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Effective From" ID="lblEffectiveFrom" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                        </label>

                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlRevisionStatus" runat="server" ToolTip="Status" Enabled="False"
                                                                                            class="md-form-control form-control">
                                                                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                                            <asp:ListItem Value="1">Pending</asp:ListItem>
                                                                                            <asp:ListItem Value="2">Under Process</asp:ListItem>
                                                                                            <asp:ListItem Value="3">Approved</asp:ListItem>
                                                                                            <asp:ListItem Value="4">Rejected</asp:ListItem>
                                                                                            <asp:ListItem Value="5">Cancelled</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator10" CssClass="validation_msg_box_sapn"
                                                                                                InitialValue="0" runat="server" SetFocusOnError="True" ControlToValidate="ddlRevisionStatus"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Status" ID="lblStatus" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                        </label>

                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtFinAmt" ToolTip="Finance Amount" runat="server" MaxLength="15"
                                                                                            ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator CssClass="validation_msg_box_sapn" Display="Dynamic" ID="RequiredFieldValidator3" runat="server"
                                                                                                ControlToValidate="txtFinAmt" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Finance Amount" ID="lblFinAmt" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtACDate" ToolTip="Account Creation Date" runat="server" ReadOnly="true"
                                                                                            ContentEditable="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label ID="lblFinAmt0" runat="server" CssClass="styleDisplayLabel" Text="Account Creation Date"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>

                                                                                <div style="display: none" class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtFilePath" ToolTip="Revision Consent Letter" runat="server" Style="text-align: left;"
                                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label ID="LblRvCns" runat="server" Text="Revision Consent Letter"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">

                                                                                        <asp:DropDownList ID="ddlRevisionType" runat="server" AutoPostBack="True" ToolTip="Revision Type"
                                                                                            OnSelectedIndexChanged="ddlRevisionType_SelectedIndexChanged" class="md-form-control form-control" />
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvRevisionType" runat="server" ControlToValidate="ddlRevisionType"
                                                                                                ErrorMessage="Select the Revision Type" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                                                InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                        </div>

                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Button ID="btnView" CssClass="styleGridShortButton" runat="server" Text="View"
                                                                                                ToolTip="View" CausesValidation="false" Visible="false" OnClick="btnView_Click" />
                                                                                            <asp:Label ID="lblRevisionType" runat="server" CssClass="styleReqFieldLabel" Text="Revision Type"></asp:Label>
                                                                                        </label>

                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:CheckBox ID="chk_Manual_Struct" ToolTip="Manual Structure" runat="server" Enabled="false" Visible="false" />
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>

                                                                                            <asp:Label ID="lblManual_Struct" runat="server" CssClass="styleDisplayLabel" Text="Manual Structure" Visible="false"></asp:Label>
                                                                                        </label>

                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="TxtRevisionReason" ToolTip="Revision Reason" runat="server"
                                                                                            onkeyup="maxlengthfortxt(50)" TextMode="MultiLine"
                                                                                            ContentEditable="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Revision Reason" ID="LblRevision_Reason" CssClass="styleDisplayLabel"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>

                                                                                <div style="display: none" class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">

                                                                                        <asp:TextBox ID="txtPLAmt" runat="server" CssClass="txtRightAlign" MaxLength="15"
                                                                                            ReadOnly="True" Visible="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>


                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label ID="lblPlAmt" runat="server" CssClass="styleReqFieldLabel" Text="Principal O/S Amount"
                                                                                                Visible="False"></asp:Label>
                                                                                        </label>

                                                                                    </div>
                                                                                </div>

                                                                            </div>
                                                                            <div align="right">
                                                                                <button class="css_btn_enabled" id="btnGO" onserverclick="btnGO_Click" runat="server"
                                                                                    type="button" accesskey="G" causesvalidation="true" title="Go[Alt+G]">
                                                                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                                                </button>
                                                                            </div>
                                                                        </asp:Panel>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <asp:ValidationSummary ID="vs_TabMainPage" runat="server" CssClass="styleMandatoryLabel"
                                                                            HeaderText="Please correct the following validation(s):  " />
                                                                        <input type="hidden" runat="server" id="hdnFileName" />
                                                                        <input id="hdnFileUploaded" runat="server" type="hidden" />
                                                                    </div>

                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <cc1:TabPanel ID="tbExisting" runat="server">
                                                    <HeaderTemplate>
                                                        Existing
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="gird">
                                                                    <asp:GridView ID="grvAccountRevisionDetails" runat="server" AutoGenerateColumns="False"
                                                                        OnRowDataBound="grvAccountRevisionDetails_RowDataBound" ToolTip="Additional Revision"
                                                                        Width="100%">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Type">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblTypeDetails" runat="server" Text='<%#Eval("Type")%>'> </asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" Width="33%" />
                                                                                <ItemStyle HorizontalAlign="Left" Width="33%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Existing">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblExistingdetails" runat="server" Text='<%#Eval("Existing")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" Width="33%" />
                                                                                <ItemStyle HorizontalAlign="Right" Width="33%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Additional Revision">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="ChkDueChange" runat="server" Text="Change Due Date" Visible="false"
                                                                                        Checked="false" OnCheckedChanged="ChkDueChange_CheckedChanged" AutoPostBack="true" />
                                                                                    <asp:Literal ID="litDescription" Text="" runat="server"></asp:Literal>
                                                                                    <asp:TextBox ID="txtRevisedValue" runat="server" Style="text-align: right;" Text='<%#Eval("Revised")%>'
                                                                                        AutoPostBack="true" OnTextChanged="txtRevisedValue_TextChanged"></asp:TextBox>
                                                                                    <asp:DropDownList ID="ddlRevisedValue" runat="server" Style="text-align: right;"
                                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlRevisedValue_SelectedIndexChanged">
                                                                                    </asp:DropDownList>
                                                                                    <asp:RequiredFieldValidator ID="rfvFBDate" runat="server" ControlToValidate="ddlRevisedValue"
                                                                                        CssClass="styleMandatoryLabel" Display="None" InitialValue="0" ValidationGroup="vsNewrevision"
                                                                                        SetFocusOnError="True" ErrorMessage="Select the FB Date" Enabled="false"></asp:RequiredFieldValidator>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                        <RowStyle HorizontalAlign="Center" />
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row" style="display: none">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="gird">
                                                                    <asp:Panel GroupingText="Existing Asset" ToolTip="Existing Asset"
                                                                        ID="pnlExistAsset" runat="server" CssClass="stylePanel">
                                                                        <asp:GridView ID="grvOldAssetDetails" runat="server" AutoGenerateColumns="False"
                                                                            OnRowDataBound="grvOldAssetDetails_RowDataBound" Width="100%" EnableModelValidation="True">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="SI No">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblID" runat="server" Text='<%#Eval("SNO")%>'> </asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" Width="25%" />
                                                                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Asset Number">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAssetCode" runat="server" Text='<%#Eval("ASSET_CODE")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" Width="25%" />
                                                                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Asset Description">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAssetDesc" runat="server" Text='<%#Eval("ASSET_DESC")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                    <ItemStyle HorizontalAlign="Left" Width="50%" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Amount Financed">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAssetAmountFinanced" runat="server" Text='<%#Eval("AMOUNT_FINANCED")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                    <ItemStyle HorizontalAlign="Right" Width="50%" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Amount Paid">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAssetAmountPaid" runat="server" Text='<%#Eval("AMOUNT_PAID")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                    <ItemStyle HorizontalAlign="Right" Width="50%" />
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <RowStyle HorizontalAlign="Center" />
                                                                        </asp:GridView>
                                                                    </asp:Panel>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="display: none">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="gird">
                                                                    <asp:Panel GroupingText="Replace / Release Asset" ToolTip="Replace / Release Asset"
                                                                        ID="pnlNewAsset" runat="server" CssClass="stylePanel">
                                                                        <asp:HiddenField ID="hdnAssetID" runat="server" />
                                                                        <asp:GridView runat="server" ShowFooter="true"
                                                                            OnRowCommand="grvAsset_RowCommand"
                                                                            ID="grvAsset" OnRowDeleting="grvAsset_RowDeleting"
                                                                            AutoGenerateColumns="False" OnRowDataBound="grvAsset_RowDataBound">
                                                                            <Columns>
                                                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Replace / Release">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" ID="lblOldAssetMapCode" Text='<%#Eval("ASSET_Release_Type")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:DropDownList ID="ASSET_Release_Type" runat="server" AutoPostBack="true"
                                                                                                OnSelectedIndexChanged="ASSET_Release_Type_SelectedIndexChanged">
                                                                                                <asp:ListItem Text="--Select--" Value="0" Enabled="true" Selected="True"></asp:ListItem>
                                                                                                <asp:ListItem Text="REPLACE" Value="1" Enabled="true"></asp:ListItem>
                                                                                                <asp:ListItem Text="RELEASE" Value="2" Enabled="true"></asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Sl.No.">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>' Visible="false"></asp:Label>
                                                                                        <asp:LinkButton ID="lnkAssetSerialNo" runat="server" Text='<%#Bind("Sno") %>' Style="text-align: right"></asp:LinkButton>
                                                                                        <asp:Label runat="server" ID="lblMappingID" Text='<%#Eval("Mapping_ID")%>' Visible="false"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Replace Asset">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" ID="lblOldAssetMapCode" Text='<%#Eval("ASSET_CODE")%>'></asp:Label>
                                                                                        <asp:Label runat="server" ID="lblOldMapASSET_ID" Text='<%#Eval("ASSET_ID")%>' Visible="false"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:DropDownList ID="ddlFAssetDesc" runat="server"></asp:DropDownList>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Asset Description">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" ID="lblNewASSET_DESC" Text='<%#Eval("ASSET_DESC")%>'></asp:Label>
                                                                                        <asp:Label runat="server" ID="lblNewASSET_ID" Text='<%#Eval("ASSET_ID")%>' Visible="false"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <uc2:Suggest ID="ddlNewAssetDesc" OnItem_Selected="ddlNewAssetDesc_SelectedIndexChanged"
                                                                                                AutoPostBack="true" runat="server" ErrorMessage="Enter Asset description" ValidationGroup="GridPayment" ServiceMethod="GetAsstList" />
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                </asp:TemplateField>


                                                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Asset Cost">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" ID="lblNewASSET_Cost" Text='<%#Eval("ASSET_COST")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:TextBox ID="txtFAssetCost" runat="server" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Asset Detail">
                                                                                    <ItemTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <button class="css_btn_enabled" id="btnIAddAss" onserverclick="btnIAddAss_Click" runat="server"
                                                                                                type="button" title="View the asset details">
                                                                                                <i class="fa fa-plus" aria-hidden="true"></i>&emsp;VA
                                                                                            </button>
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <button class="css_btn_enabled" id="btnFAddAss" onserverclick="btnFAddAss_Click" runat="server"
                                                                                                type="button" title="Add the asset details">
                                                                                                <i class="fa fa-plus" aria-hidden="true"></i>&emsp;AA
                                                                                            </button>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                    <FooterStyle HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CausesValidation="false" Text="Remove"
                                                                                            OnClientClick="return confirm('Are you sure you want to Remove this record?');" ToolTip="Remove">
                                                                                        </asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <button class="css_btn_enabled" id="btnAdd" onserverclick="btnAdd_Click" runat="server"
                                                                                                type="button" accesskey="T" title="Add the Details[Alt+T]">
                                                                                                <i class="fa fa-plus" aria-hidden="true"></i>&emsp;Add
                                                                                            </button>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <RowStyle HorizontalAlign="left" />
                                                                        </asp:GridView>
                                                                    </asp:Panel>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtPriAmt" runat="server" ReadOnly="True"
                                                                        CssClass="txtRightAlign" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Principal O/S Amount" ID="lblPriAmt" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtTotExp" runat="server" ReadOnly="True"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Total Exposure" ID="lblTotExp" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="TxtCC" runat="server" MaxLength="15" ReadOnly="True"
                                                                        ToolTip="Compensation Charges" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Compensation Charges" ID="LblCC" CssClass="styleDisplayLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="lblRepayableAmount" runat="server" MaxLength="15" ReadOnly="True"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Total Amount Repayable" ID="lblRepayable"
                                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="lblToolTipVal" runat="server" MaxLength="15" ReadOnly="True"
                                                                        CssClass="txtRightAlign" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Principal O/S BreakUP" ID="lblToolTip"
                                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>


                                                        </div>

                                                        <div class="row">
                                                            <div align="right" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <button class="css_btn_enabled" id="btnAdhocGo" onserverclick="btnAdhocGo_Click"
                                                                    validationgroup="vsNewrevision" runat="server" type="button" accesskey="P"
                                                                    title="Process[Alt+P]" causesvalidation="true">
                                                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>P</u>rocess
                                                                </button>
                                                                <button class="css_btn_enabled" id="btnGenerateRevision" onserverclick="GenerateSpecificRevisionDetails"
                                                                    validationgroup="vsNewrevision" runat="server" type="button" accesskey="P" title="Process[Alt+P]"
                                                                    causesvalidation="true">
                                                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>P</u>rocess
                                                                </button>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="pnlRevisedDetails" runat="server" GroupingText="Existing/Revised Details"
                                                                    ToolTip="Existing/Revised Details" CssClass="stylePanel" Width="100%">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <div class="row">
                                                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                <asp:GridView ID="gvExistingSOH" runat="server" AutoGenerateColumns="False" Width="100%">
                                                                                    <Columns>
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSOH" runat="server" Text='<%#Eval("Type")%>' Width="100%"></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle HorizontalAlign="Left" Width="30%" Height="22px" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Existing">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSOHExisting" runat="server" Text='<%#Eval("Existing")%>' Width="100%"></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Right" Width="35%" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Revised">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSOHRevised" runat="server" Style="text-align: right;" Text='<%#Eval("Revised")%>'
                                                                                                    Width="90%"></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Center" Width="35%" />
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                    <RowStyle HorizontalAlign="Center" />
                                                                                </asp:GridView>
                                                                            </div>
                                                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                <asp:GridView ID="grvAccountRevisionIRRDetails" OnRowDataBound="grvAccountRevisionIRRDetails_RowDataBound" runat="server" AutoGenerateColumns="False"
                                                                                    Width="100%">
                                                                                    <Columns>
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblType0" runat="server" Text='<%#Eval("Type")%>' Width="100%"></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle HorizontalAlign="Left" Width="30%" Height="22px" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Existing">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblExisting0" DataFormatString="{0:0.00000}" runat="server" Text='<%#Eval("Existing")%>' Width="100%"></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Right" Width="35%" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Revised">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblRevised0" DataFormatString="{0:0.00000}" runat="server" Style="text-align: right;" Text='<%#Eval("Revised")%>'
                                                                                                    Width="90%"></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                                            <ItemStyle HorizontalAlign="Center" Width="35%" />
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                    <RowStyle HorizontalAlign="Center" />
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="pnlRepayDetails" runat="server" ToolTip="Repayment Details" CssClass="stylePanel"
                                                                    Width="100%">
                                                                    <div class="row">
                                                                        <div class="gird">
                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                <asp:GridView ID="gvRepaymentDetails" runat="server" AutoGenerateColumns="False"
                                                                                    ShowFooter="True" OnRowDeleting="gvRepaymentDetails_RowDeleting" OnRowDataBound="gvRepaymentDetails_RowDataBound"
                                                                                    OnRowCreated="gvRepaymentDetails_RowCreated" Width="100%">
                                                                                    <Columns>
                                                                                        <asp:BoundField DataField="slno" HeaderText="Sl.No">
                                                                                            <FooterStyle Width="2%" />
                                                                                            <ItemStyle HorizontalAlign="Center" Width="2%" />
                                                                                        </asp:BoundField>
                                                                                        <asp:TemplateField HeaderText="Repayment CashFlow">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblCashFlow" runat="server" Text='<%# Bind("CashFlow") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:DropDownList ID="ddlRepaymentCashFlow_RepayTab" runat="server" Width="98%" AutoPostBack="true"
                                                                                                        OnSelectedIndexChanged="ddlRepaymentCashFlow_RepayTab_SelectedIndexChanged">
                                                                                                    </asp:DropDownList>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>

                                                                                                    <div class="grid_validation_msg_box">
                                                                                                        <asp:RequiredFieldValidator ID="rfvddlRepaymentCashFlow_RepayTab" runat="server"
                                                                                                            ControlToValidate="ddlRepaymentCashFlow_RepayTab" CssClass="styleMandatoryLabel"
                                                                                                            Display="None" ValidationGroup="TabRepayment1" SetFocusOnError="True" InitialValue="0"
                                                                                                            ErrorMessage="Select a Repayment cashflow">
                                                                                                        </asp:RequiredFieldValidator>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Per Installment Amount">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblPerInstallmentAmount_RepayTab" runat="server" Text='<%# Bind("PerInstall") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtPerInstallmentAmount_RepayTab" runat="server" Width="95%" Style="text-align: right;"
                                                                                                        MaxLength="7" class="md-form-control form-control login_form_content_input requires_true"> 
                                                                                                    </asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>

                                                                                                    <cc1:FilteredTextBoxExtender ID="ftextExtxtPerInstallmentAmount_RepayTab"
                                                                                                        runat="server" FilterType="Numbers, Custom" TargetControlID="txtPerInstallmentAmount_RepayTab" ValidChars=".">
                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                    <div class="grid_validation_msg_box">
                                                                                                        <asp:RequiredFieldValidator ID="rfvtxtPerInstallmentAmount_RepayTab" runat="server"
                                                                                                            ControlToValidate="txtPerInstallmentAmount_RepayTab" CssClass="styleMandatoryLabel"
                                                                                                            Display="None" ValidationGroup="TabRepayment1" SetFocusOnError="True" ErrorMessage="Enter the Pre installment amount">
                                                                                                        </asp:RequiredFieldValidator>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Breakup Percentage">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblBreakup_RepayTab" runat="server" Text='<%# Bind("Breakup") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtBreakup_RepayTab" runat="server" Width="95%"
                                                                                                        onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                                        class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="From Installment">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblFromInstallment_RepayTab" runat="server" Text='<%# Bind("FromInstall") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtFromInstallment_RepayTab" runat="server" Width="95%" MaxLength="3"
                                                                                                        Style="text-align: right" Text="1" ReadOnly="true"
                                                                                                        class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <cc1:FilteredTextBoxExtender
                                                                                                        ID="ftextExtxtFromInstallment_RepayTab" runat="server" FilterType="Numbers" TargetControlID="txtFromInstallment_RepayTab">
                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="To Installment">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblToInstallment_RepayTab" runat="server" Text='<%# Bind("ToInstall") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtToInstallment_RepayTab" runat="server" Width="95%" MaxLength="3" Style="text-align: right"
                                                                                                        class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <cc1:FilteredTextBoxExtender ID="ftextExtxtToInstallment_RepayTab"
                                                                                                        runat="server" FilterType="Numbers" TargetControlID="txtToInstallment_RepayTab">
                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                    <div class="grid_validation_msg_box">
                                                                                                        <asp:RequiredFieldValidator ID="rfvtxtToInstallment_RepayTab" runat="server" ControlToValidate="txtToInstallment_RepayTab"
                                                                                                            CssClass="styleMandatoryLabel" Display="None" ValidationGroup="TabRepayment1"
                                                                                                            SetFocusOnError="True" ErrorMessage="Enter the To installment">
                                                                                                        </asp:RequiredFieldValidator>
                                                                                                    </div>
                                                                                                    <div class="grid_validation_msg_box">
                                                                                                        <asp:CompareValidator
                                                                                                            ID="cmpvFromTOInstall" runat="server" ErrorMessage="To installment should be greater than From installment"
                                                                                                            ControlToValidate="txtToInstallment_RepayTab" ControlToCompare="txtFromInstallment_RepayTab"
                                                                                                            Display="None" ValidationGroup="TabRepayment1" Type="Integer" Operator="GreaterThanEqual">
                                                                                                        </asp:CompareValidator>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="From Date">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblfromdate_RepayTab" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"FromDate")).ToString(DateFormate) %> '></asp:Label><asp:TextBox
                                                                                                    ID="txRepaymentFromDate" runat="server" Visible="false" BackColor="Navy" ForeColor="White"
                                                                                                    Font-Names="calibri" Font-Size="12px" Width="95%" Style="color: White" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"FromDate")).ToString(DateFormate) %> '
                                                                                                    AutoPostBack="True" OnTextChanged="txRepaymentFromDate_TextChanged"></asp:TextBox><cc1:CalendarExtender
                                                                                                        ID="calext_FromDate" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate"
                                                                                                        TargetControlID="txRepaymentFromDate">
                                                                                                    </cc1:CalendarExtender>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtfromdate_RepayTab" runat="server" Width="95%" ReadOnly="true"
                                                                                                        class="md-form-control form-control login_form_content_input requires_true"> 
                                                                                                    </asp:TextBox>
                                                                                                    <cc1:CalendarExtender Enabled="false" ID="CalendarExtenderSD_fromdate_RepayTab" runat="server"
                                                                                                        TargetControlID="txtfromdate_RepayTab">
                                                                                                    </cc1:CalendarExtender>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="To Date">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblTODate_ReapyTab" runat="server" Width="100%" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"ToDate")).ToString(DateFormate) %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:TextBox ID="txtToDate_RepayTab" runat="server" Width="95%" Visible="false"> </asp:TextBox><cc1:CalendarExtender
                                                                                                    ID="CalendarExtenderSD_ToDate_RepayTab" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_PrevSystemDate"
                                                                                                    TargetControlID="txtToDate_RepayTab">
                                                                                                </cc1:CalendarExtender>
                                                                                            </FooterTemplate>
                                                                                            <FooterStyle Width="10%" />
                                                                                            <ItemStyle Width="10%" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Add">
                                                                                            <ItemTemplate>
                                                                                                <asp:LinkButton ID="lnRemoveRepayment" CausesValidation="false" runat="server" CommandName="Delete"
                                                                                                    Text="Remove" Visible="false"></asp:LinkButton>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <button class="css_btn_enabled" id="btnAddRepayment" runat="server"
                                                                                                        onserverclick="btnAddRepayment_OnClick" validationgroup="TabRepayment1"
                                                                                                        onclientclick="return fnCheckPageValidators('TabRepayment1',false)">
                                                                                                        <i class="fa fa-plus" aria-hidden="true"></i>&emsp;Add
                                                                                                    </button>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                            <FooterStyle HorizontalAlign="Center" Width="5%" />
                                                                                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Repayment CashFlowId" Visible="False">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblCashFlowId" runat="server" Text='<%# Bind("CashFlowId") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="False">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblAccountingIRR" runat="server" Text='<%# Bind("Accounting_IRR") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="False">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblBusinessIRR" runat="server" Text='<%# Bind("Business_IRR") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="False">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblComapnyIRR" runat="server" Text='<%# Bind("Company_IRR") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="False">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblCashFlow_Flag_ID" runat="server" Text='<%# Bind("CashFlow_Flag_ID") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div align="right" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <button class="css_btn_enabled" id="btnRecalculate" onserverclick="btnRecalculate_Click" runat="server"
                                                                                type="button" accesskey="I" title="Generate Revision[Alt+I]">
                                                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp; Generate Rev<u>i</u>sion
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:ValidationSummary ID="vsNewrevision" runat="server" CssClass="styleMandatoryLabel"
                                                                    HeaderText="Correct the following validation(s):  " ValidationGroup="vsNewrevision"
                                                                    Width="98%" />
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <cc1:TabPanel ID="tbRevisedRepayment" runat="server">
                                                    <HeaderTemplate>
                                                        Repayment Structure
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <asp:UpdatePanel ID="updInner" runat="server">
                                                            <ContentTemplate>
                                                                <div class="row">
                                                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                        <asp:Panel ID="pnlRepayAuto" runat="server" CssClass="stylePanel" GroupingText="Repayment Structure (Existing)">
                                                                            <div class="row">
                                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="gird">
                                                                                        <asp:GridView ID="grvBill" runat="server" Align="center"  ShowFooter="true" AutoGenerateColumns="False"
                                                                                            ToolTip="Repayment Structure (Existing)">
                                                                                            <Columns>
                                                                                                <asp:BoundField DataField="InstallmentNo" HeaderText="Installment Number">
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                </asp:BoundField>
                                                                                                <asp:TemplateField HeaderText="Installment Date">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblfromdate_RepayTab" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"InstallmentDate")).ToString(DateFormate) %> '>
                                                                                                        </asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:BoundField DataField="InstallmentAmount" DataFormatString="{0:0.000}" HeaderText="Installment Amount">
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                                                </asp:BoundField>
                                                                                                <asp:BoundField DataField="INSURANCE_AMT" DataFormatString="{0:0.000}" HeaderText="LIP Amount">
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                </asp:BoundField>
                                                                                            </Columns>
                                                                                        </asp:GridView>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </asp:Panel>
                                                                    </div>
                                                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                        <asp:Panel ID="Panel2" runat="server" CssClass="stylePanel" GroupingText="Repayment Structure (Revised)">
                                                                            <div class="row">
                                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="gird">
                                                                                        <asp:GridView ID="grvBill2" runat="server" Align="center" AutoGenerateColumns="False"
                                                                                            ToolTip="Repayment Structure (Revised)"  ShowFooter="true">
                                                                                            <Columns>
                                                                                                <asp:BoundField DataField="InstallmentNo" HeaderText="Installment Number">
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                </asp:BoundField>
                                                                                                <asp:TemplateField HeaderText="Installment Date">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblfromdate_RepayTab0" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"InstallmentDate")).ToString(DateFormate) %> '>
                                                                                                        </asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:BoundField DataField="InstallmentAmount" HeaderText="Installment">
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                </asp:BoundField>
                                                                                                <asp:BoundField DataField="PrincipalAmount" HeaderText="Principal">
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                </asp:BoundField>
                                                                                                <asp:BoundField DataField="FINANCE_CHARGE_WITHOUT_INS" HeaderText="interest">
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                </asp:BoundField>
                                                                                                <asp:BoundField DataField="INSURANCE_AMT" HeaderText="LIP Amount">
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                </asp:BoundField>
                                                                                                <asp:BoundField DataField="EMI" HeaderText="EMI">
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                </asp:BoundField>
                                                                                                  <asp:BoundField DataField="DEFFERAL_INTEREST" HeaderText="Defferal Interest">
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                </asp:BoundField>
                                                                                            </Columns>
                                                                                        </asp:GridView>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </asp:Panel>
                                                                    </div>

                                                                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                        <asp:Panel ID="pnlRepayManual" runat="server">
                                                                            <div class="row">
                                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="gird">
                                                                                        <div runat="server" id="div2" class="container" style="height: 350px; overflow-x: hidden; overflow-y: scroll; top: 0">
                                                                                            <asp:GridView ID="gvManualExisting" runat="server" BorderWidth="0px"
                                                                                                Align="center" AutoGenerateColumns="False">
                                                                                                <Columns>
                                                                                                    <asp:BoundField DataField="InstallmentNo" HeaderText="Installment Number">
                                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                                    </asp:BoundField>
                                                                                                    <asp:TemplateField HeaderText="Installment Date">
                                                                                                        <ItemTemplate>
                                                                                                            <asp:Label ID="lblfromdate_RepayTab" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"InstallmentDate")).ToString(DateFormate) %> '></asp:Label>
                                                                                                        </ItemTemplate>
                                                                                                    </asp:TemplateField>
                                                                                                    <asp:BoundField DataField="InstallmentAmount" HeaderText="Installment Amount">
                                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                                    </asp:BoundField>
                                                                                                    <asp:BoundField DataField="INSURANCE_AMT" HeaderText="LIP Amount">
                                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                                    </asp:BoundField>
                                                                                                </Columns>
                                                                                            </asp:GridView>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="gird">
                                                                                        <div runat="server" id="div3" class="container" style="height: 350px; overflow-x: hidden; overflow-y: scroll; top: 0">
                                                                                            <asp:GridView ID="GrvSARevised" Align="center" runat="server" AutoGenerateColumns="False"
                                                                                                Visible="False">
                                                                                                <Columns>
                                                                                                    <asp:BoundField DataField="InstallmentNo" HeaderText="Installment Number">
                                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                                    </asp:BoundField>
                                                                                                    <asp:TemplateField HeaderText="Installment Date">
                                                                                                        <ItemTemplate>
                                                                                                            <asp:Label ID="lblfromdate_RepayTab" runat="server" Text='<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"InstallmentDate")).ToString(DateFormate) %> '></asp:Label>
                                                                                                        </ItemTemplate>
                                                                                                    </asp:TemplateField>
                                                                                                    <asp:BoundField DataField="InstallmentAmount" HeaderText="Installment Amount">
                                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                                    </asp:BoundField>
                                                                                                    <asp:BoundField DataField="INSURANCE_AMT" HeaderText="LIP Amount">
                                                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                                                    </asp:BoundField>
                                                                                                </Columns>
                                                                                            </asp:GridView>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="styleMandatoryLabel"
                                                                                        HeaderText="Correct the following validation(s):  " ValidationGroup="TabRepayment1"
                                                                                        Width="98%" />
                                                                                </div>
                                                                            </div>
                                                                        </asp:Panel>
                                                                    </div>
                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                            </div>
                                        </div>
                                    </cc1:TabContainer>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:UpdatePanel ID="updButtons" runat="server" UpdateMode="Always">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div align="right">
                                                <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server"
                                                    type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]" validationgroup="btnSave"
                                                    onclick="if(fnCheckPageValidators('btnSave'))">
                                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                                </button>
                                                <button class="css_btn_enabled" id="btnClear" causesvalidation="false" runat="server" onclientclick="return confirm()"
                                                    onserverclick="btnClear_Click" type="button" accesskey="L" title="Clear[Alt+L]">
                                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                                </button>
                                                <button class="css_btn_enabled" id="btnBack"
                                                    causesvalidation="false" runat="server" onclick="if(confirm('Do you want to cancel this Revision?'))"
                                                    type="button" accesskey="R" title="Cancel Revision[Alt+R]">
                                                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;Cancel <u>R</u>evision
                                                </button>
                                                <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click"
                                                    causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                                                    type="button" accesskey="X" title="Exit [Alt+X]">
                                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                                </button>
                                                <button class="css_btn_enabled" id="btnRepay" onserverclick="btnRepay_Click"
                                                    causesvalidation="false" runat="server" visible="false"
                                                    type="button" accesskey="T" title="Repay Structure [Alt+T]">
                                                    <i class="fa fa-list" aria-hidden="true"></i>&emsp;Repay S<u>t</u>ructure      
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <cc1:ModalPopupExtender ID="MPopUp" runat="server" TargetControlID="btnBack" PopupControlID="Panel3"
                                                BackgroundCssClass="modalBackground" DropShadow="true" CancelControlID="CancelButton">
                                            </cc1:ModalPopupExtender>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="Panel3" runat="server" Style="display: none" BackColor="White" BorderStyle="Solid"
                                                BorderWidth="1px" BorderColor="Black" Width="100%">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtCancelReason" ToolTip="Remarks" runat="server"
                                                                onkeyup="maxlengthfortxt(50)" TextMode="MultiLine"
                                                                ContentEditable="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator SetFocusOnError="True" Display="Dynamic" ID="RequiredFieldValidator5"
                                                                    CssClass="validation_msg_box_sapn" runat="server" InitialValue="" ValidationGroup="Popup"
                                                                    ControlToValidate="txtCancelReason" ErrorMessage="Enter the remarks"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Remarks" ID="lblRemarks" CssClass="styleReqFieldLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                        <button class="css_btn_enabled" id="OkButton" onserverclick="OkButton_Click"
                                                            causesvalidation="true" runat="server" validationgroup="Popup"
                                                            type="button" title="Ok">
                                                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;OK
                                                        </button>

                                                        <button class="css_btn_enabled" id="CancelButton" onserverclick="CancelButton_Click"
                                                            causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                                                            type="button" title="Cancel">
                                                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Cancel
                                                        </button>

                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="styleMandatoryLabel"
                                                            HeaderText="Correct the following validation(s):  " ValidationGroup="Popup" Width="98%" />
                                                    </div>
                                                </div>

                                            </asp:Panel>
                                        </div>
                                    </div>

                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnRepay" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hdnCustomerID" runat="server" />

    <%-- <script language="javascript" type="text/javascript">
        function uploadComplete(sender, args) {
            document.getElementById('<%=hdnFileName.ClientID%>').value = args._fileName;
            //addToClientTable(args.get_fileName(), text);
        }
        function fnLoadPath(btnBrowse) {
            if (btnBrowse != null)
                document.getElementById(btnBrowse).click();
        }

        function fnAssignPath(btnBrowse, hdnPath) {
            if (btnBrowse != null) {
                document.getElementById(hdnPath).value = document.getElementById(btnBrowse).value;

            }
        }
    </script>--%>
</asp:Content>
