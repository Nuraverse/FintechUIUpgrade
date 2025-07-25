<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptPDCAcknowledgement, App_Web_nmps0mjf" title="PDC Acknowledgement" %>

<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="PDC Acknowledgement Report">
                    </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="PnlInputCriteria" runat="server" GroupingText="Input Criteria" CssClass="stylePanel">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtCustomerName" runat="server" Style="display: none;" MaxLength="80"
                                    CausesValidation="true" ToolTip="Customer Name"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <uc2:lov id="ucCustomerCodeLov" onfocus="return fnLoadCustomer();" runat="server"
                                    strlov_code="CMD" />
                                <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" OnClick="btnLoadCustomer_OnClick"
                                    Style="display: none" ToolTip="Customer Name" />
                                <input id="hdnCustID" type="hidden" runat="server" />
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvCustomer" CssClass="validation_msg_box_sapn" runat="server"
                                        ControlToValidate="txtCustomerName" ErrorMessage="Select Customer Name" Display="Dynamic"
                                        ValidationGroup="Go" SetFocusOnError="True" Enabled="true">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblCustomerName" CssClass="styleReqFieldLabel" Text="Customer Name" ToolTip="Customer Name"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true"
                                    ToolTip="Line of Business" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel" ToolTip="Line of Business">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true"
                                    ToolTip="Location 1" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblBranch" Text="Location 1" CssClass="styleDisplayLabel" ToolTip="Location 1"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddllocation2" runat="server" OnSelectedIndexChanged="ddllocation2_SelectedIndexChanged"
                                    AutoPostBack="true" Visible="true" ToolTip="Location 2" class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lbllocation" runat="server" Text="Location 2" CssClass="styleDisplayLabel" ToolTip="Location 2">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlPNum" runat="server" AutoPostBack="true" ToolTip="Account Number"
                                    OnSelectedIndexChanged="ddlPNum_SelectedIndexChanged1" class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvPNum" CssClass="validation_msg_box_sapn" runat="server"
                                        ControlToValidate="ddlPNum" ErrorMessage="Select Account Number" Display="Dynamic" ValidationGroup="Go"
                                        SetFocusOnError="True" Enabled="true">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="validation_msg_box_sapn" runat="server"
                                        ControlToValidate="ddlPNum" ErrorMessage="Select Account Number" Display="Dynamic" ValidationGroup="Go"
                                        SetFocusOnError="True" Enabled="true" InitialValue="-1">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblPNum" CssClass="styleReqFieldLabel" Text="Account Number" ToolTip="Account Number"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtDOCPath" runat="server" CausesValidation="true" ReadOnly="true"
                                    ToolTip="DOC Path" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblDOCPath" runat="server"
                                        Text="DOC Path" CssClass="styleDisplayLabel" ToolTip="DOC Path"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" style="display: none">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlSNum" runat="server" OnSelectedIndexChanged="ddlSNum_SelectedIndexChanged"
                                    AutoPostBack="true" ToolTip="Sub Account Number" Visible="false" class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblSNum" Text="Sub Account Number"
                                        CssClass="styleDisplayLabel" ToolTip="Sub Account Number" Visible="false"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlPDCNo" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlPDCNo_SelectedIndexChanged" ToolTip="PDC NO"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvPDCNo" CssClass="validation_msg_box_sapn" runat="server"
                                        ControlToValidate="ddlPDCNo" ErrorMessage="Select PDC NO" Display="Dynamic" ValidationGroup="Go"
                                        SetFocusOnError="True" Enabled="true">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="validation_msg_box_sapn" runat="server"
                                        ControlToValidate="ddlPDCNo" ErrorMessage="Select PDC NO" Display="Dynamic" ValidationGroup="Go"
                                        SetFocusOnError="True" Enabled="true" InitialValue="-1">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblPDCNo" runat="server" Text="PDC NO" CssClass="styleReqFieldLabel" ToolTip="PDC NO"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtPDCDate" runat="server" CausesValidation="true" ToolTip="PDC Date"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblPDCDate" runat="server" Text="PDC Date" CssClass="styleDisplayLabel" ToolTip="PDC Date"></asp:Label>
                                </label>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div align="right">
            <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Go" runat="server"
                type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
            </button>
            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                type="button" accesskey="L">
                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
            </button>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="lblAmounts" runat="server" Text="All Amounts are in" Visible="false"
                    CssClass="styleDisplayLabel"></asp:Label>
                <asp:Label ID="lblCurrency" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="pnlPdcdetails" runat="server" CssClass="stylePanel" GroupingText="PDC Details"
                    Width="100%" Visible="false">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <asp:GridView ID="grvPdcdetails" runat="server" AutoGenerateColumns="False" CssClass="styleInfoLabel"
                                    Width="100%">
                                    <Columns>
                                        <asp:TemplateField HeaderText="PDC Serial No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPdcSNo" runat="server" Text='<%# Bind("PDCSNo") %>' ToolTip="PDC Serial No"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeNumber" runat="server" Text='<%# Bind("ChequeNumber") %>' ToolTip="Cheque Number"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeDate" runat="server" Text='<%# Bind("ChequeDate") %>' ToolTip="Cheque Date"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Drawn on Bank">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDrawnbank" runat="server" Text='<%# Bind("DrawnonBank") %>' ToolTip="Drawn on Bank"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Banking Date" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBankingDate" runat="server" Text='<%# Bind("BankingDate") %>' ToolTip="Banking Date"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount") %>' ToolTip="Amount"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div align="right">
            <button class="css_btn_enabled" id="btnSave" title="Save PDC[Alt+S]" visible="false" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                type="button" accesskey="S">
                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave PDC
            </button>
            &nbsp; &nbsp;
                <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="styleSubmitButton"
                    CausesValidation="false" ValidationGroup="Print" Visible="false" OnClick="btnPrint_Click" ToolTip="Print" />
            &nbsp; &nbsp;
                    <button class="css_btn_enabled" id="BtnEMail" title="EMail[Alt+M]" visible="false" causesvalidation="false" onserverclick="BtnEMail_Click" runat="server"
                        type="button" accesskey="M" enabled="false">
                        <i class="fa fa-envelope" aria-hidden="true"></i>&emsp;E<u>M</u>ail
                    </button>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:ValidationSummary runat="server" ID="VSPDCAcknow" HeaderText="Please correct the following validation(s):"
                    CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="Go" ShowSummary="true" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:CustomValidator ID="CVPDCAcknowledgement" runat="server" Display="None" ValidationGroup="btnPrint"></asp:CustomValidator>
            </div>
        </div>
        <script language="javascript" type="text/javascript">
            function fnLoadCustomer() {
                document.getElementById('<%=btnLoadCustomer.ClientID%>').click();
            }
        </script>
    </div>
</asp:Content>
















