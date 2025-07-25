<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="false" inherits="Collection_S3GCln_DCFollowupEntry, App_Web_3jwyxbhk" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>

<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="ICM" TagPrefix="uc3" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="updDCDiary" runat="server">
        <ContentTemplate>
            <div class="tab-content">
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
                        <cc1:TabContainer ID="tcDcFollowup" runat="server" ActiveTabIndex="1" CssClass="styleTabPanel" ScrollBars="Auto">
                            <cc1:TabPanel runat="server" HeaderText="DC Diary" ID="tbDCDiary" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    DC Diary 
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="md-input">
                                                <asp:Panel ID="pnlDCSearchCriteria" runat="server" CssClass="stylePanel" GroupingText="DC Search Criteria"
                                                    Width="99%">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="dcAccountNumber" runat="server">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFlwUPAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                                                    Style="display: none;" MaxLength="100"></asp:TextBox>
                                                                <uc4:ICM ID="ucSrchDCFlwUPAccountLov" onblur="fnLoadAccount()" runat="server" ToolTip="Account Number" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucSrchDCFlwUPAccountLov_Item_Selected"
                                                                    strLOV_Code="ACC_LIVE" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" IsMandatory="true" ErrorMessage="Select Account Number" ValidationGroup="Go" />
                                                                <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                                    Style="display: none" />
                                                                <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Account Number" ID="lblprimeaccno" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" runat="server" id="dcLOB">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" class="md-form-control form-control"
                                                                    ToolTip="Line of Business">
                                                                </asp:DropDownList>

                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvddlLOB" runat="server" ErrorMessage="Select the Line of Business"
                                                                        ValidationGroup="Go" Display="Dynamic" SetFocusOnError="True" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                                        ControlToValidate="ddlLOB"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" runat="server" visible="false">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlBranch" AutoPostBack="true" ToolTip="Branch" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" class="md-form-control form-control"
                                                                    runat="server">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ErrorMessage="Select the Branch"
                                                                        ValidationGroup="Go" Display="Dynamic" SetFocusOnError="True" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                                        ControlToValidate="ddlBranch"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Branch" ID="lblBranch" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" runat="server" visible="false">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCustomerNameDummy" runat="server" CssClass="md-form-control form-control"
                                                                    Style="display: none;" MaxLength="50"></asp:TextBox>
                                                                <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" ToolTip="Customer Name" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                    strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" class="md-form-control form-control" />
                                                                <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                                    Style="display: none" />
                                                                <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code/Name" CssClass="styleDisplayLabel">
                                                                    </asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <uc:Suggest ID="ucDebtCollectorName" runat="server" ServiceMethod="GetDCList" ToolTip="Debt Collector Name" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Debt Collector Name" ID="lblDebCollectorName" CssClass="styleDisplayLabel" ToolTip="Debt Collector Name"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <uc:Suggest ID="ucSupervisorName" runat="server" ServiceMethod="GetSupervisorList" ToolTip="Supervisor Name" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Supervisor Name" ID="lblSuperVisorName" CssClass="styleDisplayLabel" ToolTip="Supervisor Name"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="divDcActionStartDate" runat="server" visible="false">
                                                            <div class="md-input">
                                                                <asp:TextBox runat="server" ID="txtActionStartDate" ContentEditable="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="CECActionStartDate" runat="server" TargetControlID="txtActionStartDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Action Start Date" ID="lblActionStartDate" CssClass="styleDisplayLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="divDcActionEndDate" runat="server" visible="false">
                                                            <div class="md-input">
                                                                <asp:TextBox runat="server" ID="txtActionEndDate" ContentEditable="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="calActionEndDate" runat="server" TargetControlID="txtActionEndDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Action End Date" ID="lblActionEndDate" CssClass="styleDisplayLabel"></asp:Label></td>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvSearchbtn">
                                                            <button class="css_btn_enabled" id="btnSearch" onserverclick="btnSearch_Click" runat="server" type="button" accesskey="G" causesvalidation="false" onclick="if(fnCheckPageValidators('Go','f'))" validationgroup="Go" title="Go[Alt+G]">
                                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                            </button>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" runat="server" id="dvAccountInfo" visible="false">
                                        <asp:Panel ID="pnlAccountInfor" runat="server" CssClass="stylePanel" GroupingText="Account Information" ToolTip="Account Information"
                                            Width="99%">
                                            <div>
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvdisLOB" visible="false">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtLOB" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblLOBDisplay" runat="server" CssClass="styleFieldLabel" Text="Line Of Business"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtBranchDisplay" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblBranchDisplay" runat="server" CssClass="styleFieldLabel" Text="Branch"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtCustomerNameDisplay" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblCustomerNameDisplay" runat="server" CssClass="styleFieldLabel" Text="Customer Name"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtAccountNumber" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblAccountNumber" runat="server" CssClass="styleFieldLabel" Text="Account Number"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtVIPCustomer" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblVIPCustomer" runat="server" CssClass="styleFieldLabel" Text="VIP Customer"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtNoOfChqrR" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblNoOfChqrR" runat="server" CssClass="styleFieldLabel" Text="No. Of Cheque Return"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtROPCaseFilled" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblROPCaseFilled" runat="server" CssClass="styleFieldLabel" Text="ROP Case Filled"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtCommercialCase" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblCommercialCase" runat="server" CssClass="styleFieldLabel" Text="Commercial Case"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtChequeType" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblChequeType" runat="server" CssClass="styleFieldLabel" Text="Repayment Mode"></asp:Label>
                                                                <asp:Label ID="lblPA_SA_REF_ID" runat="server" CssClass="styleFieldLabel" Text="" Visible="false"></asp:Label>
                                                                <asp:Label ID="lblCUSTOMER_ID" runat="server" CssClass="styleFieldLabel" Text="" Visible="false"></asp:Label>
                                                                <asp:Label ID="lblLOB_ID" runat="server" CssClass="styleFieldLabel" Text="" Visible="false"></asp:Label>
                                                                <asp:Label ID="lblBranch_ID" runat="server" CssClass="styleFieldLabel" Text="" Visible="false"></asp:Label>
                                                                <asp:Label ID="lblDebtorCollector_ID" runat="server" CssClass="styleFieldLabel" Text="" Visible="false"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtAgreement_Date" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblAgreement_Date" runat="server" CssClass="styleFieldLabel" Text="Agreement Date"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>


                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtSCHEUDULEB" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblSCHEUDULEB" runat="server" CssClass="styleFieldLabel" Text="Schedule B"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtFuture_Rentals" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="Label13" runat="server" CssClass="styleFieldLabel" Text="Future Rentals"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtOverdue_Amt" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="Label17" runat="server" CssClass="styleFieldLabel" Text="Overdue"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtAdvance_Amt" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblAdvance_Amt" runat="server" CssClass="styleFieldLabel" Text="Ovedue Month"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtOutstanding" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblOutstanding" runat="server" CssClass="styleFieldLabel" Text="Outstanding"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMarketing_Officer_Name" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblMarketing_Officer_Name" runat="server" CssClass="styleFieldLabel" Text="Marketing Officer Name"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <asp:Panel ID="pnlGeneralRemarks" runat="server" CssClass="stylePanel" GroupingText="General Followup"
                                                        Width="99%">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtCustomerMobileNo" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="12"></asp:TextBox>
                                                                     <cc1:FilteredTextBoxExtender ID="fteCustomerMobileNo" runat="server" FilterType="Custom, Numbers"
                                                                        TargetControlID="txtCustomerMobileNo" ValidChars="/">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblCustMobileNo" runat="server" CssClass="styleFieldLabel" Text="Customer Mobile Number"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtHPromisePayDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                         OnTextChanged="txtHPromisePayDate_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtHPromisePayDate"
                                                                        ID="CEPayDate" Enabled="True" OnClientDateSelectionChanged="checkDate_PrevSystemDateNotEqualToSystemdate">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblHPromisePayDate" runat="server" CssClass="styleFieldLabel" Text="Promise to Pay Date"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtHNextFollowupAmount" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="fttxtHNextFollowupAmount" runat="server" FilterType="Custom,Numbers"
                                                                        ValidChars="." TargetControlID="txtHNextFollowupAmount">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblHNextFollowupAmount" runat="server" CssClass="styleFieldLabel" Text="Promise to Pay Amount"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtHNextFollowupDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtHNextFollowupDate"
                                                                        ID="cetxtHNextFollowupDate" Enabled="True" OnClientDateSelectionChanged="checkDate_PrevSystemDateNotEqualToSystemdate">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblHNextFollowupDate" runat="server" CssClass="styleFieldLabel" Text="Next Followup Date"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                                <div class="row">
                                                    <div align="center">
                                                        <div class="row" align="center">
                                                            <div>
                                                                <button class="css_btn_enabled" id="btnApplication" onserverclick="btnApplication_Click" runat="server" type="button" accesskey="O" causesvalidation="false"
                                                                   validationgroup="DC Entry" title="Application[Alt+O]">
                                                                    <i class="fa fa-eye" aria-hidden="true"></i>&emsp;Application
                                                                </button>
                                                            </div>
                                                            <div>
                                                                <button class="css_btn_enabled" id="btnJournal" onserverclick="btnJournal_Click" runat="server" type="button" accesskey="O" causesvalidation="false"
                                                                   validationgroup="DC Entry" title="Journal[Alt+O]">
                                                                    <i class="fa fa-eye" aria-hidden="true"></i>&emsp;Journal
                                                                </button>
                                                            </div>
                                                            <div>
                                                                <button class="css_btn_enabled" id="btnPDC" onserverclick="btnPDC_Click" runat="server" type="button" accesskey="O" causesvalidation="false"
                                                                   validationgroup="DC Entry"  title="PDC[Alt+O]">
                                                                    <i class="fa fa-eye" aria-hidden="true"></i>&emsp;PDC
                                                                </button>
                                                            </div>
                                                            <div>
                                                                <button class="css_btn_enabled" id="btnROP" onserverclick="btnROP_Click" runat="server" type="button" accesskey="O" causesvalidation="false"
                                                                   validationgroup="DC Entry"  title="ROP[Alt+O]">
                                                                    <i class="fa fa-eye" aria-hidden="true"></i>&emsp;ROP
                                                                </button>
                                                            </div>
                                                            <div>
                                                                <button class="css_btn_enabled" id="btnSOA" onserverclick="btnSOA_Click" runat="server" type="button" accesskey="O" causesvalidation="false"
                                                                    validationgroup="DC Entry" title="View[Alt+O]">
                                                                    <i class="fa fa-eye" aria-hidden="true"></i>&emsp;SOA
                                                                </button>
                                                            </div>
                                                            <div>
                                                                <button class="css_btn_enabled" id="btnViewODICalc" onserverclick="btnViewODICalc_Click" runat="server" type="button" accesskey="I" causesvalidation="false" onclick="if(fnCheckPageValidators('DC Entry','f'))" validationgroup="DC Entry" title="Go[Alt+G]">
                                                                    <i class="fa fa-eye" aria-hidden="true"></i>&emsp;ODI Calc
                                                                </button>
                                                            </div>
                                                            <div>
                                                                <button class="css_btn_enabled" id="btnAssetView" onserverclick="btnAssetView_OnClick" runat="server" type="button" accesskey="E" causesvalidation="false" onclick="if(fnCheckPageValidators('DC Entry','f'))" validationgroup="DC Entry" title="Go[Alt+G]">
                                                                    <i class="fa fa-eye" aria-hidden="true"></i>&emsp;Asset
                                                                </button>
                                                            </div>
                                                            <div>
                                                                <button class="css_btn_enabled" id="Button1" onserverclick="btnPaiddtls_OnClick" runat="server" type="button" accesskey="p" causesvalidation="false" onclick="if(fnCheckPageValidators('DC Entry','f'))" validationgroup="DC Entry" title="Go[Alt+G]">
                                                                    <i class="fa fa-eye" aria-hidden="true"></i>&emsp;Paid details 
                                                                </button>
                                                            </div>
                                                            <div>
                                                                 <button class="css_btn_enabled" id="btnUpdateRe" onserverclick="btnUpdate_OnClick" runat="server" type="button" accesskey="E" causesvalidation="false" onclick="if(fnCheckPageValidators('DC Entry','f'))" validationgroup="DC Entry" title="Go[Alt+G]">
                                                                    <i class="fa fa-eye" aria-hidden="true"></i>&emsp;Update Remarks
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlFollowup" runat="server" CssClass="stylePanel" GroupingText="Followup List"
                                                Width="99%" Visible="false">
                                                <asp:UpdatePanel ID="upFollowupGrid" runat="server">
                                                    <ContentTemplate>
                                                        <div id="divFollowupGrid" class="gird" runat="server" style="overflow: auto">
                                                            <asp:GridView ID="gvFollowupList" runat="server" HeaderStyle-CssClass="styleGridHeader"
                                                                AutoGenerateColumns="false" OnRowDataBound="gvFollowupList_RowDataBound" class="gird_details">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Due Details" ItemStyle-VerticalAlign="Middle" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="btnDueView" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                                                runat="server" ToolTip="View,Alt+Shift+D" AccessKey="D" OnClick="btnDueView_OnClick" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="DC_FOLLOWUP_ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDCFollowUP_ID" Text='<%#Eval("DC_FOLLOWUP_ID")%>' runat="server" ToolTip="DC Follow UP ID"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="DEMAND_PROCESS_ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDemandProcess_ID" Text='<%#Eval("DEMAND_PROCESS_ID")%>' runat="server" ToolTip="Demand Process ID"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="DEMAND_PROCESS_DETAIL_ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDemandProcDetail_ID" Text='<%#Eval("DEMAND_PROCESS_DETAIL_ID")%>' runat="server" ToolTip="Demand Process Detail ID"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="CUSTOMER_NAME" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCustomerCodeName" Text='<%#Eval("CUSTOMER_NAME")%>' Width="170px"
                                                                                runat="server" ToolTip="Customer Name"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Mobile Number" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblMobilenumber" MaxLength="20" Text='<%#Eval("MOBILE_NUMBER")%>' Width="120px"
                                                                                runat="server" ToolTip="Mobile Number"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="PA SA REF ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPASA_REF_ID" Text='<%#Eval("PA_SA_REF_ID")%>' runat="server" ToolTip="Account Number"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Account Number" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAccountnumber" Text='<%#Eval("ACCOUNT_NO")%>' Width="100px"
                                                                                runat="server" ToolTip="Account Number"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Customer Type">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlCustomerType" Width="100px" CssClass="md-form-control form-control" runat="server" ToolTip="Customer Type" AutoPostBack="true" OnSelectedIndexChanged="ddlCustomerType_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Guarantor Name">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">                                                                              
                                                                                <uc:Suggest ID="ddlCustomerTypeName" runat="server" class="md-form-control form-control" ToolTip="Co-Applicant/ Guarantor Name"
                                                                                     ServiceMethod="GetCustomerTypeName" AutoPostBack="true" OnItem_Selected="ddlCustomerTypeName_Item_Selected" Width="120px" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Guarantor MobileNo">
                                                                        <ItemTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtCustomerTypeMobile" MaxLength="20" Text='<%#Eval("CUSTOMER_TYPE_MOB_NO")%>' Width="120px"
                                                                                    runat="server" ToolTip="Co-Applicant/ Guarantor MobileNo" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="fttxtCustTypeMobile" runat="server" FilterType="Numbers"
                                                                                    TargetControlID="txtCustomerTypeMobile">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Installment Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDueDate" Text='<%#Eval("DUE_DATE")%>' Width="80px"
                                                                                runat="server" ToolTip="Due Date"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Installment Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDueAmount" Text='<%#Eval("Due_Amount")%>' Width="80px"
                                                                                runat="server" ToolTip="Due Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="DEBT_COLLECTOR_ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDebtCollector_ID" Text='<%#Eval("DEBT_COLLECTOR_ID")%>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="DC Name" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDCName" Text='<%#Eval("DC_Name")%>' Width="170px"
                                                                                runat="server" ToolTip="DC Name"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="CHEQUE_RETURN_ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblChequeRetID" Text='<%#Eval("CHEQUE_RETURN_ID")%>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Cheque Return Advise Number">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblChequeReAdvNumber" Text='<%#Eval("CHEQUE_RETURN_ADVICE_NO")%>' Width="100px"
                                                                                runat="server" ToolTip="Cheque Number"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Cheque Number">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblChequeNumber" Text='<%#Eval("Cheque_No")%>' Width="100px"
                                                                                runat="server" ToolTip="Cheque Number"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="RECEIPT_NO" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblReceiptNo" Text='<%#Eval("RECEIPT_NO")%>' Width="100px" runat="server" ToolTip="Receipt Number"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Receipt_Date" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblReceiptDate" Text='<%#Eval("Receipt_Date")%>' Width="100px" runat="server" ToolTip="Receipt Date"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Return Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblReturnDate" Text='<%#Eval("Return_Date")%>' Width="100px" runat="server" ToolTip="Return Date"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Reason">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblReason" Text='<%#Eval("Reason")%>' Width="100px" runat="server" ToolTip="Reason"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Total Dues" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTotalDues" MaxLength="20" Width="80px" runat="server"
                                                                                ToolTip="Total Dues" Text='<%#Eval("TOTAL_DUES")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Arrears" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblArrears" MaxLength="20" Width="80px" runat="server"
                                                                                ToolTip="Arrears" Text='<%#Eval("ARREAR_DUES")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Current Dues" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCurrentDues" MaxLength="20" Width="80px" runat="server"
                                                                                ToolTip="Current Dues" Text='<%#Eval("CURRENT_DUES")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Other Dues" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblOtherDues" MaxLength="20" Width="80px" runat="server"
                                                                                ToolTip="Other Dues" Text='<%#Eval("OTHER_DUES")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Status" Visible="false">
                                                                        <ItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlDcFollowupStatus" runat="server" Width="100px" CssClass="md-form-control form-control" ToolTip="Follow Up Status" ValidationGroup="Update"></asp:DropDownList>
                                                                                <asp:Label ID="lblDcFollowupStatus" Text='<%#Eval("DC_FolloupStatus")%>' runat="server" Visible="false"></asp:Label>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>                                                                              
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Remarks" Visible="false">
                                                                        <ItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtRemarks" ValidationGroup="Update" Width="250px" onkeydown="maxlengthfortxt(250);" CssClass="md-form-control form-control login_form_content_input lowercase"
                                                                                    runat="server" ToolTip="Remarks" TextMode="MultiLine" Text='<%#Eval("Remarks")%>'>></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>                                                                            
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Update" Visible="false">
                                                                        <ItemTemplate>
                                                                            <button class="css_btn_enabled" id="btnFollowupUpdate" title="Update,Alt+U" causesvalidation="false" onserverclick="btnFollowupUpdate_ServerClick" runat="server"
                                                                                type="button" accesskey="U" validationgroup="Update">
                                                                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>U</u>pdate
                                                                            </button>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="View Remarks" Visible="false">
                                                                        <ItemTemplate>
                                                                            <button class="css_btn_enabled" id="btnViewRemarks" title="View Remarks,Alt+V" causesvalidation="false" onserverclick="btnViewRemarks_ServerClick" runat="server"
                                                                                type="button" accesskey="V" validationgroup="Add">
                                                                                <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>V</u>iew
                                                                            </button>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="100px" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Add Remarks" Visible="false">
                                                                        <ItemTemplate>
                                                                            <button class="css_btn_enabled" id="btnAddRemarks" title="Add Remarks,Alt+A" causesvalidation="false" onserverclick="btnAddRemarks_ServerClick" runat="server"
                                                                                type="button" accesskey="A" validationgroup="Add">
                                                                                <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                                            </button>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                </Columns>
                                                            </asp:GridView>
                                                            <uc1:PageNavigator ID="ucgridFollowupListPaging" runat="server" Visible="false" />
                                                        </div>

                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <div class="row">
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div class="row">
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlFollowupHistoryDet" runat="server" CssClass="stylePanel" GroupingText="Followup List History"
                                                Width="99%" Visible="false">
                                                <div class="gird" runat="server" style="overflow: auto">
                                                    <asp:GridView ID="gvFollowupListHist" runat="server" HeaderStyle-CssClass="styleGridHeader"
                                                        AutoGenerateColumns="false" OnRowDataBound="gvFollowupListHist_RowDataBound" class="gird_details">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="DC Follow UP ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHDCFollowUP_ID" Text='<%#Eval("DC_FOLLOWUP_ID")%>' runat="server" ToolTip="DC Follow UP ID"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Account Number" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHAccountnumber" Text='<%#Eval("ACCOUNT_NO")%>' Width="100px"
                                                                        runat="server" ToolTip="Account Number"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Customer Name" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHCustomerCodeName" Text='<%#Eval("CUSTOMER_NAME")%>' Width="170px"
                                                                        runat="server" ToolTip="Customer Name"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Mobile Number" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHMobilenumber" Text='<%#Eval("MOBILE_NUMBER")%>' Width="100px"
                                                                        runat="server" ToolTip="Mobile Number"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Customer Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCustomerType" Text='<%#Eval("Customer_Type")%>' Width="100px"
                                                                        runat="server" ToolTip="Customer Type"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Co-Applicant/ Guarantor Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCustomerTypeName" Text='<%#Eval("Customer_Type_Name")%>' Width="100px"
                                                                        runat="server" ToolTip="Co-Applicant/ Guarantor Name"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Co-Applicant/ Guarantor MobileNo">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCustomerTypeMobNo" Text='<%#Eval("Customer_Type_Mobile_No")%>' Width="100px"
                                                                        runat="server" ToolTip="Co-Applicant/ Guarantor MobileNo"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>


                                                            <asp:TemplateField HeaderText="Promise to Pay Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHPromisetoPayDate" Text='<%#Eval("PROMISE_TO_DATE")%>' Width="100px"
                                                                        runat="server" ToolTip="Promise to Pay Date"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Promise to Pay Amount">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHPromisetoPayAmount" Text='<%#Eval("PROMISE_TO_PAY_AMOUNT")%>' Width="80px"
                                                                        runat="server" ToolTip="Promise to Pay Amount"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Next FollowUp Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHNextFollowupDate" Text='<%#Eval("NEXT_FOLLOWUP_DATE")%>' Width="80px"
                                                                        runat="server" ToolTip="Next Followup Date"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Cheque Number" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblChequeNumber" Text='<%#Eval("Cheque_No")%>' Width="100px"
                                                                        runat="server" ToolTip="Cheque Number"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--                  <asp:TemplateField HeaderText="Receipt Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHReceiptNo" Text='<%#Eval("RECEIPT_NO")%>' Width="100px" runat="server" ToolTip="Receipt Number"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Receipt Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHReceiptDate" Text='<%#Eval("Receipt_Date")%>' Width="100px" runat="server" ToolTip="Receipt Date"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Return Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHReturnDate" Text='<%#Eval("Return_Date")%>' Width="100px" runat="server" ToolTip="Return Date"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Reason">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHReason" Text='<%#Eval("Reason")%>' Width="100px" runat="server" ToolTip="Reason"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>

                                                            <asp:TemplateField HeaderText="Status">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDcFollowupStatus" Text='<%#Eval("DC_FolloupStatus")%>' ToolTip="Followup Status" runat="server" Width="80px"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Remarks" Visible="false">
                                                                <ItemTemplate>
                                                                    <%--<asp:Label ID="lblHDcRemarks" Text='<%#Eval("Remarks")%>' runat="server" ToolTip="Remarks" Width="170px"></asp:Label>--%>
                                                                    <asp:TextBox ID="txtHDcRemarks" Text='<%#Eval("Remarks")%>' Width="250px" ToolTip="Remarks" runat="server" ReadOnly="true" TextMode="MultiLine"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Created By">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHCreatedBy" Text='<%#Eval("Created_By")%>' runat="server" ToolTip="Created By" Width="100px"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Created On">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHCreated_On" Text='<%#Eval("CREATED_ON")%>' runat="server" ToolTip="Created On" Width="100px"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>

                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Remarks Entry" ID="tpRemarksEntry" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Remarks Entry &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlRemarksSearchCriteria" runat="server" CssClass="stylePanel" GroupingText="Remarks Search Criteria"
                                                Width="99%">
                                                <div>
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlRemarksAction" runat="server" CssClass="md-form-control form-control" ToolTip="Action" AutoPostBack="true" OnSelectedIndexChanged="ddlRemarksAction_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvddlRemarksAction" runat="server" ControlToValidate="ddlRemarksAction" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" InitialValue="0" ErrorMessage="Select the Action" ValidationGroup="Remarks Entry"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvddlRemAction" runat="server" ControlToValidate="ddlRemarksAction" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" InitialValue="0" ErrorMessage="Select the Action" ValidationGroup="Remarks Search"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblAction" runat="server" Text="Action"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtRemarksEntryAccnoDummy" runat="server" CssClass="md-form-control form-control"
                                                                    Style="display: none;" MaxLength="100"></asp:TextBox>
                                                                <uc4:ICM ID="ucSrchRemarksAccNo" onblur="fnLoadRemarksAccount()" runat="server" ToolTip="Account Number" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both"
                                                                    strLOV_Code="ACC_LIVE" ServiceMethod="GetAccuntNoList" OnItem_Selected="ucSrchRemarksAccNo_Item_Selected" class="md-form-control form-control" />
                                                                <asp:Button ID="btnRemarksEntryAccNo" runat="server" Text="Load Account" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnRemarksEntryAccNo_Click"
                                                                    Style="display: none" />
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvtxtRemarksEntryAccnoDummy" runat="server" ErrorMessage="Select the Account Number"
                                                                        SetFocusOnError="true" ControlToValidate="txtRemarksEntryAccnoDummy" CssClass="validation_msg_box_sapn" ValidationGroup="Remarks Entry"
                                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblRemarksSearchAccNo" runat="server" ToolTip="Account Number" Text="Account Number"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row" id="divSrchInputDetails" runat="server">

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtStartDate" MaxLength="20" runat="server" ToolTip="Action Start Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="cetxtStartDate" runat="server" Enabled="True"
                                                                    TargetControlID="txtStartDate">
                                                                </cc1:CalendarExtender>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblStartDate" runat="server" Text="Action Start Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtEndDate" MaxLength="20" runat="server" ToolTip="Action End Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="cetxtEndDate" runat="server" Enabled="True"
                                                                    TargetControlID="txtEndDate">
                                                                </cc1:CalendarExtender>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblEndDate" runat="server" Text="Action End Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtSearchRemarksNo" MaxLength="30" runat="server" ToolTip="Remarks Number" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblSearchRemarksNo" runat="server" Text="Remarks Number"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlSearchRemarksType" runat="server" CssClass="md-form-control form-control" ToolTip="Remarks Type" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchRemarksType_SelectedIndexChanged"></asp:DropDownList>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblSearchRemarksType" runat="server" Text="Remarks Type"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlSearchRemarksSubType" runat="server" ToolTip="Remarks Sub Type" CssClass="md-form-control form-control"></asp:DropDownList>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblSearchRemarksSubType" runat="server" Text="Remarks Sub Type"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlSearchBy" runat="server" CssClass="md-form-control form-control"></asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblSearchBy" runat="server" Text="Search By"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtSrchNextActionStartDate" runat="server" ToolTip="Next Action Start Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="cetxtSrchNextActionStartDate" runat="server" Enabled="True"
                                                                    TargetControlID="txtSrchNextActionStartDate">
                                                                </cc1:CalendarExtender>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblSrchNextActionStartDate" runat="server" Text="Next Action Start Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtSrchNextActionEndDate" runat="server" ToolTip="Next Action End Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="cetxtSrchNextActionEndDate" runat="server" Enabled="True"
                                                                    TargetControlID="txtSrchNextActionEndDate">
                                                                </cc1:CalendarExtender>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblSrchNextActionEndDate" runat="server" Text="Next Action End Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divSrchRemEmployeeName" runat="server" visible="false">
                                                            <div class="md-input">
                                                                <uc:Suggest ID="ddlSrchRemEmployeeName" runat="server" ServiceMethod="GetEmployeNameList" IsMandatory="false" ToolTip="Employee Name" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblSrchRemEmployeeName" runat="server" Text="Employee Name">
                                                                    </asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlSearchStatus" runat="server" ToolTip="Status" CssClass="md-form-control form-control"></asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div class="row" align="right" id="divSrchbtnRemarks" runat="server">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <button class="css_btn_enabled" id="btnSearchRemarks" onserverclick="btnSearchRemarks_ServerClick" runat="server"
                                                                type="button" accesskey="R" title="Search, Alt+R" validationgroup="Remarks Search">
                                                                <i class="fa fa-search" aria-hidden="true"></i>&emsp;Sea<u>r</u>ch
                                                            </button>
                                                        </div>
                                                    </div>

                                                    <div class="row" id="divSrchRemarksEntryGrid" runat="server">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird" runat="server" style="overflow: auto">
                                                                <asp:GridView ID="gvSearchRemarksEntry" runat="server" HeaderStyle-CssClass="styleGridHeader"
                                                                    AutoGenerateColumns="false" class="gird_details" OnRowDataBound="gvSearchRemarksEntry_RowDataBound">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="ACCOUNT DIARY HDR ID" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAccDiaryHDRID" runat="server" Text='<%#Eval("ACCOUNT_DIARY_HDR_ID")%>'></asp:Label>
                                                                                <asp:Label ID="lblSRAssigned" runat="server" Visible="false" Text='<%#Eval("AccAssigned")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="ACCOUNT DIARY DET ID" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAccDiaryDetID" runat="server" Text='<%#Eval("ACCOUNT_DIARY_DET_ID")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Account No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAccountNo" runat="server" ToolTip="Account Number" Text='<%#Eval("Account_No")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Customer Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCustomerName" runat="server" ToolTip="Customer Name" Text='<%#Eval("Customer_Name")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Remarks No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRemarksNo" runat="server" ToolTip="Remarks Number" Text='<%#Eval("Remarks_Number")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Action Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblActionDate" runat="server" ToolTip="Action Date" Text='<%#Eval("Follow_UP_Date")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Origin Branch">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblOriginBranch" runat="server" ToolTip="Origin Branch" Text='<%#Eval("Origin_Branch")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Origin User">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblOriginUser" runat="server" ToolTip="Origin User" Text='<%#Eval("Origin_User")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Next Action Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblNextActionDate" runat="server" ToolTip="Next Action Date" Text='<%#Eval("Next_Follow_UP_Date")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Select">
                                                                            <HeaderTemplate>
                                                                                <asp:CheckBox ID="chkSelectAllAccount" runat="server" ToolTip="Select All"></asp:CheckBox>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkSelectAccount" runat="server" AutoPostBack="true" ToolTip="Select Account" OnCheckedChanged="chkSelectAccount_CheckedChanged" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                            <div class="row">
                                                                <uc1:PageNavigator ID="ucSrchRemarksEntryPaging" runat="server" Visible="false" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlRemarksEntry" runat="server" CssClass="stylePanel" GroupingText="Remarks Entry"
                                                Width="99%">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtRemarksNumber" runat="server" Enabled="false" ToolTip="Remarks Number" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Remarks Number" ID="lblRemarksNumber"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlRemarksType" runat="server" ToolTip="Remarks Type" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlRemarksType_SelectedIndexChanged"></asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvddlRemarksType" runat="server" ErrorMessage="Select the Remarks Type" ValidationGroup="Remarks Entry"
                                                                            SetFocusOnError="true" ControlToValidate="ddlRemarksType" CssClass="validation_msg_box_sapn" InitialValue="0"
                                                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Remarks Type" ID="lblRemarksType" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlRemarksSubType" ToolTip="Remarks Sub Type" runat="server" class="md-form-control form-control"></asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvddlRemarksSubType" runat="server" ErrorMessage="Select the Remarks SubType" ValidationGroup="Remarks Entry"
                                                                            SetFocusOnError="true" ControlToValidate="ddlRemarksSubType" CssClass="validation_msg_box_sapn" InitialValue="0"
                                                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Remarks Sub Type" ID="lblRemarksSubType" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divComments" runat="server">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" ToolTip="Comments" onkeydown="maxlengthfortxt(250);" class="md-form-control form-control login_form_content_input requires_true lowercase"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtComments" runat="server" ErrorMessage="Enter the Comments" ValidationGroup="Remarks Entry"
                                                                            SetFocusOnError="true" ControlToValidate="txtComments" CssClass="validation_msg_box_sapn"
                                                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Comments" ID="lblComments"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divddlActionTaken" runat="server">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlActionTaken" runat="server" class="md-form-control form-control" ToolTip="Action To Be Taken" AutoPostBack="true" OnSelectedIndexChanged="ddlActionTaken_SelectedIndexChanged"></asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvddlActionTaken" runat="server" ErrorMessage="Select the Action To Be Taken" ValidationGroup="Remarks Entry"
                                                                            SetFocusOnError="true" ControlToValidate="ddlActionTaken" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Action To Be Taken" ID="lblActionTaken" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divAssignToBranch" runat="server" visible="false">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlAssigntoBranch" runat="server" class="md-form-control form-control" ToolTip="Assign To Branch" AutoPostBack="true" OnSelectedIndexChanged="ddlAssigntoBranch_SelectedIndexChanged"></asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvddlAssigntoBranch" runat="server" ErrorMessage="Select the Assign To Branch" ValidationGroup="Remarks Entry" Enabled="false"
                                                                            SetFocusOnError="true" ControlToValidate="ddlAssigntoBranch" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Assign To Branch" ID="lblAssigntoBranch"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divAssignToUser" runat="server">
                                                                <div class="md-input">
                                                                    <uc:Suggest ID="ddlEmployeeName" runat="server" ServiceMethod="GetEmployeNameList" class="md-form-control form-control" IsMandatory="true" ToolTip="Assigned to User" ErrorMessage="Select the Assigned To User"
                                                                        ValidationGroup="Remarks Entry" />

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Assign To User" ID="lblAssigntoUser"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divNextActionDate" runat="server" visible="false">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtNextActionDate" runat="server" ToolTip="Next Action Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="ceNextActionDate" runat="server" TargetControlID="txtNextActionDate"></cc1:CalendarExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtNextActionDate" runat="server" ErrorMessage="Select the Next Action Date" ValidationGroup="Remarks Entry" Enabled="false"
                                                                            SetFocusOnError="true" ControlToValidate="txtNextActionDate" CssClass="validation_msg_box_sapn"
                                                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Next Action Date" ID="lblNextActionDate"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divcbIsSecuredRemarks" runat="server">
                                                                <div class="md-input">
                                                                    <asp:CheckBox ID="cbIsSecuredRemarks" runat="server" AutoPostBack="true" ToolTip="Secured Remarks" OnCheckedChanged="cbIsSecuredRemarks_CheckedChanged" />
                                                                    <asp:Label ID="lblSecuredRemarks" runat="server" Text="Secured Remarks"></asp:Label>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                <div class="md-input">
                                                                    <asp:Panel ID="pnlUserDetails" GroupingText="Access Employee List" runat="server" CssClass="stylePanel" Style="height: 150px;" Visible="false">
                                                                        <asp:GridView runat="server" ID="gvUserDetails" Width="100%" HeaderStyle-CssClass="styleGridHeader"
                                                                            OnRowDataBound="gvUserDetails_RowDataBound" AutoGenerateColumns="False" class="gird_details">
                                                                            <Columns>
                                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="User Name"
                                                                                    HeaderStyle-Width="70%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblName" runat="server" ToolTip='<%#Eval("Name")%>' Text='<%#Eval("Name")%>'></asp:Label>
                                                                                        <asp:Label ID="lblUserName" runat="server" Visible="false" ToolTip='<%#Eval("User_Name")%>' Text='<%#Eval("User_Name")%>'></asp:Label>
                                                                                        <asp:Label ID="lblUserID" runat="server" Visible="false" Text='<%#Eval("ID")%>'></asp:Label>
                                                                                        <asp:Label ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderStyle-Width="30%">
                                                                                    <HeaderTemplate>
                                                                                        <asp:CheckBox ID="chkSelectAllUser" runat="server" ToolTip="Select All"></asp:CheckBox>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="chkSelectUser" runat="server" ToolTip="Select"></asp:CheckBox>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <RowStyle HorizontalAlign="Center" />
                                                                        </asp:GridView>
                                                                    </asp:Panel>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div class="row" id="divCallHistoryGrid" runat="server">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlCallHistoryGrid" runat="server" CssClass="stylePanel" GroupingText="Call History Details"
                                                Width="99%" Visible="false">
                                                <div class="gird" runat="server" style="overflow: auto">
                                                    <asp:GridView ID="gvCallHistoryDetails" runat="server" HeaderStyle-CssClass="styleGridHeader"
                                                        AutoGenerateColumns="false" class="gird_details">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Account Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHDAccountNo" runat="server" ToolTip="Account Number" Text='<%#Eval("PANUM")%>' Width="80px"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Remarks Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHDRemarksDate" runat="server" ToolTip="Remarks Number" Text='<%#Eval("REMARK_DATE")%>' Width="80px"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Remarks Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHDRemarksNo" runat="server" ToolTip="Remarks Number" Text='<%#Eval("Ticket_Number")%>' Width="80px"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Remarks">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtHDRemarks" Text='<%#Eval("Remarks")%>' Width="250px" ToolTip="Remarks" runat="server" ReadOnly="true" TextMode="MultiLine"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Action Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHDActionDate" runat="server" ToolTip="Action Date" Text='<%#Eval("Action_Date")%>' Width="80px"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Next Action Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHDNextActionDate" runat="server" ToolTip="Next Action Date" Text='<%#Eval("Next_Action_Date")%>' Width="80px"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Assigned By">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHDAssignedBy" runat="server" ToolTip="Assigned By" Text='<%#Eval("Assigned_By")%>' Width="100px"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="ODI Calculation" ID="tabODICalc" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    ODI Calc &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <asp:Panel ID="pnlODICalc" GroupingText="Overdue Interest Calculation" CssClass="stylePanel" runat="server">
                                            <div id="divODICalc" runat="server" style="height: 350px;">
                                                <asp:GridView ID="gvODICalc" runat="server" HeaderStyle-CssClass="styleGridHeader" class="gird_details"
                                                    RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Installment No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInstallmentNo" Text='<%#Eval("INSTALLMENT_NO")%>' Width="80px" ToolTip="Installment No" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Installment Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInstallmentDate" Text='<%#Eval("INSTALLMENTDATE")%>' Width="80px" ToolTip="Installment Date" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Installment Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInstallmentAmount" Text='<%#Eval("INSTALLMENTAMOUNT")%>' Width="80px" ToolTip="Installment Amount" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Paid Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPaidDate" Text='<%#Eval("PAID_DATE")%>' Width="80px" runat="server" ToolTip="Paid Date"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Paid Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPaidAmount" Text='<%#Eval("PAID_AMOUNT")%>' Width="80px" runat="server" ToolTip="Paid Amount"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Gap Days">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblGapDays" Text='<%#Eval("GAP_DAYS")%>' Width="80px" runat="server" ToolTip="Gap Days"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="ODI Chargeable Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblODIChargeableAmt" Text='<%#Eval("ODI_CHARGBLE_AMOUNT")%>' Width="80px" ToolTip="ODI Chargeable Amount" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="ODI Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblODIAmount" Text='<%#Eval("ODI_AMOUNT")%>' Width="80px" runat="server" ToolTip="ODI Amount"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="ODI Interest Rate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblODIInterestRate" Text='<%#Eval("ODI_INTEREST_RATE")%>' Width="80px" runat="server" ToolTip="ODI Interest Rate"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>

                                                <div class="row">
                                                    <br />
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtAFCRecived" runat="server" ToolTip="Additional Finance Charges Received" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="AFC Received" ID="lblAFCReceived"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtAFCWaiver" ToolTip="Additional Finance Charges Waiver" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="AFC Waiver" ID="lblAFCWaiver"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtAFCBalanceDue" ToolTip="Additional Finance Charges Balance Due" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="AFC Balance Due" ID="lblAFCBalanceDue"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Asset Details" ID="tabAssetDtl" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Asset Details &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <asp:Panel ID="pnlAssetdtl" GroupingText="Asset Details" CssClass="stylePanel" runat="server">
                                            <div id="divAssetDetail" runat="server" class="gird">
                                                <asp:GridView ID="grvAssetDetails" runat="server" HeaderStyle-CssClass="styleGridHeader"
                                                    RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false" class="gird_details">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Asset Code">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAssetCode" Text='<%#Eval("Asset_Code")%>' Width="100px" ToolTip="Asset Code" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Asset Description">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAssetDescription" Text='<%#Eval("Asset_Description")%>' Width="120px" ToolTip="Asset Description" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Dealer Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDealerName" Text='<%#Eval("Dealer_Name")%>' Width="140px" ToolTip="Dealer Name" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Registration Number">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRegnNumber" Text='<%#Eval("Regn_Number")%>' Width="120px" ToolTip="Registration Number" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Engine Number">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblEngineNumber" Text='<%#Eval("Engine_Number")%>' Width="100px" ToolTip="Engine Number" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Chassis Number">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblChassisNumber" Text='<%#Eval("Chasis_Number")%>' Width="100px" ToolTip="Chassis Number" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Serial Number">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSerialNumber" Text='<%#Eval("Serial_Number")%>' Width="100px" ToolTip="Serial Number" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Installation Ref Number">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInstallationRefNo" Text='<%#Eval("Installation_Ref_No")%>' Width="100px" ToolTip="Installation Reference Number" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="SOA Details" ID="tabSOA" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    SOA Details &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <iframe runat="server" id="iframeSOA" width="100%" height="100%"></iframe>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="SOA Details" ID="tabApplication" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Application Details &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <iframe runat="server" id="iframeApplication" width="100%" height="100%"></iframe>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Asset Details" ID="TabPanel1" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Journal Details &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <asp:Panel ID="pnlJournalDetails" GroupingText="Journal Details" CssClass="stylePanel" runat="server">
                                            <div id="div1" runat="server" class="container">
                                                <asp:GridView ID="grvQuery" runat="server" AutoGenerateColumns="true"
                                                    OnRowDataBound="grvQuery_DataBound" Visible="true" Width="100%">
                                                </asp:GridView>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="PDC Details" ID="TabPanel2" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    PDC Details &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <iframe runat="server" id="iframePDCDtl" width="100%" height="100%"></iframe>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="ROP Details" ID="TabPanel3" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    ROP Details &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <iframe runat="server" id="iframeROP" width="100%" height="100%"></iframe>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Paid Details" ID="TabPanel4" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Paid Details &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <asp:Panel ID="pnlPaidDetails" GroupingText="Paid Details" CssClass="stylePanel" runat="server">
                                            <div id="dvPaidDetails" runat="server" style="height: 350px;">
                                                <asp:GridView ID="grvPaidDetails" runat="server" HeaderStyle-CssClass="styleGridHeader" class="gird_details"
                                                    RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Installment No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPInstallmentNo" Text='<%#Eval("INSTALLMENT_NO")%>' Width="80px" ToolTip="Installment No" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Installment Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPInstallmentDate" Text='<%#Eval("INSTALLMENTDATE")%>' Width="80px" ToolTip="Installment Date" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Installment Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPInstallmentAmount" Text='<%#Eval("INSTALLMENTAMOUNT")%>' Width="80px" ToolTip="Installment Amount" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Paid Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPPaidDate" Text='<%#Eval("PAID_DATE")%>' Width="80px" runat="server" ToolTip="Paid Date"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Paid Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPPaidAmount" Text='<%#Eval("PAID_AMOUNT")%>' Width="80px" runat="server" ToolTip="Paid Amount"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>                                                                                          
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnPdf" title="PDF [Alt+F]" causesvalidation="false" onserverclick="btnPdf_ServerClick" runat="server"
                        type="button" accesskey="F" visible="false">
                        <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;PD<u>F</u>
                    </button>
                    <button class="css_btn_enabled" id="btnCommonSave" onserverclick="btnCommonSave_ServerClick" runat="server" onclick="if(fnCheckPageValidators('DC Entry'))" validationgroup="DC Entry"
                        type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_ServerClick" runat="server" onclick="if(fnCheckPageValidators('Remarks Entry'))" validationgroup="Remarks Entry"
                        type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]" visible="false">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClearAll" onserverclick="btnClearAll_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>

                    <button class="css_btn_enabled" id="btnExit" onserverclick="btnExit_Click" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                    <asp:HiddenField ID="HdnOption" runat="server" />
                </div>

                <div class="row" runat="server" visible="false">
                    <asp:ValidationSummary ID="vgSave" runat="server" ValidationGroup="vgSave" CssClass="styleMandatoryLabel"
                        HeaderText="Correct the following validation(s):" ShowSummary="true" />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="vgUp"
                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                        ShowSummary="true" />
                    <asp:CustomValidator ID="cvFollowUp" runat="server" CssClass="styleMandatoryLabel"
                        Enabled="true" Width="98%" />
                </div>
                <div class="row" style="display: none">

                    <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                    <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                </div>
                <input type="hidden" id="hdnSearch" runat="server" />
                <input type="hidden" id="hdnOrderBy" runat="server" />

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblCommonPopup" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpeCommonPopup" runat="server" PopupControlID="dvCommonPopup" TargetControlID="lblCommonPopup"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvCommonPopup" style="display: none; width: 80%; height: 40%; position: absolute; margin-top: -110px;">
        <div id="Div4" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -25px;">
            <asp:ImageButton ID="imgCommonPopup" runat="server" Width="50px" Height="50px" ImageUrl="~/Images/close.png"
                OnClick="imgCommonPopup_Click" />
        </div>
        <div>
            <asp:Panel ID="pnlAccountDetails" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <div>
                            <asp:Panel ID="pnlDueDetails" GroupingText="Repayment Details" CssClass="stylePanel" runat="server" Visible="false">
                                <div id="divDueDetails" runat="server" class="gird">
                                    <asp:GridView ID="grvDueDetails" runat="server" HeaderStyle-CssClass="styleGridHeader" class="gird_details"
                                        RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Repayment Mode">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRepaymentMode" ToolTip="Repayment Mode" Text='<%#Eval("Repayment_Mode")%>' Width="120px" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="No Of Inst OD">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNoOfInstOD" Text='<%#Eval("Inst_OD")%>' Width="80px" ToolTip="No Of Installment OD" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="OD Age In Days">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblODAgeInDays" Text='<%#Eval("AgeInDays")%>' Width="80px" ToolTip="OD Age in Days" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EMI">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEMI" Text='<%#Eval("EMI")%>' Width="80px" ToolTip="EMI" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="NPA Slab">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNPASlab" Text='<%#Eval("NPA_Slab")%>' Width="80px" ToolTip="NPA Slab" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ROP Case Filing Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblROPCaseStatus" Text='<%#Eval("ROP_Case_Status")%>' Width="120px" ToolTip="ROP Case Filing Status" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Cheque Presentation Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblChequeDate" Text='<%#Eval("Cheque_Date")%>' Width="80px" ToolTip="Cheque Presentation Date" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="NTD">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNTD" Text='<%#Eval("NTD")%>' Width="80px" ToolTip="Not To Deposit" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PNTD">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPNTD" Text='<%#Eval("PNTD")%>' Width="80px" ToolTip="Permanently Not To Deposit" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Credit Overdue">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCreditOverdue" Text='<%#Eval("Credit_Overdue")%>' Width="80px" ToolTip="Credit Overdue" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnInvoicePopup" onserverclick="btnInvoiceOk_Click" runat="server" visible="false"
                                    type="button" accesskey="O" causesvalidation="false" title="Ok[Alt+O]">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>O</u>k
                                </button>
                                <button class="css_btn_enabled" id="btnInvoiceCancel" onserverclick="btnInvoiceCancel_Click" runat="server"
                                    type="button" accesskey="H" causesvalidation="false" title="Hide[Alt+H]">
                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>H</u>ide
                                </button>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>

    <script language="javascript" type="text/javascript">

        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcDcFollowup_tbDCDiary_btnLoadCust').click();
        }

        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcDcFollowup_tbDCDiary_btnLoadAccount').click();
        }

        function fnLoadRemarksAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcDcFollowup_tpRemarksEntry_btnRemarksEntryAccNo').click();
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

        function fnTrashDCFlwUPAccountSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtFlwUPAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtFlwUPAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtFlwUPAccountNoDummy.ClientID %>').value = "";
                }
            }
        }

        function fnTrashRemarksAccountSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtRemarksEntryAccnoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtRemarksEntryAccnoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtRemarksEntryAccnoDummy.ClientID %>').value = "";
                }
            }
        }

        //Tab index code startsp 

        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {
            // debugger;

            tab = $find('ctl00_ContentPlaceHolder1_tcDcFollowup');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')


            var querymode = location.search.split("qsMode=");
            if (querymode.length > 1) {
                if (querymode[1].length > 1) {
                    querymode = querymode[1].split("&");
                    querymode = querymode[0];
                }
                else {
                    querymode = querymode[1];
                }
                //  debugger;
                if (querymode == 'C') {
                    PageLoadTabContSetFocus();
                }
                if (querymode != 'Q' && tab != null) {
                   <%-- tab.add_activeTabChanged(on_Change);
                    var newindex = tab.get_activeTabIndex(index);
                    btnActive_index = newindex;
                    var btnSave = document.getElementById('<%=btnSave.ClientID %>')--%>

                    //  debugger;
                    if (btnSave != null) {
                        if (newindex > 0) {
                            btnSave.removeAttribute("disabled");
                            btnSave.setAttribute("class", "css_btn_enabled");
                        }
                        else {
                            btnSave.setAttribute("disabled", "disabled");
                            btnSave.setAttribute("class", "css_btn_disabled");
                        }
                    }
                }
            }
            else {
                PageLoadTabContSetFocus();
            }
        }

        function on_Change(sender, e) {
            debugger;
            var TC = $find("<%=tcDcFollowup.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() != 0) {
                fnMoveNextTab('Tab');
            }
            var newindex = tab.get_activeTabIndex(index);
            var btnSave = document.getElementById('<%=btnSave.ClientID %>');
            var btnPdf = document.getElementById('<%=btnPdf.ClientID %>')

            if (newindex > 0) {

                if (btnSave != null)
                    btnSave.style.visibility = "visible";

                if (btnPdf != null)
                    btnPdf.style.visibility = "visible";

            }
            else {
                if (btnSave != null)
                    btnSave.style.visibility = "hidden";

                if (btnPdf != null)
                    btnPdf.style.visibility = "hidden";
            }

            if (newindex > index) {
                //if (!fnCheckPageValidators(strValgrp, false)) {
                //    tab.set_activeTabIndex(index);
                //    return;
                //}
            }

        }


        function fnMoveNextTab(Source_Invoker) {
            // debugger;
            tab = $find('ctl00_ContentPlaceHolder1_tcDcFollowup');


            var strValgrp = tab._tabs[index]._tab.outerText.trim();
       <%--var Valgrp = document.getElementById('<%=vsCompanyAdd.ClientID %>')--%>
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            var btnPdf = document.getElementById('<%=btnPdf.ClientID %>')

            //btnSave.disabled=true;

            strValgrp = "";


            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;

            }
            else if (Source_Invoker == 'btnPrevTab') {
                newindex = btnActive_index - 1;
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }
            if (newindex > index) {
                if (!fnCheckPageValidators(strValgrp, false)) {
                    tab.set_activeTabIndex(index);
                }
                else {

                    switch (index) {

                        case 0:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;

                            if (btnSave != null)
                                btnSave.style.visibility = "hidden";

                            if (btnPdf != null)
                                btnPdf.style.visibility = "hidden";

                            break;
                        case 1:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;

                            if (btnSave != null)
                                btnSave.style.visibility = "visible";

                            if (btnPdf != null)
                                btnPdf.style.visibility = "visible";

                            break;
                    }
                }
            }
            else {
                tab.set_activeTabIndex(newindex);
                //index = tab.get_activeTabIndex(newindex);
                //Focus Start
                var TC = $find("<%=tcDcFollowup.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=ddlLOB.ClientID %>").focus();

                }
                if (TC.get_activeTab().get_tabIndex() == 1) {
                    $get("<%=ddlRemarksAction.ClientID %>").focus();
                }

                //Focus End
            }
        }

        function PageLoadTabContSetFocus() {
            // debugger;
            var TC = $find("<%=tcDcFollowup.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlLOB.ClientID %>").focus();
            }
        }
        //Tab index code end

        function fnTrashSuggest(e) {

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

