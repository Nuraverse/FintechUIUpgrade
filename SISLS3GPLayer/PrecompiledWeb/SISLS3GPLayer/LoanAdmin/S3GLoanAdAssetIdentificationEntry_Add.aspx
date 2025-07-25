<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GLOANADAssetIdentificationEntry_Add, App_Web_razugfam" enableeventvalidation="false" %>

<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style type="text/css">
        .btn_5_disabled {
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
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" Text="Asset Identification" CssClass="styleDisplayLabel"></asp:Label>

                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business" AutoPostBack="true" class="md-form-control form-control"
                                        OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvddlLOB" runat="server" ControlToValidate="ddlLOB" ValidationGroup="Submit"
                                            ErrorMessage="Select a Line of Business" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                            InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlBranch" AutoPostBack="true" ToolTip="Branch" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                        runat="server" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <%-- <uc2:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true"
                            ErrorMessage="Select a Location" IsMandatory="true" OnItem_Selected="ddlBranch_SelectedIndexChanged" />--%>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ControlToValidate="ddlBranch" ValidationGroup="Submit"
                                            ErrorMessage="Select a Branch" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                            InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblBranch" Text="Location" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                        Style="display: none;" MaxLength="100"></asp:TextBox>
                                    <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                        strLOV_Code="ACC_LIVE" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" />
                                    <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                        Style="display: none" />

                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvtxtAccountNoDummy" runat="server" ErrorMessage="Select the Account Number"
                                            ValidationGroup="Submit" SetFocusOnError="true" ControlToValidate="txtAccountNoDummy" CssClass="validation_msg_box_sapn"
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <%-- <uc2:Suggest ID="ddlMLA" runat="server" ServiceMethod="GetPANUM" AutoPostBack="true"
                                        OnItem_Selected="ddlMLA_SelectedIndexChanged" IsMandatory="true" ErrorMessage="Enter a Account Number" />--%>
                                    <asp:LinkButton ID="lnkViewAccountDetails" runat="server" Text="View Account" CssClass="styleDisplayLabel" Enabled="false" AccessKey="V"
                                        ToolTip="View the account Details, ALT+V" OnClick="lnkViewAccountDetails_Click"></asp:LinkButton>

                                    <%-- <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ControlToValidate="ddlBranch"
                            ErrorMessage="Select a Location" CssClass="styleMandatoryLabel" Display="None"
                            InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>

                                    <asp:HiddenField ID="hdnAccount_ID" runat="server" />

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblPAN" runat="server" Text="Account Number" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divSLA" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlSLA" runat="server" ToolTip="Sub Account Number"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlSLA_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvddlSLA" InitialValue="0" CssClass="styleMandatoryLabel"
                                        runat="server" ControlToValidate="ddlSLA" SetFocusOnError="True" ErrorMessage="Select a Sub Account Number"
                                        Display="None"></asp:RequiredFieldValidator>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblSLA" runat="server" Text="Sub Account Number" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlInvoice" runat="server" ToolTip="Vendor Invoice No." AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlInvoice_SelectedIndexChanged" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <%--           <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvInvoice" InitialValue="0"
                                            runat="server" ControlToValidate="ddlInvoice" SetFocusOnError="True" ErrorMessage="Select a Vendor Invoice No."
                                            Display="Dynamic" CssClass="validation_msg_box_sapn" Enabled="false"></asp:RequiredFieldValidator>
                                    </div>--%>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblInvoice" runat="server" Text="Vendor Invoice No." CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:TextBox ID="txtInvoiceDate" runat="server" Enabled="false" MaxLength="20"
                                        ToolTip="Vendor Invoice Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblInvoiceDate" runat="server" Text="Vendor Invoice Date" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:TextBox ID="txtInvoiceAmount" runat="server" Enabled="false" class="md-form-control form-control login_form_content_input requires_true"
                                        ToolTip="Invoice Amount" Style="text-align: right"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblInvoiceAmount" runat="server" Text="Invoice Amount" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtCustomerNameDummy" runat="server" CssClass="md-form-control form-control"
                                        Style="display: none;" MaxLength="50"></asp:TextBox>
                                    <uc4:ICM ID="ucCustomerCodeLov" HoverMenuExtenderLeft="true" runat="server" DispalyContent="Both" Enabled="false"
                                        strLOV_Code="" ServiceMethod="GetDummyList" class="md-form-control form-control" />
                                    <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false"
                                        Style="display: none" />
                                    <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go" CssClass="md-form-control form-control">  </asp:TextBox>
                                    <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvtxtCustomerNameDummy" runat="server" ErrorMessage="Select the Customer"
                                            ValidationGroup="Submit" SetFocusOnError="true" ControlToValidate="txtCustomerNameDummy" CssClass="validation_msg_box_sapn"
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <label>
                                        <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name/Code" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divVendorCode" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:TextBox ID="txtVendorCodeDummy" runat="server" Style="display: none;" MaxLength="100" ToolTip="Vendor Name/Code" CssClass="md-form-control form-control">  </asp:TextBox>
                                    <uc4:ICM ID="ucVendorCodeLov" onblur="fnLoadVendor()" HoverMenuExtenderLeft="true" runat="server" DispalyContent="Both" AutoPostBack="true"
                                        strLOV_Code="" ServiceMethod="GetVendorList" class="md-form-control form-control" OnItem_Selected="ucVendorCodeLov_Item_Selected" />
                                    <asp:Button ID="btnLoadVendor" runat="server" Text="Load Vendor" CausesValidation="false" UseSubmitBehavior="false"
                                        Style="display: none" />

                                    <asp:HiddenField ID="hdnVendorID" runat="server" />
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvtxtVendorCodeDummy" runat="server" ErrorMessage="Select the Vendor Name" Enabled="false"
                                            ValidationGroup="Submit" SetFocusOnError="true" ControlToValidate="txtVendorCodeDummy" CssClass="validation_msg_box_sapn"
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblVendorName" runat="server" Text="Vendor Name/Code" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>



                <%--   <uc1:S3GCustomerAddress ID="S3GCustomerAddress" runat="server" FirstColumnStyle="styleFieldLabel"
                                    SecondColumnStyle="styleFieldAlign" />
                           
                          
                                <uc1:S3GCustomerAddress ID="S3GVendorAddress" runat="server" Caption="Vendor" FirstColumnStyle="styleFieldLabel"
                                    SecondColumnStyle="styleFieldAlign" />--%>



                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <asp:Panel ID="pnlAssetDetails" runat="server" GroupingText="Asset Details" CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAIE" Enabled="false" runat="server" ToolTip="Asset Identity Number" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblAIENo" runat="server" Text="Asset Identity Number" ContentEditable="False"
                                                CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAIEDate" runat="server" ReadOnly="true" ToolTip="Asset Identification Date" class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblAIEDate" runat="server" Text="Asset Identification Date" ContentEditable="False"
                                                CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleRecordCount" id="divAssetMessage" runat="server" visible="false">
                                    <asp:Label runat="server" ID="Label4" Text="Asset Details already updated" Font-Size="Medium"
                                        class="styleMandatoryLabel"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                                    <div id="divAstGrid" runat="server">
                                        <div class="gird">
                                            <asp:GridView ID="grvAsset" runat="server" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false"
                                                OnRowDataBound="grvAsset_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAssetID" Visible="false" runat="server" Text='<%#Eval("Asset_Number")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Sl.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSINO" MaxLength="20" Text='<%#Eval("Row")%>' runat="server" ToolTip="Unit SI.Number"></asp:Label>
                                                            <asp:Label ID="lblAssetType" Text='<%#Eval("AssetType_ID")%>' runat="server" Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Asset Code" DataField="Asset_Code" ItemStyle-HorizontalAlign="Left" />
                                                    <asp:BoundField HeaderText="Asset Description" DataField="ASSET_DESCription" ItemStyle-HorizontalAlign="Left" />
                                                    <asp:TemplateField HeaderText="Ref SL No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRefSLNo" MaxLength="20" Text='<%#Eval("REF_SLNO")%>' runat="server" ToolTip="Reference Serial Number" Width="70px"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Vendor Code/Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblVendorCode" runat="server" Width="100px" Text='<%#Eval("VENDOR_NAME")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asset Status ID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAssetStatusID" runat="server" Width="100px" Text='<%#Eval("ASSET_STATUS_ID")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asset Status">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAssetStatus" runat="server" Width="100px" Text='<%#Eval("Asset_Status")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Amount Financed">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmountFinanced" runat="server" Width="100px" Text='<%#Eval("Amount_Financed")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Registration Number">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtRegNo1" MaxLength="10" Text='<%#Eval("REGN_NUMBER1")%>' CssClass="md-form-control form-control login_form_content_input requires_true" Width="80px"
                                                                    runat="server" ToolTip="Registration Number"></asp:TextBox>
                                                                <asp:TextBox ID="txtRegNo2" MaxLength="10" Text='<%#Eval("REGN_NUMBER2")%>' CssClass="md-form-control form-control login_form_content_input requires_true" Width="100px"
                                                                    runat="server" ToolTip="Registration Number"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                            <%-- <cc1:FilteredTextBoxExtender ID="ftxtRegAla" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters"
                                                                TargetControlID="txtRegNo1" ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXZabcdefghijklmnopqrstuvwxyz">
                                                            </cc1:FilteredTextBoxExtender>--%>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtRegAla" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                TargetControlID="txtRegNo1" ValidChars="">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtRegNo" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                TargetControlID="txtRegNo2" ValidChars="">
                                                            </cc1:FilteredTextBoxExtender>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Engine Number">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtEngineNo" MaxLength="20" Text='<%#Eval("ENGINE_NUMBER")%>' CssClass="md-form-control form-control login_form_content_input requires_true" Width="100px"
                                                                    runat="server" ToolTip="Engine Number"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>

                                                            <cc1:FilteredTextBoxExtender ID="ftxtEngine" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                TargetControlID="txtEngineNo" ValidChars="">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Chassis Number">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtChassisNo" MaxLength="20" Text='<%#Eval("CHASIS_NUMBER")%>' CssClass="md-form-control form-control login_form_content_input requires_true" Width="100px"
                                                                    runat="server" ToolTip="Chassis Number"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtChassis" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                TargetControlID="txtChassisNo" ValidChars="">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Serial Number">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtSerialNo" MaxLength="20" Text='<%#Eval("SERIAL_NUMBER")%>' CssClass="md-form-control form-control login_form_content_input requires_true" Width="100px"
                                                                    runat="server" ToolTip="Serial Number"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtSerialNo" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                TargetControlID="txtSerialNo" ValidChars="">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Installation Ref Number">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtInstallationNo" MaxLength="20" Text='<%#Eval("INSTALLATION_REF_NO")%>' CssClass="md-form-control form-control login_form_content_input requires_true" Width="100px"
                                                                    runat="server" ToolTip="Installation Ref Number"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtInstRefNo" runat="server" FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                                                TargetControlID="txtInstallationNo" ValidChars="">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Installation Date">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtInstallationDate" MaxLength="20" runat="server" 
                                                                    CssClass="md-form-control form-control login_form_content_input requires_true" Width="100px" 
                                                                    AutoPostBack="true" OnTextChanged="txtInstallationDate_TextChanged"
                                                                    ToolTip="Installation Date" Text='<%#Eval("INSTALLATION_DATE")%>'></asp:TextBox>
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtInstallationDate"
                                                                    ID="CEInsDate" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="First Registration Date">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtFirstRegistrationDate" AutoPostBack="true" OnTextChanged="txtFirstRegistrationDate_TextChanged" MaxLength="20" runat="server" CssClass="md-form-control form-control login_form_content_input requires_true" Width="100px"
                                                                    ToolTip="First Registration Date" Text='<%#Eval("FIRST_REGISTRATION_DATE")%>'></asp:TextBox>
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtFirstRegistrationDate"
                                                                    ID="CEFirstRegisDate" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Registration Date">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtRegistrationDate" MaxLength="20" runat="server" AutoPostBack="true" OnTextChanged="txtRegistrationDate_TextChanged" CssClass="md-form-control form-control login_form_content_input requires_true" Width="100px"
                                                                    ToolTip="Registration Date" Text='<%#Eval("REGISTRATION_DATE")%>'></asp:TextBox>
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtRegistrationDate"
                                                                    ID="CERegisDate" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Renewal Date">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtRenewalDate" MaxLength="20" runat="server" AutoPostBack="true" OnTextChanged="txtRenewalDate_TextChanged" CssClass="md-form-control form-control login_form_content_input requires_true" Width="100px"
                                                                    ToolTip="Renewal Date" Text='<%#Eval("RENEWAL_DATE")%>'></asp:TextBox>
                                                                <cc1:CalendarExtender runat="server" TargetControlID="txtRenewalDate"
                                                                    ID="CERenewalDate" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Registration Type">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px; width: 200px">
                                                                <asp:DropDownList ID="ddlRegistrationType" runat="server" ToolTip="Registration Type" CssClass="md-form-control form-control" Width="200px">
                                                                </asp:DropDownList>
                                                                <asp:Label ID="lblREGISTRATIONTYPE" Text='<%#Eval("REGISTRATION_TYPE")%>' runat="server" Visible="false"></asp:Label>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Registered By">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtRegistered_By" MaxLength="20" Text='<%#Eval("REGISTERED_BY")%>' CssClass="md-form-control form-control login_form_content_input requires_true" Width="100px"
                                                                    runat="server" ToolTip="Registered By"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="fttxtRegistered_By" ValidChars=" .&" TargetControlID="txtRegistered_By"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                                    Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Seller ID">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtSELLER_ID" MaxLength="12" Text='<%#Eval("SELLER_ID")%>' CssClass="md-form-control form-control login_form_content_input requires_true" Width="100px"
                                                                    runat="server" ToolTip="Seller ID"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="fttxtSELLER_ID" runat="server" ValidChars="/"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    Enabled="True" TargetControlID="txtSELLER_ID">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Seller Name">
                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtSeller" MaxLength="100" Text='<%#Eval("SELLER")%>' CssClass="md-form-control form-control login_form_content_input requires_true" Width="100px"
                                                                    runat="server" ToolTip="Seller Name"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="fttxtSeller" ValidChars=" .&" TargetControlID="txtSeller"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                                    Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--changed By Thangam M on 18/Nov/2011 to fix UAT bug--%>
                                                    <asp:TemplateField HeaderText="Upload Document">
                                                        <ItemTemplate>
                                                            <div class="md-input">
                                                                <asp:UpdatePanel ID="up1" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:FileUpload runat="server" ID="flUploadI" Width="180px" ToolTip="Upload File" />
                                                                        <asp:Button ID="btnBrowse" CausesValidation="false" runat="server" OnClick="btnBrowse_OnClick" Style="display: none"></asp:Button>
                                                                        <asp:TextBox ID="txtFileupldI" Visible="false" runat="server" ReadOnly="true" CssClass="styleDisplayText" />

                                                                        <asp:Label ID="lblActualPathI" runat="server" Visible="false" Text='<%# Eval("INSTALLATION_DOC_PATH") %>'></asp:Label>
                                                                        <asp:Label ID="lblCurrentPath" runat="server" Visible="false" />
                                                                        <asp:HiddenField ID="hdnSelectedPath" runat="server" />
                                                                        <asp:CheckBox ID="chkSelect" runat="server" Text="" Width="20px" Enabled="false" Visible="false" />


                                                                        <asp:Button CssClass="styleGridShortButton" ID="btnDlg" runat="server" Text="Browse"
                                                                            Style="display: none"></asp:Button>

                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:PostBackTrigger ControlID="btnBrowse" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                        </ItemTemplate>

                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAssetIsNew" Visible="false" runat="server" Text='<%#Eval("IS_NEW")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View" ItemStyle-VerticalAlign="Middle">
                                                        <ItemTemplate>
                                                            <%--   <asp:ImageButton ID="BtnView" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                            runat="server" ToolTip="View,Alt+V" AccessKey="V" Visible="false" />--%>

                                                            <div class="md-input">
                                                                <asp:Label runat="server" ID="lblPath" Visible="false" Text='<%# Eval("INSTALLATION_DOC_PATH")%>'></asp:Label>
                                                                <asp:LinkButton runat="server" CausesValidation="false" onchange="funSetValidationValues();" CssClass="grid_btn" ID="hyplnkView" OnClick="hyplnkView_Click" Text="View"></asp:LinkButton>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <asp:Panel ID="pnlInvoiceDetails" runat="server" GroupingText="Invoice Details" CssClass="stylePanel">
                            <div class="gird">
                                <asp:GridView ID="gvInvoiceDetails" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false"
                                    OnRowDataBound="gvInvoiceDetails_RowDataBound" runat="server" ShowFooter="True" OnRowCommand="gvInvoiceDetails_RowCommand" OnRowDeleting="gvInvoiceDetails_RowDeleting" class="gird_details">
                                    <Columns>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInvoiceID" runat="server" Text='<%#Eval("Invoice_ID")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSINO" MaxLength="20" Text='<%#Eval("SERIAL_NUMBER")%>' runat="server" ToolTip="Unit SI.Number"></asp:Label>
                                                <%--<asp:Label ID="lblAssetType" Text='<%#Eval("AssetType_ID")%>' runat="server" Visible="false"></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Asset ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAsset_ID" Text='<%#Eval("AssetID")%>' runat="server" ToolTip="Asset ID"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Asset Status ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAssetStatusID" runat="server" Text='<%#Eval("ASSET_STATUS_ID")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Asset Description">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAsset_Description" Text='<%#Eval("AssetDescription")%>' runat="server" ToolTip="Asset Description"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlAssetDescription" runat="server" ToolTip="Asset Description" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAssetDescription_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box" style="top: 25px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvAssetDescription" runat="server" ControlToValidate="ddlAssetDescription"
                                                            Display="Dynamic" SetFocusOnError="true" CssClass="validation_msg_box_sapn" ErrorMessage="Select Asset Description" InitialValue="0" ValidationGroup="Add">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ref SL No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRefSLNo" Text='<%#Eval("REF_SLNO")%>' runat="server" ToolTip="Reference Serial Number"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label ID="lblFRefSLNo" Text='<%#Eval("REF_SLNO")%>' runat="server" ToolTip="Reference Serial Number"></asp:Label>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Invoice Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInvoice_Number" Text='<%#Eval("Invoice_No")%>' runat="server" ToolTip="Invoice Number"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtInvoice_Number" runat="server" Text='<%#Bind("Invoice_No") %>' MaxLength="30" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="fttxtNominee" ValidChars="/-()" TargetControlID="txtInvoice_Number"
                                                        FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                        Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box" style="top: 25px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtInvoice_Number" runat="server" ControlToValidate="txtInvoice_Number"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                            ErrorMessage="Enter Invoice Number"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>

                                            </FooterTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Invoice Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInvoice_Date" Text='<%#Eval("Invoice_Date")%>' runat="server" ToolTip="Invoice Date"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtInvoice_Date" runat="server" MaxLength="20" Text='<%#Bind("Invoice_Date") %>' 
                                                        CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="cetxtInvoice_Date" runat="server" Enabled="True"
                                                        TargetControlID="txtInvoice_Date">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtInvoice_Date" runat="server" ControlToValidate="txtInvoice_Date"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                            ErrorMessage="Enter Invoice Date"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Invoice Amount">
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtInvoice_Amount_Hdr" MaxLength="20" runat="server" Style="text-align: right"
                                                        CssClass="md-form-control form-control login_form_content_input requires_true" Width="100px"
                                                        OnTextChanged="txtInvoice_Amount_Hdr_TextChanged" AutoPostBack ="true"
                                                        ToolTip="Invoice Amount" Text='<%#Eval("Invoice_Amount")%>'></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftInvoice_Amount" runat="server" FilterType="Custom,Numbers"
                                                        ValidChars="." TargetControlID="txtInvoice_Amount_Hdr">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvInvoice_Amount" runat="server" ControlToValidate="txtInvoice_Amount_Hdr"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                            ErrorMessage="Enter Invoice Amount"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtInvoice_Amount" runat="server" ToolTip="Invoice_Amount" Style="text-align: right"
                                                        CssClass="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftInvoice_Amount" runat="server" FilterType="Custom,Numbers"
                                                        ValidChars="." TargetControlID="txtInvoice_Amount">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvInvoice_Amount" runat="server" ControlToValidate="txtInvoice_Amount"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Add" SetFocusOnError="True"
                                                            ErrorMessage="Enter Invoice Amount"></asp:RequiredFieldValidator>
                                                    </div>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>

                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Button ID="btnRemove" runat="server" CausesValidation="false" Text="Delete" 
                                                    AccessKey="R" ToolTip="Delete[Alt+R]" CommandName="Delete" 
                                                    OnClientClick="return confirm('Do you want to delete this record?');" CssClass="grid_btn_delete" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <button class="css_btn_enabled" id="btnAdd" title="Add,Alt+A" onserverclick="btnAdd_ServerClick" runat="server"
                                                    type="button" accesskey="A" validationgroup="Add">
                                                    <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                </button>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPay_Flag" runat="server" Text='<%#Eval("Pay_Flag")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <asp:Panel ID="pnlHistory" runat="server" Visible="false" CssClass="stylePanel" GroupingText="Asset Details History">
                            <div class="gird">
                                <asp:GridView ID="grvAssetHistory" runat="server" HeaderStyle-CssClass="styleGridHeader"
                                    RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" class="gird_details">
                                    <Columns>

                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSerialNo" runat="server" ToolTip="S.No" Text='<%#Container.DataItemIndex+1%>' Width="80px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Asset Code">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAsset_Code" Text='<%#Eval("Asset_Code")%>' runat="server" ToolTip="Asset Code" Width="120px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Asset Description">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAsset_Description" Text='<%#Eval("Asset_Description")%>' runat="server" ToolTip="Asset Description" Width="150px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ref SL No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHistRefSLNo" Text='<%#Eval("REF_SLNO")%>' runat="server" ToolTip="Asset Description" Width="150px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Registration Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRegistration_No" Text='<%#Eval("REGN_NUMBER")%>' runat="server" ToolTip="Registration Number" Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Installation Ref No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInstallation_Ref_No" Text='<%#Eval("INSTALLATION_REF_NO")%>' runat="server" ToolTip="Installation Ref Number" Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Installation Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInstallation_Date" Text='<%#Eval("INSTALLATION_DATE")%>' runat="server" ToolTip="Installation Date" Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Registration Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRegistration_Date" Text='<%#Eval("REGISTRATION_DATE")%>' runat="server" ToolTip="Registration Date" Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Renewal Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRenewal_Date" Text='<%#Eval("RENEWAL_DATE")%>' runat="server" ToolTip="Renewal Date" Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Registered By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRegistered_By" Text='<%#Eval("REGISTER_NAME")%>' runat="server" ToolTip="Registered By" Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Seller ID">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSeller_ID" Text='<%#Eval("SELLER_ID")%>' runat="server" ToolTip="Seller ID" Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Seller Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSeller_Name" Text='<%#Eval("SELLER_NAME")%>' runat="server" ToolTip="Seller Name" Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                        </asp:Panel>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12" align="right">

                    <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(fnCheckPageValidators('Submit'))" validationgroup="Submit"
                        type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>

                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnPrint" title="Print[Alt+L]" causesvalidation="false" visible="false" runat="server" onserverclick="btnPrint_ServerClick"
                        type="button" accesskey="L">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>P</u>rint
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
            </div>

            <%-- <div id="div1" style="display: none">
                <asp:CustomValidator ID="custAsset" runat="server" OnServerValidate="custAsset_ServerValidate"
                    Display="None"></asp:CustomValidator>

                <asp:ValidationSummary ID="vsAssetVerification" runat="server" HeaderText="Correct the following validation(s):"
                    CssClass="styleMandatoryLabel" Width="100%" />
                <asp:HiddenField ID="hdnScreenWidth" runat="server" />
            </div>--%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">

        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }
        function fnLoadVendor() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadVendor').click();
        }
        function pageLoad() {
            //if (document.getElementById('divMenu').style.display == 'none') {
            //    (document.getElementById('ctl00_ContentPlaceHolder1_divAstGrid')).style.width = screen.width - document.getElementById('divMenu').style.width - 50;
            //}
            //else {
            //    (document.getElementById('ctl00_ContentPlaceHolder1_divAstGrid')).style.width = screen.width - 280;
            //}
        }

        // Not Used
        function setRight() {
            var divx = document.getElementById('ctl00_ContentPlaceHolder1_divAstGrid');
            divx.scrollTop = divx.scrollHeight;
        }

        function showMenu(show) {
            if (show == 'T') {

                if (document.getElementById('divGrid1') != null) {
                    document.getElementById('divGrid1').style.width = "800px";
                    document.getElementById('divGrid1').style.overflow = "scroll";
                }

                document.getElementById('divMenu').style.display = 'Block';
                document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

                document.getElementById('ctl00_imgShowMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

                (document.getElementById('ctl00_ContentPlaceHolder1_divAstGrid')).style.width = screen.width - 280;
            }
            if (show == 'F') {
                if (document.getElementById('divGrid1') != null) {
                    document.getElementById('divGrid1').style.width = "960px";
                    document.getElementById('divGrid1').style.overflow = "auto";
                }

                document.getElementById('divMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'none';
                document.getElementById('ctl00_imgShowMenu').style.display = 'Block';

                (document.getElementById('ctl00_ContentPlaceHolder1_divAstGrid')).style.width = screen.width - document.getElementById('divMenu').style.width - 50;
            }
        }

        function fnLoadPath(btnBrowse) {
            if (btnBrowse != null)
                document.getElementById(btnBrowse).click();
        }

        function fnAssignPath(btnBrowse, hdnPath) {
            if (btnBrowse != null)
                document.getElementById(hdnPath).value = document.getElementById(btnBrowse).value;
        }

        function FunCheckForZero(input, strName) {


            // debugger        
            var Score = document.getElementById(input).value;
            if (Score != '') {
                if (!isNaN(Score)) {
                    if (Score == 0) {
                        alert(strName + 'cannot be Zero');
                        document.getElementById(input).value = '';
                        document.getElementById(input).focus();
                    }
                }
                //            else
                //            {
                //                var IsSlashContains=true;
                //                while(IsSlashContains)
                //                {
                //                  if(Score.indexOf('/') == -1 && Score.indexOf('-') == -1)
                //                  {  
                //                    IsSlashContains = false;
                //                  }
                //                  else
                //                  {
                //                    Score = Score.replace('/','');
                //                    Score = Score.replace('-','');
                //                  }
                //                }               
                //                
                //                if(Score.trim() == '' || Score.trim() == 0)
                //                {
                //                    alert(strName + 'is not valid');
                //                    document.getElementById(input).value = '';
                //                    document.getElementById(input).focus();
                //                }                
                //            }
            }
        }

        function fnTrashCustomerSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";


                }
            }
        }

        function fnTrashAccountSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
                }
            }
        }

        <%--        function fnTrashVendorSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtVendorCodeDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtVendorCodeDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtVendorCodeDummy.ClientID %>').value = "";
                }
            }
        }--%>
    </script>

</asp:Content>
