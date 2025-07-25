<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Insurance_S3GInsAssetInsuranceClaim, App_Web_q5jmkrdt" enableeventvalidation="false" enableviewstate="true" %>

<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%--<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>--%>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>

                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <asp:Panel ID="PnlInputCriteria" runat="server" GroupingText="Input Criteria" CssClass="stylePanel" Width="100%">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business" AutoPostBack="true" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB" CssClass="validation_msg_box_sapn" SetFocusOnError="true"
                                                Display="Dynamic" InitialValue="0" ErrorMessage="Select a Line of Business" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                            <asp:RequiredFieldValidator ID="rfvPolicyLOB" runat="server" ControlToValidate="ddlLOB"
                                                Display="None" InitialValue="0" ErrorMessage="Select a Line of Business" ValidationGroup="Add"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true" ToolTip="Branch" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" onmouseover="ddl_itemchanged(this);" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ControlToValidate="ddlBranch" CssClass="validation_msg_box_sapn" SetFocusOnError="true"
                                                Display="Dynamic" InitialValue="0" ErrorMessage="Select the Branch" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblBranch" runat="server" CssClass="styleReqFieldLabel" Text="Branch"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtCustomerNameDummy" runat="server" CssClass="md-form-control form-control"
                                            Style="display: none;" MaxLength="50"></asp:TextBox>
                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" ToolTip="Customer Name" runat="server" AutoPostBack="true" DispalyContent="Both" class="md-form-control form-control"
                                            strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                        <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                            Style="display: none" />
                                        <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go">  </asp:TextBox>
                                        <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvtxtCustomerNameDummy" runat="server" ErrorMessage="Select the Customer" ValidationGroup="Submit"
                                                SetFocusOnError="true" ControlToValidate="txtCustomerNameDummy" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name/Code"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                            Style="display: none;" MaxLength="100"></asp:TextBox>
                                        <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ToolTip="Account Number" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                            strLOV_Code="ACC_LIVE" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" />
                                        <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                            Style="display: none" />
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvtxtAccountNoDummy" runat="server" ErrorMessage="Select the Account Number"
                                                SetFocusOnError="true" ControlToValidate="txtAccountNoDummy" CssClass="validation_msg_box_sapn" ValidationGroup="Submit"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                          <asp:LinkButton ID="lnkViewAccountDetails" runat="server" Text="View Account" CssClass="styleDisplayLabel" AccessKey="V"
                                            ToolTip="View the account Details, ALT+V" OnClick="lnkViewAccountDetails_Click"></asp:LinkButton>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblMLA" runat="server" ToolTip="Account Number" CssClass="styleReqFieldLabel"
                                                Text="Account Number"></asp:Label>
                                        </label>


                                        <%--    <asp:DropDownList ID="ddlMLA" runat="server" ToolTip="Account No" OnSelectedIndexChanged="ddlMLA_SelectedIndexChanged" class="md-form-control form-control"
                                            AutoPostBack="true">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvPrimeAccount" runat="server" ControlToValidate="ddlMLA"
                                                Display="Dynamic" InitialValue="0" ErrorMessage="Select a Account Number"
                                                ValidationGroup="Submit" SetFocusOnError="true" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblMLA" runat="server" CssClass="styleReqFieldLabel" Text="Account Number"></asp:Label>
                                        </label>--%>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtICNNO" runat="server" ToolTip="ICN No" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblICNNO" runat="server" ToolTip="ICN No" CssClass="styleReqFieldLabel" Text="ICN No"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtICNDate" runat="server" ToolTip="ICN Date" ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="ftxtICNDate" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                            TargetControlID="txtICNDate" ValidChars="/-">
                                        </cc1:FilteredTextBoxExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblICNDate" runat="server" ToolTip="ICN Date" CssClass="styleDisplayLabel" Text="ICN Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divSubAccountNo" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlSLA" runat="server" ToolTip="Sub Account Number" Visible="false" Width="165px" Style="height: 22px" OnSelectedIndexChanged="ddlSLA_SelectedIndexChanged"
                                            AutoPostBack="true">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvSubAccount" runat="server" ControlToValidate="ddlSLA"
                                            Display="None" InitialValue="0" ErrorMessage="Select a Sub Account Number" Enabled="false"
                                            ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblSLA" runat="server" CssClass="styleReqFieldLabel" Text="Sub Account Number" Visible="false"></asp:Label>
                                        </label>
                                    </div>
                                </div>


                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkActive" runat="server" />
                                        <asp:Label runat="server" Text="Active" ID="lblActive" CssClass="styleDisplayLabel">
                                        </asp:Label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <asp:Panel ID="pnlPolicyDetails" runat="server" ScrollBars="Horizontal" CssClass="stylePanel" GroupingText="Policy Details" Visible="true">
                            <div class="gird">
                                <asp:GridView ID="gvPolicyDetails" runat="server" AutoGenerateColumns="false" OnRowDeleting="gvPolicyDetails_RowDeleting" Visible="true"
                                    OnRowDataBound="gvPolicyDetails_RowDataBound" ShowFooter="True" class="gird_details">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Accident Date">
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="lblAccidentDate" runat="server" Text='<%# Bind("ACCIDENTDATE") %>'
                                                        ToolTip="Accident Date" CssClass="md-form-control form-control login_form_content_input requires_true" Width="100px"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="calAccidentDateEdit" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                        TargetControlID="lblAccidentDate">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box" style="height: 28px;">
                                                        <asp:RequiredFieldValidator ID="rfvlblAccidentDate" runat="server" ControlToValidate="lblAccidentDate"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Submit" SetFocusOnError="True"
                                                            ErrorMessage="Enter the Accident Date"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <%--     <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtAccidentDate" runat="server" ToolTip="AccidentDate" Width="100px" CssClass="md-form-control form-control"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CEAccidentDate" runat="server" PopupButtonID="imgAccidentDate" TargetControlID="txtAccidentDate">
                                                    </cc1:CalendarExtender>
                                                    <asp:RequiredFieldValidator ID="rfvtxtAccidentDate" runat="server" ControlToValidate="txtAccidentDate"
                                                        CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Submit" SetFocusOnError="True"
                                                        ErrorMessage="Select Accident Date"></asp:RequiredFieldValidator>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Accident Details">
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="lblAccidentDet" runat="server" TextMode="MultiLine" Style="padding-left: 5px" CssClass="md-form-control form-control login_form_content_input requires_true"
                                                        Text='<%# Bind("ACCIDENTDETAILS") %>' ToolTip="Accident Details" onkeyup="maxlengthfortxt(200)" Width="200px"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <%--   <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtAccidentDet" runat="server" onkeyup="maxlengthfortxt(200)" TextMode="MultiLine" CssClass="md-form-control form-control login_form_content_input"
                                                        ToolTip="AccidentDet"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Claim No">
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="lblAssetClaimNumber" runat="server" MaxLength="16" Style="padding-left: 5px" CssClass="md-form-control form-control login_form_content_input requires_true"
                                                        Text='<%# Bind("AssetClaimNo") %>' ToolTip="Asset Claim Number" Width="100px"></asp:TextBox>

                                                    <cc1:FilteredTextBoxExtender ID="ftxtAssetClaimNumber" runat="server" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                        TargetControlID="lblAssetClaimNumber">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box" style="height: 28px;">
                                                        <asp:RequiredFieldValidator ID="rfvlblAssetClaimNumber" runat="server" ControlToValidate="lblAssetClaimNumber"
                                                            ValidationGroup="Submit" Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Enter the Claim Number"></asp:RequiredFieldValidator>
                                                    </div>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <%--  <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtAssetClaimNumber" runat="server" MaxLength="16" ToolTip="Asset Claim Number" CssClass="md-form-control form-control"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvtxtAssetClaimNumber" runat="server" ControlToValidate="txtAssetClaimNumber"
                                                        CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Submit" SetFocusOnError="True"
                                                        ErrorMessage="Enter the Claim Number"></asp:RequiredFieldValidator>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Claim Date">
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="lblAssetClaimDate" runat="server" Text='<%# Bind("ClaimDate") %>' CssClass="md-form-control form-control login_form_content_input requires_true"
                                                        ToolTip="Asset Claim Date" Width="100px"></asp:TextBox>

                                                    <cc1:CalendarExtender ID="calAssetClaimDateEdit" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                        TargetControlID="lblAssetClaimDate">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box" style="height: 28px;">
                                                        <asp:RequiredFieldValidator ID="rfvlblAssetClaimDate" runat="server" ControlToValidate="lblAssetClaimDate"
                                                            Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="Submit" SetFocusOnError="True"
                                                            ErrorMessage="Enter the Claim Date">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <%-- <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtAssetClaimDate" runat="server" ToolTip="AssetClaimDate" CssClass="md-form-control form-control"></asp:TextBox>

                                                    <cc1:CalendarExtender ID="CEAssetClaimDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                        TargetControlID="txtAssetClaimDate">
                                                    </cc1:CalendarExtender>
                                                    <asp:RequiredFieldValidator ID="rfvtxtAssetClaimDate" runat="server" ControlToValidate="txtAssetClaimDate"
                                                        CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Submit" SetFocusOnError="True"
                                                        ErrorMessage="Select the Asset Claim Date"></asp:RequiredFieldValidator>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Alert Date" Visible="false">
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtAssetAlertDate" runat="server" Text='<%# Bind("AlertDate") %>' CssClass="md-form-control form-control login_form_content_input requires_true"
                                                        ToolTip="Asset Alert Date" OnTextChanged="txtAssetAlertDate_TextChanged" AutoPostBack="true" Width="100px"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="calAssetAlertDateEdit" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                        TargetControlID="txtAssetAlertDate">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box" style="height: 28px;">
                                                        <asp:RequiredFieldValidator ID="rfvlblAssetAlertDate" runat="server" ControlToValidate="txtAssetAlertDate"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Submit" SetFocusOnError="True"
                                                            ErrorMessage="Select the Alert Date"></asp:RequiredFieldValidator>
                                                    </div>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <%--<FooterTemplate>
                                                            <asp:TextBox ID="txtAlertDate" runat="server" MaxLength="8" ToolTip="AssetAlertDate" ></asp:TextBox>
                                                            <asp:Image ID="imgAssetAlert" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Select Alert Date"
                                                                Visible="false" />
                                                            <cc1:CalendarExtender ID="CEAlertDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                                PopupButtonID="Image1" TargetControlID="txtAlertDate">
                                                            </cc1:CalendarExtender>
                                                            <asp:RequiredFieldValidator ID="rfvtxtAlertDate" runat="server" ControlToValidate="txtAlertDate"
                                                                CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Submit" SetFocusOnError="True"
                                                                ErrorMessage="Select the Alert Date"></asp:RequiredFieldValidator>
                                                        </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Regn No or Serial No">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblRegnnoH" runat="server" Text="Regn/Serial/Engine/Chassis No - Policy No" CssClass="styleDisplayLabel"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlMachineNoEdit" runat="server" CssClass="md-form-control form-control"
                                                        ToolTip="Regn/Serial/Engine/Chassis No" AutoPostBack="true" OnSelectedIndexChanged="ddlMachineNo_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box" style="height: 28px;">
                                                        <asp:RequiredFieldValidator ID="rfvMachineNo" runat="server" ControlToValidate="ddlMachineNoEdit"
                                                            Display="Dynamic" ValidationGroup="Submit" SetFocusOnError="True" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Select Regn/Serial/ Engine/Chassis No - Policy No"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <%--                           <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlMachineNo" runat="server" MaxLength="20" ToolTip="Regn No or Serial No"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlMachineNo_SelectedIndexChanged"
                                                        CssClass="md-form-control form-control" Width="100px">
                                                    </asp:DropDownList>
                                                   <asp:RequiredFieldValidator ID="rfvMachineNo" runat="server" ControlToValidate="txtRegNo"
                                                                Display="None" ErrorMessage="Enter the Machine No" ValidationGroup="Add">
                                                            </asp:RequiredFieldValidator>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Asset_Number" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAssetNumber" runat="server" Text='<%# Bind("ASSET_NUMBER") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ACCOUNT_INS_DETAILS_ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblACCOUNT_INS_DETAILS_ID" runat="server" Text='<%# Bind("ACCOUNT_INS_DETAILS_ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Asset Description">
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">

                                                    <asp:Label ID="lblAssetDescriptionEdit" runat="server" Style="padding-left: 5px"
                                                        Text='<%# Bind("AssetDescription") %>' ToolTip="Asset Description" Width="100px"></asp:Label>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <%--                      <FooterTemplate>
                                                <asp:Label ID="lblAssetDescription" runat="server" MaxLength="20" ToolTip="Asset Description"></asp:Label>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Insured By">
                                            <ItemTemplate>

                                                <asp:Label ID="lblInsuredByEdit" runat="server" Width="100px" ToolTip="Insured By" Style="padding-left: 5px" Text='<%# Bind("InsuredBy") %>'></asp:Label>
                                            </ItemTemplate>
                                            <%--                             <FooterTemplate>
                                                <asp:Label ID="lblInsuredBy" runat="server" MaxLength="20" ToolTip="Insured By"></asp:Label>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Insurance Company ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInsuranceCompanyID" runat="server" Text='<%# Bind("INS_COMPANY_ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Insurer Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInsurerNameEdit" runat="server" Width="100px" Style="padding-left: 5px" Text='<%# Bind("Ins_Company_Name") %>'
                                                    ToolTip="Insurer Name"></asp:Label>
                                            </ItemTemplate>
                                            <%--               <FooterTemplate>
                                                <asp:Label ID="lblInsurerName" runat="server" MaxLength="20" ToolTip="Insurer Name"></asp:Label>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Policy No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPolicyNumberEdit" runat="server" Width="100px" Style="padding-left: 5px" Text='<%# Bind("PolicyNo") %>'
                                                    ToolTip="Policy Number"></asp:Label>
                                            </ItemTemplate>
                                            <%-- <FooterTemplate>
                                                <asp:Label ID="lblPolicyNumber" runat="server" MaxLength="20" ToolTip="Policy Number"></asp:Label>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Policy Setup Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPolicySetupDateEdit" runat="server" MaxLength="8" Width="100px"
                                                    Text='<%# Bind("PolicySetupDate") %>' ToolTip="Policy Setup Date"></asp:Label>
                                            </ItemTemplate>
                                            <%--        <FooterTemplate>
                                                <asp:Label ID="lblPolicySetupDate" runat="server" MaxLength="8" ToolTip="PolicySetupDate"></asp:Label>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Policy Expiry Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPolicyExpiryDateEdit" runat="server" MaxLength="8" Width="100px"
                                                    Text='<%# Bind("PolicyExpiryDate") %>' ToolTip="Policy Expiry Date"></asp:Label>
                                            </ItemTemplate>
                                            <%--     <FooterTemplate>
                                                <asp:Label ID="lblPolicyExpiryDate" runat="server" MaxLength="8" ToolTip="Valid Till Date"></asp:Label>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Insured Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInsuredAmountEdit" runat="server" Style="padding-left: 5px; text-align: right" Width="100px"
                                                    Text='<%# Bind("InsuredAmount") %>' ToolTip="Insured Amount"></asp:Label>
                                            </ItemTemplate>
                                            <%--            <FooterTemplate>
                                                <asp:Label ID="lblInsuredAmount" runat="server"></asp:Label>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Claim Amount">
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="lblClaimAmount" runat="server" MaxLength="10" Style="padding-left: 5px; text-align: right" Width="100px" CssClass="md-form-control form-control login_form_content_input requires_true"
                                                        Text='<%# Bind("ClaimAmount") %>' ToolTip="Claim Amount" onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>

                                                    <cc1:FilteredTextBoxExtender ID="ftxtPremium1" runat="server" FilterType="Custom,Numbers"
                                                        ValidChars="." TargetControlID="lblClaimAmount">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box" style="height: 28px;">
                                                        <asp:RequiredFieldValidator ID="rfvlblClaimAmount" runat="server" ControlToValidate="lblClaimAmount"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Submit" SetFocusOnError="True"
                                                            ErrorMessage="Enter the Claim Amount"></asp:RequiredFieldValidator>
                                                    </div>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <%--                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtClaimAmount" runat="server" ToolTip="Claim Amount" MaxLength="10" Style="text-align: right" onkeypress="fnAllowNumbersOnly(true,false,this)" CssClass="md-form-control form-control" Width="100px">
                                                    </asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvtxtClaimAmount" runat="server" ControlToValidate="txtClaimAmount"
                                                        Display="None" ValidationGroup="Submit" SetFocusOnError="True"
                                                        ErrorMessage="Enter the Claim Amount"></asp:RequiredFieldValidator>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtPremium" runat="server" FilterType="Custom,Numbers"
                                                        ValidChars="." TargetControlID="txtClaimAmount">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>remar
                                                </div>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlStatusEdit" runat="server" Style="padding-left: 5px" ToolTip="Status" Width="100px" CssClass="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box" style="height: 28px;">
                                                        <asp:RequiredFieldValidator ID="rfvddlstatus" runat="server" ControlToValidate="ddlStatusEdit"
                                                            Display="Dynamic" ValidationGroup="Submit" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Select the Status"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <%--                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlStatus" runat="server" MaxLength="20" ToolTip="Status" CssClass="md-form-control form-control" Width="100px">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ClaimDetails">
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="lblClaimDetails" runat="server" Width="200px" TextMode="MultiLine" Style="padding-left: 5px" CssClass="md-form-control form-control login_form_content_input requires_true"
                                                        Text='<%# Bind("ClaimDetails") %>' ToolTip="Claim Details" onkeyup="maxlengthfortxt(500)"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <%--                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtClaimDetails" runat="server" onkeyup="maxlengthfortxt(200)" TextMode="MultiLine" CssClass="md-form-control form-control login_form_content_input"
                                                        ToolTip="ClaimDetails"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Claim Received Date">
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="lblClaimRcvdDate" runat="server" Text='<%# Bind("ClaimReceivedDate") %>' CssClass="md-form-control form-control login_form_content_input requires_true"
                                                        ToolTip="Claim Received Date" Width="100px"></asp:TextBox>


                                                    <cc1:CalendarExtender ID="calClaimRcvdDateEdit" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                        TargetControlID="lblClaimRcvdDate">
                                                    </cc1:CalendarExtender>

                                                    <%--<asp:RequiredFieldValidator ID="rfvlblClaimRcvdDate" runat="server" ControlToValidate="lblClaimRcvdDate"
                                                        CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Submit" SetFocusOnError="True"
                                                        ErrorMessage="Enter the Claim Received Date"></asp:RequiredFieldValidator>--%>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <%--                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtClaimRcvdDate" runat="server" ToolTip="ClaimRcvdDate" CssClass="md-form-control form-control" Width="100px"></asp:TextBox>

                                                    <cc1:CalendarExtender ID="CEClaimRcvdDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                        TargetControlID="txtClaimRcvdDate">
                                                    </cc1:CalendarExtender>
                                                    <asp:RequiredFieldValidator ID="rfvtxtClaimRcvdDate" runat="server" ControlToValidate="txtClaimRcvdDate"
                                                        CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Submit" SetFocusOnError="True"
                                                        ErrorMessage="Select Claim Received Date"></asp:RequiredFieldValidator>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Claim Received Amount">
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="lblClaimRcvdAmt" runat="server" MaxLength="10" Style="padding-left: 5px; text-align: right" CssClass="md-form-control form-control login_form_content_input requires_true"
                                                        Text='<%# Bind("ClaimReceivedAmount") %>' ToolTip="Claim Received Amount" onkeypress="fnAllowNumbersOnly(true,false,this)" Width="100px"></asp:TextBox>

                                                    <cc1:FilteredTextBoxExtender ID="ftxtClaimRcdAmt" runat="server" FilterType="Custom,Numbers"
                                                        ValidChars="." TargetControlID="lblClaimRcvdAmt">
                                                    </cc1:FilteredTextBoxExtender>

                                                    <%--<asp:RequiredFieldValidator ID="rfvlblClaimRcvdAmt" runat="server" ControlToValidate="lblClaimRcvdAmt"
                                                        CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Submit" SetFocusOnError="True"
                                                        ErrorMessage="Enter the Claim Received Amount"></asp:RequiredFieldValidator>--%>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <%--                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtClaimRcvdAmt" runat="server" ToolTip="Claim Amount" Width="100px" MaxLength="10" Style="text-align: right" onkeypress="fnAllowNumbersOnly(true,false,this)" CssClass="md-form-control form-control">
                                                    </asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvtxtClaimRcvdAmt" runat="server" ControlToValidate="txtClaimRcvdAmt"
                                                        Display="None" ValidationGroup="Submit" SetFocusOnError="True"
                                                        ErrorMessage="Enter the Claim Received Amount"></asp:RequiredFieldValidator>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtClaimRcdAmt1" runat="server" FilterType="Custom,Numbers"
                                                        ValidChars="." TargetControlID="txtClaimRcvdAmt">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Claim Received Details">
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="lblClaimRecdDtls" runat="server" TextMode="MultiLine" Style="padding-left: 5px" CssClass="md-form-control form-control login_form_content_input requires_true"
                                                        Text='<%# Bind("ClaimReceivedDetails") %>' ToolTip="Claim Received Details" onkeyup="maxlengthfortxt(500)" Width="200px"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <%--                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtClaimRecdDtls" runat="server" onkeyup="maxlengthfortxt(200)" TextMode="MultiLine" CssClass="md-form-control form-control"
                                                        ToolTip="ClaimRecdDtls" Width="200px"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" Visible="false">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnRemove" runat="server" CausesValidation="false" CommandName="Delete" CssClass="grid_btn"
                                                    Text="Remove">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Button ID="btnAddPolicyClaim" runat="server" CausesValidation="true" CssClass="grid_btn"
                                                    OnClick="btnAddPolicyClaim_OnClick" Text="Add" ValidationGroup="Add" />
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row" id="divHistory" runat="server" visible="false">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlHistory" runat="server" CssClass="stylePanel" GroupingText="History">
                            <div class="gird">
                                <asp:GridView ID="gvHistory" runat="server" OnRowDataBound="gvHistory_RowDataBound"
                                    EmptyDataText="No history found for selected account" AutoGenerateColumns="false" Width="100%"
                                    class="gird_details">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Accident Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAccdientDateH" runat="server" Text='<%# Bind("Accident_Date") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Accident Details">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtAccidentDateH" runat="server" TextMode="MultiLine" Width="140px" Enabled="false" Text='<%# Bind("Accident_Details") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Claim No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblClaimNoH" runat="server" Text='<%# Bind("ClaimNo") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ICN No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblICNNoH" runat="server" Text='<%# Bind("ICNNO") %>' Width="100px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Claim Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblClaimDateH" runat="server" Width="100px" Text='<%# Bind("ClaimDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Claim Closed Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblClaimClosedDateH" runat="server" Width="100px" Text='<%# Bind("ClaimClosedDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Regn/Serial/Engine/Chassis No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRegnorSerialNoH" runat="server"   Text='<%# Bind("RegnorSerialNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Asset Description">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAssetDescriptionH" runat="server" Width="140px" Text='<%# Bind("AssetDescription") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="InsuredBy">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInsuredByH" runat="server"  Width="100px" Text='<%# Bind("InsuredBy") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Insurer Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInsurerNameH" runat="server" Width="120px" Text='<%# Bind("INS_COMPANY_NAME") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Policy No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPolicyNoH" runat="server" Width="100px" Text='<%# Bind("PolicyNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Policy Setup Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPolicySetupDateH" runat="server" Width="100px" Text='<%# Bind("PolicySetupDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Policy Expiry Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPolicyExpiryDateH" runat="server" Width="100px" Text='<%# Bind("PolicyExpiryDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Insured Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInsuredAmountH" runat="server" Width="100px" Text='<%# Bind("InsuredAmount") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Claim Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblClaimAmountH" runat="server" Width="100px" Text='<%# Bind("ClaimAmount") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStatusH" runat="server" Width="100px" Text='<%# Bind("Status") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Claim Details">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtClaimDetailsH" runat="server" Width="140px" Text='<%# Bind("ClaimDetails") %>' TextMode="MultiLine" Enabled="false"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Claim Received Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblClaimRecdDateH" runat="server"  Width="100px" Text='<%# Bind("CLAIM_RECVD_DATE") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Claim Received Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblClaimRecdAmountH" runat="server" Width="100px" Text='<%# Bind("CLAIM_RECVD_AMOUNT") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Claim Received Details">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtClaimRecdDetailsH" runat="server" Width="140px" Text='<%# Bind("CLAIM_RECVD_DETAILS") %>' TextMode="MultiLine" Enabled="false"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div align="right" class="fixed_btn">

                    <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_OnClick" runat="server" onclick="if(fnCheckPageValidators('Submit'))" validationgroup="Submit"
                        type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>

                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_OnClick" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>

                    <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_OnClick" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>

                </div>
                <div class="row" style="display: none;">
                    <asp:CustomValidator ID="cvAssetInsuranceClaim" runat="server" CssClass="styleMandatoryLabel"
                        Enabled="true"></asp:CustomValidator>
                    <asp:ValidationSummary ID="vsPolicyDetails" runat="server" CssClass="styleMandatoryLabel"
                        ValidationGroup="Submit" HeaderText="Correct the following validation(s):" />
                    <asp:ValidationSummary ID="vsPolicyClaimDetails" runat="server" CssClass="styleMandatoryLabel"
                        ValidationGroup="Add" HeaderText="Correct the following validation(s):" />
                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">

        //function showMenu(show) {
        //    if (show == 'T') {

        //        //Added by Kali K to solve error ( when menu is show scroll should appear in grid )
        //        //This is used to show scroll bar when div is used in GridView
        //        if (document.getElementById('divGrid1') != null) {
        //            document.getElementById('divGrid1').style.width = "800px";
        //            document.getElementById('divGrid1').style.overflow = "scroll";
        //        }

        //        document.getElementById('divMenu').style.display = 'Block';
        //        document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

        //        document.getElementById('ctl00_imgShowMenu').style.display = 'none';
        //        document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

        //        (document.getElementById('ctl00_ContentPlaceHolder1_pnlPolicyDetails')).style.width = screen.width - 260;
        //        (document.getElementById('ctl00_ContentPlaceHolder1_gvPolicyDetails')).style.width = screen.width - 260;

        //        (document.getElementById('ctl00_ContentPlaceHolder1_pnlHistory')).style.width = screen.width - 260;
        //    }
        //    if (show == 'F') {

        //        //Added by Kali K to solve error ( when menu is hide scroll for is not hiding from grid view )
        //        //This is used to hide scroll bar when div is used in GridView
        //        if (document.getElementById('divGrid1') != null) {
        //            document.getElementById('divGrid1').style.width = "960px";
        //            document.getElementById('divGrid1').style.overflow = "auto";
        //        }

        //        document.getElementById('divMenu').style.display = 'none';
        //        document.getElementById('ctl00_imgHideMenu').style.display = 'none';
        //        document.getElementById('ctl00_imgShowMenu').style.display = 'Block';

        //        //document.getElementById('divMenu').setAttribute('width', 0);

        //        (document.getElementById('ctl00_ContentPlaceHolder1_pnlPolicyDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 50;
        //        (document.getElementById('ctl00_ContentPlaceHolder1_gvPolicyDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;

        //        (document.getElementById('ctl00_ContentPlaceHolder1_pnlHistory')).style.width = screen.width - document.getElementById('divMenu').style.width - 50;
        //    }
        //}

        //function Resize() {
        //    if (document.getElementById('divMenu').style.display == 'none') {
        //        (document.getElementById('ctl00_ContentPlaceHolder1_pnlPolicyDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 50;
        //        (document.getElementById('ctl00_ContentPlaceHolder1_gvPolicyDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;

        //        (document.getElementById('ctl00_ContentPlaceHolder1_pnlHistory')).style.width = screen.width - document.getElementById('divMenu').style.width - 50;
        //    }
        //    else {
        //        (document.getElementById('ctl00_ContentPlaceHolder1_pnlPolicyDetails')).style.width = screen.width - 260;
        //        (document.getElementById('ctl00_ContentPlaceHolder1_gvPolicyDetails')).style.width = screen.width - 260;

        //        (document.getElementById('ctl00_ContentPlaceHolder1_pnlHistory')).style.width = screen.width - 260;
        //    }
        //}

        //function fnLoadCustomer() {
        //    document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCustomer').click();
        //}
        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }

        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
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

    </script>

</asp:Content>
