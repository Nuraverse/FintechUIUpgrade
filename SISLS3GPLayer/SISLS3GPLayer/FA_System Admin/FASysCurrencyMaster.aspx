<%@ Page Language="C#" MasterPageFile="~/Common/FAMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="FASysCurrencyMaster.aspx.cs" Inherits="Sysadm_FASysCurrencyMaster"
    Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
                                <asp:DropDownList ID="ddlCurrencyName" runat="server"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvCurrencyName" CssClass="validation_msg_box_sapn" runat="server"
                                        InitialValue="0" ControlToValidate="ddlCurrencyName" Text="Select the Currency Name"
                                        ErrorMessage="Select the Currency Name" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Currency Name" CssClass="styleReqFieldLabel" ID="lblCurrencyName">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtPrecision" runat="server" MaxLength="1"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvPrecision" CssClass="validation_msg_box_sapn" runat="server"
                                        ControlToValidate="txtPrecision" Text="Enter the Precision" ErrorMessage="Enter the Precision"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Precision" CssClass="styleReqFieldLabel" ID="lblPrecision">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:CheckBox Checked="true" ID="chkActive" runat="server" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <asp:Label runat="server" Text="Active" ID="lblActive">
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S" title="Save[Alt+S]"
                            onclick="if(fnCheckPageValidators())">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button id="btnClear" runat="server" accesskey="L" title="Clear[Alt+L]"
                            causesvalidation="false" class="css_btn_enabled" type="button" onserverclick="btnClear_Click">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                        </button>
                        <%-- <cc1:ConfirmButtonExtender ID="btnClear_ConfirmButtonExtender" runat="server" ConfirmText="Are you sure want to Clear_FA?"
                            Enabled="True" TargetControlID="btnClear">
                        </cc1:ConfirmButtonExtender>--%>
                        <button id="btnCancel" runat="server" causesvalidation="false" accesskey="C" title="Cancel[Alt+C]"
                            class="css_btn_enabled" type="button" onserverclick="btnCancel_Click">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>C</u>ancel
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary CssClass="styleSummaryStyle" runat="server" ID="vsCurrency"
                                HeaderText="Please correct the following validation(s):  " ShowSummary="true"
                                ShowMessageBox="false" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>
                                <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                            </label>
                            <asp:RangeValidator ID="rvPrecision" runat="server" ControlToValidate="txtPrecision"
                                CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Maximum 4 is allowed for Precision"
                                MaximumValue="4" Text="Maximum 4 is allowed for Precision"></asp:RangeValidator>
                            <asp:CustomValidator ID="cvCurrency" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtPrecision"
                                FilterType="Numbers">
                            </cc1:FilteredTextBoxExtender>
                            <input type="hidden" id="hdnID" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
