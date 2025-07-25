<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GLoanAdminAccountAssignment_Add, App_Web_iryvojbu" title="S3G - Account Assignment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<%--<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="LOV" TagPrefix="uc1" %>
<%@ Register Src="../UserControls/CommonAutoSuggestion.ascx" TagName="CommonAutoSuggestion"
    TagPrefix="uc2" %>--%>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="upAc_Assignment" UpdateMode="Always" runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                function fnLoadCustomer() {
                    document.getElementById('<%=btnLoadCustomer.ClientID%>').click();
                }
                function fnLoadCustomerg() {
                    document.getElementById('ctl00_ContentPlaceHolder1_gvGuarantorsDetails_ctl03_ucCustomerLov').click();
                }

                function fnLoadCust() {
                    document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
                }

                function fnLoadAccount() {
                    document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
                }
            </script>
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
                        <asp:Panel ID="pnlAccountAssignmentAssignor" Width="99%" runat="server" Style="margin-left: 4px;"
                            GroupingText="Account Assignee Details" CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddllob" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddllob_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvLineofBusiness" CssClass="validation_msg_box_sapn"
                                                SetFocusOnError="true" runat="server" ControlToValidate="ddllob" InitialValue="0"
                                                ErrorMessage="Select the Line Of Business" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleDisplayLabel" ToolTip="Line of Business"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" runat="server" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvBranchCode" runat="server" ControlToValidate="ddlBranch" Display="Dynamic" ErrorMessage="Select a To Location"
                                                InitialValue="0" SetFocusOnError="True" ValidationGroup="btnSave" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblBranch" runat="server" Text="Branch" CssClass="styleDisplayLabel" ToolTip="Branch"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                            strLOV_Code="ACC_ACCA" ServiceMethod="GetAccuntNoList" />
                                        <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                            Style="display: none" />
                                        <asp:HiddenField ID="hdnPasa_Detail_ID" runat="server" />
                                        <asp:HiddenField ID="hdnPANum_Customer_ID" runat="server" />
                                        <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblAccountNumber" runat="server" Text="Account Number" CssClass="styleDisplayLabel" ToolTip="Account Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtFinanceAmount" runat="server" ToolTip="Finance Amount" ContentEditable="false"
                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true">                                             
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblFinanceAmount" runat="server" Text="Finance Amount" CssClass="styleDisplayLabel" ToolTip="Finance Amount"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInstallmentStartDate" runat="server" ToolTip="Installment Start Date"
                                            ContentEditable="false" class="md-form-control form-control login_form_content_input requires_true">                                             
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInstallmentStartDate" runat="server" Text="Installment Start Date" CssClass="styleDisplayLabel" ToolTip="Installment Start Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAssignorName_Code" runat="server" ToolTip="Assignee Code and Name"
                                            ContentEditable="false" class="md-form-control form-control login_form_content_input requires_true">                                             
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblAssignorName_Code" runat="server" Text="Assignee Code / Name" CssClass="styleDisplayLabel" ToolTip="Assignee Code / Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnViewAccountDetails" onserverclick="btnViewAccountDetails_Click" runat="server"
                                    type="button" accesskey="V" title="View Account,Alt+V" enabled="false">
                                    <i class="fa fa-street-view" aria-hidden="true"></i>&emsp;<u>V</u>iew Account
                                </button>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlAccountAssignmentAssignee" Width="99%" runat="server" Style="margin-left: 4px;"
                            GroupingText="Account Assignor Details" CssClass="stylePanel">
                            <div class="row">
                                <asp:Panel ID="disp" runat="server" Height="300px" ScrollBars="Vertical" Style="display: none" ToolTip="Assignor Code / Name" />
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" 
                                            runat="server" AutoPostBack="true" DispalyContent="Both"
                                            strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                        <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" 
                                            CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                            Style="display: none" />
                                        <asp:HiddenField ID="hdnCustId" runat="server" />
                                        <asp:TextBox ID="txtCustomerCode" runat="server" ReadOnly="True" Visible="False"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:TextBox ID="txtCustomerID" runat="server" ReadOnly="True" Visible="False"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblCustomerCode" runat="server" Text="Assignor Code / Name" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAcAssignmentNumber" ToolTip="Assignment Number" ReadOnly="true"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblAcAssignmentNumber" runat="server" Text="Assignment Number" CssClass="styleDisplayLabel" ToolTip="Assignment Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAssignmentCharges" runat="server" ToolTip="Assignment Charges"
                                            onkeypress="fnAllowNumbersOnly(true,false,this)" Style="text-align: right;"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvAssignmentChrg" runat="server" Display="Dynamic"
                                                ValidationGroup="btnSave" ErrorMessage="Enter the Assignment Charges" ControlToValidate="txtAssignmentCharges"
                                                SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblAssignmentCharges" runat="server" Text="Assignment Charges" CssClass="styleDisplayLabel" ToolTip="Assignment Charges"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAssignmentDate" runat="server" ToolTip="Assignment Date" AutoPostBack="true"
                                            OnTextChanged="txtAssignmentDate_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgAssignmentDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                            TargetControlID="txtAssignmentDate" PopupButtonID="imgAssignmentDate" ID="calExeAssignmentDate"
                                            Enabled="True">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvAssignmentDate" runat="server" ControlToValidate="txtAssignmentDate"
                                                ErrorMessage="Select the Assignment Date" ValidationGroup="btnSave" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblAssignmentDate" runat="server" Text="Assignment Date" CssClass="styleDisplayLabel" ToolTip="Assignment Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtRemarks" runat="server" ToolTip="Remarks" MaxLength="100" TextMode="MultiLine"
                                            Rows="2" onkeypress="maxlengthfortxt(100)" onchange="maxlengthfortxt(100)"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblRemarks" runat="server" Text="Remarks" CssClass="styleDisplayLabel" ToolTip="Remarks"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtNewAccountNumber" ToolTip="Assignment Account Number" ReadOnly="true"
                                            runat="server"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblNewAccountNumber" runat="server" Text="Assignment Account Number" CssClass="styleDisplayLabel" ToolTip="Assignment Account Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel runat="server" ID="pnlAssignorGuarantorDetails" CssClass="stylePanel"
                                        GroupingText="Additional Guarantor Details">
                                        <div id="div18" style="overflow: auto; width: auto;" runat="server">
                                            <asp:Label ID="lblGuarantorDetails" runat="server" Text="No Contract details Available"
                                                Visible="False" />
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="gird">
                                                        <asp:GridView ID="gvGuarantorsDetails" runat="server" AutoGenerateColumns="False"
                                                            ShowFooter="True" Width="100%" OnRowDataBound="gvGuarantorsDetails_RowDataBound"
                                                            OnRowDeleting="gvGuarantorsDetails_RowDeleting" ToolTip="Additional Guarantor Details"
                                                            CssClass="gird_details">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Guarantor type" ItemStyle-Width="18%" FooterStyle-Width="18%">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblGuarantortype" runat="server" Text='<%# Bind("GuarantorType") %>'>
                                                                        </asp:Label>
                                                                        <asp:Label ID="lblGuarantorType_ID" runat="server" Text='<%# Bind("GuarantorType_ID") %>'
                                                                            Visible="false">
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                    <%----%>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlGuarantortype" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlGuarantortype_SelectedIndexChanged" CssClass="md-form-control form-control login_form_content_input">
                                                                            </asp:DropDownList>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlGuarantortype" runat="server" ControlToValidate="ddlGuarantortype"
                                                                                    CssClass="validation_msg_box_sapn" ValidationGroup="Guarantor" Display="Dynamic" InitialValue="0"
                                                                                    SetFocusOnError="True" ErrorMessage="Select a Guarantor type"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Guarantor Name" ItemStyle-Width="50%" FooterStyle-Width="50%">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblGuarantor_Name" runat="server" Text='<%# Bind("Guarantor_Name") %>'>
                                                                        </asp:Label>
                                                                        <asp:Label ID="lblGuarantor_ID" runat="server" Text='<%# Bind("Guarantor_ID") %>'
                                                                            Visible="false">
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <%-- <uc2:LOV ID="ucCustomerLov" runat="server" TextWidth="80%" DispalyContent="Both" onblur="fnLoadCustomerg()" />--%>
                                                                            <uc2:LOV ID="ucCustomerLov" runat="server" TextWidth="80%" strLOV_Code="CMD" strControlID="ctl00_ContentPlaceHolder1_div18_gvGuarantorsDetails_ctl03_ucCustomerLov" />
                                                                            <asp:TextBox ID="txtGuarCode" runat="server" ReadOnly="True" Visible="False"
                                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <asp:TextBox ID="txtGuarID" runat="server" ReadOnly="True" Visible="False"
                                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <asp:HiddenField ID="hdnGuarId" runat="server" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Guarantee Amount" ItemStyle-Width="15%" FooterStyle-Width="15%"
                                                                    ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtGuarantee_Amount" runat="server" Text='<%# Bind("Guarantee_Amount") %>'
                                                                            Style="text-align: right;" ContentEditable="false" Width="95%"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtGuaranteeamount" runat="server" Style="text-align: right"
                                                                                MaxLength="10" class="md-form-control form-control login_form_content_input requires_true">
                                                                            </asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="ftxtGuarateeAmount" runat="server" TargetControlID="txtGuaranteeamount"
                                                                                FilterType="Numbers" Enabled="True">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvGuaranteeamount" runat="server" ControlToValidate="txtGuaranteeamount"
                                                                                    CssClass="validation_msg_box_sapn" ValidationGroup="Guarantor" Display="Dynamic" SetFocusOnError="True"
                                                                                    ErrorMessage="Enter the Guarantee Amount"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Charge Sequence" ItemStyle-Width="18%" FooterStyle-Width="18%">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblGuaranteeSequence" runat="server" Text='<%# Bind("GuaranteeSequence") %>'>
                                                                        </asp:Label>
                                                                        <asp:Label ID="lblGuaranteeSequence_ID" runat="server" Text='<%# Bind("GuaranteeSequence_ID") %>'
                                                                            Visible="false">
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlChargesequence" runat="server"
                                                                                CssClass="md-form-control form-control login_form_content_input">
                                                                            </asp:DropDownList>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlChargesequence" runat="server" ControlToValidate="ddlChargesequence"
                                                                                    CssClass="validation_msg_box_sapn" ValidationGroup="Guarantor" Display="Dynamic" InitialValue="0"
                                                                                    SetFocusOnError="True" ErrorMessage="Select a Charge Sequence"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lbtnViewCustomer" CausesValidation="false" runat="server" CommandName="Edit"
                                                                            Text="View" Visible="false"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnRemove" CausesValidation="false" runat="server" CommandName="Delete"
                                                                            Text="Remove"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Button ID="btnAddGuarantor" runat="server" CausesValidation="false" Text="Add" AccessKey="T" ToolTip="Add,Alt+T"
                                                                            ValidationGroup="Guarantor" CssClass="grid_btn" OnClick="btnAddGuarantor_Click"></asp:Button>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())"
                        causesvalidation="false" validationgroup="btnSave" runat="server" onserverclick="btnSave_Click"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        causesvalidation="false" runat="server"
                        onserverclick="btnClear_Click"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                        causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                    <button class="css_btn_enabled" id="btnAssignmentRevoke" onserverclick="btnAssignmentRevoke_Click"
                        causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                        type="button" accesskey="R" title="Revoke[Alt+R]" visible="false">
                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>R</u>evoke
                    </button>
                    <button id="btnPrint" runat="server" accesskey="P"
                        class="css_btn_enabled" type="button" onserverclick="btnPrint_Click" title="Print [Alt+P]"
                        causesvalidation="false">
                        <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;<u>P</u>rint
                    </button>
                    <asp:Button ID="btnLoadCustomer" runat="server" Style="display: none" Text="Load Customer"
                        OnClick="btnLoadCustomer_OnClick" CausesValidation="false" />
                    <asp:HiddenField ID="hdnCustomerId" runat="server" />
                    <input type="hidden" id="HdnCus" runat="server" />
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsAssignment" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ValidationGroup="btnSave" />
                        <asp:CustomValidator ID="cvAssignment" runat="server" ValidationGroup="btnSave" Display="None">
                        </asp:CustomValidator>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>






