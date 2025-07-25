<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_DC_Incentive_Calculation, App_Web_la20gqab" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="DC Incentive Calculation" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label></h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartDateSearch" runat="server"
                                            AutoPostBack="True" class="md-form-control form-control login_form_content_input requires_true"
                                            OnTextChanged="txtStartDateSearch_OnTextChanged"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvFromdate" runat="server" ControlToValidate="txtStartDateSearch"
                                            Display="None" ErrorMessage="Select Overdue Start Date" SetFocusOnError="True"
                                            ValidationGroup="Main" />
                                        <asp:Image runat="server" ID="imgStartDate" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                            PopupButtonID="imgStartDate" TargetControlID="txtStartDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Overdue Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">

                                        <asp:TextBox ID="txtEndDateSearch"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            AutoPostBack="True" OnTextChanged="txtEndDateSearch_OnTextChanged"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="False"
                                            PopupButtonID="imgEndDate" TargetControlID="txtEndDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                        </cc1:CalendarExtender>
                                        <asp:Image runat="server" ID="imgEndDate" Visible="false" />
                                        <asp:RequiredFieldValidator ID="rfvenddate" runat="server" ControlToValidate="txtEndDateSearch"
                                            Display="None" ErrorMessage="Select Overdue End Date" SetFocusOnError="True"
                                            ValidationGroup="Main" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">

                                            <asp:Label runat="server" ID="lblEndDateSearch" Text="Overdue End Date" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">

                    <button class="css_btn_enabled" id="btnGo" runat="server" onserverclick="btnGo_Click"
                        validationgroup="Main" type="button" causesvalidation="true" accesskey="I" title="Incentive Calculation,Alt+I">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>I</u>ncentive Calculation
                    </button>
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))"
                        causesvalidation="false" validationgroup="Save" runat="server" onserverclick="btnSave_Click"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" runat="server" onserverclick="btnClear_Click"
                        type="button" title="Clear,Alt + L" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u>C</u>lear
                    </button>
                    <button class="css_btn_enabled" id="BtnCancel" visible="True" runat="server"
                        onserverclick="BtnCancel_Click" title="Exit,Alt + X" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                    <button class="css_btn_enabled" ID="btnReport" Visible="false" runat="server" 
                        onserverclick="btnReport_Click" ToolTip="Export [Alt+E]" accesskey="E" >
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>E</u>xport
                    </button>
                    <asp:Button ID="BtnPrint" CssClass="styleSubmitButton" Visible="false" runat="server" Text="Print" OnClick="BtnPrint_Click" ToolTip="Print" />
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsBankBook" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                            ValidationGroup="Main" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                        <asp:CustomValidator ID="cvBankBook" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnReport" />
            <asp:PostBackTrigger ControlID="btnGo" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

