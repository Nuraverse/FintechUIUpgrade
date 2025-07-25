<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptPaymentReport, App_Web_qvacefhr" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc3" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }

        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
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
                document.getElementById('<%=ucCustomerCodeLov.ClientID %>').value = "";

            }
            if (document.getElementById(e + '_TxtName').value == "") {
                //alert('test2');
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=ucCustomerCodeLov.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {
                //alert('test3');
                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    //alert('test4');
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + 'ucCustomerCodeLov').value = "0";
                    document.getElementById('<%=ucCustomerCodeLov.ClientID %>').value = "";
                }
            }
        }

    </script>
    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Payment Chart">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel runat="server" ID="PnlRepreport" CssClass="stylePanel" GroupingText="INPUT CRITERIA">

                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" runat="server" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                AutoPostBack="True" ValidationGroup="btnGo" ToolTip="Line of Business" class="md-form-control form-control">
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
                                            <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true"
                                                ToolTip="Branch" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Branch" ID="lblLocation" ToolTip="Branch" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged"
                                                ValidationGroup="btnGo" ToolTip="Scheme" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblprdt" runat="server" Text="Scheme" CssClass="styleDisplayLabel" ToolTip="Scheme"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlpaytype" runat="server" OnSelectedIndexChanged="ddlpaytype_SelectedIndexChanged"
                                                AutoPostBack="True" ValidationGroup="btnGo" ToolTip="Pay Type" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="reqpaytype" runat="server" Display="Dynamic" ControlToValidate="ddlpaytype"
                                                    ValidationGroup="btnGo" CssClass="validation_msg_box_sapn" ErrorMessage="Select Pay Type" InitialValue="0"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblpaytype" runat="server" Text="Pay Type" CssClass="styleReqFieldLabel" ToolTip="Pay Type"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:Panel ID="disp" runat="server" Height="300px" ScrollBars="Vertical" Style="display: none" />
                                            <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" IsMandatory="true" AutoPostBack="true" DispalyContent="Both" class="md-form-control form-control"
                                                strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                            <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                Style="display: none" />
                                            <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go">  </asp:TextBox>
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                            <asp:Button ID="btncust" runat="server" Text="" CausesValidation="false" UseSubmitBehavior="false" OnClick="btncust_Click"
                                                Style="display: none" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblCustomerName" CssClass="styleDisplayLabel" Text="Pay To"></asp:Label>
                                            </label>
                                        </div>
                                    </div>


                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="divAccountno" runat="server" visible="true">
                                        <div class="md-input">
                                            <%--<uc:Suggest ID="ucAccountLov" runat="server" ServiceMethod="GetAccuntNoList" AutoPostBack="true" />--%>
                                            <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                                Style="display: none;" MaxLength="100"></asp:TextBox>
                                            <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true"
                                                ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                                strLOV_Code="ACC_REPORT_0_2" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" />
                                            <asp:Button ID="btnLoadAccount" runat="server" Text="Load Account" CausesValidation="false"
                                                UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                Style="display: none" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label1" CssClass="styleDisplayLabel" Text="Account Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtpaystartsearch" runat="server" ToolTip="Pay Start Date"
                                                class="md-form-control form-control login_form_content_input requires_true" autocomplete="off"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True"
                                                PopupButtonID="imgpaystartdate" TargetControlID="txtpaystartsearch">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="Lblpaystartsearch" runat="server" CssClass="styleDisplayLabel" Text="Pay Start Date" ToolTip="Pay Start Date" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtpayendsearch" runat="server" ToolTip="Pay End Date"
                                                class="md-form-control form-control login_form_content_input requires_true" autocomplete="off"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender4" runat="server" Enabled="True"
                                                PopupButtonID="imgpayenddate" TargetControlID="txtpayendsearch">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblpayendsearch" runat="server" CssClass="styleDisplayLabel" Text="Pay End Date" ToolTip="Pay End Date" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtStartDateSearch" runat="server" ToolTip="PO Start Date"
                                                class="md-form-control form-control login_form_content_input requires_true" autocomplete="off"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True"
                                                PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblStartDateSearch" runat="server" CssClass="styleDisplayLabel" Text="PO Start Date" ToolTip="PO Start Date" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtEndDateSearch" runat="server" ToolTip="PO End Date"
                                                class="md-form-control form-control login_form_content_input requires_true" autocomplete="off"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True"
                                                PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblEndDateSearch" runat="server" CssClass="styleDisplayLabel" Text="PO End Date" ToolTip="PO End Date" />
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnGo" onserverclick="btngo_Click" validationgroup="btnGo" runat="server"
                            type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>

                        <button class="css_btn_enabled" id="btnclear" causesvalidation="false" runat="server" onserverclick="btnClear_Click"
                            type="button" accesskey="L" title="Clear[Alt+L]">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="PnlDetailedView" runat="server" CssClass="stylePanel" GroupingText="Due Details" Width="100%">
                                <asp:Label ID="LBLpay" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                                <div class="gird">
                                    <div id="divDetails" runat="server" style="overflow: scroll; height: auto;">

                                        <asp:GridView ID="GrvDetails" runat="server" OnRowDataBound="grvCollection_RowDataBound" AutoGenerateColumns="False" Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sl. No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblcustname" runat="server" Text='<%# Bind("SNO") %>' ToolTip="S. No"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Customer Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblcustname" runat="server" Text='<%# Bind("NAME") %>' ToolTip="Customer"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Loan No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lblaccno" runat="server" Text='<%# Bind("ACNO") %>' ToolTip="Account No"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Payee Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgvLOCATION" runat="server" Text='<%# Bind("PAYEE_NAME") %>' ToolTip="Payee Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <%--    <asp:TemplateField HeaderText="Status ">
                                    <ItemTemplate>
                                        <asp:Label ID="lblaccstatus" runat="server" Text='<%# Bind("Account_Status") %>' ToolTip="Account Status"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="LPO Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLPOAmt" runat="server" Text='<%# Bind("LPOAMT") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Discount Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDiscountAmt" runat="server" Text='<%# Bind("DETAMT") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="NET LPO Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNetLPOtAmt" runat="server" Text='<%# Bind("NETAMT") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <%-- <asp:TemplateField HeaderText="Finance Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblfinamt" runat="server" Text='<%# Bind("Fin_Amt") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Po Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblpodt" runat="server" Text='<%# Bind("PO_DATE") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField HeaderText="Payment Due Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpaduedt" runat="server" Text='<%# Bind("Payment_due_dt") %>' ></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Paid Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblpdamt" runat="server" Text='<%# Bind("Paid_Amount") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField HeaderText="Paid Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblpaydt" runat="server" Text='<%# Bind("Paid_Date") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <%-- <asp:TemplateField HeaderText="Approver">
                                    <ItemTemplate>
                                        <asp:Label ID="lblapprove" runat="server" Text='<%# Bind("Payment_Approver") %>' ></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Balance">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblbal" runat="server" Text='<%# Bind("Balance") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <%--   <asp:TemplateField HeaderText="First Installment Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblinstaldt" runat="server" Text ='<%#Bind("ist_dt") %>' ></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Invoice No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvoiceNo" runat="server" Text='<%# Bind("INVNO") %>' ToolTip="Account No"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Invoice Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvoiceDt" runat="server" Text='<%# Bind("Invoice_date") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Invoice Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvoiceAmt" runat="server" Text='<%# Bind("INVAMT") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Difference">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDifference" runat="server" Text='<%# Bind("Difference") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Schedule B Value">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblScheduleB_Value" runat="server" Text='<%# Bind("SB") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </asp:Panel>

                        </div>
                    </div>
                    <input type="hidden" id="hdnCustomerID" runat="server" />


                    <div align="right">
                        <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server"
                            type="button" causesvalidation="false" accesskey="P" title="Print,Alt+P">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsDis" runat="server" Visible="false" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):"
                                ShowSummary="true" ValidationGroup="btnGo" />
                        </div>
                    </div>


                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

