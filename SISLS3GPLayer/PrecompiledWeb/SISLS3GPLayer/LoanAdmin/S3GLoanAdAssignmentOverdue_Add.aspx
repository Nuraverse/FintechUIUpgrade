<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GLoanAdAssignmentOverdue_Add, App_Web_a0fm2otg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%--<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>--%>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UPApprovals" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <%--<td colspan="3">--%>
                                    <asp:Panel ID="pnlHeader" runat="server"
                                        GroupingText="Header Information" CssClass="stylePanel">
                                        <div>
                                            <div class="row">
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtAssignmentNumber" ToolTip="Assignment Number" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                            runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="Assignment Number" ID="Label2" CssClass="styleFieldLabel"
                                                                ToolTip="Assignment Number"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlLOB" runat="server" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" ToolTip="Line of Business" CssClass="md-form-control form-control" AutoPostBack="true">
                                                        </asp:DropDownList>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="RFVddlLOB" runat="server" ControlToValidate="ddlLOB"
                                                                CssClass="styleMandatoryLabel" Display="Dynamic" ErrorMessage="Select the Line of Business" ValidationGroup="Go"
                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <label>
                                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"
                                                                ToolTip="Line of Business"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlBranch" runat="server" class="md-form-control form-control" ToolTip="Branch" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="RFVddlBranch" runat="server" ControlToValidate="ddlBranch"
                                                                CssClass="styleMandatoryLabel" Display="Dynamic" ErrorMessage="Select the Branch" ValidationGroup="Go"
                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <label>
                                                            <asp:Label runat="server" Text="Branch" ID="lblBranch" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlDocumentType" runat="server" CssClass="md-form-control form-control" AutoPostBack="true" ToolTip="Transfer Type"
                                                            OnSelectedIndexChanged="ddlDocumentType_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <div class="validation_msg_box" style="top: 28px !important;">
                                                            <asp:RequiredFieldValidator ID="RFVddlDocumentType" runat="server" ControlToValidate="ddlDocumentType"
                                                                CssClass="styleMandatoryLabel" Display="Dynamic" ErrorMessage="Select the Transfer Type" ValidationGroup="Go"
                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <label>
                                                            <asp:Label ID="lblDocumentType" runat="server" CssClass="styleReqFieldLabel" Text="Transfer Type"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" ToolTip="Customer Name" DispalyContent="Both" class="md-form-control form-control"
                                                            strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                                        <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                            Style="display: none" />
                                                        <asp:TextBox runat="server" ID="txtCustomerName" ToolTip="Customer Name" Visible="false"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <asp:HiddenField ID="hdnCustomerCode" runat="server" />
                                                        <asp:HiddenField ID="hdnCustomerId" runat="server" />
                                                        <asp:HiddenField ID="hdnAccountID" runat="server" />
                                                        <asp:HiddenField ID="hdnToAccountNo" runat="server" />
                                                        <asp:HiddenField ID="hidcuscode" runat="server" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblCode" CssClass="styleReqFieldLabel" Text="Customer Name"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <uc4:ICM ID="ucAccountLov" onblur="fnLoadToAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" Enabled="false" ToolTip="From Account number" DispalyContent="Both" Width="200px"
                                                            strLOV_Code="ACC_ASSIGN" ServiceMethod="GetAccountList" OnItem_Selected="ucAccountLov_Item_Selected" />
                                                        <asp:Button ID="btnLoadAccount" runat="server" Text="From Account number" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                            Style="display: none" />
                                                        <asp:LinkButton ID="lnkViewAccountDetails" runat="server" Text="View Account" CssClass="styleDisplayLabel" AccessKey="V" CausesValidation="false"
                                                            ToolTip="View the account Details, ALT+V" OnClick="lnkViewAccountDetails_Click" Style="color: red; text-underline-position: below;"></asp:LinkButton>
                                                        <asp:TextBox ID="txtCustomerCode" runat="server" Visible="false"></asp:TextBox>
                                                        <asp:TextBox ID="txtCustomerID" runat="server" Visible="false"></asp:TextBox>
                                                        <asp:HiddenField ID="hdnCustId" runat="server" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="From Account number" ID="lblprimeaccno" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="dvodamount" runat="server" visible="false">
                                                    <div class="md-input">
                                                               <asp:TextBox ID="txtODAmount" ToolTip="Account OD" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                            runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label runat="server" Text="Account OD" ID="lblOD" CssClass="styleDisplayLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <uc4:ICM ID="ucaceToAccountNo" onblur="fnLoadToAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" Enabled="false" ToolTip="To Account number" DispalyContent="Both" Width="200px"
                                                            strLOV_Code="ACC_ASSIGNTO" ServiceMethod="GetToAccountList" OnItem_Selected="ucaceToAccountNo_Item_Selected" />
                                                        <asp:Button ID="btnLoadToAccount" runat="server" Text="To Account number" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadToAccount_Click"
                                                            Style="display: none" />
                                                        <asp:LinkButton ID="lnkViewAccountDetailsto" runat="server" Text="View Account" CssClass="styleDisplayLabel" AccessKey="Q" CausesValidation="false"
                                                            ToolTip="View the account Details, ALT+Q" OnClick="lnkViewAccountDetailsto_Click" Style="color: red; text-underline-position: below;"></asp:LinkButton>
                                                        <%--<UC:Suggest ID="aceToAccountNo" runat="server" ServiceMethod="GetAccountList" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" />--%>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="To Account number" ToolTip="To Account number" ID="lblToAccountNo1" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="display: none;">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtFromDate" ToolTip="From date" runat="server" AutoPostBack="true" OnTextChanged="txtFromDate_Changed" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalendarExtenderFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                            runat="server" Enabled="True" TargetControlID="txtFromDate">
                                                        </cc1:CalendarExtender>
                                                        <label>
                                                            <asp:Label runat="server" ToolTip="From date" Text="From Date" ID="lblFromDate" CssClass="styleFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="display: none;">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtToDate" ToolTip="To date" runat="server" AutoPostBack="true" OnTextChanged="txtToDate_Changed" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalendarExtenderToDate" runat="server" Enabled="True"
                                                            TargetControlID="txtToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                        </cc1:CalendarExtender>
                                                        <label>
                                                            <asp:Label runat="server" ToolTip="To date" Text="To Date" ID="lblToDate" CssClass="styleFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div align="right" style="margin-top: 15px;">
                                            <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Go" runat="server"
                                                type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                            </button>
                                        </div>
                                        <%-- <div>
                                        <asp:Button ID="btnGo" CssClass="styleSubmitShortButton" runat="server"
                                            Text="Go" OnClick="btnGo_Click" ValidationGroup="btnGo"
                                            AccessKey="G" ToolTip="Go to the Details, Alt+G" />
                                    </div>--%>
                                    </asp:Panel>
                                    <%--</td>--%>
                                    <%--                 <tr>
                                    <td width="49%" valign="top">--%>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel ID="pnlAccountDetails" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Account Details">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                <%--  <div class="row">--%>
                                                <asp:Panel ID="pnlFromAccount" ScrollBars="None" runat="server" CssClass="stylePanel" Height="250px" GroupingText="From Account Details" Visible="false">

                                                    <%--<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 grid">--%>
                                                    <asp:GridView ID="grvFromAccount" runat="server" AutoGenerateColumns="False" Width="100%" EmptyDataText="No Records Found"
                                                        CssClass="styleInfoLabel" OnRowDataBound="OnRowDataBound" class="gird_details">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="SNo">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSlno" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="left" Width="3%" />
                                                            </asp:TemplateField>
                                                            <%--<asp:TemplateField HeaderText="Customer Name" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblApprovalSNO" Text='<%# Bind("Customer_ID")%>' runat="server" Visible="false"></asp:Label>
                                                            <asp:Label ID="lblEntity" runat="server" Text='<%# Bind("Customer_Name") %>' ToolTip="Customer Name"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="left" Width="15%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblFromAccountNos" Text='<%# Bind("Account_No")%>' runat="server" Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="left" />
                                                    </asp:TemplateField>--%>
                                                            <%--         <asp:TemplateField HeaderText="Assign" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAssign" runat="server" Text='<%# Bind("Cashflow_Flag_Id") %>'
                                                                ToolTip="Assign" Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>--%>
                                                            <asp:TemplateField HeaderText="Cash Flow Flag">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblOver_DUE" runat="server" Text='<%# Bind("Cashflowflag_Desc") %>'
                                                                        ToolTip="Cash Flow Flag"></asp:Label>
                                                                    <asp:Label ID="lblCashflow_Flag_Id" runat="server" Text='<%# Bind("Cashflow_Flag_Id") %>'
                                                                        ToolTip="Cash Flow Flag" Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                                <%-- <ItemStyle HorizontalAlign="Center" />--%>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Installment No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInstallmentNos" runat="server" Text='<%# Bind("Installment") %>'
                                                                        ToolTip="Over Due"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInstallmentDate" runat="server" Text='<%# Bind("Installment_Date") %>'
                                                                        ToolTip="Date"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Amount">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInstallmentAmount" runat="server" Text='<%# Bind("Amount") %>'
                                                                        ToolTip="Amount"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Allocated Amount">
                                                                <ItemTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtAmount" runat="server" ToolTip="Allocated Amount" Width="115px" onkeypress="fnAllowNumbersOnly(true,false,this)" Text='<%# Bind("Allocated")%>'
                                                                            Style="text-align: right" MaxLength="14" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender42" runat="server" TargetControlID="txtAmount"
                                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Select">
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged"
                                                                        Text="Select" ToolTip="Select" />
                                                                </HeaderTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelect" runat="server" OnCheckedChanged="chkSelect_CheckedChanged" AutoPostBack="true" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <%--</div>--%>
                                                </asp:Panel>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 grid">
                                                <asp:Panel ID="pnlTransaction" ScrollBars="None" runat="server" CssClass="stylePanel" Height="250px" GroupingText="To Account Details" Visible="false">


                                                    <asp:GridView ID="gvTransaction" runat="server" AutoGenerateColumns="False" Width="100%" EmptyDataText="No Records Found"
                                                        CssClass="styleInfoLabel" OnRowDataBound="gvTransaction_RowDataBound" class="gird_details">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="SNo">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSlno" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="left" Width="3%" />
                                                            </asp:TemplateField>
                                                            <%--  <asp:TemplateField HeaderText="Account No" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblToAccount_No" runat="server" Text='<%# Bind("Account_No") %>' ToolTip="Account No"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="left" />
                                                    </asp:TemplateField>--%>
                                                            <asp:TemplateField HeaderText="Installment No" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblToInstallment" Text='<%# Bind("Installment")%>' runat="server"></asp:Label>
                                                                    <asp:Label ID="lblToCashflow_Flag_Id" runat="server" Text='<%# Bind("Cashflow_Flag_Id") %>'
                                                                        ToolTip="Cash Flow Flag" Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblToInstallmentDate" runat="server" Text='<%# Bind("Installment_Date") %>'
                                                                        ToolTip="Date"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblToAmount" runat="server" Text='<%# Bind("Amount") %>'
                                                                        ToolTip="Amount"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Allocated Amount">
                                                                <ItemTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtAmount" runat="server" ToolTip="Allocated Amount" Width="115px" onkeypress="fnAllowNumbersOnly(true,false,this)" Text='<%# Bind("Allocated")%>'
                                                                            Style="text-align: right" MaxLength="14" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender42" runat="server" TargetControlID="txtAmount"
                                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Select">
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="chkAllTrans" runat="server" AutoPostBack="true" OnCheckedChanged="chkAllTrans_CheckedChanged"
                                                                        Text="Select" ToolTip="Select" />
                                                                </HeaderTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkTrans" runat="server" OnCheckedChanged="chkTrans_CheckedChanged" AutoPostBack="true" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>


                                                </asp:Panel>
                                            </div>

                                        </div>
                                    </asp:Panel>
                                </div>

                            </div>
                        </div>

                    </div>
                    <div align="right" class="fixed_btn">
                        <button class="css_btn_disabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" validationgroup="Save" runat="server" onserverclick="btnSave_Click"
                            type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                            onserverclick="btnClear_Click"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>
                    <%-- <tr>
                    <td colspan="3">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                        <asp:Button runat="server" ID="btnSave" Enabled="false" ValidationGroup="btnSave" Text="Save"
                            CssClass="styleSubmitButton" OnClick="btnSave_Click" OnClientClick="return fnCheckPageValidators();" ToolTip="Save the Details, Alt+S" AccessKey="S" />
                        <input type="hidden" value="0" runat="server" id="hdnID1" />
                        <asp:Button runat="server" ID="btnClear" Text="Clear"
                            CssClass="styleSubmitButton" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" ToolTip="Clear the Details, Alt+L" AccessKey="L" />
                        &nbsp;
                        <asp:Button runat="server" ID="btnCancel" Text="Exit" OnClick="btnCancel_Click" CausesValidation="false"
                            CssClass="styleSubmitButton" ToolTip="Exit the Details, Alt + X" AccessKey="X" OnClientClick="return fnConfirmExit();" />
                    </td>
                </tr>--%>

                    <div style="display: none">
                        <asp:ValidationSummary ValidationGroup="btnGo" ID="ValidationSummary4" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                        <asp:HiddenField ID="hdnrow" runat="server" />
                        <asp:ValidationSummary ValidationGroup="btnSave" ID="ValidationSummary1" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:ValidationSummary ValidationGroup="btnCust" ID="VSPayTo" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                    </div>

                </div>
            </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">
        function fnLoadCustomer() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }
        function fnLoadToAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadToAccount').click();
        }

        function fnTrashCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
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

        function fnTrashCommonFromAccSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
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

        function fnTrashCommonToAccSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
            }
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                //alert('test1');
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=ucaceToAccountNo.ClientID %>').value = "";

            }
            if (document.getElementById(e + '_TxtName').value == "") {
                //alert('test2');
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=ucaceToAccountNo.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {
                //alert('test3');
                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    //alert('test4');
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + 'ucaceToAccountNo').value = "0";
                    document.getElementById('<%=ucCustomerCodeLov.ClientID %>').value = "";
                }
            }
        }

    </script>
</asp:Content>

