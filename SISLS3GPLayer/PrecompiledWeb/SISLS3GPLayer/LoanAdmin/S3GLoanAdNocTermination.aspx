<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GLoanAdNocTermination, App_Web_ccy20lsg" title="NOC" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc3" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
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
                        <asp:Panel ID="pnlNocTerminationDetails" runat="server" CssClass="stylePanel" GroupingText="NOC Termination Details">
                            <div class="row">
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                            ToolTip="Line of Business" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="hdnCustomerMailId" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="RFVLOB" CssClass="validation_msg_box_sapn" runat="server"
                                                ControlToValidate="ddlLOB" InitialValue="0" ValidationGroup="VGNoc" ErrorMessage="Select a Line of Business"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                            ToolTip="Branch" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="RFVNocBranch" CssClass="validation_msg_box_sapn" runat="server"
                                                ControlToValidate="ddlBranch" InitialValue="0" ValidationGroup="VGNoc" ErrorMessage="Select the Branch"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label runat="server" Text="Branch" ID="lblBranch" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtNocNo" ReadOnly="True" ToolTip="NOC Number" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <asp:HiddenField ID="hdnnocid" runat="server" />
                                        <label>
                                            <asp:Label runat="server" Text="NOC Number" ID="lblNocNo" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtNocDate" ReadOnly="True" ToolTip="Release Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Release Date" ID="lblNocDate" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ToolTip="Account Number" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ddlPAN_Item_Selected"
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
                                            <asp:Label runat="server" Text="Account Number" ID="lblprimeaccno" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtAccDate" ReadOnly="True" ToolTip="Account Date"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Account Date" ID="lblAccDate" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtMaturityDate" ReadOnly="True" ToolTip="Maturity Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Maturity Date" ID="lblMaturityDate" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtClosureDate" ReadOnly="True" ToolTip="Closure Date"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Closure Date" ID="lblClosureDate" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtAccountStatuse" ReadOnly="True" ToolTip="Account Status"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Account Status" ID="lblAccountStatus" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="btnLoadCustomer()" Width="400px" HoverMenuExtenderLeft="true" ToolTip="Customer Name" runat="server" Enabled="false" AutoPostBack="true" DispalyContent="Both" class="md-form-control form-control"
                                            strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" />
                                        <asp:Button ID="btnLoadCust" runat="server" Text="Load Client Name" CausesValidation="false" UseSubmitBehavior="false" Visible="false"
                                            Style="display: none" />
                                        <asp:TextBox runat="server" ID="txtCustomerName" ReadOnly="True" ToolTip="Customer Name" Visible="false"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:HiddenField ID="hdnCustomerCode" runat="server" />
                                        <asp:HiddenField ID="hdnCustomerId" runat="server" />
                                        <asp:HiddenField ID="hidcuscode" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblCustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlReleasetoto" runat="server" AutoPostBack="True" ToolTip="Release To" class="md-form-control form-control" OnSelectedIndexChanged="ddlReleasetoto_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="rfvReleasetoto" CssClass="validation_msg_box_sapn" runat="server"
                                                ControlToValidate="ddlReleasetoto" InitialValue="0" ValidationGroup="Save" ErrorMessage="Select the Release To"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="validation_msg_box_sapn" runat="server"
                                                ControlToValidate="ddlReleasetoto" InitialValue="0" ValidationGroup="VGNoc" ErrorMessage="Select the Release To"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label runat="server" Text="Release To" ID="lblReleaseTo" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <uc2:Suggest ID="ddlGUARANTOR" ValidationGroup="VGNoc" runat="server" ToolTip="Name" class="md-form-control form-control login_form_content_input requires_true"
                                            ServiceMethod="GetCustomerList"
                                            ErrorMessage="Select a Name" ReadOnly="true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <%-- <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="rfvGUARANTOR" CssClass="validation_msg_box_sapn" runat="server" Enabled="false"
                                                ControlToValidate="ddlGUARANTOR" InitialValue="0" ValidationGroup="Save" ErrorMessage="Select the Name"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>--%>
                                        <label>
                                            <asp:Label runat="server" Text="Name" ID="lblName" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtarabcustomername" ReadOnly="True" ToolTip="Arabic Customer Name" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="validation_msg_box_sapn" runat="server"
                                                ControlToValidate="txtarabcustomername" ValidationGroup="Save" ErrorMessage="Enter the Arabic Customer Name"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label runat="server" Text="Arabic Customer Name" ID="lblArabicCustomerName" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtNocPrintstatus" ReadOnly="True" ToolTip="NOC Print Status" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="NOC Print Status" ID="lblNocPrintstatus" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" id="dvnocstatus" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtNOCStatus" ReadOnly="True" ToolTip="NOC Status" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="NOC Status" ID="Label2" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="display: none;">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlSAN" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSAN_SelectedIndexChanged" ToolTip="Sub A/C Number" Visible="false">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="RFVSLA" runat="server" ControlToValidate="ddlSAN" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select a Sub Account Number" InitialValue="0" ValidationGroup="VGNoc"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label ID="lblsubAccno" runat="server" CssClass="styleDisplayLabel" Text="Sub Account Number" Visible="false"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right" style="margin-top: 10px;">
                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="VGNoc" runat="server"
                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Panel ID="PNLAssetDetails" runat="server" CssClass="stylePanel" GroupingText="Asset Details"
                            Width="100%">
                            <div>
                                <div class="row">
                                    <div class="gird">
                                        <asp:GridView runat="server" ID="GRVNOC" AutoGenerateColumns="False" Width="100%"
                                            ToolTip="Asset Details" OnRowDataBound="GRVNOC_RowDataBound" class="gird_details">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sl.No">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkAssetSerialNo" CssClass="grid_btn" runat="server" Text='<%#Bind("SNo") %>' Style="text-align: right"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <%--<ItemTemplate>
                                                        <asp:Label ID="txtsno" runat="server" Text='<%# Bind("SNo")%>'></asp:Label>
                                                    </ItemTemplate>--%>
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset Code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAsset_ID" Visible="false" runat="server" Text='<%#Eval("Asset_Number")%>' />
                                                        <asp:Label ID="txtAssetCode" runat="server" Text='<%# Bind("Asset_Code")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset Description">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtAssetDesc" runat="server" Text='<%# Bind("Asset_Description")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset Registration No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtAssetRegNo" runat="server" Text='<%# Bind("Regno")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Closure Type">
                                                    <ItemTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:Label ID="lblDetailClosureType" runat="server" Text='<%# Bind("Closure_Type")%>'></asp:Label>
                                                            <asp:DropDownList ID="ddlClosureType" runat="server" ToolTip="Closure Type" CssClass="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <%-- <div class="validation_msg_box" style="top: 28px !important;">
                                                                <asp:RequiredFieldValidator ID="rfvddlClosureType" runat="server" CssClass="validation_msg_box_sapn"
                                                                    ErrorMessage="Select the Parameter Type" Display="Dynamic" SetFocusOnError="true" InitialValue="0" ControlToValidate="ddlClosureType"></asp:RequiredFieldValidator>
                                                            </div>--%>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Vehicle Registration No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblVehicleReg_No" runat="server" Text='<%# Bind("VehicleReg_No")%>' Visible="false"></asp:Label>
                                                        <asp:TextBox ID="txtVehicleRegistrationNo" ToolTip="Vehicle Registration No" class="md-form-control form-control login_form_content_input requires_true"
                                                            MaxLength="50" runat="server" Text='<%# Bind("VehicleReg_No")%>' ReadOnly="true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Type of Vehicle">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTypeofVehicle" runat="server" Text='<%# Bind("TypeofVehicle")%>' Visible="false"></asp:Label>
                                                        <asp:TextBox ID="txtTypeofVehicle" ToolTip="Type of Vehicle" class="md-form-control form-control login_form_content_input requires_true"
                                                            MaxLength="50" runat="server" Text='<%# Bind("TypeofVehicle")%>'></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Color">
                                                    <ItemTemplate>
                                                          <asp:Label ID="lblColor" runat="server" Text='<%# Bind("Color")%>' Visible="false"></asp:Label>
                                                        <asp:TextBox ID="txtColor" ToolTip="Color" class="md-form-control form-control login_form_content_input requires_true"
                                                            MaxLength="50" runat="server"  Text='<%# Bind("Color")%>'></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Chassis No">
                                                    <ItemTemplate>
                                                         <asp:Label ID="lblChassis_No" runat="server" Text='<%# Bind("Chassis_No")%>' Visible="false"></asp:Label>
                                                        <asp:TextBox ID="txtChassisNo" ToolTip="Chassis No" class="md-form-control form-control login_form_content_input requires_true"
                                                            MaxLength="50" runat="server" Text='<%# Bind("Chassis_No")%>' ReadOnly="true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Engine No">
                                                    <ItemTemplate>
                                                         <asp:Label ID="lblEngine_No" runat="server" Text='<%# Bind("Engine_No")%>' Visible="false"></asp:Label>
                                                        <asp:TextBox ID="txtEngineNo" ToolTip="Engine No" class="md-form-control form-control login_form_content_input requires_true"
                                                            MaxLength="50" runat="server" Text='<%# Bind("Engine_No")%>' ReadOnly="true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Status">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkSelectAllAssetAll" OnCheckedChanged="chkSelectAllAssetAll_CheckedChanged" AutoPostBack="true" runat="server"></asp:CheckBox>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelectAssetAll" OnCheckedChanged="chkSelectAssetAll_CheckedChanged" AutoPostBack="true" runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField HeaderText="View">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="BtnView" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery" OnClick="BtnView_Click"
                                                            runat="server" ToolTip="View,Alt+V" AccessKey="V" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>--%>
                                            </Columns>
                                            <HeaderStyle CssClass="styleGridHeader" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Panel ID="pnlHistoryDetails" runat="server" CssClass="stylePanel" GroupingText="History Details" Visible="false"
                            Width="100%">
                            <div>
                                <div class="row">
                                    <div class="gird">
                                        <asp:GridView runat="server" ID="gvHistoryDetails" AutoGenerateColumns="False" Width="100%" ShowFooter="false"
                                            ToolTip="History Details" OnRowDataBound="gvHistoryDetails_RowDataBound" class="gird_details">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sl.No">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkAssetSerialNo" CssClass="grid_btn" runat="server" Text='<%#Bind("SNo") %>' Style="text-align: right"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset Code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtAssetCode" runat="server" Text='<%# Bind("Asset_Code")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset Description">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtAssetDesc" runat="server" Text='<%# Bind("Asset_Description")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset Registration No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtAssetRegNo" runat="server" Text='<%# Bind("Regno")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Closure Type" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtClosureType" runat="server" Text='<%# Bind("ClosureType_Desc")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="NOC Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtNOCDate" runat="server" Text='<%# Bind("NOCDate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="NOC No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtNOCNo" runat="server" Text='<%# Bind("NOCNo")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField HeaderText="View">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="BtnView" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                            runat="server" ToolTip="View,Alt+H" AccessKey="H" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>--%>
                                            </Columns>
                                            <HeaderStyle CssClass="styleGridHeader" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" validationgroup="Save" runat="server" onserverclick="btnSave_Click"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                        onserverclick="btnClear_Click"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnNocLetter" title="Print NOC Letter[Alt+L]" causesvalidation="false" visible="false" validationgroup="VGNOC" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>P</u>rint NOC Letter
                    </button>
                    <button class="css_btn_enabled" id="btnEmail" title="Email[Alt+E]" causesvalidation="false" validationgroup="VGNOC" visible="false" runat="server" onserverclick="btnEmail_Click"
                        type="button" accesskey="E">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>E</u>mail
                    </button>
                    <button class="css_btn_enabled" id="btnNOCcancel" title="Exit[Alt+R]" onclick="if(confirm('Are you sure want to cancel this record?'))" causesvalidation="false"
                        onserverclick="btnNOCcancel_Click" runat="server"
                        type="button" accesskey="R">
                        <i class="fa fa-share" aria-hidden="true"></i>&emsp;<u>N</u>OC Cancel
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <div class="row">
                    <asp:Panel ID="pnlPrint" HorizontalAlign="Center" CssClass="stylePanel" Visible="false" runat="server" Width="99%" GroupingText="Mail/Print Details">
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlTemplateType" ToolTip="Template Type" OnSelectedIndexChanged="ddlTemplateType_SelectedIndexChanged" runat="server" class="md-form-control form-control  requires_false">
                                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="NOC Letter" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Closure Letter" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblTemplate" ToolTip="Template Type" CssClass="styleReqFieldLabel" runat="server" Text="Template Type"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLanguage" AutoPostBack="false" runat="server" ToolTip="Language" class="md-form-control form-control  requires_false">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblLanguage" ToolTip="Language" CssClass="styleReqFieldLabel" runat="server" Text="Language"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnPdf" title="PDF [Alt+O]" causesvalidation="false" onserverclick="btnNocLetter_Click" runat="server"
                                    type="submit" accesskey="O" visible="false">
                                    <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;<u></u>PDF
                                </button>
                                <button class="css_btn_enabled" id="btnMail" title="Email [Alt+V]" causesvalidation="false" onserverclick="btnMail_Click" runat="server"
                                    type="submit" accesskey="V" visible="false">
                                    <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;<u></u>Email
                                </button>
                            </div>
                            <asp:CustomValidator ID="cvCustomerMaster" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" Width="98%" />
                            <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPdf" />
            <asp:PostBackTrigger ControlID="btnMail" />
        </Triggers>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">
        function fnLoadCustomer() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCustomer').click();
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
</asp:Content>
