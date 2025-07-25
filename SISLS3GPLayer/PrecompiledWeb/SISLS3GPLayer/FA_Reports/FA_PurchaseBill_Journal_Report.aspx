<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="FA_Reports_FA_PurchaseBill_Journal_Report, App_Web_upeq32zu" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc2" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="update1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Criteria">
                            <div class="row">


                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <cc1:ComboBox ID="ddlFromLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                            AutoPostBack="true"
                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend" OnSelectedIndexChanged="ddlFromLocation_SelectedIndexChanged">
                                        </cc1:ComboBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlFromLocation"
                                                InitialValue="--Select--" ErrorMessage="Select Branch" Display="Dynamic" SetFocusOnError="True"
                                                ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <label class="tess">
                                            <asp:Label runat="server" ID="lblfromlocation" CssClass="styleReqFieldLabel" Text="Branch"></asp:Label>
                                        </label>
                                    </div>
                                </div>



                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtFromDate" AutoComplete="off"
                                            AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" />
                                        <cc1:CalendarExtender runat="server" TargetControlID="txtFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                            PopupButtonID="txtFromDate" ID="CalFromDate" Enabled="True">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFromDate"
                                                ErrorMessage="Select From Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo"
                                                CssClass="validation_msg_box_sapn" />
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <label>
                                            <asp:Label runat="server" ID="lblFromDate" Text="From Date" />
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtToDate" AutoComplete="off"
                                            AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" />
                                        <cc1:CalendarExtender runat="server" TargetControlID="txtToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                            PopupButtonID="txtToDate" ID="CalToDate" Enabled="True">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtToDate"
                                                ErrorMessage="Select To Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo"
                                                CssClass="validation_msg_box_sapn" />
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <label>
                                            <asp:Label runat="server" ID="lblToDate" Text="To Date" />
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-2 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <cc1:ComboBox ID="ddlStatus" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                            AutoPostBack="true"
                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                        </cc1:ComboBox>
                                        <div class="validation_msg_box">
                                        </div>
                                     

                                        <label class="tess">
                                            <asp:Label runat="server" ID="Label1" CssClass="" Text="Status"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row" align="right">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="vgGo" runat="server"
                            type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClearClick" runat="server"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>

                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsjournal" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                            ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                        <%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />--%>
                        <asp:CustomValidator ID="cvjournal" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" />
                    </div>
                </div>

            </div>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnGo" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
