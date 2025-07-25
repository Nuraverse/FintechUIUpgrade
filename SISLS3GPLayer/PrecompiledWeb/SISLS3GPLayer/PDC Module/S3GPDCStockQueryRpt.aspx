<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GPDCStockQueryRpt, App_Web_lpzlcdye" enableeventvalidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    <%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
    <%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>

    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="PDC Stock Query Report">
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
                                    <asp:DropDownList ID="ddlBranch" runat="server" CausesValidation="true" ToolTip="Branch" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblLocation" runat="server" CssClass="StyleDisplaylabel" Text="Branch"></asp:Label>
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
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtStartDate" runat="server" ToolTip="Start Date" autocomplete="off"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtStartDate"
                                        PopupButtonID="imgStartDate" ID="CalendarExtender1">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ErrorMessage="Select Start Date"
                                            ValidationGroup="Go" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtStartDate"
                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
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
                                    <asp:TextBox ID="txtEndDate" runat="server" ToolTip="End Date" autocomplete="off"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <asp:Image ID="ImgEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtEndDate"
                                        PopupButtonID="imgEndDate" ID="CalendarExtender2">
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
                                    <asp:DropDownList ID="ddlDebtCollectorType" runat="server" OnSelectedIndexChanged="ddlDebtCollectorType_SelectedIndexChanged" AutoPostBack="true"
                                        ToolTip="Debt Collector Type" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblDebtCollector" runat="server" Text="Debt Collector" CssClass="styleDisplayLabel" ToolTip="Debt Collector"></asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
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
                <button class="css_btn_enabled" id="btnExcel" title="Download Excel[Alt+O]" causesvalidation="false"
                    runat="server" type="button" accesskey="O" onserverclick="btnExcel_Click">
                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Excel
                </button>

            </div>






            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnDetatails" runat="server" GroupingText="PDC Stock Query Details" CssClass="stylePanel" Width="100%" Visible="false">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="grid">
                                    <div id="divDemand" runat="server" style="overflow: auto; display: none">
                                        <asp:GridView runat="server" ID="GRVPDCDetailsEntry" AutoGenerateColumns="False" Width="100%">
                                            <Columns>
                                                <%-- LOCATION NAME--%>
                                                <asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("LOCATION_NAME")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <%-- CR NUMBER--%>
                                                <asp:TemplateField HeaderText="CR Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustcode" runat="server" Text='<%#Eval("CUST_CODE")%>'></asp:Label>
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
                                                <%--Prime A/c No--%>
                                                <asp:TemplateField HeaderText="Account Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPanumid" runat="server" Text='<%#Eval("PANUM_ID")%>' Visible="false"></asp:Label>
                                                        <asp:Label ID="lblPANUM" runat="server" Text='<%#Eval("PANUM")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--Debt Collector--%>
                                                <asp:TemplateField HeaderText="Debt Collector">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDebt" runat="server" Text='<%#Eval("DEBT_COLL")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--PDC Open--%>
                                                <asp:TemplateField HeaderText="PDC Open">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="Lnkopen" runat="server" OnClick="Lnkopen_Click" Text='<%# Bind("PDC_OPEN") %>' ToolTip="PDC Open"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--PDC Picklist--%>
                                                <asp:TemplateField HeaderText="PDC Picklist">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LnkPicklist" runat="server" OnClick="LnkPicklist_Click" Text='<%# Bind("PDC_PICKLIST") %>' ToolTip="PDC Not to Deposit"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--PDC Processed--%>
                                                <asp:TemplateField HeaderText="PDC Processed">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LnkProc" runat="server" OnClick="LnkProc_Click" Text='<%# Bind("PDC_PROCESSED") %>' ToolTip="PDC Processed"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--PDC Hold--%>
                                                <%--<asp:TemplateField HeaderText="PDC Hold">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LnkHold" runat="server" OnClick="LnkHold_Click" Text='<%# Bind("PDC_HOLD") %>' ToolTip="PDC Hold"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                </asp:TemplateField>--%>
                                                <%--PDC Sent Back to the Customer--%>
                                                <asp:TemplateField HeaderText="PDC Sent Back to Customer">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LnkSBTC" runat="server" OnClick="LnkSBTC_Click" Text='<%# Bind("PDC_SBTC") %>' ToolTip="PDC Sent Back to Customer"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--PDC Replaced By Cash--%>
                                                <asp:TemplateField HeaderText="PDC Replaced By Cash">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LnkRBC" runat="server" OnClick="LnkRBC_Click" Text='<%# Bind("PDC_RBC") %>' ToolTip="PDC Replaced By Cash"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--PDC Lost--%>
                                                <%-- <asp:TemplateField HeaderText="PDC Lost">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LnkLost" runat="server" OnClick="LnkLost_Click" Text='<%# Bind("PDC_LOST") %>' ToolTip="PDC Lost"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                </asp:TemplateField>--%>
                                                <%--PDC Not to Deposit--%>
                                                <asp:TemplateField HeaderText="PDC Not to Deposit">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LnkPNTD" runat="server" OnClick="LnkPNTD_Click" Text='<%# Bind("PDC_NTD") %>' ToolTip="PDC Not to Deposit"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--PDC Permanent Not to Deposit--%>
                                                <asp:TemplateField HeaderText="PDC PNDT">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LnkPPNTD" runat="server" OnClick="LnkPPNTD_Click" Text='<%# Bind("PDC_PNDT") %>' ToolTip="PDC Not to Deposit"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--PDC JV Adjustment--%>
                                                <asp:TemplateField HeaderText="PDC JV Adjustment">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LnkPJVAdjustment" runat="server" OnClick="LnkPJVAdjustment_Click" Text='<%# Bind("PDC_JVADJUST") %>' ToolTip="PDC Not to Deposit"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--PDC Returned--%>
                                                <asp:TemplateField HeaderText="PDC Returned">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LnkRET" runat="server" OnClick="LnkRET_Click" Text='<%# Bind("PDC_RET") %>' ToolTip="PDC Returned"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--PDC Returned--%>
                                                <asp:TemplateField HeaderText="Other Status">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LnkPDC_OTHERMODE" runat="server" Text='<%# Bind("PDC_OTHERMODE") %>' ToolTip="PDC Returned"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--PDC Swapped--%>
                                                <%--<asp:TemplateField HeaderText="PDC Swapped">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LnkSWAP" runat="server" OnClick="LnkSWAP_Click" Text='<%# Bind("PDC_SWAP") %>' ToolTip="PDC Swapped"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                                        </asp:TemplateField>--%>
                                                <%--Installment Date--%>
                                                <asp:TemplateField HeaderText="Last Banking Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBankDate" runat="server" Text='<%#Eval("BANKING_DATE")%>'
                                                            Width="96%"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="styleGridHeader" />
                                        </asp:GridView>
                                        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </asp:Panel>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlstckdet" runat="server" CssClass="stylePanel" Visible="false" Width="600px" Height="300px">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="grid">
                                    <div id="divPDCStck" runat="server" style="overflow: auto; height: 100px; display: none">
                                        <asp:GridView runat="server" ID="grvstckdet" AutoGenerateColumns="False" Width="100%">
                                            <Columns>
                                                <%-- LOCATION NAME--%>
                                                <asp:TemplateField HeaderText="Drawee Bank - Branch">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBank" runat="server" Text='<%#Eval("BANK")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <%-- CR NUMBER--%>
                                                <asp:TemplateField HeaderText="Instrument No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstrNo" runat="server" Text='<%#Eval("INSTRUMENT_NO")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--Customer Name--%>
                                                <asp:TemplateField HeaderText="Org.Instrument Dt">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstrDt" runat="server" Text='<%#Eval("INSTRUMENT_DATE")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                                <%--Debt Collector--%>
                                                <asp:TemplateField HeaderText="Revised Banking Dt">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRevBnkDt" runat="server" Text='<%#Eval("REVISED_BANKDATE")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="styleGridHeader" />
                                        </asp:GridView>
                                    </div>
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
            <%-- <tr>
                <td colspan="4" align="center">
                    <asp:Button runat="server" ID="btnExcel" CssClass="styleSubmitButton" Text="Excel" CausesValidation="true"
                        ToolTip="Excel" OnClick="btnExcel_Click" Visible="false" />
                </td>
            </tr>--%>
        </div>
    </div>
</asp:Content>

