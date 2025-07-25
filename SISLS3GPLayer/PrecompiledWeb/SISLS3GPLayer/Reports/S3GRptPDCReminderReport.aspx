<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="Reports_S3GRptPDCReminderReport, App_Web_nmps0mjf" title="PDC Reminder" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="ContentPDCReminderReport" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" EnableViewState="false" CssClass="styleInfoLabel" Text="PDC Reminder Report">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlPDCReminderHeader" runat="server" GroupingText="Input Criteria" CssClass="stylePanel" Width="100%">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ComboBoxLOBSearch" AutoPostBack="true" ValidationGroup="RFVPDCReminder"
                                            runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                            MaxLength="0" class="md-form-control form-control"
                                            ToolTip="Line of Business" OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOBSearch" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ComboBoxBranchSearch" AutoPostBack="true" ValidationGroup="RFVPDCReminder"
                                            runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                            MaxLength="0" class="md-form-control form-control"
                                            ToolTip="Branch" OnSelectedIndexChanged="ComboBoxBranchSearch_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVComboBranch" ValidationGroup="RFVPDCReminder" InitialValue="-1"
                                                CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ComboBoxBranchSearch" Enabled="false"
                                                SetFocusOnError="True" ErrorMessage="Select Location1" Display="Dynamic" Width="2%"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label Text="Branch" runat="server" ID="lblBranchSearch" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ComboBoxLocationSearch" AutoPostBack="true" ValidationGroup="RFVPDCReminder"
                                            runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                            MaxLength="0" class="md-form-control form-control"
                                            ToolTip="Location2" OnSelectedIndexChanged="ComboBoxLocationSearch_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="RFVPDCReminder" InitialValue="-1"
                                                CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ComboBoxLocationSearch" Enabled="false"
                                                SetFocusOnError="True" ErrorMessage="Select Location2" Display="Dynamic" Width="2%"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label Text="Location2" runat="server" ID="lblLocation" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartDateSearch" runat="server"
                                            ToolTip="Start Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Start Date" Visible="false" />
                                        <cc1:calendarextender id="CalendarExtenderStartDateSearch" runat="server" enabled="True"
                                            popupbuttonid="imgStartDateSearch" targetcontrolid="txtStartDateSearch">
                                        </cc1:calendarextender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="RFVPDCReminder" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                                                ErrorMessage="Select Start Date" Display="Dynamic" Width="1%"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEndDateSearch" runat="server"
                                            ToolTip="End Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="End Date" Visible="false" />
                                        <cc1:calendarextender id="CalendarExtenderEndDateSearch" runat="server" enabled="True"
                                            popupbuttonid="imgEndDateSearch" targetcontrolid="txtEndDateSearch">
                                        </cc1:calendarextender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="RFVPDCReminder" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True" ErrorMessage="Select End Date"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtFilePath" runat="server"
                                            AutoPostBack="false" ToolTip="File Path"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" ID="LblPath" Text="Document Path" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="RFVPDCReminder" runat="server"
                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                </div>
                <div align="right">
                    <asp:Label ID="lblCurrency" runat="server" ToolTip="Currency">
                    </asp:Label>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlPDCDetails" runat="server" GroupingText="PDC Reminder Details" CssClass="stylePanel" Width="100%">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div style="height: 200px; overflow: auto;">
                                            <asp:GridView ID="grvPDCDetails" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                                                BorderWidth="2" Width="100%" Height="20px" OnRowDataBound="grvPDCDetails_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Customer Name" ItemStyle-Width="2%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCustomerName" runat="server" Text='<%#Eval("CUSTOMER_NAME")%>' ToolTip="Customer Name"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="20%" HorizontalAlign="left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account No." ItemStyle-HorizontalAlign="center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPrimeAccountNumber" runat="server" Text='<%#Eval("PRIMEACCOUNTNO")%>' ToolTip="Prime Account No"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Last Collected PDC Date" ItemStyle-HorizontalAlign="center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLastCollectedPDCDate" runat="server" Text='<%#Eval("LASTCOLLECTEDPDCDATE")%>' ToolTip="Last Collected PDC Date"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Exclude All" SortExpression="Exclude All">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="lblExcludeAll" runat="server" Text="Exclude All" ToolTip="Exclude"></asp:Label>
                                                            <br />
                                                            <asp:CheckBox ID="chkExcludeAll" runat="server" AutoPostBack="false" ToolTip="Exclude" />
                                                        </HeaderTemplate>
                                                        <HeaderStyle Width="10%" />
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSelectAccount" runat="server" ToolTip="Exclude" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <RowStyle HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="BtnPrint" title="Print[Alt+P]" causesvalidation="false" onserverclick="BtnPrint_Click" runat="server"
                        type="button" accesskey="P">
                        <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                    </button>
                    <asp:Button ID="btnGeneratePDF" runat="server" CssClass="grid_btn" Text="GeneratePDF" OnClick="btnGeneratePDF_Click" ToolTip="GeneratePDF" />
                    <asp:Button ID="btnEMail" runat="server" CssClass="grid_btn" Text="EMail" Visible="false" ToolTip="EMail" OnClick="btnEMail_Click" />
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <asp:ValidationSummary ValidationGroup="RFVPDCReminder" ID="vsPDCReminder" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):"
                            ShowSummary="true" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:CustomValidator ID="cvPDCReminder" runat="server" Display="None" ValidationGroup="RFVPDCReminder">
                        </asp:CustomValidator>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnGo" />
            <asp:PostBackTrigger ControlID="btnClear" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>















