<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FACashFlowMaster_Add, App_Web_jj5zdzwe" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
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
                            <asp:Panel ID="tbCFM" runat="server" border="0" cellspacing="0" cellpadding="0">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlActivity" runat="server" AutoPostBack="True" ToolTip="Activity"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Activity" CssClass="styleReqFieldLabel" ID="lblActivity"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCashflowNo" runat="server" ReadOnly="true" ToolTip="Cash Flow Serial Number"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvActivity" runat="server" ValidationGroup="main" ErrorMessage="Select the Activity"
                                                    ControlToValidate="ddlActivity" InitialValue="0" Display="Dynamic"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Cash Flow Serial No." ID="lblCashflowNo"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlCashflow" runat="server" ToolTip="Inflow/Outflow"
                                                AutoPostBack="True" OnSelectedIndexChanged="ddlCashflow_SelectedIndexChanged"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvCashflow" runat="server" ValidationGroup="main" ErrorMessage="Select the Inflow/Outflow"
                                                    ControlToValidate="ddlCashflow" InitialValue="0" Display="Dynamic"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Inflow/Outflow" ID="lblCashflow" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCashflowDesc" runat="server" ToolTip="CashFlow Description"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtCashflowDesc"
                                                FilterType="Custom , UppercaseLetters, LowercaseLetters, Numbers" ValidChars=" "
                                                Enabled="True">
                                            </cc1:FilteredTextBoxExtender>
                                            <div class="validation_msg_box">

                                                <asp:RequiredFieldValidator ID="rfvCashflowDesc" runat="server" ValidationGroup="main" ErrorMessage="Enter the Cash Flow Description"
                                                    ControlToValidate="txtCashflowDesc" Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Cash Flow Description" ID="lblCashflowDesc" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlCashflowFlag" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlCashflowFlag_SelectedIndexChanged"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvCashflowflag" runat="server" ValidationGroup="main" ErrorMessage="Select the Cash Flow Flag"
                                                    ControlToValidate="ddlCashflowFlag" InitialValue="0" Display="Dynamic"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Cash Flow Flag" ID="lblCashflowFlag" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="CbxActive" runat="server" ToolTip="Active" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>

                                            <asp:Label runat="server" Text="Active" ID="Label7"></asp:Label>

                                        </div>
                                    </div>
                                </div>
                                <div class="row" id="trDebit" runat="server">
                                    <asp:Label runat="server" Text="Debit" ID="Label10" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                                    <asp:Panel runat="server" ID="pnlDebit" Width="100%" GroupingText="Debit" CssClass="stylePanel">
                                        <div class="row">
                                            <%--  <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">

                                            <span class="highlight"></span>
                                            <span class="bar"></span>

                                            <asp:Label runat="server" Text="Debit" ID="lblDebit" CssClass="styleReqFieldLabel"></asp:Label>

                                        </div>
                                    </div>--%>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlDType" runat="server" AutoPostBack="True"
                                                        OnSelectedIndexChanged="ddlDType_SelectedIndexChanged" ToolTip="Debit Type"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Type" ID="Label2"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <cc1:ComboBox ID="ddlDGLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlDGLCode_SelectedIndexChanged"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                    </cc1:ComboBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="GL Account Code" ID="Label1"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <cc1:ComboBox ID="ddlDAccountFlag" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlDAccountFlag_SelectedIndexChanged"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                    </cc1:ComboBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfDebitAccount" ValidationGroup="main" runat="server" ErrorMessage="Select the GL Account Code (Debit)"
                                                            ControlToValidate="ddlDAccountFlag" InitialValue="--Select--" Display="Dynamic"
                                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label class="tess">
                                                        <asp:Label runat="server" Text="GL Account Code" ID="Label8"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <cc1:ComboBox ID="ddlDSLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlDSLCode_SelectedIndexChanged"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                    </cc1:ComboBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label class="tess">
                                                        <asp:Label runat="server" Text="SL Account Code" ID="Label3"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                                <div class="row" id="trCredit" runat="server">
                                    <asp:Label runat="server" Text="Credit" ID="Label11" CssClass="styleDisplayLabel" Visible="false"></asp:Label>
                                    <asp:Panel runat="server" ID="pnlCredit" Width="100%" GroupingText="Credit" CssClass="stylePanel">
                                        <div class="row">
                                            <%-- <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:Label runat="server" Text="Credit" ID="lblCredit" CssClass="styleReqFieldLabel"></asp:Label>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                        </div>
                                    </div>--%>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlCType" runat="server" AutoPostBack="True"
                                                        OnSelectedIndexChanged="ddlCType_SelectedIndexChanged" ToolTip="Credit Type"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Type" ID="Label6"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <cc1:ComboBox ID="ddlCGLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlCGLCode_SelectedIndexChanged"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                    </cc1:ComboBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="GL Account Code" ID="Label5"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <cc1:ComboBox ID="ddlCAccountFlag" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlCAccountFlag_SelectedIndexChanged"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                    </cc1:ComboBox>
                                                    <div class="validation_msg_box">

                                                        <asp:RequiredFieldValidator ID="rfvCreditAccount" runat="server" ErrorMessage="Select the GL Account Code (Credit)"
                                                            ControlToValidate="ddlCAccountFlag" InitialValue="--Select--" Display="Dynamic"
                                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label class="tess">
                                                        <asp:Label runat="server" Text="GL Account Code" ID="Label4"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <cc1:ComboBox ID="ddlCSLCode" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlCSLCode_SelectedIndexChanged"
                                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                    </cc1:ComboBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <label class="tess">
                                                        <asp:Label runat="server" Text="SL Account Code" ID="Label9"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel runat="server" ID="panGeneralParameters" GroupingText="Program Reference Grid"
                                            CssClass="stylePanel" Style="overflow: hidden">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="gird">
                                                        <div style="height: 190px; overflow-y: auto; overflow-x: hidden" width="100%" class="container">

                                                            <asp:GridView ID="gvCashflowProgram" runat="server" Width="100%" AutoGenerateColumns="False"
                                                                DataKeyNames="Program_ID" OnRowDataBound="gvCashflowProgram_RowDataBound">
                                                                <Columns>
                                                                    <asp:TemplateField Visible="False">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblProgramid" runat="server" Text='<%# Eval("Program_ID") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Program Ref. No." HeaderStyle-CssClass="styleGridHeader">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblProgramRefNo" runat="server" ToolTip="Program Ref. No." Text='<%# Eval("Program_Ref_No") %>' />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                        <ItemStyle Width="15%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Program Description" HeaderStyle-CssClass="styleGridHeader">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblProgramName" runat="server" ToolTip="Program Description" Text='<%# Eval("Program_Name") %>' />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                        <ItemStyle Width="50%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Capture" HeaderStyle-CssClass="styleGridHeader" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox runat="server" ID="CbxCapture" Enabled="false" />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Display" HeaderStyle-CssClass="styleGridHeader" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox runat="server" ID="CbxDisplay" Enabled="false" />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Post" HeaderStyle-CssClass="styleGridHeader">
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox runat="server" ID="CbxPost" ToolTip="Post" />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <%-- <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />--%>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>

                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:RequiredFieldValidator ID="rfvDGlcode" runat="server" ValidationGroup="main" ErrorMessage="Select the GL Account Code(Debit)"
                                ControlToValidate="ddlDGLCode" InitialValue="--Select--" Display="None"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="rfvDSlcode" runat="server" Enabled="false" Visible="false" ValidationGroup="main" ErrorMessage="Select the SL Account Code(Debit)"
                                ControlToValidate="ddlDSLCode" InitialValue="--Select--" Display="None"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="rfvCGlcode" runat="server" ValidationGroup="main" ErrorMessage="Select the GL Account Code(Credit)"
                                ControlToValidate="ddlCAccountFlag" InitialValue="--Select--" Display="None"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="rfvCSlcode" runat="server" ValidationGroup="main" ErrorMessage="Select the SL Account Code(Credit)"
                                ControlToValidate="ddlCSLCode" InitialValue="--Select--" Display="None" Visible="false"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="rfvDType" runat="server" ValidationGroup="main" ErrorMessage="Select the Type(Debit)"
                                ControlToValidate="ddlDType" InitialValue="0" Display="None"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="rfvCType" runat="server" ValidationGroup="main" ErrorMessage="Select the Type(Credit)"
                                ControlToValidate="ddlCType" InitialValue="0" Display="None"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div align="right" class="fixed_btn">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('main'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S" validationgroup="main">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsCashfolw" runat="server" ValidationGroup="main" CssClass="styleMandatoryLabel"
                                HeaderText="Correct the following validation(s):  " />
                            <asp:CustomValidator ID="cvCashflow" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript" language="javascript">

        function verifyString(e) {
            document.getElementById(e).value = document.getElementById(e).value.trim();
        }

        function fnUnselectAllExpectSelected(TargetControl, gRow) {
            var TargetBaseControl = document.getElementById('<%=gvCashflowProgram.ClientID %>');
            var Inputs = TargetBaseControl.getElementsByTagName("input");

            for (var n = 0; n < Inputs.length; ++n) {
                Inputs[n].parentElement.parentElement.parentElement.style.backgroundColor = "white";
                if (Inputs[n].type == 'checkbox' && Inputs[n].uniqueID != TargetControl.uniqueID) {
                    Inputs[n].checked = false;
                }
            }
            if (TargetControl.checked == true) {
                document.getElementById(gRow).style.backgroundColor = "#f5f8ff";
            }
            else {
                document.getElementById(gRow).style.backgroundColor = "white";
            }
        }

    </script>

</asp:Content>
