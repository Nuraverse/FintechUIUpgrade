<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LegalRepossession_S3GLRRepossessionNote_Add, App_Web_5saef4xg" title="Untitled Page" enableeventvalidation="false" enableviewstate="true" %>

<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
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
                            <asp:Label runat="server" Text="Repossession Note" ID="lblHeading"> </asp:Label>
                            <input id="HidConfirm" type="hidden" runat="server" />
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <asp:UpdatePanel ID="updatepanel2" runat="server">
                        <ContentTemplate>
                            <cc1:TabContainer ID="tcLRNote" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                                Width="99%" ScrollBars="Auto" meta:resourcekey="tcEntityMasterResource1">
                                <cc1:TabPanel runat="server" HeaderText="LR Note Details" ID="tpLRNOTEDetails" CssClass="tabpan"
                                    BackColor="Red" meta:resourcekey="tbEntityResource1">
                                    <HeaderTemplate>
                                        LR NOTE Details
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="LRNoteInfo" runat="server" GroupingText="Legal Repossession Note Info"
                                                        CssClass="stylePanel">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:DropDownList ID="ddlLOB" runat="server" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                                                AutoPostBack="True" class="md-form-control form-control">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                                                            </label>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select a Line of Business" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:DropDownList OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" ID="ddlBranch"
                                                                                runat="server" AutoPostBack="True" class="md-form-control form-control">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblBranch" runat="server" CssClass="styleReqFieldLabel" Text="Branch"></asp:Label>
                                                                            </label>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ControlToValidate="ddlBranch" CssClass="validation_msg_box_sapn"
                                                                                    Display="Dynamic" InitialValue="0" ErrorMessage="Select a Branch" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtLRNo" CssClass="styleAutoGenerated" runat="server" ReadOnly="True" AutoPostBack="true"
                                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblLRNo" runat="server" CssClass="styleDisplayLabel" Text="LR No"></asp:Label>
                                                                            </label>
                                                                            <asp:LinkButton ID="lnkBtnViewExistingLRN" runat="server" OnClick="lnkBtnViewExistingLRN_Click"></asp:LinkButton>
                                                                            <asp:Label ID="lblMappedLRNId" runat="server" Visible="False"></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                                                                Style="display: none;" MaxLength="100"></asp:TextBox>
                                                                            <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false"
                                                                                DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected" class="md-form-control form-control"
                                                                                strLOV_Code="ACC_ACCA" ServiceMethod="GetAccuntNoList" />
                                                                            <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                                                Style="display: none" />
                                                                            <asp:LinkButton ID="lnkViewAccountDetails" runat="server" Text="View Account" CssClass="styleDisplayLabel" Enabled="false" AccessKey="V"
                                                                                ToolTip="View the account Details, ALT+V" OnClick="lnkViewAccountDetails_Click"></asp:LinkButton>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvtxtAccountNoDummy" runat="server" ErrorMessage="Select the Account Number"
                                                                                    SetFocusOnError="true" ControlToValidate="txtAccountNoDummy" CssClass="validation_msg_box_sapn"
                                                                                    Display="Dynamic" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                                                            <asp:HiddenField ID="hdnPasa_Detail_ID" runat="server" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblMLA" runat="server" CssClass="styleReqFieldLabel" Text="Account Number"></asp:Label>
                                                                            </label>
                                                                            <asp:Button ID="btnAccountNo" runat="server" Text="View Account" AccessKey="V" ToolTip="Account Number,Alt+V"
                                                                                Style="display: none" OnClick="btnAccountNo_Click" CssClass="styleSubmitButton" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:DropDownList ID="ddlAction" runat="server" class="md-form-control form-control">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblAction" runat="server" CssClass="styleReqFieldLabel" Text="Action"></asp:Label>
                                                                            </label>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvMode" runat="server" ControlToValidate="ddlAction"
                                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select a Action" InitialValue="0" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <%--  <asp:TextBox ID="txtCustomerNameDummy" runat="server" CssClass="md-form-control form-control"
                                                                                Style="display: none;" MaxLength="50"></asp:TextBox>--%>
                                                                            <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                                Enabled="false" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" strLOV_Code="CUS_COM" />
                                                                            <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                                                Style="display: none" Enabled="false" />
                                                                            <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" Enabled="false"
                                                                                class="md-form-control form-control login_form_content_input requires_true" ToolTip="Customer Name/Code" ValidationGroup="Go">  </asp:TextBox>
                                                                            <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <%-- <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvtxtCustomerNameDummy" runat="server" ErrorMessage="Select the Customer"
                                                                                    SetFocusOnError="true" ControlToValidate="txtCustomerNameDummy" CssClass="validation_msg_box_sapn"
                                                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                                                            </div>--%>
                                                                            <label>
                                                                                <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name/Code"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtLRDate" runat="server" ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblLRDate" runat="server" CssClass="styleReqFieldLabel" Text="LR Date"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">

                                                                            <asp:DropDownList ID="ddlSLA" AutoPostBack="True" runat="server" OnSelectedIndexChanged="ddlSLA_SelectedIndexChanged" class="md-form-control form-control" Visible="false">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblSLA" runat="server" CssClass="styleReqFieldLabel" Text="Sub Account" Visible="false"></asp:Label>
                                                                            </label>
                                                                            <%--<asp:Button ID="btnAccount" runat="server" CssClass="styleSubmitButton" Text="View Account" AccessKey="V" ToolTip="View Account,Alt+V"
                                                                                Visible="False"  OnClick="btnAccount_Click" />--%>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel GroupingText="Legal Repossession Details" ID="Panel4" runat="server"
                                                        CssClass="stylePanel" Width="100%">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:DropDownList ID="ddlRepossesion" ToolTip="Repossession" class="md-form-control form-control" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlRepossesion_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="Label2" runat="server" CssClass="styleReqFieldLabel" Text="Repossession"></asp:Label>
                                                                            </label>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvRepossesion" runat="server" ControlToValidate="ddlRepossesion" InitialValue="0"
                                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Repossession" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divVendor" runat="server">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtVendorCodeDummy" runat="server" Style="display: none;" MaxLength="100" ToolTip="Vendor Name/Code" CssClass="md-form-control form-control">  </asp:TextBox>
                                                                            <uc4:ICM ID="ucVendorCodeLov" onblur="fnLoadVendor()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true"
                                                                                DispalyContent="Both" Enabled="false" ServiceMethod="GetVendorsList" OnItem_Selected="ucvendor_Item_Selected" strLOV_Code="ENT_AGENT" />
                                                                            <asp:Button ID="btnloadVendor" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnloadVendor_Click"
                                                                                Style="display: none" />
                                                                            <asp:TextBox ID="txtVendor" runat="server" Style="display: none;" MaxLength="50" Enabled="false" AutoPostBack="true"
                                                                                class="md-form-control form-control login_form_content_input requires_true" ToolTip="Agent Name/Code" ValidationGroup="Go">  </asp:TextBox>
                                                                            <asp:TextBox ID="txtVendorID" runat="server" ReadOnly="True" Visible="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <asp:HiddenField ID="hdnvendor" runat="server" />
                                                                            <asp:HiddenField ID="hdnvendorID" runat="server" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblVendor" CssClass="styleReqFieldLabel" runat="server" Text="Vendor Name/Code"></asp:Label>
                                                                            </label>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvVendor" runat="server" ErrorMessage="Select the Vendor Name/Code" Enabled="false"
                                                                                    SetFocusOnError="true" ControlToValidate="txtVendorCodeDummy" CssClass="validation_msg_box_sapn"
                                                                                    Display="Dynamic" ValidationGroup="Submit" InitialValue=""></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divEmp" runat="server">
                                                                        <div class="md-input">
                                                                            <uc2:Suggest ID="ucEmployee" runat="server" ServiceMethod="GetUsers" Enabled="false"
                                                                                AutoPostBack="true" OnItem_Selected="ucEmployee_Item_Selected" IsMandatory="false"
                                                                                ValidationGroup="Submit" ErrorMessage="Select Employee Name" />
                                                                            <asp:HiddenField ID="hdnEmployee" runat="server" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblEmployee" runat="server" CssClass="styleReqFieldLabel" Text="Employee Name"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel GroupingText="Reason for Arrear" ID="Panel3" runat="server"
                                                        CssClass="stylePanel" Width="100%">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtReasonArrear" runat="server" TextMode="MultiLine" MaxLength="800"
                                                                                onkeyup="maxlengthfortxt(800);" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblReasonArrear" runat="server" CssClass="styleReqFieldLabel" Text="Reason for Arrears"></asp:Label>
                                                                            </label>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvtxtReasonArrear" runat="server" ControlToValidate="txtReasonArrear"
                                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Reason for Arrears" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtCurrentArrears" runat="server" MaxLength="800" Enabled="false"
                                                                                onkeyup="maxlengthfortxt(800);" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblCurrentArrears" runat="server" CssClass="styleDisplayLabel" Text="Current Arrears"></asp:Label>
                                                                            </label>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel GroupingText="Reason for Repossession" ID="Panel5" runat="server"
                                                        CssClass="stylePanel" Width="100%">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtReasonRep" runat="server" TextMode="MultiLine" MaxLength="256"
                                                                                onkeyup="maxlengthfortxt(256);" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblReasonRep" runat="server" CssClass="styleReqFieldLabel" Text="Reason for Repossession"></asp:Label>
                                                                            </label>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvReasonRep" runat="server" ControlToValidate="txtReasonRep"
                                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Reason for Repossession" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="Panel1" runat="server" GroupingText="Action Points" CssClass="stylePanel"
                                                        Width="100%">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtActionPoints" runat="server" TextMode="MultiLine" MaxLength="800"
                                                                                onkeyup="maxlengthfortxt(800);" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblActionPoints" CssClass="styleDisplayLabel" Text="Action Points"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="Panel6" runat="server" GroupingText="LR Status" CssClass="stylePanel"
                                                        Width="100%">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <uc2:Suggest ID="ddlFollowUPEMPID" runat="server" ServiceMethod="GetUsers"
                                                                                AutoPostBack="true" OnItem_Selected="ddlFollowUPEMPID_SelectedIndexChanged" IsMandatory="true"
                                                                                ValidationGroup="Submit" ErrorMessage="Select Follow Up Person Emp ID" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblFlUpEmpID" runat="server" CssClass="styleReqFieldLabel" Text="Follow Up Person Emp ID"></asp:Label>
                                                                            </label>

                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divFlUpEmpName" runat="server" visible="false">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtFlUpEmpName" runat="server" Visible="False" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="True"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblFlUpEmpName" runat="server" Visible="False" CssClass="styleDisplayLabel" Text="Follow Up Person Name"></asp:Label>
                                                                            </label>

                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtLRStatus" runat="server" ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblLRStatus" runat="server" CssClass="styleDisplayLabel" Text="LR Status"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="display: none" class="col">
                                            <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                                            <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                                        </div>
                                        <div class="btn_height"></div>
                                        <div align="right">
                                            <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Submit'))" causesvalidation="false"
                                                onserverclick="btnSave_Click" runat="server"
                                                type="button" accesskey="S" validationgroup="Submit">
                                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                            </button>
                                            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click"
                                                runat="server" type="button" accesskey="L">
                                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                            </button>
                                            <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                                type="button" accesskey="X">
                                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                            </button>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="LR Note Approval" ID="tpLRApproval" CssClass="tabpan"
                                    BackColor="Red" meta:resourcekey="tpLRApprovalResource1" Visible="false">
                                    <HeaderTemplate>
                                        LR NOTE Approval
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlApprovalHistory" runat="server" CssClass="stylePanel" GroupingText="Approval History">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <%-- <div id="div11" style="overflow: auto; width: 98%; padding-left: 1%;" runat="server">--%>
                                                                        <asp:Label ID="lblGuarDetails" runat="server" Text="No Approval details available"
                                                                            Visible="false" />
                                                                        <asp:GridView ID="gvApprovalHistory" runat="server" Width="100%">
                                                                        </asp:GridView>
                                                                    </div>
                                                                    <%--   </div>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlLRNoteApproval" runat="server" Width="100%" GroupingText="Approval Details" CssClass="stylePanel">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtApprovalName" runat="server" ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true">
                                                                            </asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblApprovalName" runat="server" Text="Approval Name" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:DropDownList ID="ddlStatus" runat="server" class="md-form-control form-control">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblStatus" runat="server" Text="Status" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtApprovalDate" runat="server" ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true">
                                                                            </asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblApprovalDate" runat="server" Text="Approval Date" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtPassword" runat="server" MaxLength="15" TextMode="Password" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtRemarks" runat="server" MaxLength="100" onkeyup="maxlengthfortxt(100);"
                                                                                TextMode="MultiLine" Columns="60" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblRemarks" runat="server" Text="Remarks"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>


                            <%-- <asp:Button ID="btnSave" runat="server" CausesValidation="true" CssClass="styleSubmitButton" AccessKey="S" ToolTip="Save,Alt+S"
                                Text="Save" ValidationGroup="Submit" OnClientClick="return fnCheckPageValidators('Submit');"
                                OnClick="btnSave_Click" />
                            <asp:Button ID="btnClear" runat="server" CausesValidation="true" CssClass="styleSubmitButton" AccessKey="L" ToolTip="Clear,Alt+L"
                                Text="Clear" OnClick="btnClear_Click" OnClientClick="return fnConfirmClear();" />
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="true" CssClass="styleSubmitButton" AccessKey="X" ToolTip="Exit,Alt+X"
                                Text="Exit" OnClick="btnCancel_Click" OnClientClick="return fnConfirmExit();" />
                            
                            <asp:Button ID="btnSMS" runat="server" CausesValidation="true" Visible="false" CssClass="styleSubmitButton" AccessKey="M" ToolTip="SMS,Alt+M"
                                Text="SMS" />
                            <asp:Button ID="btnEmail" runat="server" CausesValidation="true" Visible="false" AccessKey="E" ToolTip="Email,Alt+E"
                                CssClass="styleSubmitButton" Text="Email" />--%>

                            <asp:HiddenField ID="hidLRNNo" runat="server" />

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblCustAddress" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpeCustAddress" runat="server" PopupControlID="dvCustAddress" TargetControlID="lblCustAddress"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvCustAddress" style="display: none; width: 50%; height: 50%;">
        <div id="Div5" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -25px;">
            <asp:ImageButton ID="imgCustAddress" runat="server" Width="50px" Height="50px" ImageUrl="~/Images/close.png"
                OnClick="imgCustAddress_Click" />
        </div>
        <div>
            <asp:Panel ID="Panel2" GroupingText="Address Details" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAddress" runat="server" Height="150px" MaxLength="250" TextMode="MultiLine"
                                                onkeyup="maxlengthfortxt(250);" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                            </label>

                                            <asp:Button runat="server" ID="btnAdCancel" CausesValidation="false" AccessKey="E" ToolTip="Exit,Alt+E"
                                                OnClick="btnAdCancel_Click" Text="Exit" CssClass="styleSubmitButton" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>
    <script type="text/jscript" language="javascript">
        //javascript: window.history.forward(1);
        //Tab index code starts

        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_tcLRNote');

            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;

            }
            else if (Source_Invoker == 'btnPrevTab') {
                if (btnActive_index != 0) {
                    newindex = btnActive_index - 1;
                }
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }
            if (newindex > index) {


                switch (index) {

                    case 0:
                        tab.set_activeTabIndex(newindex);
                        index = tab.get_activeTabIndex(index);
                        btnActive_index = index;
                        break;
                    case 1:
                        tab.set_activeTabIndex(newindex);
                        index = tab.get_activeTabIndex(index);
                        btnActive_index = index;
                        break;
                    case 2:
                        tab.set_activeTabIndex(newindex);
                        index = tab.get_activeTabIndex(index);
                        btnActive_index = index;
                        break;


                }
            }
            else {
                tab.set_activeTabIndex(newindex);

                var TC = $find("<%=tcLRNote.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=ddlLOB.ClientID %>").focus();
                }
            }
        }

        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {

            var TC = $find("<%=tcLRNote.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlLOB.ClientID %>").focus();
            }

            tab = $find('ctl00_ContentPlaceHolder1_tcLRNote');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;

            function on_Change(sender, e) {
                debugger;
                if (TC.get_activeTab().get_tabIndex() != 0) {
                    fnMoveNextTab('Tab');
                }
                else {
                    tab.set_activeTabIndex(0);;
                    btnActive_index = 0;
                    return;
                }
            }

        }
        //Tab index code end

        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcLRNote_tpLRNOTEDetails_btnLoadAccount').click();
        }
        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcLRNote_tpLRNOTEDetails_btnLoadCust').click();
        }

        function fnLoadVendor() {
            //alert('hi');
            document.getElementById('ctl00_ContentPlaceHolder1_tcLRNote_tpLRNOTEDetails_btnloadVendor').click();
        }
        function fnTrashAccountSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_txtItemName').value = "";
                document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtItemName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_txtItemName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
                }
            }
        }
        function fnTrashVendorSuggest(e) {
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_txtItemName').value = "";
                document.getElementById('<%=txtVendorCodeDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtItemName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtVendorCodeDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_txtItemName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtVendorCodeDummy.ClientID %>').value = "";
                }
            }
        }
    </script>

</asp:Content>
