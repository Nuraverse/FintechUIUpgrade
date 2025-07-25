<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptNTDReport, App_Web_dy5ultuc" enableeventvalidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    <%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
    <%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
    <%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC6" %>
    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="PDC Status Report">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlInput" runat="server" GroupingText="Input Criteria" CssClass="stylePanel">

                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" CausesValidation="true"
                                                OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" ToolTip="Line of Business"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="StyleDisplaylabel" ToolTip="Line of Business">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBranch" runat="server" CausesValidation="true" ToolTip="Branch"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblLocation" runat="server" CssClass="StyleDisplaylabel" Text="Branch"></asp:Label>

                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="divAccountno" runat="server">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAccountNoDummy" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                Style="display: none;" MaxLength="100"></asp:TextBox>
                                            <UC6:ICM ID="ddlPAN" ButtonVisible="false" runat="server" ToolTip="Account No" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ddlPAN_SelectedIndexChanged" strLOV_Code="ACC_INVOICELOAD_CR" ServiceMethod="GetPANUM" class="md-form-control form-control login_form_content_input requires_true" />
                                            <asp:Button ID="btnLoadAccount" runat="server" Text="Load Account" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                Style="display: none" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblAccountNo" Text="Account No"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtStartDate" runat="server" ToolTip="Start Date"
                                                class="md-form-control form-control login_form_content_input requires_true" autocomplete="off"></asp:TextBox>
                                            <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtStartDate"
                                                PopupButtonID="imgStartDate" ID="CalendarExtender1" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ErrorMessage="Select Start Date"
                                                    CssClass="validation_msg_box_sapn"
                                                    ValidationGroup="Go" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtStartDate"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Start Date" ID="lblStartDate" CssClass="styleReqFieldLabel"
                                                    ToolTip="Start Date">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">

                                            <asp:TextBox ID="txtEndDate" runat="server" ToolTip="End Date"
                                                class="md-form-control form-control login_form_content_input requires_true" autocomplete="off"></asp:TextBox>
                                            <asp:Image ID="ImgEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtEndDate"
                                                PopupButtonID="imgEndDate" ID="CalendarExtender2" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ErrorMessage="Select End Date"
                                                    ValidationGroup="Go" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtEndDate"
                                                    CssClass="validation_msg_box_sapn">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="End Date" ID="lblEndDate" CssClass="styleReqFieldLabel"
                                                    ToolTip="End Date">
                                                </asp:Label>

                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" CausesValidation="true"
                                                OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" ToolTip="Status"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Status" ID="lblStatus" CssClass="StyleDisplaylabel" ToolTip="Status">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div align="right">
                                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnOk_Click" validationgroup="Go" runat="server"
                                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                    </button>
                                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                                        type="button" accesskey="L">
                                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                    </button>
                                    <button class="css_btn_enabled" id="btnExcel" title="Download Excel[Alt+O]" causesvalidation="true" onserverclick="btnExcel_Click" runat="server"
                                        type="button" validationgroup="Go" accesskey="O">
                                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Excel
                                    </button>
                                </div>

                            </asp:Panel>
                        </div>
                    </div>
                    <%-- <tr>
            <td class="styleFieldLabel" colspan="4" height="8px"></td>
        </tr>--%>
                    <%--<tr>
            <td colspan="4" align="center">
                <asp:Button runat="server" ID="btnGo" CssClass="styleSubmitButton" OnClientClick="return fnCheckPageValidators('Go',false);" Text="Go" CausesValidation="true"
                    ValidationGroup="Go" ToolTip="Go" OnClick="btnOk_Click" />
                &nbsp;<asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton"
                    Text="Clear" OnClientClick="return fnConfirmClear();" ToolTip="Clear" OnClick="btnClear_Click" />
            </td>
        </tr>--%>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnDetatails" runat="server" GroupingText="PDC Status Report Details" CssClass="stylePanel" Width="100%" Visible="false">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="grid">
                                            <asp:GridView runat="server" ID="GRVPDCDetailsEntry" AutoGenerateColumns="False"
                                                ShowFooter="true" Width="100%"
                                                ToolTip="PDC Status Report">
                                                <Columns>
                                                    <%-- LOB NAME--%>
                                                    <asp:TemplateField HeaderText="Line of Business">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLOB" runat="server" Text='<%#Eval("LOB_NAME")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%-- LOCATION NAME--%>
                                                    <asp:TemplateField HeaderText="Branch">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Branch_Desc")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%--Prime A/c No--%>
                                                    <asp:TemplateField HeaderText="Account Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPANUM" runat="server" Text='<%#Eval("PANUM")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%--Customer Name--%>
                                                    <asp:TemplateField HeaderText="Customer">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCUSTOMER_NAME" runat="server" Text='<%#Eval("CUSTOMER_NAME")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%--PDC No--%>
                                                    <asp:TemplateField HeaderText="PDC Entry No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPDC_ENTRY_NO" runat="server" Text='<%#Eval("PDC_ENTRY_NO")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%--Installment No--%>
                                                    <asp:TemplateField HeaderText="Installment Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInstallmentNo" runat="server" Text='<%#Eval("installment_number")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%--Installment Date--%>
                                                    <asp:TemplateField HeaderText="Installment Date" ItemStyle-Width="100px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInstallmentDate" runat="server" Text='<%#Eval("installment_date")%>'
                                                                Width="96%"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%--  Instrument No--%>
                                                    <asp:TemplateField HeaderText="Instrument Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInstrumentNo" runat="server" Text='<%#Eval("instrument_no")%>'
                                                                Width="96%"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%--Instrument Date--%>
                                                    <asp:TemplateField HeaderText="Instrument Date" ItemStyle-Width="100px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblinstrument_no" runat="server" Text='<%#Eval("instrument_date")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%--Banking Date--%>
                                                    <asp:TemplateField HeaderText="Banking Date" ItemStyle-Width="100px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBankingDate" runat="server" Text='<%#Eval("Banking_date")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%--Drawee Bank--%>
                                                    <asp:TemplateField HeaderText="Drawee Bank">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDraweeBankG" runat="server" Text='<%#Eval("drawee_bank_name")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%--  MICR --%>
                                                    <asp:TemplateField HeaderText="MICR">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMICR" runat="server" Text='<%# Bind("MICR")%>' Width="30%"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%-- Status--%>
                                                    <asp:TemplateField HeaderText="Status">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("STATUS")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%-- Amount--%>
                                                    <asp:TemplateField HeaderText="Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("INSTRUMENT_AMOUNT")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                    </asp:TemplateField>
                                                    <%-- User ID , txn_date--%>
                                                    <%--<asp:TemplateField HeaderText="Action Taken By">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUserID" runat="server" Text='<%#Eval("USER_NAME")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action Taken Date" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTxnDate" runat="server" Text='<%#Eval("txn_date")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>--%>
                                                    <%-- Remarks--%>
                                                    <asp:TemplateField HeaderText="Remarks">

                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRemarks" runat="server" Text='<%#Eval("Remarks")%>'></asp:Label>
                                                            <%-- <asp:Label ID="lblTotal" runat="server" ContentEditable="true" ></asp:Label>--%>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Wrap="true" Width="10%"></ItemStyle>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:GridView>
                                            <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary runat="server" ID="vsNTD" HeaderText="Please correct the following validation(s):"
                                CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="Go" ShowSummary="false" />
                        </div>
                    </div>
                    <%--  <tr>
            <td colspan="4" align="center">
                <asp:Button runat="server" ID="btnExcel" CssClass="styleSubmitButton" OnClientClick="return fnCheckPageValidators('Go',false);" Text="Excel" CausesValidation="true"
                    ValidationGroup="Go" ToolTip="Excel" OnClick="btnExcel_Click" Visible="false" />
            </td>
        </tr>--%>
                </div>
            </div>


            <script language="javascript" type="text/javascript">

                function fnTrashCommonSuggestAccount(e) {
                    debugger;
                    document.getElementById('ctl00_ContentPlaceHolder1_txtStartDate').value = null;
                    document.getElementById('ctl00_ContentPlaceHolder1_txtEndDate').value = null;

                }

            </script>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

