<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FAPaymentSummary, App_Web_upeq32zu" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="update1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
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
                                            <cc1:ComboBox ID="ddlActivity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlActivity_SelectedIndexChanged"
                                                AppendDataBoundItems="true" CaseSensitive="false"
                                                AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvActivity" runat="server" ControlToValidate="ddlActivity"
                                                    InitialValue="--Select--" ErrorMessage="Select Activity" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblActivity" CssClass="styleReqFieldLabel" Text="Activity"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlLocation"
                                                    InitialValue="--Select--" ErrorMessage="Select Location" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblLocation" Text="Location" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkLocationPrint" runat="server" AutoPostBack="true"
                                                ToolTip="Location Print" OnCheckedChanged="ddlSL_SelectedIndexChanged" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <asp:Label runat="server" ID="lblLocationPrint" Text="Location Print" />
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlAccountFrom" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlAccountFrom_SelectedIndexChanged"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <cc1:ComboBox ID="ddlSLFrom" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlSL_SelectedIndexChanged" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlAccountFrom"
                                                    InitialValue="--Select--" ErrorMessage="Select Account From" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblAccFrom" CssClass="styleReqFieldLabel" Text="Account From"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlAccountTo" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlAccountTo_SelectedIndexChanged"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <cc1:ComboBox ID="ddlSLTo" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlSL_SelectedIndexChanged" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlAccountFrom"
                                                    InitialValue="--Select--" ErrorMessage="Select Account From" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblAccTo" CssClass="styleReqFieldLabel" Text="Account To"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkSubAccount" runat="server" AutoPostBack="true"
                                                ToolTip="Sub Account" OnCheckedChanged="ddlSL_SelectedIndexChanged" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <asp:Label runat="server" ID="lblSubAccount" Text="Sub Account" />
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtFromDate"
                                                AutoPostBack="true" OnTextChanged="txtFromDate_OnTextChanged" onmouseover="txt_MouseoverTooltip(this)"
                                                class="md-form-control form-control login_form_content_input requires_true" />
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
                                            <asp:TextBox runat="server" ID="txtToDate"
                                                AutoPostBack="true" OnTextChanged="txtToDate_OnTextChanged" onmouseover="txt_MouseoverTooltip(this)"
                                                class="md-form-control form-control login_form_content_input requires_true" />
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
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="vgGo" runat="server"
                            type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+X]" onclick="if(fnConfirmClear())"
                            causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Cancel[Alt+C]" onclick="if(fnConfirmExit('btnCancel'))"
                            causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="C">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>C</u>ancel
                        </button>
                        <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server"
                            type="button" causesvalidation="false" accesskey="P" title="Print,Alt+P" visible="false">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlSummary" runat="server" Visible="false" GroupingText="Payment Summary Details"
                                Width="100%" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Label ID="lblLocationG" runat="server" Text="Location" />
                                        <asp:Label ID="lblUserName" Font-Size="Small" runat="server" Text="User Name" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div style="height: 200px; overflow: auto">
                                            <asp:Panel ID="pnlScroll" runat="server" GroupingText="" CssClass="stylePanel" Width="100%">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="gird">
                                                            <asp:GridView ID="gvSummary" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                                Width="99%">
                                                                <Columns>
                                                                    <%--Serial Number--%>
                                                                    <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                                    <%--Doc Date --%>
                                                                    <asp:TemplateField HeaderText="Location">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDocDate" runat="server" Text='<%#Eval("Location") %>' ToolTip="Document Date" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--Doc No --%>
                                                                    <asp:TemplateField HeaderText="Account Code">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDocNo" runat="server" Text='<%#Eval("GL_Code") %>' ToolTip="Document Number" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--Value Date --%>
                                                                    <asp:TemplateField HeaderText="Sub Account Code">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblValDate" runat="server" Text='<%#Eval("SL_Code") %>' ToolTip="Value Date" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--Description --%>
                                                                    <asp:TemplateField HeaderText="Description">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("Description") %>' ToolTip="Description" />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTotal" runat="server" Text="Total :" />
                                                                        </FooterTemplate>
                                                                        <FooterStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                    <%--SL Code--%>
                                                                    <asp:TemplateField HeaderText="Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount1") %>'
                                                                                ToolTip="Amount" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblAmtTotal" runat="server" Text='<%#Eval("TotalAmount") %>' />
                                                                        </FooterTemplate>
                                                                        <FooterStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:HiddenField ID="hdn_FTDate" runat="server" />
                        </div>
                    </div>
                    <div align="right">

                        <button class="css_btn_enabled" id="btnEmail" onserverclick="btnEmail_Click" runat="server"
                            type="button" causesvalidation="false" accesskey="M" title="Email,Alt+M" visible="false">
                            <i class="fa fa-envelope" aria-hidden="true"></i>&emsp;<u>E</u>mail
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsAccountLedger" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                                CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                                HeaderText="Correct the following validation(s):" />
                            <asp:CustomValidator ID="cvPaymentSummary" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
