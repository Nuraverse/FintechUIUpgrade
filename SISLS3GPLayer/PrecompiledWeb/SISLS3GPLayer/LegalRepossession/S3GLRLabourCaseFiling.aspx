<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LegalRepossession_S3GLRLabourCaseFiling, App_Web_5saef4xg" %>

<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc3" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="IMC" TagPrefix="uc5" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <cc1:TabContainer ID="tcCaseGeneration" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                            Width="99%" Visible="true">
                            <cc1:TabPanel runat="server" ID="tbFIR" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>Labour Case Filing</HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <div class="row" style="margin-top: 10px;"></div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlROPCasetype" ToolTip="ddlROPCasetype" runat="server" class="md-form-control form-control" 
                                                                AutoPostBack="True" OnSelectedIndexChanged="ddlROPCasetype_SelectedIndexChanged"></asp:DropDownList>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvddlROPCasetype" runat="server" ControlToValidate="ddlROPCasetype"
                                                                    SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select the Case Type"
                                                                    ValidationGroup="Labour Case Filing"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span><span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblCasetype" runat="server" CssClass="styleReqFieldLabel" Text="Case Type"></asp:Label></label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <uc2:Suggest ID="ddlEmployeeName" runat="server" ServiceMethod="GetEmployeNameList"
                                                                IsMandatory="true" ToolTip="Employee Code" ErrorMessage="Select the Employee"
                                                                ValidationGroup="Labour Case Filing" />
                                                            <span class="highlight"></span><span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblEmployeeName" runat="server" Text="Employee" CssClass="styleReqFieldLabel"></asp:Label></label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                 IsMandatory="false" strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                                            
                                                        
                                                            <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="False" UseSubmitBehavior="False" OnClick="btnLoadCust_Click"
                                                                Style="display: none" />
                                                              <asp:Button ID="btncust" runat="server" CausesValidation="False" UseSubmitBehavior="False" OnClick="btncust_Click" Style="display: none" />
                                                            <asp:TextBox ID="TextBox1" runat="server" autoComplete="Off" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go"></asp:TextBox><span class="highlight"></span><span class="bar"></span><label>
                                                                <asp:Label ID="lblCustomerName" CssClass="styleDisplayLabel" runat="server" Text="Customer Name/Code"></asp:Label></label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both"
                                                                OnItem_Selected="ucAccountLov_Item_Selected" IsMandatory="false" 
                                                                strLOV_Code="ACC_LR_LABOUR" ServiceMethod="GetAccuntNoList" />
                                                            <asp:Button ID="btnLoadAccount" runat="server" Text="Load Account No" CausesValidation="False" UseSubmitBehavior="False" OnClick="btnLoadAccount_Click"
                                                                Style="display: none" /><asp:HiddenField ID="hdnPasa_Detail_ID" runat="server" />
                                                            <asp:HiddenField ID="hdnCustomer_ID" runat="server" />
                                                            <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                                            <span class="highlight"></span><span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblAccountNumber" CssClass="styleDisplayLabel" runat="server" Text="Account Number"></asp:Label></label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtCaseCode" runat="server" ToolTip="Case Code" Enabled="False" autoComplete="Off"
                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><span class="highlight"></span><span class="bar"></span><label><asp:Label ID="lblCaseCode" runat="server" CssClass="styleDisplayLabel" Text="Case Code"></asp:Label></label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="ROP Details" ID="pnlFIRDetails" runat="server"
                                                    CssClass="stylePanel" Width="100%">
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFIRNumber" runat="server" ToolTip="ROP Number" autoComplete="Off"
                                                                    MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:FilteredTextBoxExtender ID="ftFIRNumber" runat="server" TargetControlID="txtFIRNumber"
                                                                        FilterType="Numbers, UppercaseLetters, LowercaseLetters" Enabled="True" />
                                                                <span class="highlight"></span><span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFIRNUMBER" runat="server" CssClass="styleReqFieldLabel" Text="ROP Number"></asp:Label></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                              <div class="md-input">
                                                                <uc2:Suggest ID="ucFIRLocation" ToolTip="ROP Location" runat="server" ServiceMethod="GetROPLocation" 
                                                                    class="md-form-control form-control" />  
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFIRLocation" runat="server" CssClass="styleDisplayLabel" Text="ROP Location"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFIRDate" runat="server" ToolTip="ROP Date" autoComplete="fasle"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:CalendarExtender ID="calFIRDate" runat="server" Enabled="True" TargetControlID="txtFIRDate"></cc1:CalendarExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvROPDate" runat="server" ControlToValidate="txtFIRDate" Enabled="False"
                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the ROP Date"
                                                                        ValidationGroup="Labour Case Filing"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span><span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFIRDate" runat="server" Text="ROP Date"></asp:Label></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtROPClnDate" runat="server" ToolTip="ROP Collection Date" autoComplete="Off"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:CalendarExtender ID="calROPClnDt" runat="server" Enabled="True" TargetControlID="txtROPClnDate"></cc1:CalendarExtender>
                                                                <span class="highlight"></span><span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblROPCollectionDt" runat="server" CssClass="styleDisplayLabel" Text="ROP Collection Date"></asp:Label></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlFIRStatus" runat="server" class="md-form-control form-control"></asp:DropDownList>
                                                                <div class="validation_msg_box">

                                                                    <asp:RequiredFieldValidator ID="rfvFIRStatus" runat="server" ControlToValidate="ddlFIRStatus" Enabled="False"
                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the ROP Status"
                                                                        ValidationGroup="Labour Case Filing" InitialValue="0"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span><span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFIRSatus" runat="server" Text="ROP Status"></asp:Label></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtClosedDate" runat="server" ToolTip="FIR Closed Date" MaxLength="20" autoComplete="Off"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:CalendarExtender ID="calFIRClosedDate" runat="server" Enabled="True" TargetControlID="txtClosedDate"></cc1:CalendarExtender>
                                                                <span class="highlight"></span><span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblClosedDate" runat="server" CssClass="styleDisplayLabel" Text="ROP Closed Date"></asp:Label></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFIRStatement" runat="server" ToolTip="ROP File Statement Details" autoComplete="Off"
                                                                    TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true" onkeyup="maxlengthfortxt(200)"></asp:TextBox><span class="highlight"></span><span class="bar"></span><label><asp:Label ID="lblFIRStatement" runat="server" CssClass="styleDisplayLabel" Text="ROP File Statement"></asp:Label></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFIRRemarks" runat="server" ToolTip="ROPROP Remarks" TextMode="MultiLine" autoComplete="Off"
                                                                    class="md-form-control form-control login_form_content_input requires_true lowercase" onkeyup="maxlengthfortxt(200)"></asp:TextBox><span class="highlight"></span><span class="bar"></span><label><asp:Label ID="lblFIRRemarks" runat="server" CssClass="styleDisplayLabel" Text="ROP Remarks"></asp:Label></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="display: none" class="col">
                                            <asp:Button ID="Button1" AccessKey="N" UseSubmitBehavior="False" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" />
                                            <asp:Button ID="Button2" AccessKey="P" UseSubmitBehavior="False" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" />
                                       </div>

                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="tbCourt" runat="server" CssClass="tabpan">
                                <HeaderTemplate>Court Case Details</HeaderTemplate>
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCaseCourtNumber" runat="server" ToolTip="Court Case Number" MaxLength="20" AutoPostBack="true" autoComplete="Off"
                                                    OnTextChanged="txtCaseCourtNumber_TextChanged" class="md-form-control form-control"></asp:TextBox><span class="highlight"></span><span class="bar"></span>
                                                <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvCasecourtNumber" runat="server" ControlToValidate="txtCaseCourtNumber" Enabled="False"
                                                            SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter court case number"
                                                            ValidationGroup="Labour Case Filing"></asp:RequiredFieldValidator>
                                                </div>
                                                <label>
                                                    <asp:Label ID="lblCourtCaseNumber" runat="server" CssClass="styleReqFieldLabel" Text="Court Case Number"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlcourtlev" runat="server" ToolTip="Court Level" AutoPostBack="true" 
                                                    OnSelectedIndexChanged="ddlcourtlev_SelectedIndexChanged" class="md-form-control form-control"></asp:DropDownList>
                                                <asp:Label runat="server" ID="lblMCourtLevel" Visible="false"></asp:Label>
                                                <span class="highlight"></span><span class="bar"></span><div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvCourtlevel" runat="server" ControlToValidate="ddlcourtlev" Enabled="False"
                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select Court level"
                                                        ValidationGroup="Labour Case Filing"></asp:RequiredFieldValidator>
                                                </div>
                                                <label>
                                                    <asp:Label runat="server" Text="Court Level" ID="lblcourtlev" CssClass="styleReqFieldLabel"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlcourttype" runat="server" ToolTip="Court Type" AutoPostBack="true" autoComplete="Off"
                                                    OnSelectedIndexChanged="ddlcourttype_SelectedIndexChanged" class="md-form-control form-control">
                                                </asp:DropDownList>
                                                  <asp:Label runat="server" ID="lblMCourtType" Visible="false"></asp:Label>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvCourtType" runat="server" ControlToValidate="ddlcourttype" Enabled="False" InitialValue="0"
                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Court type"
                                                        ValidationGroup="Labour Case Filing"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Court Type" ID="lblcourttype" CssClass="styleReqFieldLabel"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlCourtBranch" ToolTip="Court Branch" runat="server" class="md-form-control form-control"></asp:DropDownList>
                                                <span class="highlight"></span><span class="bar"></span><div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvCourtBranch" runat="server" ControlToValidate="ddlCourtBranch" Enabled="False" InitialValue="0"
                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Court Branch"
                                                        ValidationGroup="Labour Case Filing"></asp:RequiredFieldValidator>
                                                </div>
                                                <label>
                                                    <asp:Label ID="lblCourtBranch" runat="server" CssClass="styleReqFieldLabel" Text="Court Branch"></asp:Label></label>
                                            </div>
                                        </div>
                                         <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCaseFiledDate" runat="server" ToolTip="Case Filed Date" autoComplete="Off"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:CalendarExtender ID="calCaseFileDate" runat="server" Enabled="True" TargetControlID="txtCaseFiledDate"></cc1:CalendarExtender>
                                                <span class="highlight"></span><span class="bar"></span>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvCaseFiledDate" runat="server" ControlToValidate="txtCaseFiledDate" Enabled="False" InitialValue="0"
                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Case Filed Date"
                                                        ValidationGroup="Labour Case Filing"></asp:RequiredFieldValidator>
                                                </div>

                                                <label>
                                                    <asp:Label ID="lblCaseFiledDate" runat="server" CssClass="styleReqFieldLabel" Text="Case Filed Date"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCaseChargeAmt" runat="server" ToolTip="Case Charges Amount" autoComplete="Off"
                                                    MaxLength="20" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox><cc1:FilteredTextBoxExtender ID="ftCaseChargeAmt" runat="server" TargetControlID="txtCaseChargeAmt"
                                                        FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblCaseCharges" runat="server" CssClass="styleDisplayLabel" Text="Case Charges Amount"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCaseAmt" runat="server" ToolTip="Case Amount" MaxLength="20" autoComplete="Off"
                                                    class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                 <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvCaseamount" runat="server" ControlToValidate="txtCaseAmt" Enabled="False" 
                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter case amount"
                                                        ValidationGroup="Labour Case Filing"></asp:RequiredFieldValidator>
                                                     </div>
                                                <cc1:FilteredTextBoxExtender ID="ftCaseAmt" runat="server" TargetControlID="txtCaseAmt"
                                                        FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblCaseAmt" runat="server" CssClass="styleDisplayLabel" Text="Case Amount"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCourtAmt" runat="server" ToolTip="Additional Court Order Amount" autoComplete="Off"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:FilteredTextBoxExtender ID="ftCourtAmt" runat="server" TargetControlID="txtCourtAmt"
                                                        FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblCourtAmt" runat="server" CssClass="styleDisplayLabel" Text="Additional Court Order Amount"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlCaseStatus" OnSelectedIndexChanged="ddlCaseStatus_SelectedIndexChanged" ToolTip="Case Status"
                                                    class="md-form-control form-control login_form_content_input requires_true"
                                                    runat="server" AutoPostBack="True">
                                                </asp:DropDownList>
                                                 <div class="validation_msg_box">
                                                  <asp:RequiredFieldValidator ID="rfvCaseStatus" runat="server" ControlToValidate="ddlCaseStatus" Enabled="False" InitialValue="0"
                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Case status"
                                                        ValidationGroup="Labour Case Filing"></asp:RequiredFieldValidator>
                                                     </div>
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblCaseStatus" runat="server" CssClass="styleDisplayLabel" Text="Case Status"></asp:Label>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCaseClosedDate" runat="server" ToolTip="Case Closed Date" MaxLength="20" autoComplete="Off"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:CalendarExtender ID="calCaseClosedDate" runat="server" Enabled="True" TargetControlID="txtCaseClosedDate"></cc1:CalendarExtender>
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblCaseCaseCloseDate" runat="server" CssClass="styleDisplayLabel" Text="Case Closed Date"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <uc2:Suggest ID="ddlAdvocate" ToolTip="Lawyer" runat="server"
                                                    ServiceMethod="GetLawyerDetails" IsMandatory="false" ValidationGroup="Labour Case Filing"
                                                    class="md-form-control form-control" ErrorMessage="Select the Lawyer" />
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblAdvocate" runat="server" CssClass="styleReqFieldLabel" Text="Lawyer"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtLawyerDate" runat="server" ToolTip="Lawyer Effective Date" autoComplete="Off"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:CalendarExtender ID="calLawyerDate" runat="server" Enabled="True" TargetControlID="txtLawyerDate"></cc1:CalendarExtender>
                                                 <div class="validation_msg_box">
                                                  <asp:RequiredFieldValidator ID="rfvLawyerDate" runat="server" ControlToValidate="txtLawyerDate" Enabled="False"  
                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Lawyer Effective date"
                                                        ValidationGroup="Labour Case Filing"></asp:RequiredFieldValidator>
                                                     </div>
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lbllawyerdate" runat="server" CssClass="styleDisplayLabel" Text="Lawyer Effective From Date"></asp:Label></label>
                                            </div>
                                        </div>
                                         <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLawyerFee" runat="server" ToolTip="Lawyer Fee" MaxLength="10" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="fteLawyerFee" runat="server" TargetControlID="txtLawyerFee"
                                                                    FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLawyerFee" runat="server" CssClass="styleDisplayLabel" Text="Lawyer Fee"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                  <%--         <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtLawyerToDate" runat="server" ToolTip="Lawyer Effective Date" autoComplete="Off"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:CalendarExtender ID="calLawyerToDate" runat="server" Enabled="True" TargetControlID="txtLawyerDate"></cc1:CalendarExtender>
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lbllawyerTodate" runat="server" CssClass="styleDisplayLabel" Text="Lawyer Effective To Date"></asp:Label></label>
                                            </div>
                                        </div>--%>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtAddlCharges" runat="server" ToolTip="Additional Charges" MaxLength="20" autoComplete="Off"
                                                    class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox><cc1:FilteredTextBoxExtender ID="ftAddlCharges" runat="server" TargetControlID="txtAddlCharges" FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblAddlCharges" runat="server" CssClass="styleDisplayLabel" Text="Additional Charges"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtVerdictNo" runat="server" ToolTip="Verdict Number" MaxLength="10" autoComplete="Off"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:FilteredTextBoxExtender ID="ftVerdictNumber" runat="server" TargetControlID="txtVerdictNo"
                                                        FilterType="LowercaseLetters, UppercaseLetters, Numbers" Enabled="true" />
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblVerdictNo" runat="server" CssClass="styleDisplayLabel" Text="Verdict Number"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtVerdictDt" runat="server" ToolTip="Verdict Date" autoComplete="Off"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:CalendarExtender ID="calVerdictDt" runat="server" Enabled="True" TargetControlID="txtVerdictDt"></cc1:CalendarExtender>
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblVerdictDate" runat="server" CssClass="styleDisplayLabel" Text="Verdict Date"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtVerdictAmt" runat="server" ToolTip="Verdict Amount" autoComplete="Off"
                                                    MaxLength="20" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right">
                                                </asp:TextBox><cc1:FilteredTextBoxExtender ID="ftVerdictAmt" runat="server" TargetControlID="txtVerdictAmt"
                                                    FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblVerdictAmt" runat="server" CssClass="styleDisplayLabel" Text="Verdict Amount"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCourtOrderdt" runat="server" ToolTip="Court Ordered Date" autoComplete="Off"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:CalendarExtender ID="calCourtOrdDt" runat="server" Enabled="True" TargetControlID="txtCourtOrderdt"></cc1:CalendarExtender>
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblCoortOrderDate" runat="server" CssClass="styleDisplayLabel" Text="Court Ordered Date"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtRepossessionDt" runat="server" ToolTip="Repossession Date" autoComplete="Off"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:CalendarExtender ID="calRepossessionDt" runat="server" Enabled="True" TargetControlID="txtRepossessionDt"></cc1:CalendarExtender>
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblRepossessionDt" runat="server" CssClass="styleDisplayLabel" Text="Repossession Date"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtExecutionLTRDt" runat="server" ToolTip="Execution Letter Date" autoComplete="Off"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:CalendarExtender ID="calELTRDt" runat="server" Enabled="True" TargetControlID="txtExecutionLTRDt"></cc1:CalendarExtender>
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblELTRDt" runat="server" CssClass="styleDisplayLabel" Text="Execution Letter Date"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtMORDT" runat="server" ToolTip="Mortage Letter Date" autoComplete="Off"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:CalendarExtender ID="calMorLtrDt" runat="server" Enabled="True" TargetControlID="txtMORDT"></cc1:CalendarExtender>
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblMORDt" runat="server" CssClass="styleDisplayLabel" Text="Mortage Letter Date"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtVerdictStmt" runat="server" ToolTip="Verdict Statement" autoComplete="Off"
                                                    onkeyup="maxlengthfortxt(200)" class="md-form-control form-control login_form_content_input requires_true" TextMode="MultiLine"></asp:TextBox><span class="highlight"></span><span class="bar"></span><label><asp:Label ID="lblVerdictStatement" runat="server" CssClass="styleDisplayLabel" Text="Verdict Statement"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtClaimAmt" runat="server" ToolTip="Claim Amount" autoComplete="Off"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:FilteredTextBoxExtender ID="ftClaimAmt" runat="server" TargetControlID="txtClaimAmt"
                                                        FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                <span class="highlight"></span><span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblClaimAmt" runat="server" CssClass="styleDisplayLabel" Text="Claim Amount"></asp:Label></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtReasonforWithDraw" runat="server" ToolTip="Reason of Withdraw" autoComplete="Off"
                                                    onkeyup="maxlengthfortxt(200)" class="md-form-control form-control login_form_content_input requires_true" TextMode="MultiLine"></asp:TextBox><span class="highlight"></span><span class="bar"></span><label><asp:Label ID="lblReasonWithDraw" runat="server" CssClass="styleDisplayLabel" 
                                                        Text="Reason for Case Dismissed"></asp:Label></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div align="center" style="display: none;">
                                        <button class="css_btn_enabled" id="btnHearingDetails" onserverclick="btnHearingDetails_Click" runat="server"
                                            type="button" accesskey="H" causesvalidation="false" title="Hearing Details[Alt+H]">
                                            <i class="" aria-hidden="true"></i>&emsp;<u>H</u>earing Details</button>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                                            <asp:Panel GroupingText="Lawyer History Details" ID="Panel2" runat="server"
                                                CssClass="stylePanel" Width="100%">
                                                <div class="gird">
                                                    <asp:GridView Width="100%" ID="grvLawyerDtls" runat="server" AutoGenerateColumns="False" class="gird_details">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                          <%--  <asp:BoundField HeaderText="Lawyer Name" DataField="ENTITY_NAME" ItemStyle-HorizontalAlign="Right" />--%>
                                                              <asp:TemplateField HeaderText="Lawyer Name" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblLawyerName" runat="server" Text='<%#Eval("ENTITY_NAME") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Effective From" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblLawyerEffFrom" runat="server" Text='<%#Eval("EFF_FROM") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <%-- <asp:BoundField HeaderText="Effective From" DataField="EFF_FROM" ItemStyle-HorizontalAlign="Center" />
                                                            <asp:BoundField HeaderText="Effective To" DataField="EFF_TO" ItemStyle-HorizontalAlign="Right" />--%>
                                                            <asp:TemplateField HeaderText="Effective To" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblLawyerEffTo" runat="server" Text='<%#Eval("EFF_TO") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EmptyDataTemplate><span>No Data Found</span></EmptyDataTemplate>
                                                        <EditRowStyle CssClass="styleFooterInfo" />
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                                            <asp:Panel GroupingText="Summon Details" ID="Panel1" runat="server"
                                                CssClass="stylePanel" Width="100%">
                                                <div class="gird">
                                                    <asp:GridView Width="100%" ID="grvSummonDetail" runat="server" AutoGenerateColumns="False" OnRowCommand="grvSummonDetail_RowCommand"
                                                        OnRowDataBound="grvSummonDetail_RowDataBound" OnRowDeleting="grvSummonDetail_RowDeleting" ShowFooter="True" class="gird_details">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Summon No">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtSummonNo" runat="server" Text='<%# Eval("SummonNo") %>' ContenetEditable="false" MaxLength="50" autoComplete="Off"
                                                                        CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtFSummonNo" runat="server" Text='<%# Eval("SummonNo") %>' MaxLength="50" autoComplete="Off"
                                                                            CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><span class="highlight"></span><span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Summon Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSummonDate" runat="server" Text='<%# Eval("Summon_Date") %>'></asp:Label></ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtSummonFDate" runat="server" Text='<%# Eval("Summon_Date") %>' autoComplete="Off"
                                                                            CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:CalendarExtender ID="calSummonDate" runat="server" Enabled="True" TargetControlID="txtSummonFDate"></cc1:CalendarExtender>
                                                                        <span class="highlight"></span><span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Summon Details">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtSummonDetails" runat="server" Text='<%# Eval("SummonRemarks") %>' TextMode="MultiLine" autoComplete="Off"
                                                                        ContenetEditable="false" onkeyup="maxlengthfortxt(200)" class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                     <asp:Label runat="server" ID="lblSMod" Text='<%# Eval("Mod") %>' Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtFSummonDetails" runat="server" Text='<%# Eval("SummonRemarks") %>' TextMode="MultiLine" autoComplete="Off"
                                                                            onkeyup="maxlengthfortxt(200)" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><span class="highlight"></span><span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="grid_btn_delete"
                                                                        OnClientClick="return confirm('Are you sure want to Delete this record?');"
                                                                        AccessKey="E" ToolTip="Delete[Alt+Shift+E]">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <button class="css_btn_enabled" id="btnSummonAdd" title="Add,Alt+A" onserverclick="btnSummonAdd_ServerClick" runat="server"
                                                                        type="button" accesskey="A" validationgroup="Add">
                                                                        <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd</button>
                                                                </FooterTemplate>
                                                                <FooterStyle HorizontalAlign="Center" Width="10%" />
                                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EditRowStyle CssClass="styleFooterInfo" />
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                                            <asp:Panel GroupingText="Prosecution Details" ID="pnlProsecution" runat="server"
                                                CssClass="stylePanel" Width="100%">
                                                <div class="gird">
                                                    <asp:GridView Width="100%" ID="grvProsecution" runat="server" AutoGenerateColumns="False" 
                                                        OnRowCommand="grvProsecution_RowCommand" CssClass="gird_details"
                                                        OnRowDataBound="grvProsecution_RowDataBound" OnRowDeleting="grvProsecution_RowDeleting" 
                                                        ShowFooter="True">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                             <asp:TemplateField HeaderText="Prosecution No">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lblProsecutionNo" Text='<%#Eval("ProsecutionNo") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox runat="server" ID="txtFProsecutionNo"></asp:TextBox>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Court Category">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCourtCategory" runat="server" Text='<%# Eval("CourtCategory") %>'></asp:Label><asp:Label ID="lblCourtCategoryVal" runat="server" Text='<%# Eval("CourtCategoryVal") %>' Visible="false"></asp:Label></ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;" >
                                                                    <asp:DropDownList ID="ddlCourtCategory" runat="server" ToolTip="Court Category" class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                       
                                                                      <span class="highlight"></span><span class="bar"></span> </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Court Category Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCourtCatType" runat="server" Text='<%# Eval("CourtCatType") %>'></asp:Label>
                                                                    <asp:Label ID="lblCourtCatTypeVal" runat="server" Text='<%# Eval("CourtCatTypeVal") %>' Visible="false"></asp:Label>
                                                                     <asp:Label runat="server" ID="lblPMod" Text='<%# Eval("Mod") %>' Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                     <div class="md-input" style="margin: 0px;" >
                                                                    <asp:DropDownList runat="server" ID="ddlCourtCatType" ToolTip="Court Category Type"
                                                                         class="md-form-control form-control"></asp:DropDownList>
                                                                     
                                                                      <span class="highlight"></span><span class="bar"></span> </div>
                                                                      </FooterTemplate>
                                                             
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Hearing Attended By">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHearingAttBy" runat="server" Text='<%# Eval("HearingAttBy") %>'></asp:Label>
                                                                    <asp:Label ID="lblHearingAttByVal" runat="server" Text='<%# Eval("HearingAttByVal") %>' Visible="false"></asp:Label></ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <uc2:Suggest ID="ucHearingAttBy" ToolTip="Hearing Attended by" runat="server"
                                                                            ServiceMethod="GetHearingAttBy" class="md-form-control form-control" />
                                                                        <span class="highlight"></span><span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Hearing Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="txtHearingDate" runat="server" Text='<%# Eval("Hearing_Date") %>'></asp:Label></ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtHearingFDate" runat="server" Text='<%# Eval("Hearing_Date") %>' CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:CalendarExtender ID="calHearingDate" runat="server" Enabled="True" TargetControlID="txtHearingFDate"></cc1:CalendarExtender>
                                                                        <span class="highlight"></span><span class="bar"></span></div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Next Hearing Date">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="lblNextHearingDate" runat="server" Text='<%# Eval("Next_Hearing_Date") %>' CssClass="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox></ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtNextHearingFDate" runat="server" Text='<%# Eval("Next_Hearing_Date") %>' CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><cc1:CalendarExtender ID="calNextFDate" runat="server" Enabled="True" TargetControlID="txtNextHearingFDate"></cc1:CalendarExtender>
                                                                        <span class="highlight"></span><span class="bar"></span></div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Prosecution Details">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtProsecutionRemarks" runat="server" Text='<%# Eval("ProsecutionRemarks") %>' TextMode="MultiLine" onkeyup="maxlengthfortxt(200)" ReadOnly="true" CssClass="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox></ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtFProsecutionRemarks" runat="server" Text='<%# Eval("ProsecutionRemarks") %>' TextMode="MultiLine" onkeyup="maxlengthfortxt(200)" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox><span class="highlight"></span><span class="bar"></span></div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="grid_btn_delete"
                                                                        OnClientClick="return confirm('Are you sure want to Delete this record?');" AccessKey="T" ToolTip="Delete[Alt+T]">
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <button class="css_btn_enabled" id="btnProsecutionAdd" title="Add,Alt+Shift+D" onserverclick="btnProsecutionAdd_ServerClick" runat="server"
                                                                        type="button" accesskey="D" validationgroup="Add">
                                                                        <i class="fa fa-plus" aria-hidden="true"></i>&emsp;A<u>d</u>d</button>
                                                                </FooterTemplate>
                                                                <FooterStyle HorizontalAlign="Center" Width="10%" />
                                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <EditRowStyle CssClass="styleFooterInfo" />
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>

                    </div>
                </div>


                <div align="right" class="fixed_btn">

                    <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(fnCheckPageValidators('Labour Case Filing'))"
                        type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]" validationgroup="Labour Case Filing">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>

                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>

                    <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>

                <div class="row" style="display: none">
                    <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                    <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                </div>

                <asp:ValidationSummary ID="vsCaseGeneration" runat="server" CssClass="styleMandatoryLabel"
                    HeaderText="Correct the following validation(s):  " ValidationGroup="Labour Case Filing" ShowSummary="true" />
                <asp:CustomValidator ID="cvCaseGeneration" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">
        function fnLoadCustomer() {
            //alert(document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_ucCustomerCodeLov_txtName').value);
            document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_ucCustomerCodeLov_btnLoadCust').click();
        }
        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_btnLoadCust').click();
        }
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_btnLoadAccount').click();
        }

        //Tab index code starts

        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_tcCaseGeneration');

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

                var TC = $find("<%=tcCaseGeneration.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=ddlROPCasetype.ClientID %>").focus();
                }
            }
        }

        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {

            var TC = $find("<%=tcCaseGeneration.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlROPCasetype.ClientID %>").focus();
            }

            tab = $find('ctl00_ContentPlaceHolder1_tcCaseGeneration');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;

            function on_Change(sender, e) {
                //  debugger;
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

        function fnTrashCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById("<%= btncust.ClientID %>").click();
            }
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                //alert('test1');
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=ucCustomerCodeLov.ClientID %>').value = "";

            }
            if (document.getElementById(e + '_TxtName').value == "") {
                //alert('test2');
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=ucCustomerCodeLov.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {
                //alert('test3');
                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    //alert('test4');
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + 'ucCustomerCodeLov').value = "0";
                    document.getElementById('<%=ucCustomerCodeLov.ClientID %>').value = "";
                }
            }
        }
    </script>
</asp:Content>
