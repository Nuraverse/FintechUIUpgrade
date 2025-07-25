<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3G_RPT_ChequeDishor_Report, App_Web_zznul5le" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }

        function fnTrashCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById("<%= btncust.ClientID %>").click();
                            }
                            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                                //alert('test1');
                                document.getElementById(e + '_TxtName').value = "";
                                document.getElementById('<%=ucAccountLov.ClientID %>').value = "";

                            }
                            if (document.getElementById(e + '_TxtName').value == "") {
                                //alert('test2');
                                document.getElementById(e + '_hdnSelectedValue').value = "0";
                                document.getElementById('<%=ucAccountLov.ClientID %>').value = "";
                            }
                            if (document.getElementById(e + '_txtLastSelectedText').value != "") {
                                //alert('test3');
                                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                                    //alert('test4');
                                    document.getElementById(e + '_TxtName').value = "";
                                    document.getElementById(e + 'ucCustomerCodeLov').value = "0";
                                    document.getElementById('<%=ucAccountLov.ClientID %>').value = "";
                                }
                            }
                        }
    </script>
    <asp:UpdatePanel ID="UpTranslander" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Paid Dishonored Cheque Report">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel runat="server" ID="PnlInput" CssClass="stylePanel" GroupingText="INPUT CRITERIA"
                            Width="100%">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                            AutoPostBack="True" ValidationGroup="Header" ToolTip="Line of Business"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleDisplayLabel" ToolTip="Line of Business"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlbranch" runat="server" AutoPostBack="True" ValidationGroup="Header"
                                            ToolTip="Branch" OnSelectedIndexChanged="ddlbranch_SelectedIndexChanged"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblbranch" runat="server" CssClass="styleDisplayLabel" Text="Branch" ToolTip="Branch"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                            Style="display: none;" MaxLength="100"></asp:TextBox>
                                        <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true"  
                                            ShowHideAddressImageButton="false" DispalyContent="Both"
                                             OnItem_Selected="ucAccountLov_Item_Selected"
                                            strLOV_Code="ACC_REPORT_0_2" ServiceMethod="GetAccountNo" class="md-form-control form-control" />
                                        <asp:Button ID="btnLoadAccount" runat="server" Text="Load Account" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                            Style="display: none" />
                                        <asp:Button ID="btncust" runat="server" Text="" CausesValidation="false" UseSubmitBehavior="false" OnClick="btncust_Click" Style="display: none" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblAccountNo" Text="Account No"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <input id="hidDate" runat="server" type="hidden" />
                                        <asp:TextBox ID="txtStartDateSearch" runat="server" OnTextChanged="txtStartDateSearch_TextChanged"
                                            AutoPostBack="true" ToolTip="Start Date" autocomplete="off"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" Display="Dynamic" ControlToValidate="txtStartDateSearch"
                                                ValidationGroup="btnGo" CssClass="validation_msg_box_sapn" ErrorMessage="Select New Receipt From Date"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True"
                                            PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblStartDateSearch" runat="server" CssClass="styleReqFieldLabel" Text="New Receipt From Date" ToolTip="Start Date" />
                                        </label>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEndDateSearch" runat="server" OnTextChanged="txtEndDateSearch_TextChanged"
                                            AutoPostBack="true" ToolTip="End Date" autocomplete="off"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" Display="Dynamic" ControlToValidate="txtEndDateSearch"
                                                ValidationGroup="btnGo" CssClass="validation_msg_box_sapn" ErrorMessage="Select New Receipt To Date"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True"
                                            PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblEndDateSearch" runat="server" CssClass="styleReqFieldLabel" Text="New Receipt To Date" ToolTip="End Date" />
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="btnGo" runat="server"
                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                    <button class="css_btn_enabled" id="btnExcel" onserverclick="btnExcel_ServerClick" validationgroup="btnGo" runat="server" visible="false"
                        type="button" causesvalidation="true" accesskey="A" title="Excel,Alt+A">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                </div>
                 <div class="row" >
                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblNoRecords" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                    </div>
                 </div>
                <div class="row" style="display:none;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblAmounts" runat="server" Text="[All amounts are in" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                        <asp:Label ID="lblCurrency" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="PnlInstalmentDue" runat="server" CssClass="stylePanel" GroupingText="Paid Dishonored Cheque Report">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="divAbstract" runat="server" style="overflow: scroll; height: 200px;">
                                            <asp:Label ID="lblRecord" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                                            <asp:GridView ID="grvRcptDtl" runat="server" AutoGenerateColumns="False" Width="100%" HeaderStyle-CssClass="styleGridHeader"
                                                OnRowDataBound="grvRcptDtl_RowDataBound" ShowFooter="false">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblODSlNo" runat="server" Text='<%# Eval("SNO") %>' ToolTip="S.No." />
                                                            <%--<asp:Label ID="lblSno" runat="server" Text='<%# Bind("SNO") %>' ToolTip="Line Of Business"></asp:Label>--%>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPANUMGA" runat="server" Text='<%# Bind("PANUM") %>' ToolTip="Branch"></asp:Label>
                                                            <asp:Label ID="lblPA_SA_REF_ID" runat="server" Text='<%# Eval("PA_SA_REF_ID") %>' Visible="false" />
                                                            <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("Customer_Id") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Customer Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCUSTOMER_NAME" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>' ToolTip="Product"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cheque Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCHEQUE_NUMBER" runat="server" Text='<%# Bind("CHEQUE_NUMBER") %>' ToolTip="Account No."></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cheque Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCHEQUE_RETURN_ADVICE_DATE" runat="server" Text='<%# Bind("CHEQUE_RETURN_ADVICE_DATE") %>' ToolTip="Customer Name"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Drawee Bank Name" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100px">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDrawee_Bank_Name" runat="server" Style="text-align: right" Text='<%# Bind("Drawee_Bank_Name") %>' ToolTip="Approved Amount"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotal" runat="server" Style="text-align: left;" Text="Total" Font-Bold="true"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Installment No" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblINSTALLMENT_NO" runat="server" Style="text-align: right" Text='<%# Bind("INSTALLMENT_NO") %>' ToolTip="Installment No"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblCHEQUE_AMOUNTF" runat="server" Style="text-align: right;"></asp:Label>
                                                        </FooterTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <FooterStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCHEQUE_AMOUNT" runat="server" Style="text-align: right" Text='<%# Bind("CHEQUE_AMOUNT") %>' ToolTip="Installment No"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblCHEQUE_AMOUNTF" runat="server" Style="text-align: right;"></asp:Label>
                                                        </FooterTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <FooterStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Reason" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblIREASON" runat="server" Style="text-align: right" Text='<%# Bind("REASON") %>' ToolTip="Paid Amount"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="New Receipt Date" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRECEIPT_DATE" runat="server" Style="text-align: right" Text='<%# Bind("RECEIPT_DATE") %>' ToolTip="Principal Amount"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="New Receipt Number" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbRECEIPT_NO" runat="server" Style="text-align: right" Text='<%# Bind("RECEIPT_NO") %>' ToolTip="Interest Amount"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Receipt Amount" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbTOTAL_RECEIPT_AMOUNTAmt" runat="server" Style="text-align: right" Text='<%# Bind("TOTAL_RECEIPT_AMOUNT") %>' ToolTip="Interest Amount"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblRECEIPT_AMOUNTF" runat="server" Style="text-align: right;" Font-Bold="true"></asp:Label>
                                                        </FooterTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Mode Of Receipt" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbRECEIPT_MODE" runat="server" Style="text-align: right" Text='<%# Bind("RECEIPT_MODE") %>' ToolTip="Interest Amount"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Instrument Number" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbINSTRUMENT_NO" runat="server" Style="text-align: right" Text='<%# Bind("INSTRUMENT_NO") %>' ToolTip="Interest Amount"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" ToolTip="Select All" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                        <asp:Panel GroupingText="Print Details" ID="pnlPrintDetails" runat="server" CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlPrintType" runat="server" class="md-form-control form-control" ToolTip="Print Type">
                                            <asp:ListItem Value="P" Text="PDF"></asp:ListItem>
                                            <%--<asp:ListItem Value="W" Text="WORD"></asp:ListItem>--%>
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblPrintType" runat="server" Text="Print Type" ToolTip="Print Type" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLanguage" AutoPostBack="false" ToolTip="Language" runat="server"
                                            class="md-form-control form-control  requires_false">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLanguage" ToolTip="Language" runat="server" Text="Language"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnPrint" title="Print[Alt+P]" causesvalidation="false" onserverclick="btnPrint_Click" runat="server"
                        type="button" accesskey="P">
                        <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsDis" runat="server" CssClass="styleMandatoryLabel" Visible="false" HeaderText="Please correct the following validation(s):"
                            ShowSummary="true" ValidationGroup="btnGo" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:CustomValidator ID="CVInstalmentDueRpt" runat="server" Display="None" ValidationGroup="btnPrint"></asp:CustomValidator>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
             <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

