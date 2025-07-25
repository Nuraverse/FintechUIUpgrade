<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="false" inherits="LoanAdmin_S3GLoanAdFactoringInvoiceLoading, App_Web_4eeqi0qu" title="Factoring Invoice Loading" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register TagPrefix="uc3" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
      

        function funNextFoucs() {
            alert('hi');
            //document.getElementById('ctl00_ContentPlaceHolder1_ddlPAN_txtItemName').click();
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
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }

        function funReplaceAlpahNumericInly(Invocie, InvocieId, Invoice_DeDupeId) {
            var InvocieNo = document.getElementById(InvocieId).value;
            document.getElementById(Invoice_DeDupeId).value = InvocieNo.replace(/[&\/\\#,+()$~%.'":*?<>{}]/g, '_');
        }

        function fnLoadCustomer() {
            ////debugger;
            document.getElementById("<%= btnLoadCustomer.ClientID %>").click();

       }

    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <script src="../Content/Scripts/UserScript.js"></script>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlFactoringDetails" runat="server" CssClass="stylePanel" GroupingText="Factoring Invoice Details"
                            Width="99%">
                            <div>
                                <div class="row">

                                    <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" class="md-form-control form-control" runat="server" ToolTip="Line of Business"
                                                TabIndex="-1">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>


                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="padding: 0px !important; padding-right: 5px !important">
                                                        <asp:TextBox ID="txtCustomerCodeLease" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                            Style="display: none;" MaxLength="50"></asp:TextBox>
                                                        <UC6:icm id="ucCustomerCodeLov" tooltip="Customer Name" onblur="fnLoadCustomer()" hovermenuextenderleft="true" runat="server" showhideaddressimagebutton="true" autopostback="true" dispalycontent="Both"
                                                            strlov_code="CUS_CLIENTFACAPR" servicemethod="GetCustomerList" onitem_selected="ucCustomerCodeLov_Item_Selected" />
                                                        <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_Click"
                                                            Style="display: none" />
                                                    </td>
                                                </tr>
                                            </table>

                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvcmbCustomer" runat="server" ControlToValidate="txtCustomerCodeLease"
                                                    ErrorMessage="Select a Customer Code" ValidationGroup="Main Page" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvCustomer" runat="server" ControlToValidate="txtCustomerCodeLease"
                                                    ErrorMessage="Select a Customer Code" ValidationGroup="tcAsset" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Client Name" ID="lblCustomerNameSelect" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>


                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="divAccountno" runat="server">
                                        <div class="md-input">
                                            <%--<uc:Suggest ID="ucAccountLov" runat="server" ServiceMethod="GetAccuntNoList" AutoPostBack="true" />--%>
                                            <asp:TextBox ID="txtAccountNoDummy" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                Style="display: none;" MaxLength="100"></asp:TextBox>
                                            <UC6:ICM ID="ddlPAN" onblur="fnLoadAccount()" ButtonVisible="false" runat="server" ToolTip="Account No" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ddlPAN_SelectedIndexChanged"
                                                strLOV_Code="ACC_INVOICELOAD_CR" ServiceMethod="GetPANUM" class="md-form-control form-control login_form_content_input requires_true" />
                                            <asp:Button ID="btnLoadAccount" runat="server" Text="Load Account" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                Style="display: none" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblAccountNo" Text="Account No"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBranch" Enabled="false" runat="server" ToolTip="Branch" OnSelectedIndexChanged="ddlBranch_Item_Selected"
                                                class="md-form-control form-control" DropDownStyle="DropDown"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                AutoPostBack="True">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ErrorMessage="Select the Branch"
                                                    SetFocusOnError="true" ControlToValidate="ddlBranch" CssClass="validation_msg_box_sapn" InitialValue="0" ValidationGroup="VGFIL"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblLocation" runat="server" ToolTip="Branch" Text="Branch" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <%-- <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc2:Suggest ID="ddlPAN" runat="server" ToolTip="Account number" ServiceMethod="GetPANUM" AutoPostBack="true"
                                                OnItem_Selected="ddlPAN_SelectedIndexChanged" ValidationGroup="VGFIL" IsMandatory="true"
                                                ErrorMessage="Enter a Account number" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Account number" ID="lblprimeaccno" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>--%>




                                    <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDayOpen" TabIndex="-1" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" runat="server" AutoPostBack="True"
                                                ToolTip="Day Open">
                                            </asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Day Open" ID="lblDayOpen" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlSAN" Width="180px" runat="server" AutoPostBack="True" class="md-form-control form-control" OnSelectedIndexChanged="ddlSAN_SelectedIndexChanged" Visible="false"
                                                ToolTip="Sub Account Number">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVSLA" CssClass="validation_msg_box_sapn" runat="server"
                                                    Enabled="false" ControlToValidate="ddlSAN" InitialValue="0" ValidationGroup="VGFIL"
                                                    ErrorMessage="Select a Sub Account Number" Display="Dynamic">
                                    
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVSLA1" CssClass="validation_msg_box_sapn" runat="server"
                                                    Enabled="false" ControlToValidate="ddlSAN" InitialValue="0" ValidationGroup="VGFILAdd"
                                                    ErrorMessage="Select a Sub Account Number" Display="Dynamic">
                                    
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Sub Account Number" ID="lblsubAccno" CssClass="styleDisplayLabel" Visible="false"></asp:Label>
                                            </label>
                                        </div>
                                    </div>


                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">

                                            <asp:TextBox runat="server" ID="txtFILNo" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="True" TabIndex="-1"
                                                ToolTip="FIL Number"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="FIL Number" ID="lblFILNo" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>



                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtFILDate" class="md-form-control form-control login_form_content_input requires_true" ToolTip="FIL Date"></asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="validation_msg_box_sapn"
                                                    runat="server" ValidationGroup="VGFILAdd" ControlToValidate="txtFILDate" Display="Dynamic"
                                                    ErrorMessage="Select Factoring Invoice Loading Date"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="validation_msg_box_sapn"
                                                    runat="server" ValidationGroup="VGFIL" ControlToValidate="txtFILDate" Display="Dynamic"
                                                    ErrorMessage="Select Factoring Invoice Loading Date"></asp:RequiredFieldValidator>
                                            </div>
                                            <cc1:CalendarExtender ID="CECFILDATE" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                TargetControlID="txtFILDate" Format="dd/MM/yyyy">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="FIL Date" ID="lblFILDate" CssClass="styleReqFieldLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtStatus" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="True" TabIndex="-1"
                                                ToolTip="Status"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Status" ID="lblStatus" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtMargin" Text="0" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="True" Style="text-align: right"
                                                TabIndex="-1" ToolTip="Margin %" OnTextChanged="txtMargin_TextChanged" AutoPostBack="true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Margin %" ID="lblMargin" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>



                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtCreditLimit" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="True" Style="text-align: right"
                                                TabIndex="-1" ToolTip="Pre Payment Limit"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Pre Payment Limit" ID="lblCreditLimit" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtDp" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"
                                                TabIndex="-1" ToolTip="Drawing Power" ReadOnly="true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Drawing Power" ID="lblDrawingPower" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtOutStandingAmount" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"
                                                TabIndex="-1" ToolTip="Funds in Use" ReadOnly="true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Funds in Use" ID="lblOutStandAmount" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtCreditAvailable" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                TabIndex="-1" Style="text-align: right" ToolTip="Funds Available"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Funds Available" ID="lblCreditAvailable" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtInvoiceLoadValue" AutoPostBack="true" OnTextChanged="txtInvoiceLoadValue_TextChanged" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"
                                                onkeypress="fnAllowNumbersOnly(true,false,this)" MaxLength="13" ToolTip="Minimum Invoice Value"></asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="validation_msg_box_sapn"
                                                    runat="server" ValidationGroup="VGFILAdd" ControlToValidate="txtInvoiceLoadValue"
                                                    Display="Dynamic" ErrorMessage="Enter the Minimum Invoice Value "></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="validation_msg_box_sapn"
                                                    runat="server" ValidationGroup="VGFIL" ControlToValidate="txtInvoiceLoadValue"
                                                    Display="Dynamic" ErrorMessage="Enter the Minimum Invoice Value "></asp:RequiredFieldValidator>
                                            </div>
                                            <cc1:FilteredTextBoxExtender ID="fteAmount1" runat="server" TargetControlID="txtInvoiceLoadValue"
                                                FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Minimum Invoice Value" ID="lblInvoiceloadvalue" CssClass="styleReqFieldLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtNoOfinvoice" autocomplete="off" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"
                                                MaxLength="6" ToolTip="No of Invoice"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="flttxtNoOfinvoice" runat="server" TargetControlID="txtNoOfinvoice"
                                                FilterType="Numbers" Enabled="True">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>

                                            <%--  <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvTotalNoofInvoice" CssClass="validation_msg_box_sapn"
                                                    runat="server" ValidationGroup="VGFIL" ControlToValidate="txtNoOfinvoice"
                                                    Display="Dynamic" ErrorMessage="Enter the No of Invoice "></asp:RequiredFieldValidator>
                                            </div>--%>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvnoofInvoice" runat="server" CssClass="validation_msg_box_sapn" ControlToValidate="txtNoOfinvoice" Display="Dynamic" ErrorMessage="Enter the No of Invoice" ValidationGroup="VGFILAdd"></asp:RequiredFieldValidator>
                                            </div>
                                            <label>
                                                <asp:Label runat="server" Text="No of Invoice" ID="lblNoofInvoice" CssClass="styleReqFieldLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtPurchaseValue" autocomplete="off" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"
                                                onkeypress="fnAllowNumbersOnly(true,false,this)" MaxLength="13" ToolTip="Purchase Value"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="flttxtPurchaseValue" runat="server" TargetControlID="txtPurchaseValue"
                                                FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Purchase Value" ID="lblPurchaseValue" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvPurchaseValue" runat="server" CssClass="validation_msg_box_sapn" ControlToValidate="txtPurchaseValue" Display="Dynamic" Enabled="false" ErrorMessage="Enter the Purchase Value" ValidationGroup="VGFILAdd"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCreditDays" runat="server" MaxLength="3" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"
                                                ToolTip="Credit Days" OnTextChanged="txtCreditDays_TextChanged" AutoPostBack="true"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FTECreditDays" runat="server" TargetControlID="txtCreditDays"
                                                FilterType="Numbers" Enabled="true">
                                            </cc1:FilteredTextBoxExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtCreditDays" CssClass="validation_msg_box_sapn"
                                                    runat="server" ValidationGroup="VGFIL" ControlToValidate="txtCreditDays" Display="Dynamic"
                                                    ErrorMessage="Enter the Credit Days"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblCreditDays" runat="server" CssClass="styleDisplayLabel" Text="Credit Days"> </asp:Label>
                                            </label>
                                        </div>
                                    </div>




                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLoadType" runat="server" AutoPostBack="true" ToolTip="Invoice Load Type" class="md-form-control form-control" OnSelectedIndexChanged="ddlLoadType_SelectedIndexChanged">
                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Data Entry" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Excel Upload" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLoadType" runat="server" CssClass="validation_msg_box_sapn" ControlToValidate="ddlLoadType" InitialValue="0" Display="Dynamic" ErrorMessage="Select Invoice Load Type" ValidationGroup="VGFIL"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLoadType1" runat="server" CssClass="validation_msg_box_sapn" ControlToValidate="ddlLoadType" InitialValue="0" Display="Dynamic" ErrorMessage="Select Invoice Load Type" ValidationGroup="VGFILAdd"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblLoadingType" runat="server" CssClass="styleReqFieldLabel" Text="Invoice Load Type"> </asp:Label>
                                            </label>
                                        </div>
                                    </div>


                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:FileUpload ID="FileUpld" runat="server" Width="100%" />
                                            <%--<asp:RequiredFieldValidator ID="rfvFileUpload" runat="server" ControlToValidate="FileUpld" ErrorMessage="Select Template"
                                                        CssClass="validation_msg_box_sapn" SetFocusOnError="True" Display="Dynamic" Enabled="false"
                                                        ValidationGroup="VGFIL"></asp:RequiredFieldValidator>--%>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FileUpld" ErrorMessage="Select Template"
                                                    CssClass="validation_msg_box_sapn" SetFocusOnError="True" Display="Dynamic" Enabled="false"
                                                    ValidationGroup="VGFILAdd"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCustonerName" ReadOnly="true" runat="server" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: left"
                                                ToolTip="Client"></asp:TextBox>
                                            <input id="hdnCustID" type="hidden" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblCustomerName" runat="server" Text="Client" CssClass="styleDisplayLabel"></asp:Label>
                                                <asp:HiddenField ID="hidcuscode" runat="server" />
                                            </label>
                                        </div>
                                    </div>



                                    <div id="divtxtTotalInvoiceLoadValue" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtTotalInvoiceLoadValue" ReadOnly="true" runat="server" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"
                                                ToolTip="Invoice Load Value"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblTotalInvoiceValue" runat="server" CssClass="styleReqFieldLabel" Text="Invoice Load Value"> </asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">


                                            <asp:RadioButtonList ID="rbtlBillType" class="md-form-control form-control radio" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="0" Selected="True" Text="Customer "></asp:ListItem>

                                            </asp:RadioButtonList>



                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">

                                            <asp:TextBox ID="txtGeneralRemarks" TextMode="MultiLine" ToolTip="Remarks" onkeyup="maxlengthfortxt(4000);" runat="server"
                                                AutoPostBack="false" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblGeneralRemarks" runat="server" Text="Remarks" ToolTip="Remarks" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <button class="css_btn_enabled" id="btnViewClientBalance" title="Go[Alt+Y]" causesvalidation="false" onserverclick="btnViewClientBalance_ServerClick" runat="server"
                                                type="button" accesskey="Y">
                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u></u>Client Balance
                                            </button>
                                        </div>
                                    </div>



                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <button class="css_btn_enabled" id="btnGo" title="Go[Alt+G]" onclick="if(fnCheckPageValidators('VGFILAdd',false))" causesvalidation="false" onserverclick="btnGo_Click" runat="server"
                                                type="button" accesskey="G">
                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                            </button>
                                            <button class="css_btn_enabled" id="btnPreviousInvoices" title="Previous Invoice[Alt+P]" causesvalidation="false" onserverclick="btnPreviousInvoices_Click" runat="server"
                                                type="button" accesskey="P">
                                                <i class="fa fa fa-hand-o-right" aria-hidden="true"></i>&emsp;View <u>P</u>revious Invoice
                                            </button>
                                            <button class="css_btn_enabled" id="lnkView" title="Valid Records[Alt+J]" causesvalidation="false" onserverclick="lnkView_Click" runat="server"
                                                type="button" accesskey="J">
                                                <i class="fa fa fa-hand-o-right" aria-hidden="true"></i>&emsp;View <u>V</u>alid Records
                                            </button>
                                            <asp:ImageButton ID="imgUploadedExcel" AccessKey="U" ToolTip="Valid File,Alt+U" runat="server" ImageUrl="~/Images/ExcelExport10.png" OnClick="imgUploadedExcel_Click" />
                                            <asp:ImageButton ID="imgErrorFileExcel" runat="server" AccessKey="E" ToolTip="Error Log File,Alt+E" ImageUrl="~/Images/ExcelError.png" OnClick="imgErrorFileExcel_Click" />
                                            <%--<asp:Button ID="btnPreviousInvoices" AccessKey="V" ToolTip="View,Alt+V" runat="server" Text="View Previous Invoice" CssClass="css_btn_enabled" Style="cursor: hand;" OnClick="btnPreviousInvoices_Click" />--%>
                                            <%--<asp:Button ID="lnkView" runat="server" CssClass="css_btn_enabled" Text="View Valid Records" OnClick="lnkView_Click"></asp:Button>--%>



                                            <%--  <div id="trUploadedFile" class="row" runat="server">--%>
                                            <%--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>

                                            <%--</div>--%>
                                            <%-- </div>--%>
                                            <%--  <div id="trDownloadFile" class="row" runat="server">--%>
                                            <%--  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>

                                            <%-- </div>--%>
                                            <%-- </div>--%>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div id="divFormatHelpBase" runat="server" class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <cc1:CollapsiblePanelExtender ID="cpeDemo" runat="Server" TargetControlID="pnlFormatDownLoad"
                            ExpandControlID="divFormatHelp" CollapseControlID="divFormatHelp" Collapsed="True"
                            TextLabelID="lblDetails" ImageControlID="imgDetails" ExpandedText="(Hide Details...)"
                            CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                            CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />
                        <asp:Panel ID="divFormatHelp" runat="server" CssClass="accordionHeader" Width="98.5%">
                            <div style="float: left;">
                                Format Help?
                            </div>
                            <div style="float: left; margin-left: 20px;">
                                <asp:Label ID="lblDetails" runat="server">(Show Details...)</asp:Label>
                            </div>
                            <div style="float: right; vertical-align: middle;">
                                <asp:ImageButton ID="imgDetails" runat="server" ImageUrl="~/Images/expand_blue.jpg"
                                    AlternateText="(Show Details...)" />
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlFormatDownLoad" runat="server" CssClass="stylePanel"
                            Width="99%">
                            <div style="margin-top: -10px" class="row">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <%--  <asp:TextBox ID="txtFilterCustomerSearch" onkeyup="maxlengthfortxt(20);" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            ToolTip="Filter" OnTextChanged="txtFilter_TextChanged" AutoPostBack="true"></asp:TextBox>--%>


                                        <uc2:Suggest ID="ddltxtFilterCustomerSearch" runat="server" ToolTip="Customer Filter" ServiceMethod="GetUploadCustomerFilter" AutoPostBack="false"
                                            IsMandatory="false"
                                            ErrorMessage="Enter a Account number" />

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblFilter" runat="server" CssClass="styleDisplayLabel" Text="Customer Filter"> </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div style="margin-top: 10px" class="md-input">

                                        <button class="css_btn_enabled" id="btnDownLoadFormat" title="Load Format[Alt+F]" causesvalidation="false" onserverclick="btnDownLoadFormat_Click" runat="server"
                                            type="button" accesskey="F">
                                            <i class="fa fa-check-square-o" aria-hidden="true"></i>&emsp;<u>L</u>oad Format
                                        </button>

                                        <button class="css_btn_enabled" id="btnExportFormat" title="Down Load[Alt+H]" causesvalidation="false" onserverclick="btnExportFormat_Click" runat="server"
                                            type="button" accesskey="H">
                                            <i class="fa fa fa-download" aria-hidden="true"></i>&emsp;<u>D</u>own Load 
                                        </button>

                                    </div>


                                </div>
                                <div class="gird">
                                    <asp:GridView runat="server" ID="grvDownLoadFileFormat" RowStyle-HorizontalAlign="Left" class="gird_details" AutoGenerateColumns="true" ShowFooter="false"
                                        Width="100%">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Exclude">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkExclude" runat="server" ToolTip="Exclude"></asp:CheckBox>
                                                </ItemTemplate>
                                                <ItemStyle Width="30px" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div style="display: none" class="gird">
                                    <asp:GridView runat="server" ID="grvDownLoadFileFormatExport" SkinID="0" RowStyle-HorizontalAlign="Left" AutoGenerateColumns="true" ShowFooter="false"
                                        Width="100%">
                                    </asp:GridView>
                                </div>
                        </asp:Panel>
                    </div>
                </div>
                <%--<div class="row">--%>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlInvDtl" runat="server" CssClass="stylePanel" GroupingText="Invoice Details"
                        Width="99%">

                        <div class="gird">
                            <asp:GridView runat="server" ID="GRVFIL" class="gird_details" AutoGenerateColumns="False" ShowFooter="true"
                                OnRowCommand="GRVFIL_RowCommand" Width="100%" OnRowUpdating="GRVFIL_RowUpdating" OnRowEditing="GRVFIL_RowEditing" DataKeyNames="SNo" OnRowCancelingEdit="GRVFIL_RowCancelingEdit" OnRowDataBound="GRVFIL_RowDataBound"
                                OnRowDeleting="GRVFIL_RowDeleting">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="30px" HeaderText="SI No.">
                                        <ItemTemplate>
                                            <asp:Label ID="txtsno" runat="server" Text='<%# Bind("SNo")%>' Width="30px" ToolTip="SI No."></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="txtsnoF" runat="server" Width="30px"></asp:Label>
                                        </FooterTemplate>
                                        <ItemStyle Width="30px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Invoice No" ItemStyle-Width="140px">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtInvoiceNo" Enabled="false" runat="server" MaxLength="35" class="md-form-control form-control login_form_content_input requires_true" Text='<%# Bind("InvoiceNO")%>'
                                                Rows="2" ToolTip="Invoice No"></asp:TextBox>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtInvoiceNoF" runat="server" MaxLength="35" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Invoice No"></asp:TextBox>
                                                <%--  <cc1:FilteredTextBoxExtender ID="flttxtInvoiceNoF" runat="server" FilterType="Custom" FilterMode="ValidChars" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
                                                    TargetControlID="txtInvoiceNoF">
                                                </cc1:FilteredTextBoxExtender>--%>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="grid_validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvInvoiceNo" runat="server" ErrorMessage="Enter the Invoice Number"
                                                        ValidationGroup="vgGridAdd" CssClass="validation_msg_box_sapn" ControlToValidate="txtInvoiceNoF"
                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtInvoiceNoE" runat="server" MaxLength="35" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Invoice No"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <%-- <cc1:FilteredTextBoxExtender ID="flttxtInvoiceNoE" runat="server" FilterType="Custom" FilterMode="ValidChars" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
                                                    TargetControlID="txtInvoiceNoE">
                                                </cc1:FilteredTextBoxExtender>--%>
                                                <div class="grid_validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvInvoiceNoE" runat="server" ErrorMessage="Enter the Invoice Number"
                                                        ValidationGroup="vgGridAdd" CssClass="validation_msg_box_sapn" ControlToValidate="txtInvoiceNoE"
                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </EditItemTemplate>
                                        <ItemStyle Width="140px" HorizontalAlign="Left" />
                                        <FooterStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Invoice No Dedupe" ItemStyle-Width="140px">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtInvoiceNoDedupe" Enabled="false" runat="server" MaxLength="35" class="md-form-control form-control login_form_content_input requires_true" Text='<%# Bind("Invoiceno_Dedupe")%>'
                                                Rows="2" ToolTip="Invoice No(Dedupe)"></asp:TextBox>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtInvoiceNoFDedupe" Enabled="false" runat="server" MaxLength="35" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Invoice No(Dedupe)"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="flttxtInvoiceNoFDedupe" runat="server" FilterType="Custom" FilterMode="ValidChars" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
                                                    TargetControlID="txtInvoiceNoFDedupe">
                                                </cc1:FilteredTextBoxExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="grid_validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvInvoiceNoDedupe" runat="server" ErrorMessage="Enter the Invoice Number(Dedupe)"
                                                        ValidationGroup="vgGridAdd" CssClass="validation_msg_box_sapn" ControlToValidate="txtInvoiceNoFDedupe"
                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtInvoiceNoEDedupe" Enabled="false" runat="server" MaxLength="35" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Invoice No(Dedupe)"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <cc1:FilteredTextBoxExtender ID="flttxtInvoiceNoEDedupe" runat="server" FilterType="Custom" FilterMode="ValidChars" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
                                                    TargetControlID="txtInvoiceNoEDedupe">
                                                </cc1:FilteredTextBoxExtender>
                                                <div class="grid_validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvInvoiceNoEDedupe" runat="server" ErrorMessage="Enter the Invoice Number"
                                                        ValidationGroup="vgGridAdd" CssClass="validation_msg_box_sapn" ControlToValidate="txtInvoiceNoEDedupe"
                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </EditItemTemplate>
                                        <ItemStyle Width="140px" HorizontalAlign="Left" />
                                        <FooterStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date" ItemStyle-Width="120px">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtInvoiceDate" Style="text-align: right" Enabled="false" runat="server" class="md-form-control form-control login_form_content_input requires_true" Text='<%# Bind("InvoiceDate")%>'
                                                ToolTip="Date"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                TargetControlID="txtInvoiceDate">
                                            </cc1:CalendarExtender>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtInvoiceDateF" runat="server" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Date"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="grid_validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="RFVInvoiceDateF" CssClass="validation_msg_box_sapn" runat="server"
                                                        ValidationGroup="vgGridAdd" ControlToValidate="txtInvoiceDateF" Display="Dynamic"
                                                        ErrorMessage="Select Invoice Date"></asp:RequiredFieldValidator>
                                                </div>
                                                <cc1:CalendarExtender ID="CalendarExtender1F" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                    TargetControlID="txtInvoiceDateF">
                                                </cc1:CalendarExtender>
                                            </div>
                                        </FooterTemplate>

                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtInvoiceDateE" runat="server" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Date"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="grid_validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="RFVInvoiceDateE" CssClass="validation_msg_box_sapn" runat="server"
                                                        ValidationGroup="vgGridAdd" ControlToValidate="txtInvoiceDateE" Display="Dynamic"
                                                        ErrorMessage="Select Invoice Date"></asp:RequiredFieldValidator>
                                                </div>
                                                <cc1:CalendarExtender ID="CalendarExtender1E" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                    TargetControlID="txtInvoiceDateE">
                                                </cc1:CalendarExtender>
                                            </div>


                                        </EditItemTemplate>
                                        <FooterStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Party_ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPartyID" runat="server" Text='<%# Bind("Party_ID")%>' Width="140px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>



                                    <asp:TemplateField HeaderText="Customer Name" ItemStyle-Width="140px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPartyName" runat="server" Text='<%# Bind("PartyName")%>' Width="170px"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <uc2:Suggest ID="ddlPartyNameE" runat="server" EnabledWatermarkText="true" RfvGridSuggestStyleType="1" ValidationGroup="vgGridAdd" ErrorMessage="Select the Party Name" ServiceMethod="GetPartyName" AutoPostBack="false"
                                                IsMandatory="true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                        </EditItemTemplate>



                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">

                                                <uc2:Suggest ID="ddlPartyName" EnabledWatermarkText="true" runat="server" RfvGridSuggestStyleType="1" ValidationGroup="vgGridAdd" ErrorMessage="Select the Party Name" ServiceMethod="GetPartyName" AutoPostBack="false"
                                                    IsMandatory="true" />
                                                <span class="highlight"></span>
                                                <span class="bar"></span>



                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle Width="140px" />
                                        <FooterStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Due Date" ItemStyle-Width="120px">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtMaturityDate" Style="text-align: right" runat="server" Text='<%# Bind("MaturityDate")%>'
                                                class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true" ToolTip="Maturity Date"></asp:TextBox>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtMaturityDateF" class="md-form-control form-control login_form_content_input requires_true" runat="server" ToolTip="Date"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>

                                        </FooterTemplate>

                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtMaturityDateE" Enabled="false" class="md-form-control form-control login_form_content_input requires_true" runat="server" ToolTip="Date"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>

                                        </EditItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                        <FooterStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Invoice Amount" ItemStyle-Width="90px">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtInvoiceAmount" runat="server" MaxLength="13" Text='<%# Bind("InvoiceAmount")%>'
                                                onkeypress="fnAllowNumbersOnly(true,false,this)" Style="text-align: right; border-color: White"
                                                class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true" ToolTip="Invoice Amount"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="fteAmount1" runat="server" TargetControlID="txtInvoiceAmount"
                                                FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                            </cc1:FilteredTextBoxExtender>
                                        </ItemTemplate>

                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtInvoiceAmountE" runat="server" autocomplete="off" MaxLength="13" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                    class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right" ToolTip="Invoice Amount"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="grid_validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvInvoiceAmountE" runat="server" ErrorMessage="Enter the Invoice Amount"
                                                        CssClass="validation_msg_box_sapn" ControlToValidate="txtInvoiceAmountE" Display="Dynamic"
                                                        ValidationGroup="vgGridAdd"></asp:RequiredFieldValidator>
                                                </div>
                                                <cc1:FilteredTextBoxExtender ID="fteAmountE" runat="server" TargetControlID="txtInvoiceAmountE"
                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </EditItemTemplate>

                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtInvoiceAmountF" runat="server" MaxLength="13" autocomplete="off" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                    class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right" ToolTip="Invoice Amount"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="grid_validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvInvoiceAmount" runat="server" ErrorMessage="Enter the Invoice Amount"
                                                        CssClass="validation_msg_box_sapn" ControlToValidate="txtInvoiceAmountF" Display="Dynamic"
                                                        ValidationGroup="vgGridAdd"></asp:RequiredFieldValidator>
                                                </div>
                                                <cc1:FilteredTextBoxExtender ID="fteAmount1" runat="server" TargetControlID="txtInvoiceAmountF"
                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle Width="90px" />
                                        <FooterStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField ItemStyle-Width="150px" HeaderText="Paid Amount">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtAmount" runat="server" Style="text-align: right; border-color: White"
                                                class="md-form-control form-control login_form_content_input requires_true" Text='<%# Bind("Amount")%>' ReadOnly="true" ToolTip="Paid Amount"></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Factoring_Inv_Load_Details_ID" HeaderStyle-Width="50px"
                                        Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblID" runat="server" Text='<%# Bind("Factoring_Inv_Load_Details_ID")%>'
                                                Visible="false" ToolTip="SI No."></asp:Label>
                                            <asp:Label ID="lblLock" runat="server" Text='<%# Bind("Lock")%>' Visible="false"
                                                ToolTip="SI No."></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PrePayment Allowed" HeaderStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chIsPrePaymentAlowed" Enabled="false" runat="server" />
                                            <asp:Label ID="lblIsPrePaymentAlowed" Visible="false" runat="server" Text='<%# Bind("Is_Prepayment_Allowed_Id")%>'></asp:Label>
                                        </ItemTemplate>

                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:CheckBox ID="chIsPrePaymentAlowedE" runat="server" />
                                            </div>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:CheckBox ID="chIsPrePaymentAlowedF" Checked="true" runat="server"></asp:CheckBox>
                                            </div>
                                        </FooterTemplate>

                                        <ItemStyle HorizontalAlign="Center" />
                                        <ControlStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action" HeaderStyle-Width="50px">
                                        <ItemTemplate>
                                            <table width="50%">
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CssClass="grid_btn" CommandName="Edit" CausesValidation="false"
                                                            ToolTip="Edit">
                                                        </asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnRemove" OnClientClick="return confirm('Are you sure you want to delete this record?');" AccessKey="D" Text="Delete" CssClass="grid_btn_delete" CommandName="Delete" runat="server"
                                                            CausesValidation="false" ToolTip="Delete [Alt+D]" />
                                                    </td>
                                                </tr>
                                            </table>


                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <FooterTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btndummy" Visible="false" CausesValidation="false"
                                                            runat="server"></asp:Button>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnAddrow" CausesValidation="false" OnClientClick="return fnCheckPageValidators('vgGridAdd',false);"
                                                            runat="server" CommandName="AddNew" CssClass="grid_btn" Text="Add"
                                                            ValidationGroup="vgGridAdd" ToolTip="Add,Alt+A" AccessKey="A"></asp:Button>
                                                    </td>
                                                </tr>
                                            </table>
                                        </FooterTemplate>
                                        <EditItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>

                                                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CssClass="grid_btn" CommandName="Update"
                                                            ValidationGroup="Footer" ToolTip="Update"></asp:LinkButton>&nbsp;|
                                                   
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CssClass="grid_btn" CommandName="Cancel"
                                                            CausesValidation="false" ToolTip="Cancel"></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>

                                        </EditItemTemplate>



                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false" HeaderText="Check" HeaderStyle-Width="50px">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkinvchk" runat="server" OnCheckedChanged="chkinvchk_CheckedChanged" AutoPostBack="true" Enabled="false" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />

                                        <ControlStyle Width="50px" />
                                    </asp:TemplateField>

                                </Columns>
                                <HeaderStyle CssClass="styleGridHeader" />
                                <RowStyle HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                        <div align="right" class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Label runat="server" Text="Total Payable Amount" ID="lbltotal"
                                    CssClass="styleDisplayLabel" Style="padding-right: 5px"></asp:Label>
                                <asp:TextBox ID="txtTotalInvoiceAmt" Width="200px" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right; border: none"
                                    runat="server" Wrap="False" TabIndex="-1" ToolTip="Total Payable Amount">0</asp:TextBox>
                            </div>

                        </div>
                        <div align="right" class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Label runat="server" Text="Total Paid Amount" ID="lblTotalPaidAmount"
                                    CssClass="styleDisplayLabel" Style="padding-right: 5px"></asp:Label>
                                <asp:TextBox ID="txtTotalPaidAmount" Width="200px" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right; border: none"
                                    runat="server" Wrap="False" TabIndex="-1" ToolTip="Total Paid Amount">0</asp:TextBox>
                            </div>

                        </div>
                        <div style="display: none" align="right" class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Label runat="server" Text="Total Eligible Amount" ID="lblTotalEligibleAmount"
                                    CssClass="styleDisplayLabel" Style="padding-right: 5px"></asp:Label>
                                <asp:TextBox ID="txtTotalEligibleAmt" Width="200px" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right; border: none"
                                    runat="server" Wrap="False" TabIndex="-1" ToolTip="Total Eligible Amount">0</asp:TextBox>
                            </div>
                        </div>

                    </asp:Panel>
                    <div style="display: none" class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:CustomValidator ID="cvCustomerMaster" runat="server" CssClass="validation_msg_box_sapn"
                                Enabled="true" Width="98%" />
                        </div>
                    </div>





                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" GroupingText=""
                                Width="99%">
                                <div class="row">
                                    <div class="gird">
                                        <asp:GridView ID="grvInvalidRecords" class="gird_details" runat="server" AutoGenerateColumns="true">
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>




                    <div style="display: none" class="row">
                        <br />
                        <asp:CustomValidator ID="cvFactoring" runat="server" CssClass="validation_msg_box_sapn"
                            Enabled="true" Visible="false" Width="98%" ValidationGroup="VGFIL" />
                        <asp:ValidationSummary runat="server" ID="vsFactoringInvoiceLoadinf" HeaderText="Correct the following validation(s):"
                            CssClass="validation_msg_box_sapn" Width="98%" ShowMessageBox="false" ShowSummary="true"
                            ValidationGroup="VGFIL" />
                        <asp:ValidationSummary runat="server" ID="vsFactoringInvoiceLoadinfAdd" HeaderText="Correct the following validation(s):"
                            CssClass="validation_msg_box_sapn" Width="98%" ShowMessageBox="false" ShowSummary="true"
                            ValidationGroup="VGFILAdd" />
                        <asp:ValidationSummary runat="server" ID="ValidationSummary1" HeaderText="Correct the following validation(s):"
                            CssClass="validation_msg_box_sapn" Width="98%" ShowMessageBox="false" ShowSummary="true"
                            ValidationGroup="vgGridAdd" />
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="validation_msg_box_sapn"></asp:Label>
                    </div>
                </div>
                <%--</div>--%>
                <%-- <div class="row">--%>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlInvoiceChargeDetails" runat="server" CssClass="stylePanel" GroupingText="Invoice Charge Details"
                        Width="99%">
                        <div>
                            <div style="overflow-y: scroll" class="gird">

                                <asp:GridView runat="server" ID="grvInvoiceChargeDetails" class="gird_details" AutoGenerateColumns="False" ShowFooter="true"
                                    OnRowCommand="grvInvoiceChargeDetails_RowCommand" Width="100%" OnRowDataBound="grvInvoiceChargeDetails_RowDataBound"
                                    OnRowDeleting="grvInvoiceChargeDetails_RowDeleting">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="SI No.">
                                            <ItemTemplate>
                                                <asp:Label ID="txtsno" Visible="false" runat="server" Text='<%# Bind("SNo")%>' Width="30px" ToolTip="SI No."></asp:Label>
                                                <asp:Label ID="SerialNoHidden" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                            </ItemTemplate>

                                            <ItemStyle Width="30px" />
                                        </asp:TemplateField>
                                        <%-- <asp:TemplateField HeaderText="Invoice No" ItemStyle-Width="140px">
                                            <ItemTemplate>
                                                <asp:Label ID="txtInvoiceNo" runat="server" Text='<%# Bind("Invoice_No")%>'
                                                    ToolTip="Invoice No"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="140px" HorizontalAlign="Left" />
                                        </asp:TemplateField>--%>

                                        <asp:TemplateField HeaderText="Charge Description" ItemStyle-Width="140px">
                                            <ItemTemplate>
                                                <asp:Label ID="txtDescription" runat="server" Text='<%# Bind("Charge_Cashflow")%>'
                                                    ToolTip="Description"></asp:Label>

                                            </ItemTemplate>
                                            <ItemStyle Width="140px" HorizontalAlign="Left" />

                                            <FooterTemplate>
                                                <asp:Label ID="lblTotalCharge" runat="server" Text="Charge Total"
                                                    ToolTip="Description"></asp:Label>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Charge Amount" ItemStyle-Width="140px">
                                            <ItemTemplate>
                                                <div style="display: block; text-align: right;">
                                                    <asp:Label ID="txtChargeAmount" runat="server" Text='<%# Bind("Charge_Amount")%>'
                                                        ToolTip="Charge Amount"></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">

                                                    <asp:TextBox ID="txtChargeAmount" runat="server" Style="text-align: right; border-color: White"
                                                        class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true" ToolTip="Total Charge Amount"></asp:TextBox>
                                                </div>
                                            </FooterTemplate>

                                            <ItemStyle Width="140px" HorizontalAlign="Left" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Cashflow Rate" ItemStyle-Width="140px">
                                            <ItemTemplate>
                                                <div style="display: block; text-align: right;">
                                                    <asp:Label ID="txtCashflowRate" runat="server" Text='<%# Bind("Charge_Cashflow_Rate")%>'
                                                        ToolTip="Cashflow Rate"></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle Width="140px" HorizontalAlign="Left" />
                                        </asp:TemplateField>

                                    </Columns>
                                    <HeaderStyle CssClass="styleGridHeader" />
                                    <RowStyle HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <%--</div>--%>
            </div>
            <div style="float: right;" class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="row" style="float: right; margin-top: 5px;">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('VGFIL'))" validationgroup="VGFIL" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="l">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" causesvalidation="false" onclick="if(fnConfirmExit())" validationgroup="vgGridAdd" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                        <button class="css_btn_enabled" id="btnPrint" title="Print Letter[Alt+P]" causesvalidation="false" onserverclick="btnPrint_Click" runat="server"
                            type="button" accesskey="P" visible="false">
                            <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;<u>P</u>rint Letter
                        </button>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnGo" />
            <asp:PostBackTrigger ControlID="btnPreviousInvoices" />
            <asp:PostBackTrigger ControlID="imgErrorFileExcel" />
            <asp:PostBackTrigger ControlID="btnExportFormat" />
            <%--<asp:PostBackTrigger ControlID="lnkView" />--%>
            <asp:PostBackTrigger ControlID="lnkView" />
            <asp:PostBackTrigger ControlID="btnViewClientBalance" />

        </Triggers>
    </asp:UpdatePanel>


    <script language="javascript" type="text/javascript">
        function SumScore(sufLen) {

            if (parseInt(sufLen) > 2) {
                sufLen = 2;
            }
            (document.getElementById('ctl00_ContentPlaceHolder1_txtTotalInvoiceAmt')).style.left = (document.getElementById('ctl00_ContentPlaceHolder1_GRVFIL_ctl02_txtInvoiceAmount').clientLeft);
            var TargetBaseControl = document.getElementById('ctl00_ContentPlaceHolder1_GRVFIL');
            var Inputs = TargetBaseControl.getElementsByTagName("input");
            var TotalInvoiceScore = 0;
            var TotalEligibleScore = 0;
            var MarginPer = 0;
            var InvoiceAmt = 0;
            MarginPer = document.getElementById('<%=txtMargin.ClientID%>').value;
            for (var n = 0; n < Inputs.length; ++n) {
                if (Inputs[n].type == 'text') {
                    if (Inputs[n].value != '') {
                        if (Inputs[n].id.substring(Inputs[n].id.length, Inputs[n].id.length - 13) == 'InvoiceAmount') {
                            TotalInvoiceScore = (parseFloat(TotalInvoiceScore) + parseFloat(Inputs[n].value)).toFixed(parseInt(sufLen));
                            InvoiceAmt = (parseFloat(Inputs[n].value)).toFixed(parseInt(sufLen));
                        }

                        if (Inputs[n].id.substring(Inputs[n].id.length, Inputs[n].id.length - 14) == 'EligibleAmount') {
                            Inputs[n].value = (parseFloat(InvoiceAmt - (InvoiceAmt * MarginPer) / 100)).toFixed(parseInt(sufLen));
                            TotalEligibleScore = (parseFloat(TotalEligibleScore) + parseFloat(Inputs[n].value)).toFixed(parseInt(sufLen));
                        }
                    }
                }

            }
            if (parseFloat(TotalEligibleScore) >= 0)
                document.getElementById('<%=txtTotalEligibleAmt.ClientID%>').value = parseFloat(TotalEligibleScore).toFixed(parseInt(sufLen));

            if (parseFloat(TotalInvoiceScore) >= 0)
                document.getElementById('<%=txtTotalInvoiceAmt.ClientID%>').value = parseFloat(TotalInvoiceScore).toFixed(parseInt(sufLen));
        }




        function Resize() {
            if (document.getElementById('divMenu').style.display == 'none') {
                (document.getElementById('ctl00_ContentPlaceHolder1_tdEmpty')).style.width = screen.width - document.getElementById('divMenu').style.width - 500;
            }
            else {
                (document.getElementById('ctl00_ContentPlaceHolder1_tdEmpty')).style.width = '55px';
            }
        }

    </script>



    <cc1:ModalPopupExtender ID="ModalPopupExtenderApprover" runat="server" TargetControlID="btnModal"
        PopupControlID="PnlApprover" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="PnlApprover" Style="display: none; vertical-align: middle" runat="server"
        BorderStyle="Solid" BackColor="White" Width="800px">

        <asp:UpdatePanel ID="updPanel" runat="server">
            <ContentTemplate>
                <div>
                    <div class="row">
                        <asp:Label ID="lblTotalInvoiceAmount" runat="server" Text="Total Invoice Amount:" CssClass="styleDisplayLabel"></asp:Label>
                        <asp:Label ID="lblAmount" runat="server" Font-Bold="true"></asp:Label>
                    </div>
                    <%-- <tr>
                                    <td>--%>

                    <div class="gird">
                        <%--<div id="div2" class="container" runat="server" >--%>
                        <asp:GridView ID="grvApprover" runat="server" class="gird_details" AutoGenerateColumns="false" Height="50px" Width="100%"
                            ShowFooter="true" OnRowDataBound="grvApprover_RowDataBound">
                            <Columns>
                                <asp:TemplateField Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSNo" Text='<% #Bind("IDCOLUMN")%>' Visible="false" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Right">
                                    <HeaderTemplate>
                                        <%--  <asp:UpdatePanel ID="updPanel" runat="server">
                                                <ContentTemplate>--%>
                                        <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged"
                                            Text="Select All" ToolTip="Include" />
                                        <%-- </ContentTemplate>--%>
                                        <%-- <Triggers>
                                                    <asp:PostBackTrigger ControlID="chkAll" />
                                                </Triggers>--%>
                                        <%-- </asp:UpdatePanel>--%>
                                    </HeaderTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblSelect" runat="server" Visible="false" Text='<% #Bind("IS_SELECT")%>'></asp:Label>

                                        <%-- <asp:UpdatePanel ID="updPanel" runat="server">
                                                <ContentTemplate>--%>
                                        <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelect_CheckedChanged" />
                                        <%--</ContentTemplate>
                                                  <Triggers>
                                                      <asp:AsyncPostBackTrigger ControlID="chkSelect" />
                                                </Triggers>
                                            </asp:UpdatePanel>--%>
                                    </ItemTemplate>
                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remove" Visible="false" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemove" runat="server" Visible="false" Text='<% #Bind("IS_REMOVE")%>'></asp:Label>
                                        <asp:CheckBox ID="chkRemove" runat="server" AutoPostBack="true" OnCheckedChanged="chkRemove_CheckedChanged" />
                                    </ItemTemplate>
                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Customer Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPartyName" runat="server" Text='<% #Bind("Customer_Name")%>'>
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
                                    <FooterTemplate>
                                        <asp:Label ID="lblInvoiceNoF" Font-Bold="true" runat="server" Text="Total Invoice Amount"></asp:Label>
                                    </FooterTemplate>
                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Invoice No Dedupe">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInvoiceNoDedupe" runat="server" Text='<% #Bind("INVOICE_NO_DEDUPE")%>'>
                                        </asp:Label>
                                    </ItemTemplate>

                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Invoice Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInvoiceAmount" runat="server" Text='<% #Bind("Invoice_Amount")%>'>
                                        </asp:Label>
                                    </ItemTemplate>

                                    <FooterTemplate>
                                        <div class="md-input" style="margin: 0px;">
                                            <asp:TextBox ID="txtTotalInvoiceAmount" autocomplete="off" Font-Bold="true" Enabled="false"
                                                CssClass="md-form-control form-control login_form_content_input" Style="text-align: right" ToolTip="Invoice Amount" runat="server">
                                            </asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>

                                        </div>
                                    </FooterTemplate>

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

                        <%--</div>--%>
                    </div>

                    <div class="row">
                        <uc3:PageNavigator ID="ucCustomPaging" runat="server" />
                    </div>
                    <%--</td>
                                </tr>--%>
                    <div align="center" class="row">
                        <%--<asp:Button ID="btnMove" runat="server" Text="Move" ToolTip="Move" class="styleSubmitButton" />--%>

                        <%--  <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click"
                            ToolTip="Exit,Alt+X" class="css_btn_enabled" />--%>

                        <button class="css_btn_enabled" id="btnClose" title="Exit[Alt+B]" causesvalidation="false" onserverclick="btnClose_Click" runat="server"
                            type="button" accesskey="B">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;C<u></u>lose
                        </button>

                    </div>
                    <div class="row">
                        <asp:ValidationSummary ID="vsPopUp" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                            HeaderText="Correct the following validation(s):" CssClass="validation_msg_box_sapn" />
                    </div>

                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnClose" />
            </Triggers>
        </asp:UpdatePanel>
        <%-- </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnClose" />
            </Triggers>
        </asp:UpdatePanel>--%>
        <asp:Button ID="btnModal" Style="display: none" runat="server" />
    </asp:Panel>




    <cc1:ModalPopupExtender ID="ModalPreviousInvoices" runat="server" TargetControlID="btnInvoiceModal"
        PopupControlID="pnlPreviousInvoices" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlPreviousInvoices" Style="display: none; vertical-align: middle" runat="server"
        BorderStyle="Solid" BackColor="White" Width="800px">
        <asp:UpdatePanel ID="updPreviousInvoices" runat="server">
            <ContentTemplate>
                <%--    <table width="100%">
                    <tr>
                        <td width="100%">
                            <table width="100%">
                                <tr>
                                    <td>--%>
                <div class="row">
                    <asp:Label ID="lblTotalPreviousAmount" runat="server" Text="Total Invoice Amount:" CssClass="styleDisplayLabel"></asp:Label>
                    <asp:Label ID="lblTotalPreviousAmountValue" runat="server" Font-Bold="true"></asp:Label>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="gird">
                            <asp:GridView ID="grvPreviousInvoices" runat="server" AutoGenerateColumns="false"
                                ShowFooter="false" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Customer Name">
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
                                    <asp:TemplateField HeaderText="Invoice No Dedupe">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInvoiceNoDedupe" runat="server" Text='<% #Bind("INVOICE_NO_DEDUPE")%>'>
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
                        <div class="row">
                            <uc3:PageNavigator ID="PageNavigatorPreviousInvoice" runat="server" />
                        </div>


                        <%--</td>
                                </tr>
                                <tr>
                                    <td align="center">--%>
                        <%-- <asp:Button ID="btnClosePreviousInvoice" runat="server" Text="Close"
                                            ToolTip="Exit,Alt+X" AccessKey="E" class="styleSubmitButton" OnClick="btnClosePreviousInvoice_Click" />--%>
                        <div class="row">
                            <div class="col">
                                <table>
                                    <tr>
                                        <td>

                                            <button class="css_btn_enabled" id="btnClosePreviousInvoice" title="Exit[Alt+Y]" causesvalidation="false" onserverclick="btnClosePreviousInvoice_Click" runat="server"
                                                type="button" accesskey="Y">
                                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;C<u></u>lose
                                            </button>

                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>--%>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="btnInvoiceModal" Style="display: none" runat="server" />
    </asp:Panel>

    <cc1:ModalPopupExtender ID="MPEViewClientbalance" runat="server" TargetControlID="btnModalViewClientBalancePop"
        PopupControlID="pnlViewClientbalance" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlViewClientbalance" Style="display: none; vertical-align: middle" CssClass="stylePanel" GroupingText="Client Balance" runat="server"
        BorderStyle="Solid" ForeColor="Red" BackColor="White" Width="800px">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <%--    <table width="100%">
                    <tr>
                        <td width="100%">
                            <table width="100%">
                                <tr>
                                    <td>--%>

                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="div1" runat="server">
                        <div class="md-input">
                            <asp:TextBox ID="txtREGULARINVOICEAMT" Enabled="false" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" ID="lblREGULARINVOICEAMT" Text="Regular Invoice Amount"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="div2" runat="server">
                        <div class="md-input">
                            <asp:TextBox ID="txtOVERDUEINVOICEAMT" Enabled="false" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" ID="lblOVERDUEINVOICEAMT" Text="Over Due Invoice Amount"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="div3" runat="server">
                        <div class="md-input">
                            <asp:TextBox ID="txtDEFAULTINVOICEAMT" Enabled="false" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" ID="lblDEFAULTINVOICEAMT" Text="Default Invoice Amount"></asp:Label>
                            </label>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="div4" runat="server">
                        <div class="md-input">
                            <asp:TextBox ID="txtDEBTOS" Enabled="false" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" ID="lblDEBTOS" Text="Debts outstanding"></asp:Label>
                            </label>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="div5" runat="server">
                        <div class="md-input">
                            <asp:TextBox ID="txtDEBTSAPPROVED" Enabled="false" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" ID="lblDEBTSAPPROVED" Text="Debts Approved"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="div6" runat="server">
                        <div class="md-input">
                            <asp:TextBox ID="txtDEBTSUNAPPROVED" Enabled="false" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" ID="lblDEBTSUNAPPROVED" Text="Debts Un Approved"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="div7" runat="server">
                        <div class="md-input">
                            <asp:TextBox ID="txtFUNDSINUSE" Enabled="false" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" ID="lblFUNDSINUSE" Text="Funds in Use"></asp:Label>
                            </label>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="div9" runat="server">
                        <div class="md-input">
                            <asp:TextBox ID="txtDrawingPower" Enabled="false" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" ID="lblDrawingPowerBal" Text="Drawing Power"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="div10" runat="server">
                        <div class="md-input">
                            <asp:TextBox ID="txtAVAILABLEFUNDS" Enabled="false" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" ID="lblAVAILABLEFUNDS" Text="Available Funds"></asp:Label>
                            </label>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="div11" runat="server">
                        <div class="md-input">
                            <asp:TextBox ID="txtDISBURSEMENTPENDING" Enabled="false" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" ID="lblDisbursementPending" Text="Disbursement Pending"></asp:Label>
                            </label>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="div8" runat="server">
                        <div class="md-input">
                            <asp:TextBox ID="txtIrregularFund" Enabled="false" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" ID="lblIrregularFund" Text="Irregular Fund"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="div12" runat="server">
                        <div class="md-input">
                            <asp:TextBox ID="txtregularFund" Enabled="false" Style="text-align: right" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label runat="server" ID="lblRegularFund" Text="Regular Fund"></asp:Label>
                            </label>
                        </div>
                    </div>



                </div>

                <div class="row">
                    <div class="col">
                        <table>
                            <tr>
                                <td>

                                    <button class="css_btn_enabled" id="btnCloseViewClose" title="Exit[Alt+Y]" causesvalidation="false" onserverclick="btnCloseViewClose_ServerClick" runat="server"
                                        type="button" accesskey="Y">
                                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u></u>Close
                                    </button>

                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                </div>
                </div>
             
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="btnModalViewClientBalancePop" Style="display: none" runat="server" />
    </asp:Panel>



</asp:Content>
