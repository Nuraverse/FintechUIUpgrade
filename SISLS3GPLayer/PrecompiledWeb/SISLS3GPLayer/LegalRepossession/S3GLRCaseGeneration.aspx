<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LegalRepossession_S3GLRCaseGeneration, App_Web_prpaho0u" %>

<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc3" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="IMC" TagPrefix="uc5" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .grid_btn_delete_disabled {
            font-size: 12px !important;
            font-weight: 400;
            padding: 3px 10px;
            text-align: center;
            color: #bab0b0 !important;
            border: 1px #c6c2c2 solid;
            border-radius: 5px;
            text-decoration: none;
            box-shadow: none;
            cursor: pointer;
        }
    </style>


    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <cc1:TabContainer ID="tcCaseGeneration" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                            Visible="true">
                            <cc1:TabPanel runat="server" ID="tbFIR" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    ROP Case Filing
                                
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <div class="row" style="margin-top: 10px;">
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlLOB" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                        runat="server" AutoPostBack="True" class="md-form-control form-control">
                                                    </asp:DropDownList>

                                                    <div class="validation_msg_box">
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblLOB" runat="server" CssClass="styleDisplayLabel" Text="Line of Business"></asp:Label>

                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlBranch" ToolTip="Branch" runat="server" class="md-form-control form-control"
                                                        AutoPostBack="True" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblBranch" runat="server" CssClass="styleDisplayLabel" Text="Branch"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                        strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" IsMandatory="true" ErrorMessage="Select Customer" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />

                                                    <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="False" UseSubmitBehavior="False" OnClick="btnLoadCust_Click"
                                                        Style="display: none" />
                                                    <asp:Button ID="btncust" runat="server" CausesValidation="False" UseSubmitBehavior="False" OnClick="btncust_Click"
                                                        Style="display: none" />
                                                    <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code"></asp:TextBox>
                                                    <asp:LinkButton ID="lnkViewCustomerDetails" runat="server" Text="View Customer" CssClass="styleDisplayLabel" Enabled="False" AccessKey="C"
                                                        Visible="False" ToolTip="View the Customer Details, ALT+C" OnClick="lnkViewCustomerDetails_Click"></asp:LinkButton>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblCustomerName" CssClass="styleReqFieldLabel" runat="server" Text="Customer Name/Code"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divCEO" runat="server" visible="False">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtCEO" ContentEditable="false" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblCEO" runat="server" CssClass="styleReqFieldLabel" Text="CEO Name"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlLitigation" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLitigation_SelectedIndexChanged" class="md-form-control form-control"></asp:DropDownList>

                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvLitigation" runat="server" ControlToValidate="ddlLitigation"
                                                            SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select the Litigation Type"
                                                            ValidationGroup="ROP Case Filing"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblLitigation" runat="server" CssClass="styleReqFieldLabel" Text="Litigation Type"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtCaseCode" runat="server" ToolTip="Case Code" ReadOnly="True"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblCaseCode" runat="server" CssClass="styleDisplayLabel" Text="Case Code"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" style="display: none;">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtAmtROP" runat="server" ToolTip="Addl.Amt.Filed With ROP"
                                                        class="md-form-control form-control login_form_content_input requires_true" ReadOnly="True"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblAmtROP" runat="server" CssClass="styleDisplayLabel" Text="Addl.Amt.Filed With ROP"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div style="display: none" class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlROPCasetype" ToolTip="ddlROPCasetype" runat="server" class="md-form-control form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlROPCasetype_SelectedIndexChanged"></asp:DropDownList>
                                                    <%-- <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlROPCasetype" runat="server" ControlToValidate="ddlROPCasetype"
                                                            SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select the Case Type"
                                                            ValidationGroup="ROP Case Filing"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>--%>
                                                    <label>
                                                        <asp:Label ID="lblCasetype" runat="server" CssClass="styleReqFieldLabel" Text="Case Type"></asp:Label>

                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <uc2:Suggest ID="ucCaseCode" ToolTip="Old Case" ErrorMessage="Select the Case Code"
                                                        runat="server" ServiceMethod="GetClosedCase" class="md-form-control form-control" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblOldCaseCode" runat="server" CssClass="styleDisplayLabel" Text="Old Case Code"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <button class="css_btn_enabled" id="btnFetch" onserverclick="btnFetch_Click" runat="server"
                                                        type="button" causesvalidation="False" accesskey="F" title="Fetch,Alt+F">
                                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>F</u>etch
                                                    </button>
                                                </div>
                                            </div>

                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                <asp:Panel GroupingText="Customer Communication Address" ID="pnlCommAddress" runat="server"
                                                    Visible="False" CssClass="stylePanel">
                                                    <asp:Button ID="btnLoadCustomer" runat="server" OnClick="btnLoadCustomer_OnClick"
                                                        Style="display: none;" Text="Load Customer" CausesValidation="False" />
                                                    <uc1:S3GCustomerAddress ID="S3GCustomerAddress1" runat="server" FirstColumnStyle="styleFieldLabel"
                                                        FirstColumnWidth="20%" SecondColumnWidth="30%" ThirdColumnWidth="18%" FourthColumnWidth="32%"
                                                        ActiveViewIndex="1" />
                                                    <asp:Label ID="lblCustomerID" runat="server" Visible="False"></asp:Label>
                                                </asp:Panel>
                                            </div>

                                        </div>
                                        <div class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="Panel5" runat="server" GroupingText="Account Details"
                                                CssClass="stylePanel" Width="100%">
                                                <asp:GridView Width="100%" ID="grdActDetails" runat="server" class="gird_details" ShowHeaderWhenEmpty="True"
                                                    AutoGenerateColumns="False" EmptyDataText="No records found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Account Number">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblACNum" Text='<%#Eval("PANUM") %>'></asp:Label>
                                                                <asp:Label runat="server" ID="lblPASAID" Visible="false" Text='<%#Eval("pa_sa_ref_id") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Line Of Business">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblACLOB" Text='<%#Eval("LOB_NAME") %>'></asp:Label>
                                                                <asp:Label runat="server" ID="lblACLOBID" Text='<%#Eval("LOB_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Branch">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblACBranch" Text='<%#Eval("LOCATIONCAT_DESCRIPTION") %>'></asp:Label>
                                                                <asp:Label runat="server" ID="lblACBranchID" Text='<%#Eval("LOCATION_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Authorized Sign">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblAuthSign" Text='<%#Eval("AUTHORIZED_SIGN") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Guarantor">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblGuarantor" Text='<%#Eval("Guar") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Select">
                                                            <ItemTemplate>
                                                                <asp:CheckBox runat="server" AutoPostBack="true" OnCheckedChanged="chkbxSelect_CheckedChanged" ID="chkbxSelect" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>

                                                </asp:GridView>
                                                <p style="text-align: right;">
                                                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" visible="False" runat="server"
                                                        type="button" causesvalidation="False" accesskey="G" title="Go,Alt+G">
                                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                    </button>
                                            </asp:Panel>
                                        </div>

                                        <div class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel GroupingText="Account Dues" ID="pnlAccDues" runat="server" CssClass="stylePanel" Width="100%">
                                                <asp:GridView ID="grdAccountDues" runat="server" AutoGenerateColumns="False" OnRowDataBound="grdAccountDues_RowDataBound" EmptyDataText="No records found" ShowHeaderWhenEmpty="True"
                                                    class="gird_details" OnRowCommand="grdAccountDues_RowCommand">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Finance Amount">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblFinAmt" Text='<%#Eval("FINANCE_AMOUNT") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Installment Over Due">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblODAmt" Text='<%#Eval("INSTALMENT_OVERDUE_AMT") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Other Over Due">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblOtherOverDue" Text='<%#Eval("OTHER_OVERDUE_AMT") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Future Due">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblFDAmt" Text='<%#Eval("FUTURE_DUE") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Penal Interest">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblPInt" Text='<%#Eval("PENAL_INTEREST") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Cheque Return Charges">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="lblCRChrgs" Text='<%#Eval("CHQ_RTN_CHARGES") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:LinkButton runat="server" ID="lnkbtnSOA" ForeColor="#00cc00" Text="SOA" CommandName="SOA" CommandArgument='<%#Eval("PA_SA_REF_ID") +"-"+Eval("LOB") %>'></asp:LinkButton>
                                                                <asp:Label runat="server" Visible="false" ID="lblPASAREFID" Text='<%#Eval("PA_SA_REF_ID") %>'></asp:Label>
                                                                <asp:Label runat="server" Visible="false" ID="lblLOB" Text='<%#Eval("LOB") %>'></asp:Label>

                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <div align="center" style="display: none;">
                                                    <button class="css_btn_enabled" id="btnSOA" onserverclick="btnSOA_Click" runat="server"
                                                        type="button" accesskey="O" causesvalidation="False" title="Statement Of Accounts[Alt+O]">
                                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;S<u>O</u>A
                                                    </button>
                                                </div>
                                            </asp:Panel>
                                        </div>



                                        <div class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlChequeDetails" runat="server" GroupingText="Cheque Return Details"
                                                CssClass="stylePanel" Width="100%">
                                                <asp:HiddenField ID="hdnChqRequestValidation" runat="server" />
                                                <asp:HiddenField ID="hdnChqReturnDateValidation" runat="server" />
                                                <asp:Label runat="server" ID="lblNoRec"></asp:Label>
                                                <div class="gird">
                                                    <asp:GridView Width="100%" ID="gvGuarDetails" runat="server" class="gird_details" EmptyDataText="No records found"
                                                        AutoGenerateColumns="False" OnRowDataBound="gvGuarDetails_RowDataBound"
                                                        OnRowCommand="gvGuarDetails_RowCommand" ShowHeaderWhenEmpty="True">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Receipt Number" DataField="Receipt_No" />
                                                            <asp:TemplateField HeaderText="Instrument Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInstrumentNumber" runat="server" Text='<%#Eval("Instrument_No")%>'></asp:Label>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Instrument Date" DataField="Instrument_Date" />
                                                            <%--   <asp:BoundField HeaderText="Cheque Return Date" DataField="Cheque_Rtn_Date" />--%>
                                                            <asp:TemplateField HeaderText="Cheque Return Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblChequeReturnDate" runat="server" Text='<%#Eval("Cheque_Rtn_Date")%>'></asp:Label>
                                                                    <asp:Label ID="lblCHQVALIDITY" Visible="false" runat="server" Text='<%#Eval("CHQ_VALIDITY")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Cheque Amount" DataField="Amount">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="Drawee Bank & Place" DataField="Bank_Place" />
                                                            <asp:BoundField HeaderText="Rental/Supplimentary" DataField="Rental_Supplier" />
                                                            <asp:BoundField HeaderText="Debt Collector Name" DataField="Debt_Collector_Name" />
                                                            <asp:BoundField HeaderText="Reason for Cheque Return" DataField="Reason" />

                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <asp:Label Text="Select" runat="server" ID="lblsel" />
                                                                    <%--  <asp:CheckBox ID="chkSelectAll" ToolTip="Select All" runat="server" />--%>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelect" AutoPostBack="true" OnCheckedChanged="chkSelect_CheckedChanged" ToolTip="Select" runat="server" />

                                                                </ItemTemplate>

                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <asp:Label Text="View" runat="server" ID="lblHView" />
                                                                    <%--  <asp:CheckBox ID="chkSelectAll" ToolTip="Select All" runat="server" />--%>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Button ID="BtnChqView" ToolTip="View Cheque return" CausesValidation="false" runat="server" OnClick="lnkbtnIView_Click" Text="View" CssClass="grid_btn"></asp:Button>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="ChequeReturnID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblChequeReturnID" runat="server" Text='<%#Eval("CHEQUE_RETURN_ID")%>'></asp:Label>
                                                                    <asp:Label ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>
                                                                    <asp:Label ID="lblVAULTSTATUS" runat="server" Visible="false" Text='<%#Eval("VAULT_STATUS")%>'></asp:Label>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                        <div class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlPdcdtls" runat="server" GroupingText="PDC Details"
                                                CssClass="stylePanel" Width="98.5%">

                                                <asp:Label runat="server" ID="Label2"></asp:Label>
                                                <div class="gird">
                                                    <asp:GridView Width="100%" ID="grvPdcdtls" runat="server" class="gird_details" EmptyDataText="No records found"
                                                        AutoGenerateColumns="False" OnRowDataBound="grvPdcdtls_RowDataBound"
                                                        OnRowCommand="grvPdcdtls_RowCommand" ShowHeaderWhenEmpty="True">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Account Number" DataField="ACCOUNT_NO" />
                                                            <asp:TemplateField HeaderText="Instrument Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInstrumentNumber" runat="server" Text='<%#Eval("Instrument_No")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Instrument Date" DataField="Instrument_Date" />
                                                            <asp:BoundField HeaderText="Cheque Amount" DataField="Amount">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="Drawee Bank And Place" DataField="Bank_Place" />
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <asp:Label Text="Select" runat="server" ID="lblsel" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelect" ToolTip="Select" runat="server" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <%--                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:Label Text="View" runat="server" ID="lblHView" />
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BtnChqView" ToolTip="View Cheque return" runat="server" OnClick="lnkbtnIView_Click" Text="View" CssClass="grid_btn"></asp:Button>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>--%>
                                                            <asp:TemplateField HeaderText="ChequeReturnID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblChequeReturnID" runat="server" Text='<%#Eval("CHEQUE_RETURN_ID")%>'></asp:Label>
                                                                    <%--                                                                        <asp:Label ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>
                                                                        <asp:Label ID="lblVAULTSTATUS" runat="server" Visible="false" Text='<%#Eval("VAULT_STATUS")%>'></asp:Label>--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                        <div class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlOverdue" runat="server" GroupingText="Over Due Details"
                                                CssClass="stylePanel" Width="100%">
                                                <div class="gird">
                                                    <asp:GridView ID="grvOverDues" runat="server" AutoGenerateColumns="False" class="gird_details" EmptyDataText="No records found" ShowHeaderWhenEmpty="True"
                                                        Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>

                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Installment Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblODInstallment_Date" runat="server" Text='<%#Eval("INSTALLMENTDATE") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Amount">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblODAmount" runat="server" Text='<%#Eval("INSTALLMENTAMOUNT") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Installment Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblODInsNo" runat="server" Text='<%#Eval("INSTALLMENT_NO") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                        <div class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlOverDueInvoices" runat="server" GroupingText="Over Due Invoices"
                                                CssClass="stylePanel" Width="100%">
                                                <div class="gird">
                                                    <asp:GridView ID="grvOverDueInvoices" runat="server" OnRowDataBound="grvOverDueInvoices_RowDataBound" AutoGenerateColumns="False" class="gird_details" EmptyDataText="No records found" ShowHeaderWhenEmpty="True"
                                                        Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Batch Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBatchNumber" runat="server" Text='<%#Eval("BatchNumber") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Invoice Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInvoiceNumber" runat="server" Text='<%#Eval("InvoiceNumber") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Invoice Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInvoiceDate" runat="server" Text='<%#Eval("InvoiceDate") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Select">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox runat="server" ID="chkbxSelect" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false" HeaderText="Load Id">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFACTORINGINVLOADID" Visible="false" runat="server" Text='<%#Eval("FACTORING_INV_LOAD_ID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="false" HeaderText="Load Details Id">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFACTORINGINVLOADDETAILSID" Visible="false" runat="server" Text='<%#Eval("FACTORING_INV_LOAD_DETAILS_ID") %>'></asp:Label>
                                                                    <asp:Label ID="lblFACTORINGINVLOADDTTRNID" Visible="false" runat="server" Text='<%#Eval("FACTORING_INV_LOAD_DT_TRN_ID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                        </div>


                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="ROP Details" ID="pnlFIRDetails" runat="server"
                                                    CssClass="stylePanel" Width="100%">
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFIRNumber" runat="server" ToolTip="ROP Number" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftFIRNumber" runat="server" TargetControlID="txtFIRNumber"
                                                                    FilterType="Numbers, UppercaseLetters, LowercaseLetters" Enabled="True" />
                                                                <%-- <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvtxtFIRNumber" runat="server" ControlToValidate="txtFIRNumber"
                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the ROP Number"
                                                                        ValidationGroup="ROP Case Filing"></asp:RequiredFieldValidator>
                                                                </div>--%>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFIRNUMBER" runat="server" CssClass="styleDisplayLabel" Text="ROP Number"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <uc2:Suggest ID="ucFIRLocation" ToolTip="ROP Location" runat="server" ServiceMethod="GetROPLocation"
                                                                    class="md-form-control form-control" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFIRLocation" runat="server" CssClass="styleDisplayLabel" Text="ROP Location"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFIRDate" runat="server" ToolTip="ROP Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="calFIRDate" runat="server" Enabled="True" TargetControlID="txtFIRDate"></cc1:CalendarExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvROPDate" runat="server" ControlToValidate="txtFIRDate" Enabled="False"
                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the ROP Date"
                                                                        ValidationGroup="ROP Case Filing"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFIRDate" runat="server" Text="ROP Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtROPClnDate" autoComplete="off"
                                                                    runat="server" ToolTip="ROP Collection Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="calROPClnDt" runat="server" Enabled="True" TargetControlID="txtROPClnDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblROPCollectionDt" runat="server" CssClass="styleDisplayLabel" Text="ROP Collection Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlFIRStatus" runat="server" class="md-form-control form-control"></asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvFIRStatus" runat="server" ControlToValidate="ddlFIRStatus" Enabled="False"
                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the ROP Status"
                                                                        ValidationGroup="ROP Case Filing" InitialValue="0"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFIRSatus" runat="server" Text="ROP Status"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtClosedDate" runat="server" ToolTip="FIR Closed Date" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                <cc1:CalendarExtender ID="calFIRClosedDate" runat="server" Enabled="True" TargetControlID="txtClosedDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblClosedDate" runat="server" CssClass="styleDisplayLabel" Text="ROP Closed Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFIRStatement" runat="server" ToolTip="ROP File Statement Details" TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true" onkeyup="maxlengthfortxt(200)"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFIRStatement" runat="server" CssClass="styleDisplayLabel" Text="ROP File Statement"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFIRRemarks" runat="server" ToolTip="ROP Remarks" TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true lowercase" onkeyup="maxlengthfortxt(200)"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>

                                                                <label>
                                                                    <asp:Label ID="lblFIRRemarks" runat="server" CssClass="styleDisplayLabel" Text="ROP Remarks"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCaseAmount" runat="server" ToolTip="Case Amount" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="flttxtCaseAmount" runat="server" TargetControlID="txtCaseAmount"
                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvtxtCaseAmount" runat="server" ControlToValidate="txtCaseAmount"
                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the ROP Date"
                                                                        ValidationGroup="ROP Case Filing"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCaseAmount" runat="server" CssClass="styleReqFieldLabel" Text="Case Amount"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCaseFilledAgainst" onkeyup="maxlengthfortxt(100);" runat="server" ToolTip="Case Filled Against" MaxLength="100" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCaseFilledAgainst" runat="server" CssClass="styleDisplayLabel" Text="Case Filled Against"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtAdditionalAmountFiledWithROP" runat="server" ToolTip="Case Filled Against" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="flttxtAdditionalAmountFiledWithROP" runat="server" TargetControlID="txtAdditionalAmountFiledWithROP"
                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblAdditionalAmountFiledWithROP" runat="server" CssClass="styleDisplayLabel" Text="Additional Amount Filed With ROP"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <button class="css_btn_enabled" id="btnUploadROPDocuments" onserverclick="btnUploadROPDocuments_ServerClick" runat="server"
                                                                type="button" accesskey="V" causesvalidation="False" title="Upload[Alt+V]">
                                                                <i class="fa fa-upload" aria-hidden="true"></i>&emsp;<u>U</u>pload
                                                            </button>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                                                <asp:Panel GroupingText="Summon Details" ID="PnlSummon" runat="server"
                                                    CssClass="stylePanel" Width="100%">
                                                    <div class="gird">
                                                        <asp:GridView Width="100%" ID="grvSummonDetail" runat="server" AutoGenerateColumns="False" OnRowCommand="grvSummonDetail_RowCommand"
                                                            OnRowDataBound="grvSummonDetail_RowDataBound" OnRowDeleting="grvSummonDetail_RowDeleting" ShowFooter="True" class="gird_details">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="S.No.">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="2%" HorizontalAlign="Center" />

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Summon No">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtSummonNo" runat="server" Text='<%# Eval("SummonNo") %>' ContenetEditable="false" MaxLength="50"
                                                                            ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtFSummonNo" runat="server" Text='<%# Eval("SummonNo") %>' MaxLength="50" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="ftSummonNo" runat="server" TargetControlID="txtFSummonNo" FilterType="Numbers" Enabled="true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Center" Width="15%" />
                                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Summon Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSummonDate" runat="server" Text='<%# Eval("Summon_Date") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtSummonFDate" runat="server" Text='<%# Eval("Summon_Date") %>' CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <cc1:CalendarExtender ID="calSummonDate" runat="server" Enabled="True" TargetControlID="txtSummonFDate">
                                                                            </cc1:CalendarExtender>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>

                                                                    </FooterTemplate>
                                                                    <ItemStyle Width="9%" HorizontalAlign="Center" />
                                                                    <FooterStyle Width="9%" HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Summon Details">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtSummonDetails" runat="server" Text='<%# Eval("SummonRemarks") %>' TextMode="MultiLine"
                                                                            ReadOnly="true"
                                                                            ContenetEditable="false" onkeyup="maxlengthfortxt(200)" CssClass="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                    </ItemTemplate>

                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtFSummonDetails" runat="server" Text='<%# Eval("SummonRemarks") %>' TextMode="MultiLine" onkeyup="maxlengthfortxt(200)" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <asp:Label runat="server" ID="lblSMod" Text='<%# Eval("Mod") %>' Visible="false"></asp:Label>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="false" CommandName="Delete" Text="Delete" CssClass="grid_btn_delete"
                                                                            OnClientClick="return confirm('Do you want to Delete this record?');" AccessKey="K" ToolTip="Delete[Alt+Shift+K]">
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <%--        <asp:Button ID="btnSummonAdd" runat="server" CommandName="Add" CssClass="styleGridShortButton"
                                                                        Text="Add" ValidationGroup="SummonGrid" ToolTip="Add,Alt+T" AccessKey="T" />--%>
                                                                        <button class="css_btn_enabled" id="btnSummonAdd" title="Add,Alt+A" onserverclick="btnSummonAdd_ServerClick" runat="server"
                                                                            type="button" accesskey="A" validationgroup="Add">
                                                                            <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                                        </button>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Center" Width="10%" />
                                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <EditRowStyle CssClass="styleFooterInfo" />
                                                        </asp:GridView>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="display: none" class="col">
                                        <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="False" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" />
                                        <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="False" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" />
                                    </div>

                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="tbCourt" Visible="false" runat="server" HeaderText="tbCourt">
                                <HeaderTemplate>
                                    Court Case Details                                
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="Court Details" ID="Panel4" runat="server"
                                                    CssClass="stylePanel" Width="100%">
                                                    <div class="row">

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCaseCourtNumber" runat="server" ToolTip="Court Case Number" MaxLength="20"
                                                                    AutoPostBack="true" OnTextChanged="txtCaseCourtNumber_TextChanged"
                                                                    class="md-form-control form-control"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftCaseCourtNumber" runat="server" TargetControlID="txtCaseCourtNumber"
                                                                    FilterType="Numbers,UppercaseLetters,LowerCaseLetters" Enabled="true" />
                                                                <div class="validation_msg_box">
                                                                    <%--<asp:RequiredFieldValidator ID="rfvCasecourtNumber" runat="server" ControlToValidate="txtCaseCourtNumber" Enabled="False"
                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter court case number"
                                                                        ValidationGroup="ROP Case Filing"></asp:RequiredFieldValidator>--%>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCourtCaseNumber" runat="server" CssClass="styleDisplayLabel" Text="Court Case Number"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlcourtlev" runat="server" ToolTip="Court Level" AutoPostBack="true"
                                                                    OnSelectedIndexChanged="ddlcourtlev_SelectedIndexChanged" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <asp:Label runat="server" ID="lblMCourtLevel" Visible="false"></asp:Label>
                                                                <span class="highlight"></span><span class="bar"></span>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCourtlevel" runat="server" ControlToValidate="ddlcourtlev" Enabled="False"
                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select Court level"
                                                                        ValidationGroup="ROP Case Filing"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Court Level" ID="lblcourtlev" CssClass="styleReqFieldLabel"></asp:Label></label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlcourttype" runat="server" ToolTip="Court Type" AutoPostBack="true" autoComplete="Off"
                                                                    OnSelectedIndexChanged="ddlcourttype_SelectedIndexChanged" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <asp:Label runat="server" ID="lblMCourtType" Visible="false"></asp:Label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCourtType" runat="server" ControlToValidate="ddlcourttype" Enabled="False" InitialValue="0"
                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Court type"
                                                                        ValidationGroup="ROP Case Filing"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span><span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Court Type" ID="lblcourttype" CssClass="styleReqFieldLabel"></asp:Label></label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlCourtBranch" ToolTip="Court Branch" runat="server" class="md-form-control form-control">
                                                                </asp:DropDownList>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCourtBranch" runat="server" CssClass="styleReqFieldLabel" Text="Court Branch"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCourtBranch" runat="server" ControlToValidate="ddlCourtBranch" Enabled="False"
                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Court Branch"
                                                                        ValidationGroup="ROP Case Filing"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCaseFiledDate" runat="server" ToolTip="Case File Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="calCaseFileDate" runat="server" Enabled="True" TargetControlID="txtCaseFiledDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCaseFiledDate" runat="server" CssClass="styleDisplayLabel" Text="Case Filed Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCaseChargeAmt" runat="server" ToolTip="Case Charges Amount" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftCaseChargeAmt" runat="server" TargetControlID="txtCaseChargeAmt"
                                                                    FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCaseCharges" runat="server" CssClass="styleDisplayLabel" Text="Case Charges Amount"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCaseAmt" AutoPostBack="true" OnTextChanged="txtCaseAmt_TextChanged" runat="server" ToolTip="Case Amount" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCaseamount" runat="server" ControlToValidate="txtCaseAmt"
                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter case amount"
                                                                        ValidationGroup="ROP Case Filing"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <cc1:FilteredTextBoxExtender ID="ftCaseAmt" runat="server" TargetControlID="txtCaseAmt"
                                                                    FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCaseAmt" runat="server" CssClass="styleDisplayLabel" Text="Case Amount"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCourtAmt" runat="server" ToolTip="Additional Court Order Amount" MaxLength="20"
                                                                    class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftCourtAmt" runat="server" TargetControlID="txtCourtAmt"
                                                                    FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCourtAmt" runat="server" CssClass="styleDisplayLabel" Text="Additional Court Order Amount"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlCaseStatus" OnSelectedIndexChanged="ddlCaseStatus_SelectedIndexChanged" class="md-form-control form-control login_form_content_input requires_true"
                                                                    runat="server" AutoPostBack="True">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCaseStatus" runat="server" ControlToValidate="ddlCaseStatus" Enabled="False" InitialValue="0"
                                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Case status"
                                                                        ValidationGroup="ROP Case Filing"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCaseStatus" runat="server" CssClass="styleDisplayLabel" Text="Case Status"></asp:Label>

                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCaseClosedDate" runat="server" ToolTip="Case Closed Date" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="calCaseClosedDate" runat="server" Enabled="True" TargetControlID="txtCaseClosedDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCaseCaseCloseDate" runat="server" CssClass="styleDisplayLabel" Text="Case Closed Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="Lawyer Details" ID="Panel3" runat="server"
                                                    CssClass="stylePanel" Width="100%">
                                                    <div class="row">

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">

                                                                <uc2:Suggest ID="ddlAdvocate" ToolTip="Lawyer" ErrorMessage="Select the Lawyer" runat="server"
                                                                    ValidationGroup="ROP Case Filing" ServiceMethod="GetLawyerDetails"
                                                                    class="md-form-control form-control" />
                                                                <asp:HiddenField ID="hdnInternalLawyer" runat="server" />
                                                                <%-- <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlAdvocate" runat="server" ControlToValidate="ddlAdvocate" Enabled="false"
                                                            SetFocusOnError="true" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select the Lawyer"
                                                            ValidationGroup="Court Case Details"></asp:RequiredFieldValidator>
                                                    </div>--%>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblAdvocate" runat="server" CssClass="styleReqFieldLabel" Text="Lawyer"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLawyerDate" runat="server" ToolTip="Lawyer Effective Date"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="calLEDate" runat="server" Enabled="True" TargetControlID="txtLawyerDate">
                                                                </cc1:CalendarExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvLawyerdate" runat="server" ControlToValidate="txtLawyerDate" Enabled="false"
                                                                        SetFocusOnError="true" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the Lawyer"
                                                                        ValidationGroup="ROP Case Filing"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lbllawyerdate" runat="server" CssClass="styleReqFieldLabel" Text="Lawyer Effective Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLawyerFee" runat="server" ToolTip="Lawyer Fee" MaxLength="10" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="fteLawyerFee" runat="server" TargetControlID="txtLawyerFee"
                                                                    FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLawyerFee" runat="server" CssClass="styleDisplayLabel" Text="Lawyer Fee"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div align="center" style="display: none;">
                                                            <button class="css_btn_enabled" id="btnHearingDetails" onserverclick="btnHearingDetails_Click" runat="server"
                                                                type="button" accesskey="H" causesvalidation="false" title="Hearing Details[Alt+H]">
                                                                <i class="" aria-hidden="true"></i>&emsp;<u>H</u>earing Details
                                                            </button>
                                                        </div>
                                                </asp:Panel>
                                            </div>
                                        </div>





                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="Verdict Details" ID="pnlVerdict" runat="server"
                                                    CssClass="stylePanel" Width="100%">
                                                    <div class="row">


                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtVerdictNo" runat="server" ToolTip="Verdict Number" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftVerdictNumber" runat="server" TargetControlID="txtVerdictNo"
                                                                    FilterType="LowercaseLetters, UppercaseLetters, Numbers" Enabled="true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblVerdictNo" runat="server" CssClass="styleDisplayLabel" Text="Verdict Number"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtVerdictDt" runat="server" ToolTip="Verdict Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="calVerdictDt" runat="server" Enabled="True" TargetControlID="txtVerdictDt">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblVerdictDate" runat="server" CssClass="styleDisplayLabel" Text="Verdict Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtVerdictAmt" runat="server" ToolTip="Verdict Number" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftVerdictAmt" runat="server" TargetControlID="txtVerdictAmt"
                                                                    FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblVerdictAmt" runat="server" CssClass="styleDisplayLabel" Text="Verdict Amount"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCourtOrderdt" runat="server" ToolTip="Order Received Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="calCourtOrdDt" runat="server" Enabled="True" TargetControlID="txtCourtOrderdt">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCoortOrderDate" runat="server" CssClass="styleDisplayLabel" Text="Order Received Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtRepossessionDt" runat="server" ToolTip="Repossession Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="calRepossessionDt" runat="server" Enabled="True" TargetControlID="txtRepossessionDt">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblRepossessionDt" runat="server" CssClass="styleDisplayLabel" Text="Repossession Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtExecutionLTRDt" runat="server" ToolTip="Execution Letter Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="calELTRDt" runat="server" Enabled="True" TargetControlID="txtExecutionLTRDt">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblELTRDt" runat="server" CssClass="styleDisplayLabel" Text="Execution Letter Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMORDT" runat="server" ToolTip="Mortage Letter Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="calMorLtrDt" runat="server" Enabled="True" TargetControlID="txtMORDT">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblMORDt" runat="server" CssClass="styleDisplayLabel" Text="Mortage Letter Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtVerdictStmt" runat="server" ToolTip="Verdict Statement" onkeyup="maxlengthfortxt(200)" class="md-form-control form-control login_form_content_input requires_true" TextMode="MultiLine"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblVerdictStatement" runat="server" CssClass="styleDisplayLabel" Text="Verdict Statement"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtClaimAmt" runat="server" ToolTip="Claim Amount" MaxLength="20"
                                                                    class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftClaimAmt" runat="server" TargetControlID="txtClaimAmt"
                                                                    FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblClaimAmt" runat="server" CssClass="styleDisplayLabel" Text="Claim Amount"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtReasonforWithDraw" runat="server" ToolTip="Reason of Withdraw" onkeyup="maxlengthfortxt(200)" class="md-form-control form-control login_form_content_input requires_true" TextMode="MultiLine"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblReasonWithDraw" runat="server" CssClass="styleDisplayLabel" Text="Reason for Withdraw"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtAddlCharges" runat="server" ToolTip="Additional Charges" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftAddlCharges" runat="server" TargetControlID="txtAddlCharges" FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblAddlCharges" runat="server" CssClass="styleDisplayLabel" Text="Additional Charges"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                                                <asp:Panel GroupingText="Lawyer History Details" ID="Panel2" runat="server"
                                                    CssClass="stylePanel" Width="100%">
                                                    <div class="gird">
                                                        <asp:GridView Width="100%" ID="grvLawyerDtls" runat="server" EmptyDataText="No records found" ShowHeaderWhenEmpty="true"
                                                            AutoGenerateColumns="False" class="gird_details">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <%--  <asp:BoundField HeaderText="Lawyer Name" DataField="ENTITY_NAME" ItemStyle-HorizontalAlign="Right" />--%>
                                                                <asp:TemplateField HeaderText="Lawyer Name" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLawyerName" runat="server" Text='<%#Eval("ENTITY_NAME") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Effective From" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLawyerEffFrom" runat="server" Text='<%#Eval("EFF_FROM") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <%-- <asp:BoundField HeaderText="Effective From" DataField="EFF_FROM" ItemStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="Effective To" DataField="EFF_TO" ItemStyle-HorizontalAlign="Center" />--%>
                                                                <asp:TemplateField HeaderText="Effective To" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLawyerEffTo" runat="server" Text='<%#Eval("EFF_TO") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>

                                                            <EmptyDataTemplate>
                                                                <span>No Data Found</span>
                                                            </EmptyDataTemplate>
                                                            <EditRowStyle CssClass="styleFooterInfo" />
                                                        </asp:GridView>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>



                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="Prosecution Details" ID="pnlProsecution" runat="server"
                                                    CssClass="stylePanel" Width="100%">
                                                    <div class="gird">
                                                        <asp:GridView Width="100%" ID="grvProsecution" runat="server" AutoGenerateColumns="False" OnRowCommand="grvProsecution_RowCommand"
                                                            OnRowDataBound="grvProsecution_RowDataBound" OnRowDeleting="grvProsecution_RowDeleting" ShowFooter="True">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="S.No.">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Prosecution No">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lblProsecutionNo" Text='<%#Eval("ProsecutionNo") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox runat="server" ID="txtFProsecutionNo"></asp:TextBox>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Court Category">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCourtCategory" runat="server" Text='<%# Eval("CourtCategory") %>'></asp:Label>
                                                                        <asp:Label ID="lblCourtCategoryVal" runat="server" Text='<%# Eval("CourtCategoryVal") %>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input">
                                                                            <asp:DropDownList ID="ddlCourtCategory" runat="server" ToolTip="Court Category"
                                                                                CssClass="md-form-control form-control login_form_content_input">
                                                                            </asp:DropDownList>
                                                                            <asp:Label runat="server" ID="lblPMod" Text='<%# Eval("Mod") %>' Visible="false"></asp:Label>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Court Category Type">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCourtCatType" runat="server" Text='<%# Eval("CourtCatType") %>'></asp:Label>
                                                                        <asp:Label ID="lblCourtCatTypeVal" runat="server" Text='<%# Eval("CourtCatTypeVal") %>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input">
                                                                            <asp:DropDownList runat="server" ID="ddlCourtCatType" ToolTip="Court Category Type" CssClass="md-form-control form-control login_form_content_input"></asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <%-- <asp:TemplateField HeaderText="Prosecution No">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtProsecutionNo" runat="server" Text='<%# Eval("ProsecutionNo") %>' ReadOnly="true" CssClass="md-form-control form-control login_form_content_input requires_true" MaxLength="50"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtFProsecutionNo" runat="server" Text='<%# Eval("ProsecutionNo") %>' MaxLength="50" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                               <asp:TemplateField HeaderText="Prosecution Value">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtProsecutionVal" runat="server" Text='<%# Eval("Prosecution_Val") %>' MaxLength="20" Style="text-align: right" ReadOnly="true" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                           <cc1:FilteredTextBoxExtender ID="ftProsecutionVal" runat="server" TargetControlID="txtProsecutionVal" FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtFProsecutionVal" runat="server" Text='<%# Eval("Prosecution_Val") %>' MaxLength="20" Style="text-align: right" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="ftFProsecutionVal" runat="server" TargetControlID="txtFProsecutionVal" FilterType="Numbers,custom" ValidChars="." Enabled="true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>--%>
                                                                <asp:TemplateField HeaderText="Hearing Attended By">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblHearingAttBy" runat="server" Text='<%# Eval("HearingAttBy") %>'></asp:Label>
                                                                        <asp:Label ID="lblHearingAttByVal" runat="server" Text='<%# Eval("HearingAttByVal") %>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <uc2:Suggest ID="ucHearingAttBy" ToolTip="Hearing Attended by" runat="server"
                                                                                ServiceMethod="GetHearingAttBy" class="md-form-control form-control" />

                                                                            <%-- <asp:TextBox ID="txtHearingAttBy" runat="server" Text='<%# Eval("HearingAttBy") %>' 
                                                                                CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>--%>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Hearing Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtHearingDate" runat="server" Text='<%# Eval("Hearing_Date") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtHearingFDate" runat="server" Text='<%# Eval("Hearing_Date") %>' CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <cc1:CalendarExtender ID="calHearingDate" runat="server" Enabled="True" TargetControlID="txtHearingFDate">
                                                                            </cc1:CalendarExtender>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Center" Width="9%" />
                                                                    <ItemStyle HorizontalAlign="Center" Width="9%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Next Hearing Date">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="lblNextHearingDate" runat="server" Text='<%# Eval("Next_Hearing_Date") %>' CssClass="md-form-control form-control login_form_content_input requires_true" ReadOnly="true"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtNextHearingFDate" runat="server" Text='<%# Eval("Next_Hearing_Date") %>' CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <cc1:CalendarExtender ID="calNextFDate" runat="server" Enabled="True" TargetControlID="txtNextHearingFDate">
                                                                            </cc1:CalendarExtender>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Center" Width="9%" />
                                                                    <ItemStyle HorizontalAlign="Center" Width="9%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Prosecution Details">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtProsecutionRemarks" runat="server" Text='<%# Eval("ProsecutionRemarks") %>' TextMode="MultiLine" onkeyup="maxlengthfortxt(200)" ReadOnly="true" CssClass="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtFProsecutionRemarks" runat="server" Text='<%# Eval("ProsecutionRemarks") %>' TextMode="MultiLine" onkeyup="maxlengthfortxt(200)" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="grid_btn_delete"
                                                                            OnClientClick="return confirm('Are you sure want to Delete this record?');" AccessKey="T" ToolTip="Delete[Alt+T]">
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <%--  <asp:Button ID="btnProsecutionAdd" runat="server" CommandName="Add" CssClass="styleGridShortButton"
                                                                        Text="Add" ToolTip="Add,Alt+A" AccessKey="A" />--%>
                                                                        <button class="css_btn_enabled" id="btnProsecutionAdd" title="Add,Alt+Shift+D" onserverclick="btnProsecutionAdd_ServerClick" runat="server"
                                                                            type="button" accesskey="D" validationgroup="Add">
                                                                            <i class="fa fa-plus" aria-hidden="true"></i>&emsp;A<u>d</u>d
                                                                        </button>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Center" Width="10%" />
                                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <EditRowStyle CssClass="styleFooterInfo" />
                                                        </asp:GridView>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                </div>


                <div align="right">

                    <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(funSaveValidatio())" validationgroup="ROP Case Filing"
                        type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>

                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>

                    <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>



                <div class="row">

                    <asp:ValidationSummary ID="vsCaseGeneration" runat="server" CssClass="styleMandatoryLabel"
                        HeaderText="Correct the following validation(s):  " ValidationGroup="ROP Case Filing" ShowSummary="true" />
                    <asp:CustomValidator ID="cvCaseGeneration" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblfile" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="MPUploadFiles" runat="server" PopupControlID="plUploadfiles" TargetControlID="lblfile"
        BackgroundCssClass="modalBackground" Enabled="true" BehaviorID="ModalBID" />
    <asp:Panel ID="plUploadfiles" GroupingText="" Height="400px" Width="50%" runat="server" CssClass="stylePanel" Style="padding: 8px; text-wrap: normal; display: none;"
        BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">

        <table width="100%">
            <tr>
                <td colspan="2" align="center" class="stylePageHeading">
                    <asp:Label ID="Label8" runat="server" Text="Upload Files"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblUploadFile" runat="server" Text="Upload File"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="fuOtherFiles" runat="server" Width="200px" />
                    <asp:Label ID="lblCurerntSNo" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblSSID" runat="server" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <%-- <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" CssClass="styleSubmitShortButton" Text="Upload" />--%>
                    <%-- <asp:Button ID="btnUploadCancel" runat="server"  Text="Close" CssClass="styleSubmitShortButton" OnClick="btnUploadCancel_Click" />--%>
                    <button class="css_btn_enabled" id="btnUpload" onserverclick="btnUpload_Click" accesskey="U" runat="server" causesvalidation="false" title="Upload[Alt+U]"
                        type="button">
                        <i class="fa fa-upload" aria-hidden="true"></i>&emsp;<u></u>Upload
                    </button>
                    <button class="css_btn_enabled" id="btnUploadCancel" onserverclick="btnUploadCancel_Click" runat="server" accesskey="X" causesvalidation="false" title="Close[Alt+X]" onclick="if(fnConfirmExit())"
                        type="button">
                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;C<u></u>lose
                    </button>

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:UpdatePanel ID="updUploadGrid" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlProView" GroupingText="Files" CssClass="stylePanel" runat="server"
                                BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:GridView ID="grvUploadedFiles" Width="100%" runat="server" class="gird_details" AutoGenerateColumns="false" ShowFooter="false" OnRowDataBound="grvUploadedFiles_RowDataBound" OnRowDeleting="grvUploadedFiles_RowDeleting">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSNoDisplay" runat="server" Text='<%# Container.DataItemIndex+1  %>'></asp:Label>
                                                        <asp:Label ID="lblSNo" runat="server" Text='<%# Bind("Serial_No")  %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="lblSerialNo" runat="server" Text='<%# Bind("SNo") %>' Visible="false"></asp:Label>
                                                        <%-- <asp:Label ID="lblID" runat="server" Text='<%# Bind("ConstitutionDocuments_ID") %>' Visible="false"></asp:Label>--%>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
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
                                                        <%--<asp:ImageButton ID="hyplnkView" CausesValidation="false" CommandArgument='<%# Bind("Scanned_Ref_No") %>' OnClick="hyplnkView_Click"
                                                            ImageUrl="~/Images/spacer.gif" CssClass="styleGridEdit"
                                                            runat="server" />--%>
                                                        <asp:ImageButton runat="server" ToolTip="View Document" ImageUrl="~/Images/ViewFile2_Enable.jpg" Width="20px" Height="20px" CausesValidation="false" ID="hyplnkView" OnClick="hyplnkView_Click1" Text="View"></asp:ImageButton>
                                                        <asp:Label runat="server" ID="lblPath" Text='<%# Eval("Scanned_Ref_No")%>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Download">
                                                    <ItemTemplate>
                                                        <asp:ImageButton runat="server" ToolTip="View Document" ImageUrl="~/Images/downloadFile.PNG" Width="20px" Height="20px" CausesValidation="false" ID="hyplnkDownload" OnClick="hyplnkDownload_Click" Text="View"></asp:ImageButton>

                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CssClass="grid_btn_delete" AccessKey="Y" ToolTip="Alt+[Y]" CausesValidation="false" CommandName="Delete"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <script language="javascript" type="text/javascript">
        //Sathish R-11-Dec-2019
        function funSaveValidatio() {
            debugger;

            if (!funRequestVali()) {
                return false;
            }
            else {
                return true;
            }





            if (!fnCheckPageValidators('ROP Case Filing')) {
                return false;
            }
            else {
                return true;
            };




        }


        function funRequestVali() {
            var hdnChqRequestValidation = document.getElementById('<%= hdnChqRequestValidation.ClientID %>').value;
            if (hdnChqRequestValidation != "") {
                if (confirm(hdnChqRequestValidation + "Would You like to Continue?")) {
                    return true;
                }
                else {
                    //if (a.type == "submit") {
                    //    a.style.display = 'block';
                    //}
                    return false;
                }
            }
            else {
                return true;
            }
        }




        function fnLoadCustomer() {
            //alert(document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_ucCustomerCodeLov_txtName').value);
            document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_btnLoadCust').click();
        }
        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_btnLoadCust').click();
        }
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_btnLoadAccount').click();
        }
        function checkDate_ROPDate(sender, args) {
            var varApplicationDate = document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_txtFIRDate').value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 0;
            if (selectedDate < varapplndate) {
                alert('ROP Collection Date Date should be greater than or equal to ROP Date');
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_txtROPClnDate').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_txtROPClnDate').value = "";
            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_txtROPClnDate').value = selectedDate.format(sender._format);
                intValid = 1;
            }
        }


        function checkDate_ROPCloseDate(sender, args) {
            var varApplicationDate = document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_txtFIRDate').value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 0;
            if (selectedDate < varapplndate) {
                alert('ROP Closed Date should be greater than or equal to ROP Date');
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_txtClosedDate').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_txtClosedDate').value = ""
            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_txtClosedDate').value = selectedDate.format(sender._format);
                intValid = 1;
            }
        }


        function checkDate_CaseFiledDate(sender, args) {
            var varApplicationDate = document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbFIR_txtFIRDate').value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 0;
            if (selectedDate < varapplndate) {
                alert('Case Filed Date should be greater than or equal to ROP Date');
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCaseFiledDate').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCaseFiledDate').value = "";
            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCaseFiledDate').value = selectedDate.format(sender._format);
                intValid = 1;
            }
        }


        function checkDate_CaseOrderedDate(sender, args) {
            var varApplicationDate = document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCaseFiledDate').value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 0;
            if (selectedDate < varapplndate) {
                alert('Court Ordered Date should be greater than or equal to Case Filed Date');
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCourtOrderdt').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCourtOrderdt').value = "";
            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCourtOrderdt').value = selectedDate.format(sender._format);
                intValid = 1;
            }
        }



        function checkDate_CaseClosedDate(sender, args) {
            var varApplicationDate = document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCaseFiledDate').value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 0;
            if (selectedDate < varapplndate) {
                alert('Case Closed Date should be greater than or equal to Case Filed Date');
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCaseClosedDate').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCaseClosedDate').value = "";
            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCaseClosedDate').value = selectedDate.format(sender._format);
                intValid = 1;
            }
        }

        function checkDate_VerdictDate(sender, args) {
            var varApplicationDate = document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCaseFiledDate').value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 0;
            if (selectedDate < varapplndate) {
                alert('Verdict Date should be greater than or equal to Case Filed Date');
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtVerdictDt').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtVerdictDt').value = "";
            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtVerdictDt').value = selectedDate.format(sender._format);
                intValid = 1;
            }
        }


        function checkDate_LawyerDate(sender, args) {
            var varApplicationDate = document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCaseFiledDate').value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 0;
            if (selectedDate < varapplndate) {
                alert('Lawyer Date should be greater than or equal to Case Filed Date');
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtLawyerDate').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtLawyerDate').value = "";
            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtLawyerDate').value = selectedDate.format(sender._format);
                intValid = 1;
            }
        }

        function checkDate_RepossessionDate(sender, args) {
            var varApplicationDate = document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCaseFiledDate').value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 0;
            if (selectedDate < varapplndate) {
                alert('Repossession Date should be greater than or equal to Case Filed Date');
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtRepossessionDt').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtRepossessionDt').value = "";
            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtRepossessionDt').value = selectedDate.format(sender._format);
                intValid = 1;
            }
        }


        function checkDate_ExecDate(sender, args) {
            var varApplicationDate = document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCaseFiledDate').value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 0;
            if (selectedDate < varapplndate) {
                alert('Execution Letter Date should be greater than or equal to Case Filed Date');
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtExecutionLTRDt').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtExecutionLTRDt').value = "";
            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtExecutionLTRDt').value = selectedDate.format(sender._format);
                intValid = 1;
            }
        }

        function checkDate_MortDate(sender, args) {
            var varApplicationDate = document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtCaseFiledDate').value;
            var varapplndate = Date.parseInvariant(varApplicationDate, sender._format);
            var selectedDate = sender._selectedDate;
            var vartoday = new Date();
            var vartodayformat = vartoday.format(sender._format);
            var intValid = 0;
            if (selectedDate < varapplndate) {
                alert('Mortage Letter Date should be greater than or equal to Case Filed Date');
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtMORDT').value = vartodayformat;
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtMORDT').value = "";
            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_tcCaseGeneration_tbCourt_txtMORDT').value = selectedDate.format(sender._format);
                intValid = 1;
            }
        }

        //Tab index code starts

        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_tcCaseGeneration');

            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;

            }
            else if (Source_Invoker == 'btnPrevTab') {
                if (btnActive_index != 0) {
                    newindex = btnActive_index - 1;
                }
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }
            if (newindex > index) {


                switch (index) {

                    case 0:
                        tab.set_activeTabIndex(newindex);
                        index = tab.get_activeTabIndex(index);
                        btnActive_index = index;
                        break;
                    case 1:
                        tab.set_activeTabIndex(newindex);
                        index = tab.get_activeTabIndex(index);
                        btnActive_index = index;
                        break;
                    case 2:
                        tab.set_activeTabIndex(newindex);
                        index = tab.get_activeTabIndex(index);
                        btnActive_index = index;
                        break;
                }
            }
            else {
                tab.set_activeTabIndex(newindex);

                var TC = $find("<%=tcCaseGeneration.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=ddlLOB.ClientID %>").focus();
                }
            }
        }

        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {

            var TC = $find("<%=tcCaseGeneration.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlLOB.ClientID %>").focus();
            }

            tab = $find('ctl00_ContentPlaceHolder1_tcCaseGeneration');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;

            function on_Change(sender, e) {
                //  debugger;
                if (TC.get_activeTab().get_tabIndex() != 0) {
                    fnMoveNextTab('Tab');
                }
                else {
                    tab.set_activeTabIndex(0);;
                    btnActive_index = 0;
                    return;
                }
            }

        }
        //Tab index code end


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


        function fnUnselectAllExpectSelected(TargetControl) {
            var TargetBaseControl = document.getElementById('<%=grvUploadedFiles.ClientID %>');
            var Inputs = TargetBaseControl.getElementsByTagName("input");

            for (var n = 0; n < Inputs.length; ++n) {
                Inputs[n].parentElement.parentElement.parentElement.style.backgroundColor = "white";
                if (Inputs[n].type == 'checkbox' && Inputs[n].uniqueID != TargetControl.uniqueID) {
                    Inputs[n].checked = false;
                }
            }
        }
    </script>
</asp:Content>

