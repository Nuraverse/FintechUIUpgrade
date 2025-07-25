<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GLoanAdOverDueInterest, App_Web_nqjy25qa" title="Over Due Interest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc3" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">
        function fnLoadCustomer() {

            if ("<%= strMode %>" != "M" && "<%= strMode %>" != "Q" && document.getElementById('ctl00_ContentPlaceHolder1_rblAllSpecific_0').checked == false)

                document.getElementById('<%= btnLoadCustomer.ClientID %>').click();
        }

        function fnConfirmRevoke() {
            if (confirm('Are you sure want to Revoke'))
                return true;
            else
                return false;
        }

        function Resize() {
            var dv = document.getElementById('div1');
            var gv = document.getElementById('grvODI');
            dv.style.height = 100;
            //     if((gv!=null) && (dv!=null))
            //     {
            //        dv.style.height =100;
            //     }

        }

        //Call this Function if your Calender Should not allow values greater than system date
        function checkDate_NextSystemDateForODI(sender, args) {

            var today = new Date();
            if (document.getElementById('ctl00_ContentPlaceHolder1_rblAllSpecific_0').checked == true) {

            }
            else {

                if (sender._selectedDate > today) {
                    alert('Selected date cannot be greater than system date');
                    sender._textbox.set_Value(today.format(sender._format));

                }
                document.getElementById(sender._textbox._element.id).focus();
            }
        }

    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                        <asp:Button ID="btnLoadCustomer" runat="server" Style="display: none" Text="Load Customer" AccessKey="C" ToolTip="Load Customer,Alt+C"
                            OnClick="cmbCustomerCode_TextChanged" CausesValidation="false" />
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:UpdatePanel ID="udpnlODI" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel ID="pnlOverDueInterest" runat="server" CssClass="stylePanel" GroupingText="Over Due Interest Details">

                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:RadioButtonList runat="server" ID="rblAllSpecific" AutoPostBack="true" RepeatDirection="Horizontal"
                                                        OnSelectedIndexChanged="rblAllSpecific_SelectedIndexChanged"
                                                        CssClass="md-form-control form-control radio">
                                                        <asp:ListItem Text="All" Value="All" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Specific" Value="Specific"></asp:ListItem>
                                                    </asp:RadioButtonList>

                                                    <label class="tess">
                                                        <asp:Label ID="lblSelection" runat="server" Text="Selection" />
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:RadioButtonList ID="rbtnSchedule" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                                                        OnSelectedIndexChanged="rbtnSchedule_SelectedIndexChanged"
                                                        CssClass="md-form-control form-control radio">
                                                        <asp:ListItem Selected="True" Text="Schedule at" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="Schedule Now" Value="1"></asp:ListItem>
                                                    </asp:RadioButtonList>

                                                    <label class="tess">
                                                        <asp:Label ID="Label1" runat="server" Text="Schedule" />
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVLOB" CssClass="validation_msg_box_sapn" runat="server"
                                                            ControlToValidate="ddlLOB" SetFocusOnError="true" InitialValue="0" ValidationGroup="VGODI"
                                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvCALLOB" CssClass="validation_msg_box_sapn" runat="server"
                                                            ControlToValidate="ddlLOB" SetFocusOnError="true" InitialValue="0" ValidationGroup="VGCAL"
                                                            Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel">
                                                        </asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtScheduleDate" runat="server"
                                                        Enabled="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                    <cc1:CalendarExtender ID="CECScheduleDate" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate"
                                                        TargetControlID="txtScheduleDate" Format="dd/MM/yyyy">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVScheduleDate" CssClass="validation_msg_box_sapn"
                                                            runat="server" ControlToValidate="txtScheduleDate" ValidationGroup="VGODI" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label class="tess">
                                                        <asp:Label ID="lblScheduleDate" runat="server" Text="Schedule Date"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <%--  <uc3:Suggest ID="ddlBranch" Enabled="false" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true"
                                                            ErrorMessage="Select a Location" IsMandatory="true" OnItem_Selected="ddlBranch_SelectedIndexChanged" />--%>

                                                    <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server"
                                                            ControlToValidate="ddlBranch" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                            Display="Dynamic" InitialValue="0" ErrorMessage="Select the Branch" ValidationGroup="VGCAL"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label class="tess">
                                                        <asp:Label runat="server" Text="Location" ID="lblBranch" CssClass="styleReqFieldLabel">
                                                        </asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtScheduleTime" runat="server" MaxLength="8"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <%--<span class="styleMandatory">(HH:MM AM)</span>--%>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVScheduleTime" CssClass="validation_msg_box_sapn"
                                                            runat="server" ControlToValidate="txtScheduleTime" ErrorMessage="Enter the Schedule Time (HH:MM)" ValidationGroup="VGCAL" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="REVScheduleTime" Display="Dynamic" ValidationGroup="VGCAL" CssClass="validation_msg_box_sapn" runat="server"
                                                            ControlToValidate="txtScheduleTime" SetFocusOnError="True" ErrorMessage="Enter the Valid Date Time (HH:MM)" ValidationExpression="^((([0]?[1-9]|1[0-2])(:|\.)[0-5][0-9]((:|\.)[0-5][0-9])?( )?(AM|am|aM|Am|PM|pm|pM|Pm))|(([0]?[0-9]|1[0-9]|2[0-3])(:|\.)[0-5][0-9]((:|\.)[0-5][0-9])?))$"></asp:RegularExpressionValidator>

                                                    </div>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblScheduleTime" runat="server" Text="Schedule Time"></asp:Label>

                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtCustomerCodeLease" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                        Style="display: none;" MaxLength="50"></asp:TextBox>
                                                    <UC4:ICM ID="ucCustomerCodeLov" ToolTip="Customer Name" onblur="fnLoadCustomer();" HoverMenuExtenderLeft="true" runat="server" ShowHideAddressImageButton="true" AutoPostBack="true" DispalyContent="Both"
                                                        strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />

                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvCALcustomerCode" Enabled="false" ErrorMessage="Select the Customer Code" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="VGCAL" ControlToValidate="txtCustomerCodeLease" SetFocusOnError="true"
                                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>

                                                    <asp:HiddenField ID="hidCustId" runat="server" />
                                                    <asp:TextBox Visible="false" ID="txtCustomerName" runat="server" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblCuscode" runat="server" CssClass="styleReqFieldLabel" Text="Customer code"></asp:Label>

                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox runat="server" ID="txtLastODICalculationDate" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblLastODICalcDate" runat="server" Text="Last ODI Calculation Date"></asp:Label>

                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <%-- <asp:DropDownList ID="ddlPrimeAccountNo" runat="server" Enabled="false"
                                                            AutoPostBack="True" OnSelectedIndexChanged="ddlPrimeAccountNo_SelectedIndexChanged"
                                                            class="md-form-control form-control">
                                                        </asp:DropDownList>--%>

                                                    <uc3:Suggest ID="ddlPrimeAccountNo" Enabled="false" runat="server" ServiceMethod="GetODIAccountNo" AutoPostBack="true"
                                                        ErrorMessage="Select the Account No" ValidationGroup="VGCAL" IsMandatory="true" OnItem_Selected="ddlPrimeAccountNo_SelectedIndexChanged" />


                                                    <%--<div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="RFVPrimeAccountNo" Enabled="false" runat="server"
                                                                ControlToValidate="ddlPrimeAccountNo" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                                Display="Dynamic" InitialValue="0" ValidationGroup="VGCAL"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvCALPrimeAC" Enabled="false" runat="server" ControlToValidate="ddlPrimeAccountNo"
                                                                SetFocusOnError="true" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0"
                                                                ValidationGroup="VGCAL"></asp:RequiredFieldValidator>
                                                        </div>--%>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblPrimeAcc" runat="server" CssClass="styleReqFieldLabel" Text="Account No"></asp:Label>

                                                    </label>
                                                </div>
                                            </div>

                                            <div id="divFinAmount" runat="server" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox runat="server" ID="txtAmountFinanced" Style="text-align: right" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblAmountFinanced" runat="server" CssClass="styleDisplayLabel" Text="Amount Financed"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div id="divAmountRepayable" runat="server" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox runat="server" Style="text-align: right" ID="txtAmountRepayable" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblAmountRepayable" runat="server" CssClass="styleDisplayLabel" Text="Amount Repayable"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div id="divtxtFisrtInsDate" runat="server" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox runat="server" ID="txtFisrtInsDate" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblFirstInsDate" runat="server" CssClass="styleDisplayLabel" Text="First Ins.Date"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div id="divtxtLastInsDate" runat="server" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox runat="server" ID="txtLastInsDate" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblLastInsDate" runat="server" CssClass="styleDisplayLabel" Text="Last Ins.Date"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div id="divtxtnoInstallments" runat="server" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox runat="server" ID="txtnoInstallments" Style="text-align: right" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblnoofInstallments" runat="server" CssClass="styleDisplayLabel" Text="No of Installments"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div id="divtxtPenalInterestRate" runat="server" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox runat="server" Style="text-align: right" ID="txtPenalInterestRate" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblPenalInterestRate" runat="server" CssClass="styleDisplayLabel" Text="Penal Int.Rate"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox runat="server" ID="txtCurrentODIDate" AutoPostBack="true"
                                                        OnTextChanged="txtCurrentODIDate_TextChanged"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:Image ID="imgCurrentODIDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVCurrentODIDate" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="VGODI" ControlToValidate="txtCurrentODIDate"
                                                            SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvCALCurrentODIcalculationDate" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="VGCAL" ControlToValidate="txtCurrentODIDate"
                                                            SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <cc1:CalendarExtender ID="CECCurODICalcDate" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDateForODI"
                                                        PopupButtonID="imgCurrentODIDate" TargetControlID="txtCurrentODIDate" Format="dd/MM/yyyy">
                                                    </cc1:CalendarExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblCurrentODIDate" runat="server" CssClass="styleDisplayLabel" Text="As on"></asp:Label>

                                                    </label>
                                                </div>
                                            </div>
                                            <div id="divtxtAFCReceived" runat="server" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox runat="server" Style="text-align: right" ID="txtAFCReceived" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblAFCReceived" runat="server" CssClass="styleDisplayLabel" Text="AFC Received"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div id="divtxtAFCWaiver" runat="server" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox runat="server" Style="text-align: right" ID="txtAFCWaiver" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblAFCWaiver" runat="server" CssClass="styleDisplayLabel" Text="AFC Waiver"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div id="divtxtAFCBal" runat="server" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox runat="server" Style="text-align: right" ID="txtAFCBal" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblAFCBal" runat="server" CssClass="styleDisplayLabel" Text="AFC Bal"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlSubAccountNo" Enabled="false" runat="server"
                                                        AutoPostBack="True" OnSelectedIndexChanged="ddlSubAccountNo_SelectedIndexChanged"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>

                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVSubAccountNo" Enabled="false" runat="server" ControlToValidate="ddlSubAccountNo"
                                                            SetFocusOnError="true" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0"
                                                            ValidationGroup="VGODI"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvCALsubAC" Enabled="false" runat="server" ControlToValidate="ddlSubAccountNo"
                                                            SetFocusOnError="true" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0"
                                                            ValidationGroup="VGCAL"></asp:RequiredFieldValidator>
                                                    </div>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label>
                                                        <asp:Label ID="lblSAN" runat="server" Text="Sub A/C No"></asp:Label>

                                                    </label>
                                                </div>
                                            </div>
                                            <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox runat="server" ID="txtODIRate" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblODIRate" runat="server" Text="Current ODI Rate"></asp:Label>

                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div style="margin-top: 12px" class="md-input">
                                                    <button class="css_btn_enabled" id="btnCalculateODI" title="Calculate ODI[Alt+T]" onclick="if(fnCheckPageValidators('VGCAL',false))" causesvalidation="false" onserverclick="btnCalculateODI_Click" runat="server"
                                                        validationgroup="VGCAL" type="button" accesskey="T">
                                                        <i class="fa fa-calculator" aria-hidden="true"></i>&emsp;Calcula<u>t</u>e ODI
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div>

                <div id="divpnlODIInstallmentDetails" runat="server" class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlODIInstallmentDetails" runat="server" HorizontalAlign="Center"
                            GroupingText="ODI Installment Details" CssClass="stylePanel">
                            <asp:GridView runat="server" ID="grvODIInstallmentDetails" AutoGenerateColumns="False" ShowFooter="true" OnRowDataBound="grvODIInstallmentDetails_RowDataBound" HeaderStyle-CssClass="styleGridHeader"
                                RowStyle-HorizontalAlign="Center">
                                <Columns>
                                    <asp:TemplateField HeaderText="Instal.No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInstallmentNo" runat="server" Text='<%# Bind("INSTALLMENT_NO")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Installment.Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInstallmentDate" runat="server" Text='<%# Bind("INSTALLMENTDATE")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Installment Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInstallmentAmount" runat="server" Text='<%# Bind("InstallmentAmount")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtTotalInstallmentAmount" Enabled="false" Style="text-align: right" ToolTip="Total Amount" Width="100%"
                                                    runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                </asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Paid Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPaidDate" runat="server" Text='<%# Bind("PAID_DATE")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Paid Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPaidAmount" runat="server" Text='<%# Bind("PAID_AMOUNT")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtTotalPaidAmount" Enabled="false" Style="text-align: right" ToolTip="Total Amount" Width="100%"
                                                    runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                </asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Days OverDue">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDaysOverdue" runat="server" Text='<%# Bind("GAP_DAYS")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtTotalOverDueDays" Enabled="false" Style="text-align: right" ToolTip="Days OverDue" Width="100%"
                                                    runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                </asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Penal Interest">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPenlInterest" runat="server" Text='<%# Bind("ODI_AMOUNT")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtTotalPenalInterest" Enabled="false" Style="text-align: right" ToolTip="Penal Interest" Width="100%"
                                                    runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                </asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                </div>
                <div id="divpnlReceiptDetails" runat="server" class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlReceiptDetails" runat="server" HorizontalAlign="Center"
                            GroupingText="Receipt Details" CssClass="stylePanel">
                            <asp:GridView runat="server" ID="grvReceiptDetails" ShowFooter="true" OnRowDataBound="grvReceiptDetails_RowDataBound" AutoGenerateColumns="False" HeaderStyle-CssClass="styleGridHeader"
                                RowStyle-HorizontalAlign="Center">
                                <Columns>
                                    <asp:TemplateField HeaderText="Document Ref.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDocuemtnRef" runat="server" Text='<%# Bind("DocumentRef")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="30%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Receipt Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReceiptDate" runat="server" Text='<%# Bind("DOCUMENT_DATE")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="30%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Narration">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNarration" runat="server" Text='<%# Bind("Narration")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="30%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Receipt Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReceiptAmount" runat="server" Text='<%# Bind("TRANSACTION_AMOUNT")%>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtReceiptAmount" Enabled="false" Style="text-align: right" ToolTip="Receipt Amount" Width="100%"
                                                    runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                </asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="30%" />
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="panSchedule" Visible="false" runat="server" HorizontalAlign="Center"
                            GroupingText="OverDue Information" CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <%--<div id ="div1" style="overflow-x: hidden; overflow-y: auto; height :auto  "  runat ="server" >--%>
                                    <asp:Panel ID="Panel1" ScrollBars="Vertical" runat="server" HorizontalAlign="Center">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="gird">
                                                    <asp:GridView runat="server" ID="grvODI" AutoGenerateColumns="False" HeaderStyle-CssClass="styleGridHeader"
                                                        RowStyle-HorizontalAlign="Center" OnRowDataBound="grvODI_RowDataBound">
                                                        <Columns>
                                                            <%-- Branch  --%>
                                                            <asp:TemplateField HeaderText="Branch">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="txtBranchName" runat="server" Text='<%# Bind("Location")%>'></asp:Label>
                                                                    <asp:Label ID="txtBranchId" runat="server" Visible="false" Text='<%# Bind("Location_ID")%>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" Width="30%" />
                                                            </asp:TemplateField>
                                                            <%-- Number of A/c  --%>
                                                            <asp:TemplateField HeaderText="No. of Accounts">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="txtNoOfAccounts" Style="text-align: right" runat="server" Text='<%# Bind("ACC_COUNT")%>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                            </asp:TemplateField>
                                                            <%-- ODI Amount  --%>
                                                            <asp:TemplateField HeaderText="ODI Amount" ItemStyle-HorizontalAlign="Right">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="txtODIAmount" Width="100%" runat="server" Text='<%# Bind("ODI_AMOUNT")%>'
                                                                        Style="text-align: right;"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Right" Width="15%" />
                                                            </asp:TemplateField>
                                                            <%-- Check Box  --%>
                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Select">
                                                                <HeaderTemplate>
                                                                    <span id="spnAll" style="text-align: center">All</span><br></br>
                                                                    <asp:CheckBox ID="ChkHeadODI" runat="server" AutoPostBack="true" OnCheckedChanged="ChkHeadODI_CheckedChanged"></asp:CheckBox>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="ChkODI" runat="server" AutoPostBack="True" OnCheckedChanged="ChkODI_CheckedChanged"></asp:CheckBox>
                                                                    <asp:HiddenField ID="ODIStatus" runat="server" Value='<%# Bind("Status")%>'></asp:HiddenField>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                            </asp:TemplateField>
                                                            <%-- Status --%>
                                                            <asp:TemplateField HeaderText="Status">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Process")%>'></asp:Label>
                                                                    <asp:HiddenField ID="hidBillStatus" runat="server" Value='<%# Bind("BillStatus")%>'></asp:HiddenField>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                            </asp:TemplateField>
                                                            <%-- Revoke --%>
                                                            <asp:TemplateField Visible="false" HeaderText="Revoke">
                                                                <HeaderTemplate>
                                                                    <span id="spnAll" style="text-align: center">Revoke</span>
                                                                    <br></br>
                                                                    <asp:CheckBox ID="ChkHeadRevoke" runat="server" AutoPostBack="true" OnCheckedChanged="ChkHeadRevoke_CheckedChanged"></asp:CheckBox>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="ChkRevoke" runat="server" AutoPostBack="true" OnCheckedChanged="ChkRevoke_CheckedChanged"></asp:CheckBox>
                                                                    <asp:HiddenField ID="ODIID" runat="server" Value='<%# Bind("ODIID")%>'></asp:HiddenField>
                                                                    <asp:HiddenField ID="hidRevoke" runat="server" Value='<%# Bind("Is_Revoke")%>'></asp:HiddenField>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                        <RowStyle HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <%-- </div>--%>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">

                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('VGODI'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X" validationgroup="VGODI">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>

                    <button class="css_btn_enabled" id="btnRevoke" title="Revoke[Alt+R]" onclick="if(fnConfirmRevoke())" causesvalidation="false" onserverclick="btnRevoke_Click" runat="server"
                        type="button" accesskey="R" validationgroup="VGODI">
                        <i class="fa fa-level-up" aria-hidden="true"></i>&emsp;<u>R</u>evoke
                    </button>
                    <button class="css_btn_enabled" id="btnPrint" title="Print the Details[Alt+P]" visible="false" causesvalidation="false" onserverclick="btnPrint_ServerClick" runat="server"
                        type="button" accesskey="P">
                        <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;<u>P</u>rint
                    </button>


                    <%--  <asp:Button ID="btnRevoke" CssClass="styleSubmitButton" runat="server" Text="Revoke" AccessKey="R" ToolTip="Revoke,Alt+R"
                        Width="100px" OnClick="btnRevoke_Click" Visible="False" CausesValidation="false" />--%>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary runat="server" ID="vsFactoringInvoiceLoadinf" HeaderText="Correct the following validation(s):"
                            Height="177px" CssClass="styleMandatoryLabel" Width="500px" ShowMessageBox="false"
                            ShowSummary="true" ValidationGroup="VGODI" />
                        <asp:ValidationSummary runat="server" ID="ValidationSummary1" HeaderText="Correct the following validation(s):"
                            Height="177px" CssClass="styleMandatoryLabel" Width="500px" ShowMessageBox="false"
                            ShowSummary="true" ValidationGroup="VGCAL" />
                        <asp:CustomValidator ID="cvOverDueInterest" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" Width="98%"></asp:CustomValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </div>
                </div>
            </div>
        </ContentTemplate>
         <Triggers>
             <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>
    <%-- Check Box  --%>
</asp:Content>





























