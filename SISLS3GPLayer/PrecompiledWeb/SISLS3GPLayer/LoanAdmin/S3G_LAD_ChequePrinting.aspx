<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="LoanAdmin_S3G_LAD_ChequePrinting, App_Web_razugfam" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="true" ToolTip="Type" OnSelectedIndexChanged="ddlType_SelectedIndexChanged"
                                    class="md-form-control form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Receivable Cheque"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Payable Cheque"></asp:ListItem>
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvDocumentType" ValidationGroup="Print" CssClass="validation_msg_box_sapn"
                                        runat="server" ControlToValidate="ddlType" SetFocusOnError="true"
                                        ErrorMessage="Select Type" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblDocumentType" runat="server" Text="Type" ToolTip="Type" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlPrintType" runat="server" ToolTip="Print Type"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Print" CssClass="validation_msg_box_sapn"
                                        runat="server" ControlToValidate="ddlPrintType" SetFocusOnError="true"
                                        ErrorMessage="Select Print Type" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblPrintType" runat="server" Text="Print Type" ToolTip="Print Type" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlGenerateType" runat="server" AutoPostBack="true" ToolTip="Generate Type" 
                                    OnSelectedIndexChanged="ddlGenerateType_SelectedIndexChanged"
                                    class="md-form-control form-control">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="System"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Manual"></asp:ListItem>
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Print" CssClass="validation_msg_box_sapn"
                                        runat="server" ControlToValidate="ddlGenerateType" SetFocusOnError="true"
                                        ErrorMessage="Select Generate Type" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblGenerateType" runat="server" Text="Generate Type" ToolTip="Generate Type" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="dvMain" runat="server" align="center">
                            <asp:Panel ID="pnlInstalment" CssClass="stylePanel" GroupingText="Cheque Printing By Installment/Payment" runat="server">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlCheckList" hovermenuextenderleft="true" runat="server" AutoPostBack="true" 
                                                ReadOnly="true" ToolTip="Check List Number" dispalycontent="Both" class="md-form-control form-control"
                                                OnItem_Selected="ddlCheckList_Item_Selected"
                                                ServiceMethod="GetCheclistNo" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblCheckList" CssClass="styleReqFieldLabel" Text="Check List Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="txtClientName" hovermenuextenderleft="true" runat="server" AutoPostBack="true" 
                                                ReadOnly="true" ToolTip="Account Number" dispalycontent="Both" class="md-form-control form-control"
                                                OnItem_Selected="txtClientName_Item_Selected"
                                                ServiceMethod="GetAccuntNoList" />
                                            <asp:HiddenField ID="hdnCustomerCode" runat="server" />
                                            <asp:HiddenField ID="hdnCustomerId" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblClientName" CssClass="styleReqFieldLabel" Text="Account Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlChecklistNo" hovermenuextenderleft="true" runat="server" AutoPostBack="true" 
                                                ReadOnly="true" ToolTip="Proposal Number" dispalycontent="Both" class="md-form-control form-control"
                                                OnItem_Selected="ddlChecklistNo_Item_Selected"
                                                ServiceMethod="GetApplicationNoList" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblProposalNumber" CssClass="styleReqFieldLabel" Text="Proposal Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlPaymentNo" hovermenuextenderleft="true" runat="server" AutoPostBack="true" 
                                                ToolTip="Payment No." dispalycontent="Both" ReadOnly="true" class="md-form-control form-control" 
                                                OnItem_Selected="ddlPaymentNo_Item_Selected"
                                                ServiceMethod="GetPaymentList" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblPaymentno" CssClass="styleReqFieldLabel" Text="Payment No."></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtFavouringName" ReadOnly="true" runat="server"
                                                class="md-form-control form-control login_form_content_input requires_true">
                                            </asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblFavouringName" runat="server" CssClass="styleReqFieldLabel" Text="Favouring Person"></asp:Label>
                                            </label>

                                        </div>

                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input" style="text-align: left;">
                                            <asp:Label ID="Label1" runat="server" Text="TOP Mark"></asp:Label>
                                            <asp:CheckBox runat="server" ID="chkTOPMark" ToolTip="TOP Mark" Checked="true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtamount" runat="server" MaxLength="20"
                                                class="md-form-control form-control login_form_content_input requires_true">
                                            </asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FtexhMarketRate" runat="server" TargetControlID="txtamount"
                                                FilterType="Custom, Numbers" Enabled="True" ValidChars=".">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblAmount" runat="server" Text="Amount"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input" style="text-align: left;">
                                            <asp:Label ID="lblAmountInWords" runat="server" Text="Amount In Words"></asp:Label>
                                            <asp:CheckBox runat="server" ID="chkAmountInWords" ToolTip="Amount In Words" Checked="true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtStartDate" runat="server"
                                                MaxLength="12" class="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtStartDate_TextChanged" AutoPostBack="true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalStartDate" runat="server" Enabled="True"
                                                PopupButtonID="txtStartDate" TargetControlID="txtStartDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvApplicationDate" runat="server" ControlToValidate="txtStartDate"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                    ErrorMessage="Enter Start Date" ValidationGroup="main"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblStartDate" runat="server" Text="Start Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtInstalmentNo" runat="server" MaxLength="3" ToolTip="No of Installment"
                                                class="md-form-control form-control login_form_content_input requires_true">
                                            </asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtInstalmentNo"
                                                FilterType="Custom, Numbers" Enabled="True">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblInstalmentNo" runat="server" Text="No of Installment"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlFrequence" runat="server" ToolTip="Installment By"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Search" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="ddlFrequence" SetFocusOnError="true"
                                                    ErrorMessage="Select Instalment By" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblFrequence" runat="server" Text="Installment By" ToolTip="Instalment By" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input" style="text-align: left;">
                                            <asp:Label ID="lblStartEndDate" runat="server" Text="EOM"></asp:Label>
                                            <asp:CheckBox runat="server" ID="chkStartEndDate" ToolTip="EOM" Enabled="false" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                        <input type="hidden" id="hdnID" runat="server" />
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
                            <asp:Panel ID="pnlPayment" CssClass="stylePanel" GroupingText="Cheque Printing By Payment" runat="server" Visible="false">
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnPrint" title="Print[Alt+P]" validationgroup="Print" causesvalidation="true" onserverclick="btnPrint_ServerClick" runat="server"
                            type="button" accesskey="P" enabled="false">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_ServerClick" runat="server"
                            type="button" accesskey="l">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
