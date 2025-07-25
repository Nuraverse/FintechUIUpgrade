<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3GOrgGlobalParameterSetup, App_Web_xfeo3ymh" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <cc1:TabContainer ID="tcAcctCreation" runat="server" CssClass="styleTabPanel" Width="100%"
                            ScrollBars="Auto" AutoPostBack="true" ActiveTabIndex="1">
                            <!--Process Details -->
                            <cc1:TabPanel runat="server" HeaderText="Process" ID="tbAsset" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Process
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="row" style="padding: 5px !important;">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlModify" runat="server" CssClass="md-form-control form-control" AutoPostBack="True">
                                                        </asp:DropDownList>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblModify" runat="server" Text="Modification" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvModify" runat="server" Display="None" ErrorMessage="Select a Modification"
                                                                ControlToValidate="ddlModify" InitialValue="0"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:Label ID="lblEnquiryNo" runat="server" Text="Enquiry Number"></asp:Label>
                                                        <asp:CheckBox runat="server" ID="CbxEnquiryNo" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:Label ID="Label2" runat="server" Text="Offer Number"></asp:Label>
                                                        <asp:CheckBox runat="server" ID="CbxOfferNo" />
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:Label ID="Label3" runat="server" Text="Application Number"></asp:Label>
                                                        <asp:CheckBox runat="server" ID="CbxApplicationNo" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <!--IRR Details -->
                            <cc1:TabPanel runat="server" HeaderText="IRR" ID="TabPanel1" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    IRR
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td class="styleFieldLabel" width="25%">
                                                <asp:Label ID="lblIRR" runat="server" Text="IRR Rule Details" CssClass="styleReqFieldLabel"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign" width="35%">
                                                <asp:DropDownList ID="ddlIRR" runat="server" Width="105px" AutoPostBack="True">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvIRR" runat="server" Display="None" ErrorMessage="Select a IRR Details"
                                                    ControlToValidate="ddlIRR" InitialValue="0"></asp:RequiredFieldValidator>
                                            </td>
                                            <td width="40%"></td>
                                        </tr>
                                        <tr style="height: 5px"></tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="25%">
                                                <asp:Label ID="lblInvoice" runat="server" Text="Invoice" CssClass="styleReqFieldLabel"></asp:Label>
                                            </td>
                                            <td class="styleFieldLabel" width="65%">
                                                <table cellpadding="0" cellspacing="0" width="65%" border="0">
                                                    <tr>
                                                        <td align="center">
                                                            <asp:Label ID="Label1" runat="server" Text="LOB" CssClass="styleFieldLabel"></asp:Label>
                                                        </td>
                                                        <td align="center">
                                                            <asp:Label ID="Label4" runat="server" Text="Voice Required" CssClass="styleFieldLabel"></asp:Label>
                                                        </td>
                                                        <td align="center"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="ddlLOBVoice" runat="server" Width="205px" AutoPostBack="True">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None"
                                                                ErrorMessage="Select a LOB" ControlToValidate="ddlLOBVoice" InitialValue="0"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td align="right">
                                                            <asp:DropDownList ID="ddlvoice" runat="server" Width="105px" AutoPostBack="True">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvVoice" runat="server" Display="None" ErrorMessage="Select a Invoice"
                                                                ControlToValidate="ddlvoice" InitialValue="0"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td align="center"></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr style="height: 5px"></tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="25%">
                                                <asp:Label ID="Label5" runat="server" Text="Depreciation" CssClass="styleReqFieldLabel"></asp:Label>
                                            </td>
                                            <td class="styleFieldLabel" width="75%">
                                                <table cellpadding="0" cellspacing="0" width="65%" border="0">
                                                    <tr>
                                                        <td align="center">
                                                            <asp:Label ID="Label6" runat="server" Text="LOB" CssClass="styleFieldLabel"></asp:Label>
                                                        </td>
                                                        <td align="center">
                                                            <asp:Label ID="Label7" runat="server" Text="Depreciation Method" CssClass="styleFieldLabel"></asp:Label>
                                                        </td>
                                                        <td align="center"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="ddlLOBDesc" runat="server" Width="205px" AutoPostBack="True">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvLOBDesc" runat="server" Display="None"
                                                                ErrorMessage="Select a LOB" ControlToValidate="ddlLOBDesc" InitialValue="0"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td align="right">
                                                            <asp:DropDownList ID="ddlDesc" runat="server" Width="105px" AutoPostBack="True">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvDesc" runat="server" Display="None" ErrorMessage="Select a Depreciation"
                                                                ControlToValidate="ddlDesc" InitialValue="0"></asp:RequiredFieldValidator>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr style="height: 5px"></tr>
                                        <tr>
                                            <td class="styleFieldLabel" width="25%">
                                                <asp:Label ID="Label8" runat="server" Text="Rates" CssClass="styleReqFieldLabel"></asp:Label>
                                            </td>
                                            <td class="styleFieldLabel" width="65%">
                                                <table cellpadding="0" cellspacing="0" width="75%" border="0">
                                                    <tr>
                                                        <td align="center">
                                                            <asp:Label ID="Label9" runat="server" Text="LOB" CssClass="styleFieldLabel"></asp:Label>
                                                        </td>
                                                        <td align="center">
                                                            <asp:Label ID="Label10" runat="server" Text="Corporate Tax Rate" CssClass="styleFieldLabel"></asp:Label>
                                                        </td>
                                                        <td align="center">
                                                            <asp:Label ID="Label11" runat="server" Text="Prime Lending Rate" CssClass="styleFieldLabel"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="ddlLOBRates" runat="server" Width="205px" AutoPostBack="True">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvLOBRates" runat="server" Display="None"
                                                                ErrorMessage="Select a LOB" ControlToValidate="ddlLOBRates" InitialValue="0"></asp:RequiredFieldValidator>
                                                        </td>

                                                        <td align="right">
                                                            <asp:TextBox ID="txtCTR" runat="server" Width="105px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvTar" runat="server" Display="None" ErrorMessage="Enter the Corporate Tax Rate"
                                                                ControlToValidate="txtCTR"></asp:RequiredFieldValidator>
                                                        </td>

                                                        <td align="right">
                                                            <asp:TextBox ID="txtPLR" runat="server" Width="105px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvPlr" runat="server" Display="None" ErrorMessage="Enter the Prime Lending Rate"
                                                                ControlToValidate="txtPLR"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <!--ROI Details -->
                            <cc1:TabPanel runat="server" HeaderText="ROI" ID="TabPanel2" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    ROI Rule
                                </HeaderTemplate>
                                <ContentTemplate>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <!--Currency Details -->
                            <cc1:TabPanel runat="server" HeaderText="Currency" ID="TabPanel3" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Currency Round Off
                                </HeaderTemplate>
                                <ContentTemplate>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <!--Application Details -->
                            <cc1:TabPanel runat="server" HeaderText="Application" ID="TabPanel4" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Application Approval
                                </HeaderTemplate>
                                <ContentTemplate>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Button runat="server" ID="btnSave" CssClass="styleSubmitButton" Text="Save"
                            OnClientClick="return fnCheckPageValidators();" />
                        &nbsp;
                        <asp:Button runat="server" ID="btnClear" CssClass="styleSubmitButton" Text="Clear"
                            CausesValidation="False" />
                        <cc1:ConfirmButtonExtender ID="btnAssetClear_ConfirmButtonExtender" runat="server"
                            ConfirmText="Are you sure you want to Clear?" Enabled="True" TargetControlID="btnClear">
                        </cc1:ConfirmButtonExtender>
                        &nbsp;
                        <asp:Button runat="server" ID="btnCancel" CssClass="styleSubmitButton" CausesValidation="False"
                            Text="Cancel" />
                    </div>
                </div>
                <tr>
                    <asp:ValidationSummary ID="vsGlobal" runat="server" CssClass="styleMandatoryLabel"
                        HeaderText="Correct the following validation(s):  " />
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblErrorMessage" runat="server" Style="color: Red; font-size: medium"></asp:Label>
                    </td>
                </tr>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
