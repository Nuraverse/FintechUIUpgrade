<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptRepaymentSchedule, App_Web_qvacefhr" title="Repayment Schedule" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress" TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC4" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Repayment Schedule Report">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <%-- <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlCustomerInformation" Visible="false" runat="server" GroupingText="Customer Information" CssClass="stylePanel" Width="100%">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <uc2:LOV ID="ucCustomerCodeLov" onfocus="return fnLoadCustomer();" runat="server" strLOV_Code="CMD" />
                                    <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" OnClick="btnLoadCustomer_OnClick" Style="display: none" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblCustomerName" CssClass="styleReqFieldLabel" Text="Customer Name" ToolTip="Customer Name"></asp:Label>
                                    </label>

                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="md-input">
                                    <uc1:S3GCustomerAddress ID="ucCustDetails" ShowCustomerName="false" runat="server" FirstColumnStyle="styleFieldLabel" SecondColumnStyle="styleFieldAlign" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                </div>
                            </div>

                            <div style="height: 17px;" id="divSpace" runat="server">
                            </div>
                        </div>
                    </asp:Panel>
                </div>--%>

                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlRepayment" runat="server" GroupingText="Account Details" CssClass="stylePanel">
                        <div class="row">

                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">

                                    <asp:TextBox ID="txtCustomerCode" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="display: none;" MaxLength="50"></asp:TextBox>
                                    <UC4:ICM ID="ucCustomerCodeLov" ToolTip="Customer Name" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" ShowHideAddressImageButton="true" AutoPostBack="true" DispalyContent="Both"
                                        strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                    <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_OnClick"
                                        Style="display: none" />
                                    <input id="hdnCustID" type="hidden" runat="server" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Customer" ID="lblCustomer" ToolTip="Customer">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>

                           <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                        ToolTip="Line of Business" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" ToolTip="Line of Business">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" ToolTip="Location1"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblBranch" Text="Branch" ToolTip="Branch"></asp:Label>
                                    </label>
                                </div>
                            </div>
                             <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLocation2" runat="server" AutoPostBack="true" ToolTip="Location2"
                                        Enabled="false" OnSelectedIndexChanged="ddlLocation2_SelectedIndexChanged"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblLocation2" Text="Location2" ToolTip="Location2"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                     <uc:Suggest ID="ddlPNum" runat="server" ToolTip="Account Number" ServiceMethod="GetAccountNo" class="md-form-control form-control" />
                                    <%--<asp:DropDownList ID="ddlPNum" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlPNum_SelectedIndexChanged" ToolTip="Account Number"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>--%>
                                   <%-- <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvPNum" runat="server" ErrorMessage="Select Account Number"
                                            ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" InitialValue="-1"
                                            ControlToValidate="ddlPNum" CssClass="validation_msg_box_sapn">
                                        </asp:RequiredFieldValidator>
                                    </div>--%>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblPNum" CssClass="styleReqFieldLabel" Text="Account Number" ToolTip="Account Number"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="display: none">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlSNum" runat="server" ToolTip="Sub Account Number" Visible="false"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvSNum" runat="server" ErrorMessage="Select Sub Account Number"
                                            ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" InitialValue="-1"
                                            ControlToValidate="ddlSNum" Enabled="false" CssClass="validation_msg_box_sapn">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblSNum" Text="Sub Account Number" CssClass="styleDisplayLabel" ToolTip="Sub Account Number" Visible="false"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="true" ToolTip="Product"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblProduct" Text="Product" ToolTip="Product"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="dvPoff" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkPoff" runat="server" TextAlign="Right" AutoPostBack="true" OnCheckedChanged="chkPoff_CheckedChanged" Enabled="false" ToolTip="Print Off" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>

                                    <asp:Label runat="server" ID="lblPoff" Text="Print Off" Enabled="false" ToolTip="Print Off"></asp:Label>

                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvAmortization" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkAmort" runat="server"  TextAlign="Left"  AutoPostBack="true" OnCheckedChanged="chkAmort_CheckedChanged"
                                        Enabled="false" ToolTip="Amortization" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>

                                    <asp:Label runat="server" ID="lblAmort" Text="Amortization" Enabled="false" ToolTip="Amortization"></asp:Label>

                                </div>
                            </div>


                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div align="right">
                <button class="css_btn_enabled" id="btnOk" onserverclick="btnOk_Click" validationgroup="Ok" runat="server"
                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+X]" onclick="if(fnConfirmClear())"
                    causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                    type="button" accesskey="X">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Label ID="lblAmounts" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlAssetDetails" runat="server" CssClass="stylePanel" GroupingText="Asset Information" Visible="false">
                        <asp:Label ID="lblError" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <asp:GridView ID="grvAssetDetails" runat="server" Width="100%" AutoGenerateColumns="false" HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" OnRowDataBound="grvAssetDetails_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Asset Desc." ItemStyle-HorizontalAlign="Left" ControlStyle-Width="130px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAssetDesc" runat="server" Text='<%# Bind("AssetDetails") %>' ToolTip="Asset Description"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SI/Reg. No." ItemStyle-HorizontalAlign="Left" ControlStyle-Width="130px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRegNo" runat="server" Text='<%# Bind("SLRegNo") %>' ToolTip="SI/Reg No"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Finance Amt." ItemStyle-HorizontalAlign="Right" ControlStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFinanceAmt" runat="server" Text='<%# Bind("AmountFinanced") %>' ToolTip="Finance Amount"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IRR" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIRR" runat="server" Text='<%# Bind("IRR") %>' ToolTip="IRR"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Terms" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTerms" runat="server" Text='<%# Bind("Terms") %>' ToolTip="Terms"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ins. Policy No." ItemStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPolicyNo" runat="server" Text='<%# Bind("PolicyNo") %>' ToolTip="Insurance Policy No"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Valid Upto" ItemStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblValidUpto" runat="server" Text='<%# Bind("ValidUpto") %>' ToolTip="Valid Upto"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Insurer" ItemStyle-HorizontalAlign="Left" ControlStyle-Width="130px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInsurer" runat="server" Text='<%# Bind("Insurer") %>' ToolTip="Insurer"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Policy Amt." ItemStyle-HorizontalAlign="Right" ControlStyle-Width="130px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPolicyAmt" runat="server" Text='<%# Bind("PolicyAmount") %>' ToolTip="Policy Amount"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlRepayDetails" runat="server" CssClass="stylePanel" GroupingText="Repayment Structure" Visible="false">
                        <asp:Label ID="lblgridError" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                        <div id="divRepayDetails" runat="server" style="overflow: auto; height: 300px;" align="center">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView ID="grvRepayDetails" runat="server" Width="80%" AutoGenerateColumns="false"
                                            OnRowDataBound="grvRepayDetails_RowDataBound" RowStyle-HorizontalAlign="Center" ShowFooter="true">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Installment No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstallmentNo" runat="server" Text='<%# Bind("InstallmentNo") %>' ToolTip="Installment No"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblGrandTotal" runat="server" Text="Grand Total" ToolTip="Grand Total"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="A/C Mth" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblACMth" runat="server" Text='<%# Bind("ACMth") %>' ToolTip="A/C Mth"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Installment Date" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstallmentDate" runat="server" Text='<%# Bind("InstallmentDate") %>' ToolTip="Installment Date"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Installment Amt." ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstallmentAmt" runat="server" Text='<%# Bind("InstallmentAmount") %>' ToolTip="Installment Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblInstallmentAmount" runat="server" ToolTip="Total Installment Amount"></asp:Label>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Principal" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPrincipalAmt" runat="server" Text='<%# Bind("PrincipalAmount") %>' ToolTip="Principal Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblPrincipalAmount" runat="server" ToolTip="Total Principal Amount"></asp:Label>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Income" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFinanceCharges" runat="server" Text='<%# Bind("FinanceCharges") %>' ToolTip="Finance Charges"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblFinanceCharges" runat="server" ToolTip="Total Finance Charges"></asp:Label>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Un-matured Income" ItemStyle-HorizontalAlign="Right" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUMFC" runat="server" Text='<%# Bind("Umfc") %>' ToolTip="UMFC"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblUMFC" runat="server"></asp:Label>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Principal. o/s" ItemStyle-HorizontalAlign="Right" >
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPrincipalos" runat="server" Text='<%# Bind("TOTAL_POS") %>' ToolTip="Total Pos"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblPrincipalosF" runat="server"></asp:Label>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField HeaderText="Insurance Prem." ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInsuranceAmt" runat="server" Text='<%# Bind("InsuranceAmount") %>' ToolTip="Insurance Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblInsuranceAmount" runat="server" ToolTip="Total Insurance Amount"></asp:Label>
                                    </FooterTemplate>
                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Subsidy Payable" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOthers" runat="server" Text='<%# Bind("Others") %>' ToolTip="Other Charges"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblOthers" runat="server" ToolTip="Total Other Charges"></asp:Label>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField HeaderText="VAT Recovery" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lblVatRec" runat="server" MaxLength="3" Text='<%# Bind("VatRecovery") %>' ToolTip="Vat Recovery"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblVatRecovery" runat="server" ToolTip="Total Vat Recovery"></asp:Label>
                                    </FooterTemplate>
                                </asp:TemplateField>--%>
                                                <%--<asp:TemplateField HeaderText="VAT Setoff" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lblVatSetoff" runat="server" MaxLength="3" Text='<%# Bind("TaxSetOff") %>' ToolTip="Vat Setoff"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTaxSetOff" runat="server" ToolTip="Total Vat Setoff"></asp:Label>
                                    </FooterTemplate>
                                </asp:TemplateField>--%>
                                                <%--<asp:TemplateField HeaderText="Service Tax" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lblServiceTax" runat="server" MaxLength="3" Text='<%# Bind("Tax") %>' ToolTip="Tax"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTax" runat="server" ToolTip="Total Tax"></asp:Label>
                                    </FooterTemplate>
                                </asp:TemplateField>--%>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div align="right">
                <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" validationgroup="Print" runat="server"
                    type="button" causesvalidation="false" accesskey="P" title="Print,Alt+P" visible="false">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                 <%--   <asp:RequiredFieldValidator ID="rfvCustomerName" runat="server" ErrorMessage="Select Customer Name" ValidationGroup="Ok" Enabled="true" Display="None" SetFocusOnError="True" ControlToValidate="txtCustomerCode">
                                                     
                    </asp:RequiredFieldValidator>--%>
                    <asp:ValidationSummary ID="vsRepayment" runat="server" CssClass="styleMandatoryLabel" CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="Ok" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:CustomValidator ID="CVRepaymentSchedule" runat="server" Display="None" ValidationGroup="btnPrint"></asp:CustomValidator>
                </div>
            </div>
            <script language="javascript" type="text/javascript">
                function fnLoadCustomer() {
                    document.getElementById("<%= btnLoadCustomer.ClientID %>").click();

        }

    </script>
            </div>
        </div>
            </asp:Content>


          

    

           

