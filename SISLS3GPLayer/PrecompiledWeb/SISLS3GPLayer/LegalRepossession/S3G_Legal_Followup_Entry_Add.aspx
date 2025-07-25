<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" maintainscrollpositiononpostback="true" autoeventwireup="true" inherits="FinancialAccounting_FAAuthorisationRuleCard, App_Web_5saef4xg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function calendarShown(sender, args) {
            sender._popupBehavior._element.style.zIndex = 10005;
        }
        function fnConfirmCancel() {
            if (confirm('Do you want to Cancel?'))
                return true;
            else
                return false;
        }


        function fnTrashSuggest(e) {


            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_txtItemName').value = "";
            }
            if (document.getElementById(e + '_txtItemName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_txtItemName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                }
            }
        }
        function calendarShown(sender, args) {
            sender._popupBehavior._element.style.zIndex = 10005;
        }
        function calendarShown(sender, args) {
            sender._popupBehavior._element.style.zIndex = 99999999;
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleInfoLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlLawyerFlwEntry" CssClass="stylePanel" GroupingText="Lawyer Followup Entry" runat="server">
                                <div class="row">
                                    <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDocumentNo" ReadOnly="true" runat="server" ValidationGroup="main"
                                                class="md-form-control form-control login_form_content_input requires_true">
                                            </asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Document No" CssClass="styleReqFieldLabel" ID="lblDocumetnNo">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc2:Suggest ID="ddlLawyerCode" ToolTip="Lawyer Code" ErrorMessage="Select the Lawyer" runat="server" AutoPostBack="true"
                                                IsMandatory="true" ValidationGroup="main" OnItem_Selected="ddlLawyerCode_OnSelectedIndexChanged" ServiceMethod="GetLawyerCode" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Lawyer Code" CssClass="styleReqFieldLabel" ID="lblActivity">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc2:Suggest ID="ddlCaseNo" Visible="false" ToolTip="Case No" runat="server" AutoPostBack="true" IsMandatory="false" OnItem_Selected="ddlCaseNoF_Item_Selected" ServiceMethod="GetCaseNo" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Style="display: none" Text="Case No" ID="lblCase_No" CssClass="styleReqFieldLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCustomerName" Style="display: none" runat="server"
                                                class="md-form-control form-control login_form_content_input requires_true">
                                            </asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Style="display: none" Text="Customer Name" ID="lblCustomerName" CssClass="styleReqFieldLabel">
                                                </asp:Label>
                                                <asp:Label runat="server" Style="display: none" Text="Customer Name" Visible="false" ID="lblCustomerCode" CssClass="styleReqFieldLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlSchemeType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSchemeType_SelectedIndexChanged"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvSchemeType" ErrorMessage="Select the Scheme Type" Display="Dynamic" runat="server" ValidationGroup="main"
                                                    ControlToValidate="ddlSchemeType" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblSchemeType" runat="server" Text="Scheme Type" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtStatus" runat="server" ReadOnly="true"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblStatus" runat="server" Text="Approval Status"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlLawyerFlwInvoiceDetails" CssClass="stylePanel" GroupingText="Invoice Details" runat="server">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtInvoiceNo" OnTextChanged="txtInvoiceNo_TextChanged" runat="server" AutoPostBack="True"
                                                class="md-form-control form-control login_form_content_input requires_true">
                                            </asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvInoiceNumber" ErrorMessage="Enter the Invoice No" Display="Dynamic"
                                                    runat="server" ValidationGroup="Show" ControlToValidate="txtInvoiceNo"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Invoice Number" CssClass="styleReqFieldLabel" ID="lblInvoiceNumber">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtInvoiceAmount" runat="server"
                                                class="md-form-control form-control login_form_content_input requires_true">
                                            </asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvInvoiceAmount" ErrorMessage="Enter the Invoice Amount" Display="Dynamic"
                                                    runat="server" ValidationGroup="Show" ControlToValidate="txtInvoiceAmount"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <cc1:FilteredTextBoxExtender ID="FilInvoiceAmount" runat="server" TargetControlID="txtInvoiceAmount"
                                                FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Invoice Amount" CssClass="styleReqFieldLabel" ID="lblInvoiceAmount">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtInvoiceDate" runat="server" AutoPostBack="false"
                                                class="md-form-control form-control login_form_content_input requires_true">
                                            </asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvInvoiceDate" ErrorMessage="Enter the Invoice Date"
                                                    Display="Dynamic" runat="server" ValidationGroup="Show"
                                                    ControlToValidate="txtInvoiceDate" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <asp:Image ID="imgDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="cexInvoiceDate" runat="server" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                PopupButtonID="imgDate" TargetControlID="txtInvoiceDate" OnClientShown="calendarShown">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Invoice Date" CssClass="styleReqFieldLabel" ID="lblInvoiceDate">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                        <div class="md-input">

                                            <asp:FileUpload ID="fuOtherFiles" runat="server" Width="200px" ToolTip="Browse,Ctrl+Spacebar" />
                                            <asp:Label ID="lblCurerntSNo" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblSSID" runat="server" Visible="false"></asp:Label>


                                            <button class="css_btn_enabled" id="Button4" title="Upload[Alt+U]" causesvalidation="false" runat="server" onserverclick="btnUpload_Click1"
                                                type="button" accesskey="U">
                                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>U</u>pload
                                            </button>


                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <asp:GridView ID="grvUploadedFiles" Width="100%" runat="server" AutoGenerateColumns="false" ShowFooter="false"
                                            OnRowDataBound="grvUploadedFiles_RowDataBound" OnRowDeleting="grvUploadedFiles_RowDeleting">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSNoDisplay" runat="server" Text='<%# Container.DataItemIndex+1  %>'></asp:Label>
                                                        <asp:Label ID="lblSerialNo" runat="server" Text='<%# Bind("SNo") %>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="File Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFileName" runat="server" Text='<%# Bind("FileName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Select" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelect" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="View">
                                                    <ItemTemplate>

                                                        <button class="css_btn_enabled" id="btnView" title="view" causesvalidation="false" onserverclick="btnView_ServerClick" runat="server"
                                                            type="button">
                                                            View
                                                        </button>

                                                        <%--                                                            <asp:ImageButton ID="hyplnkView" OnClick="hyplnkView_Click"
                                                                ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit" 
                                                                runat="server" /> --%>
                                                        <asp:Label runat="server" ID="lblPath" Text='<%# Eval("Scanned_Ref_No")%>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <button class="css_btn_enabled" id="btnDelete" title="view" causesvalidation="false" onserverclick="btnDelete_ServerClick" runat="server"
                                                            type="button">
                                                            Delete
                                                        </button>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnshow" onserverclick="btnshow_Click" validationgroup="Show" runat="server"
                            type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>
                        <button class="css_btn_enabled" id="btnClearH" title="Clear[Alt+R]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClearH_Click" runat="server"
                            type="button" accesskey="R" validationgroup="Clear">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clea<u>r</u>
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsmShow" runat="server" ValidationGroup="Show" ShowSummary="true"
                                HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="panDateFormat" GroupingText="Expense Details" runat="server"
                                CssClass="stylePanel">

                                <%--  <div style="height: auto; width: 100%; overflow-x: scroll;">--%>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="grvCourtCaseDetails" ShowFooter="true" OnRowCreated="grvCourtCaseDetails_RowCreated" OnRowDeleting="grvCourtCaseDetails_RowDeleting" OnRowCommand="grvCourtCaseDetails_RowCommand" AutoGenerateColumns="false"
                                                runat="server" OnRowDataBound="grvCourtCaseDetails_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No.">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblSno" ToolTip="S.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="2%" HorizontalAlign="Center" />
                                                        <ItemStyle Width="2%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="2%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Case No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCaseCode" Text='<%#Bind("CASE_CODE")%>' runat="server"></asp:Label>
                                                            <asp:Label ID="lblCaseNo" Text='<%#Bind("COURT_CASE_NO")%>' runat="server" Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <uc2:Suggest ID="ddlCaseNoF" OnItem_Selected="ddlCaseNoF_Item_Selected" ErrorMessage="Select the Case No" ToolTip="Case No" runat="server"
                                                                AutoPostBack="true" IsMandatory="false" ServiceMethod="GetCaseNo_Grid"
                                                                WatermarkText="--Select--" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </FooterTemplate>
                                                        <HeaderStyle Width="12%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="12%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="12%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Case Filed Amount">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtCaseFiledAmount" Text='<%#Bind("CASE_FILED_AMOUNT")%>' ReadOnly="true" Width="100px" Style="text-align: right" runat="server"> </asp:TextBox>
                                                            <asp:Label ID="lblContractNumberI" Text='<%#Bind("Contract_Num") %>' Visible="false" runat="server"></asp:Label>
                                                            <cc1:FilteredTextBoxExtender ID="fltCaseFiledAmount" runat="server" TargetControlID="txtCaseFiledAmount"
                                                                FilterType="Numbers,custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtCaseFiledAmountF" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"
                                                                runat="server"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="flCaseFiledAmountF" runat="server" TargetControlID="txtCaseFiledAmountF"
                                                                FilterType="Numbers,custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblMaxAmount" Visible="false" runat="server"></asp:Label>
                                                                <asp:Label ID="lblContractNumberF" Text='<%#Bind("Contract_Num") %>' Visible="false" runat="server"></asp:Label>
                                                            </label>

                                                        </FooterTemplate>
                                                        <HeaderStyle Width="8%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="8%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="8%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Last Case Status">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCaseStatus" Text='<%#Bind("Case_Status") %>' runat="server"></asp:Label>
                                                            <asp:Label ID="lblCaseId" Text='<%#Bind("Case_Status_Id") %>' Visible="false" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <%-- <asp:DropDownList ID="ddlCaseStatusF" AutoPostBack="true" OnSelectedIndexChanged="ddlCaseStatus_SelectedIndexChanged" Width="100px" runat="server"></asp:DropDownList>--%>
                                                            <asp:Label ID="lblCaseStatusF" Width="90px" Text='<%#Bind("Case_Status") %>' runat="server"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle Width="8%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="8%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="8%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField Visible="false" HeaderText="Case Expense">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtEligibleCaseExpense" Text='<%#Bind("ELIGIBLE_CASE_EXPENSE") %>' Width="100px" runat="server"> </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="flEligibleCaseExpense" runat="server" TargetControlID="txtEligibleCaseExpense"
                                                                FilterType="Numbers,custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtEligibleCaseExpenseF" Style="text-align: right" Width="100px" runat="server"> </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="flEligibleCaseExpenseF" FilterType="Numbers,custom" ValidChars="." runat="server" TargetControlID="txtEligibleCaseExpenseF"
                                                                Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </FooterTemplate>
                                                        <HeaderStyle Width="8%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="8%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="8%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false" HeaderText="Other Expense">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtsofarOtherExpense" Text='<%#Bind("SO_FAR_OTHCASE_EXPENSE") %>' Style="text-align: right" Width="100px" runat="server"> </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="flEligibleCaseExpenseF" FilterType="Numbers,custom" ValidChars="." runat="server" TargetControlID="txtsofarOtherExpense"
                                                                Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtsofarOtherExpenseF" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true" runat="server"> </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fltxtsofarOtherExpenseFExpenseF" FilterType="Numbers,custom" ValidChars="." runat="server" TargetControlID="txtsofarOtherExpenseF"
                                                                Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </FooterTemplate>
                                                        <HeaderStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="10%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false" HeaderText="Case Expense">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtSofarCaseExpense" Text='<%#Bind("SO_FAR_CASE_EXPENSE") %>' Width="100px" runat="server"> </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="flSofarCaseExpense" FilterType="Numbers,custom" ValidChars="." runat="server" TargetControlID="txtSofarCaseExpense"
                                                                Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtSofarCaseExpenseF" Style="text-align: right"
                                                                class="md-form-control form-control login_form_content_input requires_true" runat="server"> </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="flSofarCaseExpenseF" FilterType="Numbers,custom" ValidChars="." runat="server" TargetControlID="txtSofarCaseExpenseF"
                                                                Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </FooterTemplate>
                                                        <HeaderStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="10%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="(+) Expenses">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="btnAddOtherExpense" OnClick="btnPopExpensesI_Click" CausesValidation="false" Height="30px" src="../Images/Dimm2.JPG" runat="server"
                                                                ToolTip="Add Expense" />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:ImageButton ID="btnAddOtherExpenseF" OnClick="btnPopExpenses_Click" CausesValidation="false" Height="30px" src="../Images/Dimm2.JPG" runat="server"
                                                                ToolTip="Add Expense" />
                                                        </FooterTemplate>
                                                        <HeaderStyle Width="2%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="2%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="2%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Accounts">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblcontractno" Visible="false" runat="server"> </asp:Label>
                                                            <asp:LinkButton ID="lnkAccountNo" CausesValidation="false" Text="View" OnClick="LnkAccountNo_ClickI" runat="server"> </asp:LinkButton>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:LinkButton ID="lnkAccountNoF" Text="View" CausesValidation="false" OnClick="LnkAccountNo_ClickF" runat="server"> </asp:LinkButton>
                                                        </FooterTemplate>
                                                        <HeaderStyle Width="2%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="2%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="2%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Other Expense">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtOtherExpense" ReadOnly="true" Text='<%#Bind("OTH_CASE_EXPENSE") %>' Width="100px" runat="server"> </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="flOtherExpense" FilterType="Numbers,custom" ValidChars="." runat="server" TargetControlID="txtOtherExpense"
                                                                Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtOtherExpenseF" ReadOnly="true" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"
                                                                runat="server"> </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="flOtherExpenseF" FilterType="Numbers,custom" ValidChars="." runat="server" TargetControlID="txtOtherExpenseF"
                                                                Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblOthCaseExp" ReadOnly="true" AutoPostBack="true" Text="" Style="text-align: right" runat="server"> </asp:Label>
                                                            </label>
                                                        </FooterTemplate>
                                                        <HeaderStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="10%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Case Expense">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtCaseExpense" ReadOnly="true" Text='<%#Bind("CASE_EXPENSE") %>' Width="100px" runat="server"> </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fltxtCaseExpense" runat="server" TargetControlID="txtCaseExpense"
                                                                FilterType="Numbers,custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtCaseExpenseF" ReadOnly="true" AutoPostBack="true" OnTextChanged="txtCaseExpenseF_TextChanged" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"
                                                                runat="server"> </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fltxtCaseExpenseF" runat="server" TargetControlID="txtCaseExpenseF"
                                                                FilterType="Numbers,custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <div align="right">
                                                                <label>
                                                                    <asp:Label ID="lblCaseExp" ReadOnly="true" AutoPostBack="true" Text="Total" Style="text-align: right" runat="server"> </asp:Label>
                                                                </label>
                                                            </div>



                                                        </FooterTemplate>
                                                        <HeaderStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="10%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Total Expense">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtTotalCaseExpenseI" ReadOnly="true" Text='<%#Bind("TOTAL_CASE_EXPENSE") %>' Width="100px" runat="server"> </asp:TextBox>

                                                            <cc1:FilteredTextBoxExtender ID="fltxtTotalCaseExpense" runat="server" TargetControlID="txtTotalCaseExpenseI"
                                                                FilterType="Numbers,custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtTotalCaseExpenseF" ReadOnly="true" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"
                                                                runat="server"> </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fltxtTotalCaseExpenseF" runat="server" TargetControlID="txtTotalCaseExpenseF"
                                                                FilterType="Numbers,custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblTotalCaseExp" ReadOnly="true" AutoPostBack="true" Text="" Style="text-align: right" runat="server"> </asp:Label>
                                                            </label>

                                                        </FooterTemplate>
                                                        <HeaderStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="10%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="[%] Reached Charges">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtEligibleOtherExpense" ReadOnly="true" Text='<%#Bind("ELIGIBLE_OTHCASE_EXPENSE") %>' Width="100px" runat="server"> </asp:TextBox>

                                                            <cc1:FilteredTextBoxExtender ID="flEligibleOtherExpense" runat="server" TargetControlID="txtEligibleOtherExpense"
                                                                FilterType="Numbers,custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtEligibleOtherExpenseF" ReadOnly="true" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"
                                                                runat="server"> </asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="flEligibleOtherExpenseF" runat="server" TargetControlID="txtEligibleOtherExpenseF"
                                                                FilterType="Numbers,custom" ValidChars="." Enabled="true">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblCaseExpPer" ReadOnly="true" AutoPostBack="true" Text="" Style="text-align: right" runat="server"> </asp:Label>
                                                            </label>

                                                        </FooterTemplate>
                                                        <HeaderStyle Width="8%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="8%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="8%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Remarks">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtHearingRmrks" Text='<%#Bind("HREMARKS") %>' TextMode="MultiLine" runat="server"> </asp:TextBox>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:TextBox ID="txtHearingRmrksF" TextMode="MultiLine" runat="server"
                                                                class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>

                                                        </FooterTemplate>
                                                        <HeaderStyle Width="25%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="25%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="25%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Action">
                                                        <ItemTemplate>
                                                            <%--<asp:ImageButton ID="btnRemove" CommandName="Delete" CausesValidation="false" Height="30px" src="../Images/DeleteImage.png" runat="server" />--%>

                                                            <asp:Button ID="btnRemove" Text="Delete" ToolTip="Delete,Alt+T" AccessKey="T"
                                                                CommandName="Delete" runat="server" CssClass="grid_btn" CausesValidation="false" />


                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <FooterTemplate>
                                                            <%--<asp:ImageButton ID="btnDetails" AccessKey="S" CommandName="AddNew" CausesValidation="false" Height="30px" src="../Images/ICOAddImage.png" runat="server" />--%>

                                                            <asp:Button ID="btnDetails" Text="Add" ToolTip="Add,Alt+B" AccessKey="B"
                                                                CommandName="AddNew" runat="server" CssClass="grid_btn" CausesValidation="false" />

                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="2%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemStyle Width="2%" HorizontalAlign="Center" />
                                                        <FooterStyle Width="2%" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <%--</div>--%>
                            </asp:Panel>
                        </div>
                    </div>

                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('main'))"
                            causesvalidation="false" validationgroup="main" runat="server" onserverclick="btnSave_Click"
                            type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                            onserverclick="btnClear_Click"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false"
                            onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>

                        <button class="css_btn_enabled" id="btnCancelInvoice" title="Cancel Invoice[Alt+N]" onclick="if(fnConfirmCancel())" causesvalidation="false" onserverclick="btnInvoiceCancel_Click" runat="server"
                            type="button" accesskey="N">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;Ca<u>n</u>cel Invoice
                        </button>
                    </div>


                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="AuthorizationRulecardAdd" runat="server" ValidationGroup="main" ShowSummary="true"
                                HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                            <input id="hdnGrvCnt" runat="server" value="0" type="hidden" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="Button4" />
        </Triggers>

    </asp:UpdatePanel>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <cc1:ModalPopupExtender ID="ModalPopupExtenderApprover" runat="server" TargetControlID="btnModal"
                PopupControlID="PnlAccountDetails" BackgroundCssClass="styleModalBackground" Enabled="true">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="PnlAccountDetails" Style="display: none; vertical-align: middle" runat="server"
                BorderStyle="Solid" CssClass="stylePanel" BackColor="White" Width="800px">
                <asp:UpdatePanel ID="upPass" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtOs" Visible="false" runat="server" Style="text-align: right" AutoPostBack="True"
                                        class="md-form-control form-control login_form_content_input requires_true">
                                    </asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtOs"
                                        FilterType="Numbers" Enabled="true">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Visible="false" Text="OS" CssClass="styleReqFieldLabel" ID="lblOs">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtOD" runat="server" Visible="false" Style="text-align: right" Width="196px" AutoPostBack="True"
                                        class="md-form-control form-control login_form_content_input requires_true">
                                    </asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtOD"
                                        FilterType="Numbers" Enabled="true">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="OD" Visible="false" CssClass="styleReqFieldLabel" ID="lblOD">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <%--<div id="divTransaction" class="container" runat="server" style="height: 200px; overflow: scroll">--%>
                                <asp:Panel ID="pnlExpenseHistory" runat="server" Width="840px" GroupingText="Account Details" CssClass="stylePanel">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvExpenseHistory" OnRowDataBound="grvExpenseHistory_RowDataBound" runat="server" AutoGenerateColumns="false"
                                                    ShowFooter="false">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSno" ToolTip="Serial Number" Visible="false" Text='<% #Bind("SNO")%>'
                                                                    runat="server"></asp:Label>
                                                                <asp:Label runat="server" ID="Label1" ToolTip="S.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="5px" HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Customer Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCustomer_Name" runat="server" Text='<% #Bind("customer_Name")%>'>
                                                                </asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="30px" HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Case No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCaseNo" runat="server" Text='<% #Bind("COURT_CASE_NO")%>'>
                                                                </asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="30px" HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Contract Number">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblContractNo" runat="server" Text='<% #Bind("CONTRACT_NUMBER")%>'>
                                                                </asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="30px" HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="O/S">
                                                            <ItemTemplate>
                                                                <asp:TextBox Style="text-align: right" Width="100px" ID="txtOsAmountI" Text='<% #Bind("OS")%>' runat="server"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredtxtODAmountI" runat="server" TargetControlID="txtOsAmountI"
                                                                    FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                            </ItemTemplate>
                                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="O/D">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtODAmountI" Style="text-align: right" Width="100px" Text='<% #Bind("OD")%>' runat="server"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredtxtOSAmountI" runat="server" TargetControlID="txtODAmountI"
                                                                    FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                            </ItemTemplate>
                                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Case Amount">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtCaseAmountI" Style="text-align: right" Width="100px" Text='<% #Bind("CASE_FILED_AMOUNT")%>' runat="server"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredtxtCaseAmountI" runat="server" TargetControlID="txtCaseAmountI"
                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="true" />
                                                            </ItemTemplate>
                                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Invoice Paid">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtInvoicePaid" Style="text-align: right" Width="100px" Text='<% #Bind("INVOICE_PAID")%>' runat="server"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FiltxtInvoicePaid" runat="server" TargetControlID="txtInvoicePaid"
                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="true" />
                                                            </ItemTemplate>
                                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Invoice Amount">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtInvoiceAmount" Style="text-align: right" Width="100px" Text='<% #Bind("INVOICE_AMOUNT")%>' runat="server"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FiltxtInvoiceAmount" runat="server" TargetControlID="txtInvoiceAmount"
                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="true" />
                                                            </ItemTemplate>
                                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField Visible="false" HeaderText="% Reached Charges">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtPerReachedCharges" Style="text-align: right" Width="100px" Text='<% #Bind("PER_REACHED_CHARGES")%>' runat="server"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FiltxttxtPerReachedCharges" runat="server" TargetControlID="txtPerReachedCharges"
                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="true" />
                                                            </ItemTemplate>
                                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
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
                            <button class="css_btn_enabled" id="btnDEVModalCancel" title="Exit[Alt+E]" causesvalidation="false" onserverclick="btnCloseBreakUpModelPop_Click" runat="server"
                                type="button" accesskey="E">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>E</u>xit
                            </button>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                <asp:ValidationSummary ID="vsPopUp" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                                    HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Button ID="btnModal" Style="display: none" runat="server" />
            </asp:Panel>
        </div>
    </div>
    <%--Other Expense--%>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <cc1:ModalPopupExtender ID="ModelAddExpense" runat="server" TargetControlID="btnModalOtherExp"
                PopupControlID="pnlExpenseDetails" BackgroundCssClass="styleModalBackground" Enabled="true">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlExpenseDetails" Style="display: none; vertical-align: middle" runat="server"
                BorderStyle="Solid" GroupingText="Expense Details" CssClass="stylePanel" BackColor="White" Width="1100px">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Panel ID="pnlAddExpense" runat="server" Width="100%" GroupingText="Add Expense " CssClass="stylePanel">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvAddExpense" runat="server" AutoGenerateColumns="false"
                                                    OnRowDataBound="grvAddExpense_DataBound" OnRowDeleting="grvAddExpense_RowDeleting"
                                                    ShowFooter="true">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSno" ToolTip="Serial Number" Visible="false" Text='<% #Bind("Sno")%>'
                                                                    runat="server"></asp:Label>
                                                                <asp:Label runat="server" ID="Label1" ToolTip="S.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label runat="server" Visible="false" ID="lblFootersno" ToolTip="S.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Case Status">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBreakupType" runat="server" Width="90px" Text='<% #Bind("Break_Type")%>'>
                                                                </asp:Label>
                                                                <asp:Label ID="lblCharge" Visible="false" runat="server" Text='<% #Bind("Break_Type_Id")%>'>
                                                                </asp:Label>
                                                                <asp:Label ID="lblCaseNo" Visible="false" runat="server" Text='<% #Bind("Case_No")%>'>
                                                                </asp:Label>
                                                                <asp:Label ID="lblExpenseType" Visible="false" runat="server" Text='<% #Bind("Expense_Type_Id")%>'>
                                                                </asp:Label>
                                                                <asp:Label ID="lblExpenseCode" Visible="false" runat="server" Text='<% #Bind("Expense_Code")%>'>
                                                                </asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            <FooterTemplate>
                                                                <asp:DropDownList ID="ddlChargeType" Width="90px" OnSelectedIndexChanged="ddlChargeType_SelectedIndexChanged" AutoPostBack="true"
                                                                    ToolTip="Type" runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Left" />

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDate" runat="server" Width="60px" Text='<% #Bind("Hearing_Date")%>'>
                                                                </asp:Label>
                                                                <asp:Label ID="lblIND" Visible="false" runat="server" Text='<% #Bind("IND")%>'>
                                                                </asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            <FooterTemplate>
                                                                <div class="row">
                                                                    <asp:TextBox ID="txtDate" runat="server" AutoPostBack="false" Width="60px"
                                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                                    </asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvInvoiceDate" ErrorMessage="Select the Date"
                                                                            Display="Dynamic" runat="server" ControlToValidate="txtDate" CssClass="grid_validation_msg_box"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <asp:Image ID="imgDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                    <cc1:CalendarExtender ID="cexInvoiceDate" runat="server" OnClientShown="calendarShown"
                                                                        PopupButtonID="imgDate" TargetControlID="txtDate">
                                                                    </cc1:CalendarExtender>

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Remarks">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtHearingRmrks" Text='<% #Bind("Remarks")%>' Width="120px" TextMode="MultiLine" runat="server"> </asp:TextBox>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:TextBox ID="txtHearingRmrksF" TextMode="MultiLine" runat="server" Width="120px"
                                                                    class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </FooterTemplate>
                                                            <HeaderStyle Width="25%" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <ItemStyle Width="25%" HorizontalAlign="Center" />
                                                            <FooterStyle Width="25%" HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtTaxableAmount" ReadOnly="true" Width="100px" Text='<% #Bind("Taxable_Amount")%>' runat="server"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredtxtAmountI" runat="server" TargetControlID="txtTaxableAmount"
                                                                    FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblAmount" Visible="false" runat="server"></asp:Label>
                                                                <asp:TextBox ID="txtTaxableAmount" runat="server" Width="90px" OnTextChanged="txtTaxableAmount_TextChanged"
                                                                  AutoPostBack="true"  class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredtxtAmount" runat="server" TargetControlID="txtAmount"
                                                                    FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </FooterTemplate>

                                                        </asp:TemplateField>

                                                         <%--VAT Changes--%>
                                                        <asp:TemplateField HeaderText="Product/Services">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("ProductService")%>' ID="lblProductServices" Width="90px" ToolTip="Product Services"></asp:Label>
                                                                <asp:HiddenField ID="hdnProductServicesId" runat="server" Value='<%#Eval("ProductService_ID") %>' />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:DropDownList ID="ddlProductServicesF" Width="90px"
                                                                        CssClass="md-form-control form-control login_form_content_input" runat="server"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlProductServicesF_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Tax Type" >
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("TaxType")%>' Width="90px" ID="lblTaxType" ToolTip="Product Services"></asp:Label>
                                                                <asp:HiddenField ID="hdnTaxTypeId" runat="server" Value='<%#Eval("TaxType_ID") %>' />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:DropDownList ID="ddlTaxTypeF" Width="90px"
                                                                        CssClass="md-form-control form-control login_form_content_input" runat="server"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlTaxTypeF_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="ITC Applicability" >
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text='<%#Eval("ITCApplicability")%>' Width="90px" ID="lblITCApplicability" ToolTip="ITC Applicability"></asp:Label>
                                                                <asp:HiddenField ID="hdnITCApplicabilityId" runat="server" Value='<%#Eval("ITCApplicability_ID") %>' />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:DropDownList ID="ddlITCApplicabilityF" Width="90px"
                                                                        CssClass="md-form-control form-control login_form_content_input" runat="server">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>



                                                        <%--VAT Changes--%>
                                                        <asp:TemplateField HeaderText="Tax Rate">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtTaxPercentage" runat="server" Text='<%#Bind("TAXPERCENTAGE") %>' ToolTip="Tax Rate" Width="50px"
                                                                    class="md-form-control form-control login_form_content_input requires_true" Enabled="false" Style="text-align: right;"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="ftxtTaxPercentage" Enabled="false" onchange="fnthousands_separators(this,1)" Width="50px" runat="server" ToolTip="Tax Rate" AutoCompleteType="Disabled"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </FooterTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="VAT Amount">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtTaxAmount" runat="server"  Text='<%#Bind("TAXAMOUNT") %>' ToolTip="Tax Amount" Width="70px"
                                                                    class="md-form-control form-control login_form_content_input requires_true" Enabled="false" Style="text-align: right;"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="ftxtTaxAmount" onchange="fnthousands_separators(this,1)" Enabled="false" Width="70px" runat="server" ToolTip="Amount" AutoCompleteType="Disabled"
                                                                        class="md-form-control form-control login_form_content_input requires_true" ></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </FooterTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Tax Applicable" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtTaxApplicable" runat="server" Text='<%#Bind("TAX_APPLICABLE") %>' ToolTip="Tax Amount" Width="70px"
                                                                    class="md-form-control form-control login_form_content_input requires_true" Enabled="false" Style="text-align: right;"></asp:TextBox>
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Total Amt.(Inc. VAT)">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtAmountI" runat="server" Text='<%#Bind("Amount") %>' ToolTip="Total Amt.(Inc. VAT)" Width="70px"
                                                                    class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtAmount" onchange="fnthousands_separators(this,1)" Enabled="false" runat="server" Width="70px" ToolTip="Amount" AutoCompleteType="Disabled"
                                                                        class="md-form-control form-control login_form_content_input requires_true" ></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </FooterTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Action">
                                                            <ItemTemplate>
                                                                <%-- <asp:ImageButton ID="btnRemoveExpense" CommandName="Delete" CausesValidation="false" Height="30px" src="../Images/DeleteImage.png" runat="server" />--%>

                                                                <asp:Button ID="btnRemoveExpense" Text="Delete" ToolTip="Delete,Alt+Y" AccessKey="Y"
                                                                    CommandName="Delete" runat="server" CssClass="grid_btn" CausesValidation="false" />


                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <FooterTemplate>
                                                                <%--<asp:ImageButton ID="btnAddExpense" CommandName="AddNew" OnClick="btnAddExpense_Click" CausesValidation="false" Height="30px" src="../Images/ICOAddImage.png" runat="server" />--%>
                                                                <asp:Button ID="btnAddExpense" Text="Add" ToolTip="Add,Alt+A" AccessKey="A" OnClick="btnAddExpense_Click"
                                                                    CommandName="AddNew" runat="server" CssClass="grid_btn" CausesValidation="false" />
                                                            </FooterTemplate>

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
                            <button class="css_btn_enabled" id="Button1" title="Save[Alt+V]" causesvalidation="false" runat="server" onserverclick="btnSaveModelOTHExpensePop_Click"
                                type="button" accesskey="V">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Sa<u>v</u>e
                            </button>
                            <button class="css_btn_enabled" id="Button2" title="Exit[Alt+T]" causesvalidation="false" onserverclick="btnCloseAddExpenseModelPop_Click" runat="server"
                                type="button" accesskey="T">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exi<u>t</u>
                            </button>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                                    HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Button ID="btnModalOtherExp" Style="display: none" runat="server" />
            </asp:Panel>
        </div>
    </div>
</asp:Content>

